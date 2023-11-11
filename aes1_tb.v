module tb_aes1;
reg [127:0] in;
reg [127:0] key;
wire [127:0] round0;
wire [127:0] round1;
wire [127:0] round2;
wire [127:0] round3;
wire [127:0] round4;
wire [127:0] round5;
wire [127:0] round6;
wire [127:0] round7;
wire [127:0] round8;
wire [127:0] round9;
wire [127:0] round10;
reg clk;

aes1 dut(in, key, clk, round0,round1,round2,round3,round4,round5,round6,round7,round8,round9,round10);


initial begin
  clk=1;
       forever #5 clk = ~clk;  
end 
always begin

in=128'h00000101030307070f0f1f1f3f3f7f7f;
key=128'h00000000000000000000000000000000;

#500 $finish;

end


endmodule