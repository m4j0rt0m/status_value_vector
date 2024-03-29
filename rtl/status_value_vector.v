/*
 *  File:                   status_value_vector.v
 *  Description:            Combinational logic for the vector update
 *  Project:                Status Value Vector
 *  Author:                 Abraham J. Ruiz R. (https://github.com/m4j0rt0m)
 *  Revision:               0.1 - First version
 *                          0.2 - Re-update feature included
 */
module status_value_vector
# (
    parameter DEPTH   = 64,
    parameter WIDTH   = 8,
    parameter SET_EN  = 0
  )
(/*AUTOARG*/
   // Outputs
   value_o, valid_o, full_o,
   // Inputs
   clk_i, rsn_i, push_i, pull_i, value_i, set_i, set_value_i
   );

  /* ports */
  input               clk_i;        //..clock signal
  input               rsn_i;        //..active low reset
  input               push_i;       //..push a new status entry
  input               pull_i;       //..pull the next oldest entry
  input   [WIDTH-1:0] value_i;      //..update value
  output  [WIDTH-1:0] value_o;      //..next value entry
  output              valid_o;      //..valid entry in the status vector
  output              full_o;       //..status vector is full

  /* verilator lint_off UNUSED */
  input               set_i;        //..set last entry
  input   [WIDTH-1:0] set_value_i;  //..set value for last updated entry
  /* verilator lint_on UNUSED */

  /* integers and genvars */
  integer i;
  genvar I;

  /* regs and wires */
  wire              empty;
  wire  [WIDTH-1:0] nxt_vector_d    [DEPTH-1:0];
  wire  [WIDTH-1:0] status_vector_d [DEPTH-1:0];
  wire  [DEPTH-1:0] update_vector_d;
  wire  [DEPTH-1:0] carry_vector_d;
  reg   [DEPTH-1:0] valid_vector_q;
  reg   [WIDTH-1:0] status_vector_q [DEPTH-1:0];

  /* verilator lint_off UNUSED */
  wire  [DEPTH-1:0] last_vector_d;
  /* verilator lint_on UNUSED */

  /* empty/occupied vector */
  assign  empty           = ~valid_vector_q[0];

  /* expand vectors assignment */
  generate
    assign  nxt_vector_d[DEPTH-1] = {WIDTH{1'b0}};
    for(I=0; I<(DEPTH-1); I=I+1)  begin: nxt_vector_assignment
      assign  nxt_vector_d[I] = status_vector_q[I+1];
    end
  endgenerate
  assign  update_vector_d = {valid_vector_q[DEPTH-2:0], 1'b1};
  assign  carry_vector_d  = {1'b0, valid_vector_q[DEPTH-1:1]};
  assign  last_vector_d   = {2'b00, valid_vector_q[DEPTH-1:2]};

  /* valid vector */
  always @ (posedge clk_i, negedge rsn_i) begin
    if(~rsn_i)  //..asynchronous reset
      valid_vector_q <=  {DEPTH{1'b0}};
    else  begin
      case({pull_i,push_i})
        2'b01:  begin   //..shift to the left
          valid_vector_q[0]         <=  1'b1;
          valid_vector_q[DEPTH-1:1] <=  valid_vector_q[DEPTH-2:0];
        end
        2'b10:  begin   //..shift to the right
          valid_vector_q[DEPTH-2:0] <=  valid_vector_q[DEPTH-1:1];
          valid_vector_q[DEPTH-1]   <=  1'b0;
        end
        2'b11:  begin
          if(empty) begin
            valid_vector_q[0]         <=  1'b1;
            valid_vector_q[DEPTH-1:1] <=  valid_vector_q[DEPTH-2:0];
          end
          else
            valid_vector_q            <=  valid_vector_q;
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
      status_value_logic
        # (
            .WIDTH    (WIDTH),
            .SET_EN   (SET_EN)
          )
        status_value_logic_inst (
            .push_i       (push_i),
            .pull_i       (pull_i),
            .set_i        (set_i),
            .update_i     (update_vector_d[I]),
            .valid_i      (valid_vector_q[I]),
            .carry_i      (carry_vector_d[I]),
            .last_i       (last_vector_d[I]),
            .empty_i      (empty),
            .value_i      (value_i),
            .set_value_i  (set_value_i),
            .next_i       (nxt_vector_d[I]),
            .actual_i     (status_vector_q[I]),
            .q_o          (status_vector_d[I])
          );
    end
  endgenerate

  /* status vector */
  always @ (posedge clk_i, negedge rsn_i) begin
    for(i=0; i<DEPTH; i=i+1)  begin
      if(~rsn_i)
        status_vector_q[i] <=  {WIDTH{1'b0}};
      else
        status_vector_q[i] <=  status_vector_d[i];
    end
  end

  /* output assignments */
  assign value_o      = status_vector_q[0];
  assign valid_o      = valid_vector_q[0];
  assign full_o       = valid_vector_q[DEPTH-1];

endmodule // status_value_vector
