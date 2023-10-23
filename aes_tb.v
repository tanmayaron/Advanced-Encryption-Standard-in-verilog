module tb_aes;
reg [127:0] in;
reg [127:0] key;
wire [127:0] out;
wire [127:0] r0;
wire [127:0] s1;

aes dut(.in(in), .key(key), .out(out), .r0(r0), .s1(s1));


always begin

in=128'h00000101030307070f0f1f1f3f3f7f7f;
key=128'h00000000000000000000000000000000;

#100 $finish;

end


endmodule