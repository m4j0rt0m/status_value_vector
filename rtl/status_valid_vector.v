/*
 *  File:                   epi_tracer_last_child_instr_comb_logic.v
 *  Description:            Combinational logic for the last-child-instruction (LCI) vector update
 *  Project:                EPI - Vector lane
 *  Author:                 Abraham J. Ruiz R. (abraham.ruiz@bsc.es)
 *  Revision:               0.1 - First tracer version
 */
module epi_tracer_last_child_instr_comb_logic
(/*AUTOARG*/);

  /* ports */
  input       push_i;     //..push a new instruction into queue (mapped)
  input       pull_i;     //..pull a instructions from queue (commited)
  input       update_i;   //..update or not the LCI vector bit
  input       carry_a_i;  //..next update mask bit (i+1)
  input       carry_b_i;  //..next update mask bit (i+2)
  input       last_i;     //..multi-instruction / last-child-instruction
  input       next_i;     //..next bit in LCI vector (i+1)
  input       prev_i;     //..previous bit in LCI vector (n-1)
  input       actual_i;   //..actual registered bit in LCI vector (i)

  output reg  q_o;        //..bit to be registered in LCI vector (i)

  /* local parameters <push and pull> */
  localparam  NN        = 2'b00;  //..neither push nor pull (there is no change)
  localparam  NP        = 2'b01;  //..push and no pull
  localparam  PN        = 2'b10;  //..pull and no push
  localparam  PP        = 2'b11;  //..both push and pull

  /* update mask bits */
  wire  update_en_a = update_i & ~carry_a_i;  //..update-bit enable (i), as a head pointer
  wire  update_en_b = carry_a_i & ~carry_b_i; //..update-bit enable (i+1), modified head pointer

  /* logic */
  always @ (*) begin
    case({pull_i, push_i})
      NN:  begin
        q_o     = actual_i;
        carry_o = 1'b0;
      end
      NP:  begin
        if(update_en_a)
          q_o = last_i;
        else
          q_o = actual_i;
      end
      PN:  begin
        q_o = next_i;
      end
      PP:  begin
        if(carry_i)
      end
    endcase
  end

endmodule
