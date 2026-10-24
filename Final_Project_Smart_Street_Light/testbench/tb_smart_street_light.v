`timescale 1ns/1ps

module tb_smart_street_light;

    reg clk;
    reg reset;
    reg night;
    reg vehicle;
    wire [1:0] light_mode;

    smart_street_light uut (
        .clk(clk),
        .reset(reset),
        .night(night),
        .vehicle(vehicle),
        .light_mode(light_mode)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("smart_street_light.vcd");
        $dumpvars(0, tb_smart_street_light);

        $monitor("Time=%0t reset=%b night=%b vehicle=%b light_mode=%b",
                 $time, reset, night, vehicle, light_mode);

        clk = 0;
        reset = 1;
        night = 0;
        vehicle = 0;

        #12 reset = 0;

        // Test 1: Daytime - lights OFF
        #10;
        if (light_mode !== 2'b00)
            $fatal(1, "FAIL: Expected DAY mode");

        // Test 2: Nighttime without vehicle - DIM
        night = 1;
        #10;
        if (light_mode !== 2'b01)
            $fatal(1, "FAIL: Expected NIGHT mode");

        // Test 3: Vehicle detected - BRIGHT
        vehicle = 1;
        #10;
        if (light_mode !== 2'b10)
            $fatal(1, "FAIL: Expected BRIGHT mode");

        // Test 4: Vehicle leaves - DIM
        vehicle = 0;
        #10;
        if (light_mode !== 2'b01)
            $fatal(1, "FAIL: Expected NIGHT mode after vehicle leaves");

        // Test 5: Daytime returns - OFF
        night = 0;
        #10;
        if (light_mode !== 2'b00)
            $fatal(1, "FAIL: Expected DAY mode");

        $display("================================");
        $display("ALL TESTS PASSED!");
        $display("================================");

        $finish;
    end

endmodule
