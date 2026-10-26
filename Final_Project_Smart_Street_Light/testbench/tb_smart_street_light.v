`timescale 1ns/1ps
module tb_smart_street_light;
 
    reg  clk = 0;
    reg  rst = 1;
    reg  dark = 0;
    reg  motion = 0;
    wire lamp_on;
    wire high_intensity;
    integer errors = 0;
 
    smart_street_light #(
        .HOLD_CYCLES(5)
    ) dut (
        .clk(clk),
        .rst(rst),
        .dark(dark),
        .motion(motion),
        .lamp_on(lamp_on),
        .high_intensity(high_intensity)
    );
 
    always #5 clk = ~clk;
 
    initial begin
        $dumpfile("smart_street_light.vcd");
        $dumpvars(0, tb_smart_street_light);
 
        // Reset, then daylight: lamp must be off
        repeat (2) @(negedge clk);
        rst = 0;
        @(negedge clk);
        if (lamp_on !== 0 || high_intensity !== 0) begin
            $display("FAIL: lamp should be off in daylight");
            errors = errors + 1;
        end
 
        // Dark, no motion: dim
        dark = 1;
        @(negedge clk);
        if (lamp_on !== 1 || high_intensity !== 0) begin
            $display("FAIL: lamp should be dim when dark");
            errors = errors + 1;
        end
 
        // Motion: bright
        motion = 1;
        @(negedge clk);
        if (lamp_on !== 1 || high_intensity !== 1) begin
            $display("FAIL: lamp should be bright on motion");
            errors = errors + 1;
        end
 
        // Motion removed: bright held for 4 cycles, dim on the 5th
        motion = 0;
        repeat (4) @(negedge clk);
        if (high_intensity !== 1) begin
            $display("FAIL: bright level should be held during hold time");
            errors = errors + 1;
        end
        @(negedge clk);
        if (lamp_on !== 1 || high_intensity !== 0) begin
            $display("FAIL: lamp should return to dim after hold time");
            errors = errors + 1;
        end
 
        // Daylight returns: off
        dark = 0;
        @(negedge clk);
        if (lamp_on !== 0 || high_intensity !== 0) begin
            $display("FAIL: lamp should turn off when not dark");
            errors = errors + 1;
        end
 
        // Dark and motion together from OFF: straight to bright
        dark = 1;
        motion = 1;
        @(negedge clk);
        if (lamp_on !== 1 || high_intensity !== 1) begin
            $display("FAIL: OFF to BRIGHT transition did not occur");
            errors = errors + 1;
        end
 
        if (errors == 0)
            $display("PASS: all smart_street_light checks passed");
        else
            $display("FAIL: %0d check(s) failed", errors);
        $finish;
    end
 
    initial begin
        $monitor("time=%0t rst=%b dark=%b motion=%b lamp_on=%b high=%b",
                 $time, rst, dark, motion, lamp_on, high_intensity);
    end
 
endmodule
