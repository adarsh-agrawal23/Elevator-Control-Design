`timescale 1ns / 1ps

module elevator_fsm_tb;

    
    reg clk;
    reg reset;
    reg [2:0] req_floor;
    reg timer_expired;

    
    wire [1:0] motor_dir;
    wire door;
  wire [1:0] current_floor;
  

    
    elevator_controller dut (
        .clk(clk),
        .reset(reset),
        .req_floor(req_floor),
        .timer_expired(timer_expired),
        .motor_dir(motor_dir),
      .door(door),
      .current_floor(current_floor)
    );

    
    always #5 clk = ~clk;  

    initial begin
      $display("Time\tReset\tReq\tDir\tDoor\tCurrent");
      $monitor("%0t\t%b\t%b\t%b\t%b\t%b", 
                 $time, reset, req_floor, motor_dir, door,current_floor);
    end

    
    initial begin
        
        $dumpfile("elevator_fsm.vcd");
        $dumpvars(0, elevator_fsm_tb);

        
        clk = 0;
        reset = 1;
        req_floor = 3'b001;
        timer_expired = 0;

        
        #10 reset = 0;

        
        #10 req_floor = 3'b100;  
        #60;

        
        timer_expired = 1; #10 timer_expired = 0;

        
        #20 timer_expired = 1; #10 timer_expired = 0;

        
        req_floor = 3'b100;
        #50;

        
        req_floor = 3'b001;
        #60;

        
        timer_expired = 1; #10 timer_expired = 0;
        #20 timer_expired = 1; #10 timer_expired = 0;

        req_floor = 3'b001;

        
        #50 $finish;
    end

endmodule
