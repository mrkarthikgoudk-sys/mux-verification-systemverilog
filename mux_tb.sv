`timescale 1ns/1ps

module mux_tb;

    // DUT inputs
    logic a;
    logic b;
    logic sel;

    // DUT output
    logic y;

    // Expected output
    logic expected_y;

    // DUT instantiation
    mux dut (
        .a   (a),
        .b   (b),
        .sel (sel),
        .y   (y)
    );

    // Task for applying and checking each test case
    task run_test(
        input logic test_a,
        input logic test_b,
        input logic test_sel,
        input logic expected
    );
        begin
            a = test_a;
            b = test_b;
            sel = test_sel;
            expected_y = expected;

            #10;

            if (y === expected_y)
                $display(
                    "Time: %0t a=%0b b=%0b sel=%0b y=%0b expected=%0b PASS",
                    $time, a, b, sel, y, expected_y
                );
            else
                $display(
                    "Time: %0t a=%0b b=%0b sel=%0b y=%0b expected=%0b FAIL",
                    $time, a, b, sel, y, expected_y
                );
        end
    endtask

    initial begin

        // Waveform generation
        $dumpfile("dump.vcd");
        $dumpvars(0, mux_tb);

        $display("==============================================");
        $display("       2:1 Multiplexer Verification");
        $display("==============================================");

        // Test Case 1
        run_test(0, 0, 0, 0);

        // Test Case 2
        run_test(1, 0, 0, 1);

        // Test Case 3
        run_test(0, 1, 1, 1);

        // Test Case 4
        run_test(1, 1, 1, 1);

        $display("==============================================");
        $display("          Simulation Completed");
        $display("==============================================");

        $finish;
    end

endmodule
