module smart_street_light #(
    parameter HOLD_CYCLES = 5
)(
    input  wire clk,
    input  wire rst,
    input  wire dark,
    input  wire motion,
    output reg  lamp_on,
    output reg  high_intensity
);
 
    localparam [1:0] S_OFF    = 2'b00;
    localparam [1:0] S_DIM    = 2'b01;
    localparam [1:0] S_BRIGHT = 2'b10;
 
    localparam COUNTER_WIDTH = $clog2(HOLD_CYCLES + 1);
 
    reg [1:0] state;
    reg [COUNTER_WIDTH-1:0] hold_cnt;
 
    // State register, next-state logic and hold counter
    always @(posedge clk) begin
        if (rst) begin
            state    <= S_OFF;
            hold_cnt <= 0;
        end
        else begin
            case (state)
                S_OFF: begin
                    hold_cnt <= 0;
                    if (dark)
                        state <= motion ? S_BRIGHT : S_DIM;
                end
                S_DIM: begin
                    hold_cnt <= 0;
                    if (!dark)
                        state <= S_OFF;
                    else if (motion)
                        state <= S_BRIGHT;
                end
                S_BRIGHT: begin
                    if (!dark) begin
                        state    <= S_OFF;
                        hold_cnt <= 0;
                    end
                    else if (motion) begin
                        hold_cnt <= 0;
                    end
                    else if (hold_cnt >= HOLD_CYCLES - 1) begin
                        state    <= S_DIM;
                        hold_cnt <= 0;
                    end
                    else begin
                        hold_cnt <= hold_cnt + 1'b1;
                    end
                end
                default: begin
                    state    <= S_OFF;
                    hold_cnt <= 0;
                end
            endcase
        end
    end
 
    // Moore output decoder
    always @(*) begin
        lamp_on        = 1'b0;
        high_intensity = 1'b0;
        case (state)
            S_DIM:    lamp_on = 1'b1;
            S_BRIGHT: begin
                lamp_on        = 1'b1;
                high_intensity = 1'b1;
            end
            default: ;
        endcase
    end
 
endmodule
