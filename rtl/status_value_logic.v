/*
 *  File:                   status_value_logic.v
 *  Description:            Combinational logic for the vector update
 *  Project:                Status Valid Vector
 *  Author:                 Abraham J. Ruiz R. (https://github.com/m4j0rt0m)
 *  Revision:               0.1 - First version
 */
module status_value_logic
(/*AUTOARG*/
   // Outputs
   q_o,
   // Inputs
   push_i, pull_i, update_i, valid_i, carry_i, empty_i, value_i,
   next_i, actual_i
   );

  /* ports */
  input       push_i;   //..push a new entry
  input       pull_i;   //..pull an entry from queue
  input       update_i; //..update or not the status vector bit
  input       valid_i;  //..valid update mask bit (i)
  input       carry_i;  //..next update mask bit (i+1)
  input       empty_i;  //..empty status vector
  input       value_i;  //..state input
  input       next_i;   //..next bit in status vector (i+1)
  input       actual_i; //..actual registered bit in status vector (i)

  output reg  q_o;      //..bit to be registered in status vector (i)

  /* local parameters <push and pull> */
  localparam  NN        = 2'b00;  //..neither push nor pull (there is no change)
  localparam  NP        = 2'b01;  //..push and no pull
  localparam  PN        = 2'b10;  //..pull and no push
  localparam  PP        = 2'b11;  //..both push and pull

  /* update mask bits (working as tail pointers, head pointer always in [0]) */
  wire  update_en_a = update_i & ~valid_i;  //..update-bit enable (i), as a tail pointer
  wire  update_en_b = valid_i & ~carry_i;   //..update-bit enable (i+1), modified tail pointer

  /* logic */
  always @ (*) begin
    case({pull_i, push_i})
      NN:  begin  //..nothing happens
        q_o     = actual_i;
      end
      NP:  begin  //..push a new entry
        if(update_en_a)
          q_o = value_i;
        else
          q_o = actual_i;
      end
      PN:  begin  //..pull an entry
        q_o = next_i;
      end
      PP:  begin  //..push a new entry, as well, pull the oldest entry
        if(~empty_i) begin
          if(update_en_b)
            q_o = value_i;
          else
            q_o = next_i;
        end
        else
          q_o = value_i;
      end
    endcase
  end

endmodule // status_value_logic
