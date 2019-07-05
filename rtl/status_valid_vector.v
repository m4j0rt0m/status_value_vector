/*
 *  File:                   status_valid_vector.v
 *  Description:            Combinational logic for the vector update
 *  Project:                Status Valid Vector
 *  Author:                 Abraham J. Ruiz R. (https://github.com/m4j0rt0m)
 *  Revision:               0.1 - First version
 */
module status_valid_vector
# (
    parameter DEPTH = 16
  )
(/*AUTOARG*/
   // Outputs
   valid_o, full_o,
   // Inputs
   clk_i, rsn_i, push_i, pull_i, value_i
   );

  /* ports */
  input       clk_i;    //..clock signal
  input       rsn_i;    //..active low reset
  input       push_i;   //..push a new status entry
  input       pull_i;   //..pull the next oldest entry
  input       value_i;  //..update value
  output reg  valid_o;  //..valid entry in the status vector
  output reg  full_o;   //..status vector is full

  /* integers and genvars */
  genvar I;

  /* regs and wires */
  wire  [DEPTH-1:0] nxt_vector_d;
  wire  [DEPTH-1:0] status_vector_d;
  wire  [DEPTH-1:0] update_vector_d;
  wire  [DEPTH-1:0] carry_vector_d;
  reg   [DEPTH-1:0] valid_vector_q;
  reg   [DEPTH-1:0] status_vector_q;

  /* expand vectors assignment */
  assign  nxt_vector_d    = {1'b0, status_vector[DEPTH-1:1]};
  assign  update_vector_d = {valid_vector_q[DEPTH-2:1], 1'b1};
  assign  carry_vector_d  = {1'b0, valid_vector_q[DEPTH-1:1]};

  /* valid vector */
  always @ (posedge clk_i, negedge rsn_i) begin
    if(~rsn_i)  //..asynchronous reset
      valid_vector_q <=  {DEPTH{1'b0}};
    else  begin
      case({pull,push})
        2'b10:  begin   //..shift to the left
          valid_vector_q[0]          <=  1'b1;
          valid_vector_q[DEPTH-1:1]  <=  valid_vector_q[DEPTH-2:0];
        end
        2'b10:  begin   //..shift to the right
          valid_vector_q[DEPTH-2:0]  <=  valid_vector_q[DEPTH-1:1];
          valid_vector_q[DEPTH-1]    <=  1'b0;
        end
        default:  begin //..stays the same
          valid_vector_q <=  valid_vector_q;
        end
      endcase
    end
  end

  /* update-bit combinational logic */
  generate
    for(I=0; I<DEPTH; I=I+1)  begin:  comb_logic
      status_valid_logic  (
        .push_i   (push_i),
        .pull_i   (pull_i),
        .update_i (update_vector_d[I]),
        .valid_i  (valid_vector_q[I]),
        .carry_i  (carry_vetor_d[I]),
        .value_i  (value_i),
        .next_i   (nxt_vector_d[i]),
        .actual_i (status_vector_q[I]),
        .q_o      (status_vector_d[I])
      );
    end
  endgenerate

  /* status vector */
  always @ (posedge clk_i, negedge rsn_i) begin
    if(~rsn_i)
      status_vector_q <=  {DEPTH{1'b0}};
    else
      status_vector_q <=  status_vector_d;
  end

endmodule
