module tb_daes;
reg [127:0] in;
reg [127:0] key;
wire [127:0] Add_round_key;
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

inv_aes1 dut(in, key, clk, Add_round_key,round1,round2,round3,round4,round5,round6,round7,round8,round9,round10);


initial begin
  clk=1;
       forever #10 clk = ~clk;  
end 
always begin

in=128'hc7d12419489e3b6233a2c5a7f4563172;
key=128'h00000000000000000000000000000000;

$monitor("t=%3d Add_round_key=%h \n  round10=%h \n round9=%h \n round8=%h \n round7=%h \n round6=%h \n round5=%h \n round4=%h \n round3=%h \n round2=%h \n round1=%h \n ",$time,Add_round_key,round10,round9,round8,round7,round6,round5,round4,round3,round2,round1);


#700 $finish;

end


endmodule