module elevator_controller(
    input clk,
    input reset,
    input [2:0] req_floor,      
    input timer_expired,        
    output reg [1:0] motor_dir, 
    output reg door  , 
  output reg [1:0] current_floor
);

    
    parameter IDLE      = 3'd0,
              MOVE_UP   = 3'd1,
              MOVE_DOWN = 3'd2,
              STOP      = 3'd3,
              DOOR_OPEN = 3'd4,
              WAIT      = 3'd5,
              CHECK     = 3'd6;

    reg [2:0] state, next_state;
    reg [2:0] prev_state;
   
    reg request_above, request_below;
  
  
    reg floor_arrival;
  reg [1:0] next_floor;
  
    
    

    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            prev_state <= IDLE;
        end else begin
            prev_state <= state;
            state <= next_state;
        end
    end

    
    always @(*) begin
        next_state = state;
      floor_arrival = 0;
      next_floor = current_floor;
        case (state)
            IDLE: begin
              if (floor_arrival) next_state = DOOR_OPEN;
                else if (request_above) next_state = MOVE_UP;
                else if (request_below) next_state = MOVE_DOWN;
            end
            MOVE_UP:    begin
              if(current_floor < 2)
                next_floor = current_floor + 1;
              floor_arrival = req_floor[next_floor];
              next_state = floor_arrival ? STOP : MOVE_UP;
            end
            MOVE_DOWN:  begin
              if(current_floor > 0)
                next_floor = current_floor - 1;
              floor_arrival = req_floor[next_floor];
              next_state = floor_arrival ? STOP : MOVE_DOWN;
            end
            STOP:       next_state = DOOR_OPEN;
            DOOR_OPEN:  next_state = timer_expired ? WAIT : DOOR_OPEN;
            WAIT:       next_state = timer_expired ? CHECK : WAIT;
            CHECK: begin
                if (request_above) next_state = MOVE_UP;
                else if (request_below) next_state = MOVE_DOWN;
                else next_state = IDLE;
            end
        endcase
      
    end

    
    always @(*) begin
        case (current_floor)
            2'd0: begin
                request_above = req_floor[1] | req_floor[2];
                request_below = 1'b0;
            end
            2'd1: begin
                request_above = req_floor[2];
                request_below = req_floor[0];
            end
            2'd2: begin
                request_above = 1'b0;
                request_below = req_floor[0] | req_floor[1];
            end
            default: begin
                request_above = 1'b0;
                request_below = 1'b0;
            end
        endcase
    end
  always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_floor <= 2'd0;
    end else if ((state == MOVE_UP) && current_floor < 2) begin
        current_floor <= current_floor + 1;
    end else if ((state == MOVE_DOWN) && current_floor > 0) begin
        current_floor <= current_floor - 1;
    end
end

      
      

    
  always @(*) begin
        case (next_state) 
            IDLE, CHECK: begin
                motor_dir <= 2'b00;
                door <= 1'b0;
            end
            MOVE_UP: begin
                motor_dir <= 2'b01;
                door <= 1'b0;
            end
            MOVE_DOWN: begin
                motor_dir <= 2'b10;
                door <= 1'b0;
            end
            STOP: begin
                motor_dir <= 2'b00;
                door <= 1'b0;
                
            end
            DOOR_OPEN, WAIT: begin
                motor_dir <= 2'b00;
                door <= 1'b1;
            end
            default: begin 
                motor_dir <= 2'b00;
                door <= 1'b0;
            end
        endcase
    end


endmodule
