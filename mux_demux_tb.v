`timescale 1ns/1ps

module tb_mux_demux;

    // MUX signals
    reg a, b, sel_mux;
    wire y;

    // DEMUX signals
    reg din, sel_demux;
    wire y0, y1;

    // Instantiate MUX
    mux_2to1 uut_mux (
        .a(a),
        .b(b),
        .sel(sel_mux),
        .y(y)
    );

    // Instantiate DEMUX
    demux_1to2 uut_demux (
        .din(din),
        .sel(sel_demux),
        .y0(y0),
        .y1(y1)
    );

    initial begin
        $display("Starting simulation...");

        // Test MUX
        a = 0; b = 1; sel_mux = 0; #10;
        sel_mux = 1; #10;

        // Test DEMUX
        din = 1; sel_demux = 0; #10;
        sel_demux = 1; #10;

        $display("Simulation finished.");
        $stop;
    end

endmodule
