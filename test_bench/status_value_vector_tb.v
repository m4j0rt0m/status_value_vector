/*
 *  File:                   status_value_vector_tb.v
 *  Description:            Test bench for status value vector module
 *  Project:                Status Value Vector
 *  Author:                 Abraham J. Ruiz R. (https://github.com/m4j0rt0m)
 *  Revision:               0.1 - First version
 */
module status_value_vector_tb ();


  /* local parameters */
  localparam  FREQ_CLK  = 50000000;
  localparam  CLK_F     = (1000000000 / FREQ_CLK) / 2;
  localparam  DEPTH     = 32;

    /* defines */
  `define CYCLES(cycles)  (CLK_F*2*cycles)

  /* regs and wires */
  reg   clk_i;    //..clock signal
  reg   rsn_i;    //..active low reset
  reg   push_i;   //..push a new status entry
  reg   pull_i;   //..pull the next oldest entry
  reg   value_i;  //..value to be inserted into queue
  wire  value_o;  //..next value from status vector
  wire  valid_o;  //..valid entry in the status vector
  wire  full_o;   //..status vector is full

  /* dut */
  status_value_vector
    # (
        .DEPTH  (DEPTH)
      )
    dut (
        .clk_i (clk_i),
        .rsn_i (rsn_i),
        .push_i (push_i),
        .pull_i (pull_i),
        .value_i (value_i),
        .value_o (value_o),
        .valid_o (valid_o),
        .full_o (full_o)
      );

  /* initial */
  initial begin
    clk_i   = 0;
    rsn_i   = 0;
    push_i  = 0;
    pull_i  = 0;
    value_i = 0;
  end

  /* clock signal */
  always  begin
    #CLK_F  clk_i <=  ~clk_i;
  end

  /* simulation */
  always  begin
    $dumpfile("status_value_vector.vcd");
    $dumpvars();
    #`CYCLES(4)   rsn_i = 1;
    #`CYCLES(1)   push_i  = 1;
                  value_i = 1;
    #`CYCLES(4)   push_i  = 0;
                  pull_i  = 1;
    #`CYCLES(5)   push_i  = 1;
                  value_i = 0;
    #`CYCLES(2)   value_i = 1;
    #`CYCLES(4)   push_i  = 0;
                  value_i = 0;
    #`CYCLES(32)  $finish;
  end

endmodule // status_value_vector_tb
