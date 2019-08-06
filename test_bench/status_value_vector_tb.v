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
  localparam  WIDTH     = 4;

    /* defines */
  `define CYCLES(cycles)  (CLK_F*2*cycles)

  /* regs and wires */
  reg               clk_i;        //..clock signal
  reg               rsn_i;        //..active low reset
  reg               push_i;       //..push a new status entry
  reg               pull_i;       //..pull the next oldest entry
  reg   [WIDTH-1:0] value_i;      //..value to be inserted into queue
  wire  [WIDTH-1:0] value_o;      //..next value from status vector
  wire              valid_o;      //..valid entry in the status vector
  wire              full_o;       //..status vector is full
  reg               set_i;        //..reupdate last value
  reg   [WIDTH-1:0] set_value_i;  //..reupdate value to be set

  /* dut */
  status_value_vector
    # (
        .DEPTH  (DEPTH),
        .WIDTH  (WIDTH)
      )
    dut (
        .clk_i (clk_i),
        .rsn_i (rsn_i),
        .push_i (push_i),
        .pull_i (pull_i),
        .value_i (value_i),
        .value_o (value_o),
        .valid_o (valid_o),
        .full_o (full_o),
        .set_i (set_i),
        .set_value_i (set_value_i)
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

  /* clog2 function */
  function integer clog2;
    input integer value;
    begin
      value = value-1;
      for (clog2=0; value>0; clog2=clog2+1)
        value = value>>1;
    end
  endfunction

  /* simulation */
  always  begin
    #`CYCLES(4)   rsn_i = 1;
    #`CYCLES(2)   push_t(10);
    #`CYCLES(1)   pull_t(5);
//    #`CYCLES(1)   push_i  = 1;
//    #`CYCLES(4)   push_i  = 0;
//                  pull_i  = 1;
//    #`CYCLES(5)   push_i  = 1;
//    #`CYCLES(2)   push_i  = 0;
//                  pull_i  = 0;
//    #`CYCLES(2)   pull_i  = 1;
//    #`CYCLES(6)   push_i  = 1;
  end

  /* push data task */
  reg [$clog2(DEPTH)-1:0] push_counter;
  task automatic push_t;
    input [$clog2(DEPTH)-1:0] push_amount;
    begin
      push_counter  = 0;
      while (push_counter != push_amount) begin
        push_i  = 1;
        #`CYCLES(1);
        push_counter = push_counter + 1;
        push_i  = 0;
      end
    end
  endtask

  /* pull data task */
  reg [$clog2(DEPTH)-1:0] pull_counter;
  task automatic pull_t;
    input [$clog2(DEPTH)-1:0] pull_amount;
    begin
      pull_counter  = 0;
      while (pull_counter != pull_amount) begin
        pull_i  = 1;
        #`CYCLES(1);
        pull_counter = pull_counter + 1;
        pull_i  = 0;
      end
    end
  endtask

  always  begin
    $dumpfile("status_value_vector.vcd");
    $dumpvars();
    #`CYCLES(1000)  $finish;
  end
  always  begin
    #`CYCLES(1)   value_i = value_i + 1;
  end

endmodule // status_value_vector_tb
