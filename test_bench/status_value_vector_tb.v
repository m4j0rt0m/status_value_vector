/*
 *  File:                   status_value_vector_tb.v
 *  Description:            Test bench for status value vector module
 *  Project:                Status Value Vector
 *  Author:                 Abraham J. Ruiz R. (https://github.com/m4j0rt0m)
 *  Revision:               0.1 - First version
 */
module status_value_vector_tb ();

  /* local parameters */
  localparam  FREQ_CLK  = 50;
  localparam  CLK_F     = (1000 / FREQ_CLK) / 2;
  localparam  DEPTH     = 8;
  localparam  WIDTH     = 8;
  localparam  SET_EN    = 1;

    /* defines */
  `define CYCLES(cycles)  (CLK_F*2*cycles)

  /* dut regs and wires */
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

  /* sim-dut regs and wires */
  wire  [WIDTH-1:0] sim_value_o;  //..next value from sim-fifo
  wire              sim_valid_o;  //..valid entry in the sim-fifo
  wire              sim_full_o;   //..sim-fifo full

  /* dut */
  status_value_vector
    # (
        .DEPTH  (DEPTH),
        .WIDTH  (WIDTH),
        .SET_EN (SET_EN)
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

  /* behavioural sim dut model */
  sim_fifo_behaviour
    # (
        .DEPTH  (DEPTH),
        .WIDTH  (WIDTH)
      )
    sim_dut (
        .clk_i (clk_i),
        .rsn_i (rsn_i),
        .push_i (push_i),
        .pull_i (pull_i),
        .value_i (value_i),
        .value_o (sim_value_o),
        .valid_o (sim_valid_o),
        .full_o (sim_full_o),
        .set_i (set_i),
        .set_value_i (set_value_i)
      );

  integer idx;

  /* initial */
  initial begin
    clk_i       = 0;
    rsn_i       = 0;
    push_i      = 0;
    pull_i      = 0;
    value_i     = 0;
    set_i       = 0;
    set_value_i = 0;
    $dumpfile("status_value_vector.vcd");
    $dumpvars(0, status_value_vector_tb);
    $dumpvars(1, dut);
    $dumpvars(1, sim_dut);
    for (idx = 0; idx < DEPTH; idx = idx + 1) $dumpvars(1, sim_dut.sim_fifo_mem[idx]);
    for (idx = 0; idx < DEPTH; idx = idx + 1) $dumpvars(1, dut.status_vector_q[idx]);
    #`CYCLES(200000)  $finish;
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
    #`CYCLES(4)   rsn_i = 1;  //..remove reset
    #`CYCLES(400) rsn_i = 0;  //..set a reset
  end

  always  begin
    #`CYCLES(($urandom%10)) push_t(($urandom%10));
  end

  always  begin
    #`CYCLES(($urandom%10)) pull_t(($urandom%10));
  end

  always  begin
    #`CYCLES(($urandom%10)) set_i       = 1;
                            set_value_i = ($urandom%256);
    #`CYCLES(1)             set_i       = 0;
  end

  /* push data task */
  reg [$clog2(DEPTH)-1:0] push_counter;
  task automatic push_t;
    input [$clog2(DEPTH)-1:0] push_amount;
    begin
      push_counter  = 0;
      while (push_counter != push_amount) begin
        push_i  = 1;
        value_i = $urandom%256;
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

  /* evaluation */
  reg error;
  initial error = 0;
  always @ (posedge clk_i)  begin
    if(sim_valid_o != valid_o)
      error =  1'b1;
    else if(valid_o)  begin
      if(value_o != sim_value_o)
        error = 1'b1;
      else
        error = 1'b0;
    end
    else
      error = 1'b0;
  end

endmodule // status_value_vector_tb
