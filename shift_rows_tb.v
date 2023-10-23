module tb;

    reg [127:0] in;
    wire [127:0] out;
    reg clk;
    shift_rows dut(in, clk, out);

    initial begin
       clk=1;
       forever #5 clk = ~clk;  
    end

    always
    begin
        #10 in= 128'h63637c7c7b7bc5c57676c0c07575d2d2;

        #100 $finish;
    end

endmodule