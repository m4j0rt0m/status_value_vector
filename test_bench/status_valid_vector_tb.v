/*
 *  File:                   status_valid_vector_tb.v
 *  Description:            Test for status valid vector module
 *  Project:                Status Valid Vector
 *  Author:                 Abraham J. Ruiz R. (https://github.com/m4j0rt0m)
 *  Revision:               0.1 - First version
 */
module status_valid_vector_tb ();

  /* local parameters */
  localparam  DEPTH = 32;

  /* regs and wires */
  reg   clk_i;    //..clock signal
  reg   rsn_i;    //..active low reset
  reg   push_i;   //..push a new status entry
  reg   pull_i;   //..pull the next oldest entry
  reg   value_i;  //..update value
  wire  valid_o;  //..valid entry in the status vector
  wire  full_o;   //..status vector is full

  /* dut */
  status_valid_vector
    # (
        .DEPTH  (DEPTH)
      )
    dut (
        .clk_i (clk_i),
        .rsn_i (rsn_i),
        .push_i (push_i),
        .pull_i (pull_i),
        .value_i (value_i),
        .valid_o (valid_o),
        .full_o (full_o)
      );

  /*  */

endmodule
