module aes1(input [127:0] in,
 input [127:0] key, input clk, output [127:0] round0, output [127:0] round1, output [127:0] round2,
 output[127:0] round3, output[127:0] round4, output[127:0] round5, output[127:0] round6, output[127:0] round7,
 output[127:0] round8, output[127:0] round9,output[127:0] round10);

assign round0=in^key;
wire [127:0] k1;
wire [127:0] rd0,key0;
pipe pipe1(clk, key, round0, key0, rd0);
key_exp key_exp1(key0, 4'd1, k1);

//round1
wire [127:0] s1;
subbytes sub1(rd0, s1);

wire [127:0] sr1;
shift_rows shift1(s1, sr1);

wire [127:0] m1;
mixColumns mix1(sr1, m1);

assign round1=k1^m1;


wire [127:0] rd1,key1;
pipe pipe2(clk, k1, round1, key1, rd1);
//round2
wire [127:0] k2;
key_exp key_exp2(key1, 4'd2, k2);

wire [127:0] s2;
subbytes sub2(rd1, s2);

wire [127:0] sr2;
shift_rows shift2(s2, sr2);

wire [127:0] m2;
mixColumns mix2(sr2, m2);

assign round2=k2^m2;

wire [127:0] rd2,key2;
pipe pipe3(clk, k2, round2, key2, rd2);

//round3
wire [127:0] k3;
key_exp key_exp3(key2, 4'd3, k3);

wire [127:0] s3;
subbytes sub3(rd2, s3);

wire [127:0] sr3;
shift_rows shift3(s3, sr3);

wire [127:0] m3;
mixColumns mix3(sr3, m3);

assign round3=k3^m3;

wire [127:0] rd3,key3;
pipe pipe4(clk, k3, round3, key3, rd3);
//round4
wire [127:0] k4;
key_exp key_exp4(key3, 4'd4, k4);

wire [127:0] s4;
subbytes sub4(rd3, s4);

wire [127:0] sr4;
shift_rows shift4(s4, sr4);

wire [127:0] m4;
mixColumns mix4(sr4, m4);

assign round4=k4^m4;


wire [127:0] rd4,key4;
pipe pipe5(clk, k4, round4, key4, rd4);
//round5
wire [127:0] k5;
key_exp key_exp5(key4, 4'd5, k5);

wire [127:0] s5;
subbytes sub5(rd4, s5);

wire [127:0] sr5;
shift_rows shift5(s5, sr5);

wire [127:0] m5;
mixColumns mix5(sr5, m5);

assign round5=k5^m5;


wire [127:0] rd5,key5;
pipe pipe6(clk, k5, round5, key5, rd5);
//round6
wire [127:0] k6;
key_exp key_exp6(key5, 4'd6, k6);

wire [127:0] s6;
subbytes sub6(rd5, s6);

wire [127:0] sr6;
shift_rows shift6(s6, sr6);

wire [127:0] m6;
mixColumns mix6(sr6, m6);

assign round6=k6^m6;


wire [127:0] rd6,key6;
pipe pipe7(clk, k6, round6, key6, rd6);
//round7
wire [127:0] k7;
key_exp key_exp7(key6, 4'd7, k7);

wire [127:0] s7;
subbytes sub7(rd6, s7);

wire [127:0] sr7;
shift_rows shift7(s7, sr7);

wire [127:0] m7;
mixColumns mix7(sr7, m7);

assign round7=k7^m7;


wire [127:0] rd7,key7;
pipe pipe8(clk, k7, round7, key7, rd7);
//round8
wire [127:0] k8;
key_exp key_exp8(key7, 4'd8, k8);

wire [127:0] s8;
subbytes sub8(rd7, s8);

wire [127:0] sr8;
shift_rows shift8(s8, sr8);

wire [127:0] m8;
mixColumns mix8(sr8, m8);

assign round8=k8^m8;


wire [127:0] rd8,key8;
pipe pipe9(clk, k8, round8, key8, rd8);
//round9
wire [127:0] k9;
key_exp key_exp9(key8, 4'd9, k9);

wire [127:0] s9;
subbytes sub9(rd8, s9);

wire [127:0] sr9;
shift_rows shift9(s9, sr9);

wire [127:0] m9;
mixColumns mix9(sr9, m9);

assign round9=k9^m9;


wire [127:0] rd9,key9;
pipe pipe10(clk, k9, round9, key9, rd9);
//round10
wire [127:0] k10;
key_exp key_exp10(key9, 4'd10, k10);

wire [127:0] s10;
subbytes sub10(rd9, s10);

wire [127:0] sr10;
shift_rows shift10(s10, sr10);

assign round10=k10^sr10;




endmodule


module key_exp(input [127:0] wi, input [3:0] r, 
                output [127:0] wo );

    //finding g
    //rotword
    wire [31:0] wr3;
    assign wr3[7:0]=wi[31:24];
    assign wr3[15:8]=wi[7:0];
    assign wr3[23:16]=wi[15:8];
    assign wr3[31:24]=wi[23:16];

    //sbox
    wire [31:0] ws3;
    sbox s0(wr3[7:0], ws3[7:0]);
    sbox s1(wr3[15:8], ws3[15:8]);
    sbox s2(wr3[23:16], ws3[23:16]);
    sbox s3(wr3[31:24], ws3[31:24]);

    wire [31:0] r1;
    wire [31:0] r2;
    wire [31:0] r3;
    wire [31:0] r4;
    wire [31:0] r5;
    wire [31:0] r6;
    wire [31:0] r7;
    wire [31:0] r8;
    wire [31:0] r9;
    wire [31:0] r10;
    assign r1=32'h01000000;
    assign r2=32'h02000000;
    assign r3=32'h04000000;
    assign r4=32'h08000000;
    assign r5=32'h10000000;
    assign r6=32'h20000000;
    assign r7=32'h40000000;
    assign r8=32'h80000000;
    assign r9=32'h1b000000;
    assign r10=32'h36000000;

    reg [31:0] wf;
    always@(ws3)
    begin
        case(r)
            4'd1 : wf<=ws3^r1;
            4'd2 : wf<=ws3^r2;
            4'd3 : wf<=ws3^r3;
            4'd4 : wf<=ws3^r4;
            4'd5 : wf<=ws3^r5;
            4'd6 : wf<=ws3^r6;
            4'd7 : wf<=ws3^r7;
            4'd8 : wf<=ws3^r8;
            4'd9 : wf<=ws3^r9;
            4'd10 : wf<=ws3^r10;

        endcase
    end

    wire [31:0] g;
    assign g=wf;
    assign wo[127:96]=wi[127:96]^g;
    assign wo[95:64]=wi[95:64]^wo[127:96];
    assign wo[63:32]=wi[63:32]^wo[95:64];
    assign wo[31:0]=wi[31:0]^wo[63:32];



endmodule

module mixColumns(in,out);

input [127:0] in;
output[127:0] out;


function [7:0] f1; 
	input [7:0] x;
	begin 
		
			if(x[7] == 1) f1 = ((x << 1) ^ 8'h1b);
			else f1 = x << 1; 
	end 	
endfunction



function [7:0] f2; 
	input [7:0] x;
	begin 
			
			f2 = f1(x) ^ x;
	end 
endfunction




genvar i;

generate 
for(i=0;i< 4;i=i+1) begin : m_col

	assign out[(i*32 + 24)+:8]= f1(in[(i*32 + 24)+:8]) ^ f2(in[(i*32 + 16)+:8]) ^ in[(i*32 + 8)+:8] ^ in[i*32+:8];
	assign out[(i*32 + 16)+:8]= in[(i*32 + 24)+:8] ^ f1(in[(i*32 + 16)+:8]) ^ f2(in[(i*32 + 8)+:8]) ^ in[i*32+:8];
	assign out[(i*32 + 8)+:8]= in[(i*32 + 24)+:8] ^ in[(i*32 + 16)+:8] ^ f1(in[(i*32 + 8)+:8]) ^ f2(in[i*32+:8]);
   assign out[i*32+:8]= f2(in[(i*32 + 24)+:8]) ^ in[(i*32 + 16)+:8] ^ in[(i*32 + 8)+:8] ^ f1(in[i*32+:8]);

end

endgenerate

endmodule

module shift_rows(
    input [127:0] in, output reg [127:0] out
); 

always@(in)
    begin
        out[7:0]<=in[39:32]; //0
        out[15:8]<=in[79:72]; //1
        out[23:16]<=in[119:112]; //2
        out[31:24]<=in[31:24]; //3

        out[39:32]<=in[71:64]; //4
        out[47:40]<=in[111:104]; //5
        out[55:48]<=in[23:16]; //6
        out[63:56]<=in[63:56]; //7

        out[71:64]<=in[103:96]; //8
        out[79:72]<=in[15:8]; //9
        out[87:80]<=in[55:48]; //10
        out[95:88]<=in[95:88]; //11

        out[103:96]<=in[7:0]; //12
        out[111:104]<=in[47:40]; //13
        out[119:112]<=in[87:80]; //14
        out[127:120]<=in[127:120]; //15
    end

    
endmodule

module subbytes(data,tmp_out);
	 input [127:0]data;
	 output [127:0]tmp_out;
	  sbox q0(data[127:120],tmp_out[127:120] );
     sbox q1( data[119:112],tmp_out[119:112] );
     sbox q2( data[111:104],tmp_out[111:104] );
     sbox q3( data[103:96],tmp_out[103:96] );
     
     sbox q4( data[95:88],tmp_out[95:88] );
     sbox q5( data[87:80],tmp_out[87:80] );
     sbox q6( data[79:72],tmp_out[79:72] );
     sbox q7( data[71:64],tmp_out[71:64] );
     
     sbox q8( data[63:56],tmp_out[63:56] );
     sbox q9( data[55:48],tmp_out[55:48] );
     sbox q10(data[47:40],tmp_out[47:40] );
     sbox q11(data[39:32],tmp_out[39:32] );
     
     sbox q12(data[31:24],tmp_out[31:24] );
     sbox q13(data[23:16],tmp_out[23:16] );
     sbox q14(data[15:8],tmp_out[15:8] );
     sbox q15(data[7:0],tmp_out[7:0] );

endmodule

module sbox(data,sbox_out);
	 input [7:0] data;
	 output reg [7:0] sbox_out;
	 
	 always@(data)
	 begin
	 
	 
	 case (data)          //substitution table
       8'h00              : sbox_out <= 8'h63;
       8'h01              : sbox_out <= 8'h7c;
       8'h02              : sbox_out <= 8'h77;
       8'h03              : sbox_out <= 8'h7b;
       8'h04              : sbox_out <= 8'hf2;
       8'h05              : sbox_out <= 8'h6b;
       8'h06              : sbox_out <= 8'h6f;
       8'h07              : sbox_out <= 8'hc5;
       8'h08              : sbox_out <= 8'h30;
       8'h09              : sbox_out <= 8'h01;
       8'h0a              : sbox_out <= 8'h67;
       8'h0b              : sbox_out <= 8'h2b;
       8'h0c              : sbox_out <= 8'hfe;
       8'h0d              : sbox_out <= 8'hd7;
       8'h0e              : sbox_out <= 8'hab;
       8'h0f              : sbox_out <= 8'h76;
       8'h10              : sbox_out <= 8'hca;
       8'h11              : sbox_out <= 8'h82;
       8'h12              : sbox_out <= 8'hc9;
       8'h13              : sbox_out <= 8'h7d;
       8'h14              : sbox_out <= 8'hfa;
       8'h15              : sbox_out <= 8'h59;
       8'h16              : sbox_out <= 8'h47;
       8'h17              : sbox_out <= 8'hf0;
       8'h18              : sbox_out <= 8'had;
       8'h19              : sbox_out <= 8'hd4;
       8'h1a              : sbox_out <= 8'ha2;
       8'h1b              : sbox_out <= 8'haf;
       8'h1c              : sbox_out <= 8'h9c;
       8'h1d              : sbox_out <= 8'ha4;
       8'h1e              : sbox_out <= 8'h72;
       8'h1f              : sbox_out <= 8'hc0;
       8'h20              : sbox_out <= 8'hb7;
       8'h21              : sbox_out <= 8'hfd;
       8'h22              : sbox_out <= 8'h93;
       8'h23              : sbox_out <= 8'h26;
       8'h24              : sbox_out <= 8'h36;
       8'h25              : sbox_out <= 8'h3f;
       8'h26              : sbox_out <= 8'hf7;
       8'h27              : sbox_out <= 8'hcc;
       8'h28              : sbox_out <= 8'h34;
       8'h29              : sbox_out <= 8'ha5;
       8'h2a              : sbox_out <= 8'he5;
       8'h2b              : sbox_out <= 8'hf1;
       8'h2c              : sbox_out <= 8'h71;
       8'h2d              : sbox_out <= 8'hd8;
       8'h2e              : sbox_out <= 8'h31;
       8'h2f              : sbox_out <= 8'h15;
       8'h30              : sbox_out <= 8'h04;
       8'h31              : sbox_out <= 8'hc7;
       8'h32              : sbox_out <= 8'h23;
       8'h33              : sbox_out <= 8'hc3;
       8'h34              : sbox_out <= 8'h18;
       8'h35              : sbox_out <= 8'h96;
       8'h36              : sbox_out <= 8'h05;
       8'h37              : sbox_out <= 8'h9a;
       8'h38              : sbox_out <= 8'h07;
       8'h39              : sbox_out <= 8'h12;
       8'h3a              : sbox_out <= 8'h80;
       8'h3b              : sbox_out <= 8'he2;
       8'h3c              : sbox_out <= 8'heb;
       8'h3d              : sbox_out <= 8'h27;
       8'h3e              : sbox_out <= 8'hb2;
       8'h3f              : sbox_out <= 8'h75;
       8'h40              : sbox_out <= 8'h09;
       8'h41              : sbox_out <= 8'h83;
       8'h42              : sbox_out <= 8'h2c;
       8'h43              : sbox_out <= 8'h1a;
       8'h44              : sbox_out <= 8'h1b;
       8'h45              : sbox_out <= 8'h6e;
       8'h46              : sbox_out <= 8'h5a;
       8'h47              : sbox_out <= 8'ha0;
       8'h48              : sbox_out <= 8'h52;
       8'h49              : sbox_out <= 8'h3b;
       8'h4a              : sbox_out <= 8'hd6;
       8'h4b              : sbox_out <= 8'hb3;
       8'h4c              : sbox_out <= 8'h29;
       8'h4d              : sbox_out <= 8'he3;
       8'h4e              : sbox_out <= 8'h2f;
       8'h4f              : sbox_out <= 8'h84;
       8'h50              : sbox_out <= 8'h53;
       8'h51              : sbox_out <= 8'hd1;
       8'h52              : sbox_out <= 8'h00;
       8'h53              : sbox_out <= 8'hed;
       8'h54              : sbox_out <= 8'h20;
       8'h55              : sbox_out <= 8'hfc;
       8'h56              : sbox_out <= 8'hb1;
       8'h57              : sbox_out <= 8'h5b;
       8'h58              : sbox_out <= 8'h6a;
       8'h59              : sbox_out <= 8'hcb;
       8'h5a              : sbox_out <= 8'hbe;
       8'h5b              : sbox_out <= 8'h39;
       8'h5c              : sbox_out <= 8'h4a;
       8'h5d              : sbox_out <= 8'h4c;
       8'h5e              : sbox_out <= 8'h58;
       8'h5f              : sbox_out <= 8'hcf;
       8'h60              : sbox_out <= 8'hd0;
       8'h61              : sbox_out <= 8'hef;
       8'h62              : sbox_out <= 8'haa;
       8'h63              : sbox_out <= 8'hfb;
       8'h64              : sbox_out <= 8'h43;
       8'h65              : sbox_out <= 8'h4d;
       8'h66              : sbox_out <= 8'h33;
       8'h67              : sbox_out <= 8'h85;
       8'h68              : sbox_out <= 8'h45;
       8'h69              : sbox_out <= 8'hf9;
       8'h6a              : sbox_out <= 8'h02;
       8'h6b              : sbox_out <= 8'h7f;
       8'h6c              : sbox_out <= 8'h50;
       8'h6d              : sbox_out <= 8'h3c;
       8'h6e              : sbox_out <= 8'h9f;
       8'h6f              : sbox_out <= 8'ha8;
       8'h70              : sbox_out <= 8'h51;
       8'h71              : sbox_out <= 8'ha3;
       8'h72              : sbox_out <= 8'h40;
       8'h73              : sbox_out <= 8'h8f;
       8'h74              : sbox_out <= 8'h92;
       8'h75              : sbox_out <= 8'h9d;
       8'h76              : sbox_out <= 8'h38;
       8'h77              : sbox_out <= 8'hf5;
       8'h78              : sbox_out <= 8'hbc;
       8'h79              : sbox_out <= 8'hb6;
       8'h7a              : sbox_out <= 8'hda;
       8'h7b              : sbox_out <= 8'h21;
       8'h7c              : sbox_out <= 8'h10;
       8'h7d              : sbox_out <= 8'hff;
       8'h7e              : sbox_out <= 8'hf3;
       8'h7f              : sbox_out <= 8'hd2;
       8'h80              : sbox_out <= 8'hcd;
       8'h81              : sbox_out <= 8'h0c;
       8'h82              : sbox_out <= 8'h13;
       8'h83              : sbox_out <= 8'hec;
       8'h84              : sbox_out <= 8'h5f;
       8'h85              : sbox_out <= 8'h97;
       8'h86              : sbox_out <= 8'h44;
       8'h87              : sbox_out <= 8'h17;
       8'h88              : sbox_out <= 8'hc4;
       8'h89              : sbox_out <= 8'ha7;
       8'h8a              : sbox_out <= 8'h7e;
       8'h8b              : sbox_out <= 8'h3d;
       8'h8c              : sbox_out <= 8'h64;
       8'h8d              : sbox_out <= 8'h5d;
       8'h8e              : sbox_out <= 8'h19;
       8'h8f              : sbox_out <= 8'h73;
       8'h90              : sbox_out <= 8'h60;
       8'h91              : sbox_out <= 8'h81;
       8'h92              : sbox_out <= 8'h4f;
       8'h93              : sbox_out <= 8'hdc;
       8'h94              : sbox_out <= 8'h22;
       8'h95              : sbox_out <= 8'h2a;
       8'h96              : sbox_out <= 8'h90;
       8'h97              : sbox_out <= 8'h88;
       8'h98              : sbox_out <= 8'h46;
       8'h99              : sbox_out <= 8'hee;
       8'h9a              : sbox_out <= 8'hb8;
       8'h9b              : sbox_out <= 8'h14;
       8'h9c              : sbox_out <= 8'hde;
       8'h9d              : sbox_out <= 8'h5e;
       8'h9e              : sbox_out <= 8'h0b;
       8'h9f              : sbox_out <= 8'hdb;
       8'ha0              : sbox_out <= 8'he0;
       8'ha1              : sbox_out <= 8'h32;
       8'ha2              : sbox_out <= 8'h3a;
       8'ha3              : sbox_out <= 8'h0a;
       8'ha4              : sbox_out <= 8'h49;
       8'ha5              : sbox_out <= 8'h06;
       8'ha6              : sbox_out <= 8'h24;
       8'ha7              : sbox_out <= 8'h5c;
       8'ha8              : sbox_out <= 8'hc2;
       8'ha9              : sbox_out <= 8'hd3;
       8'haa              : sbox_out <= 8'hac;
       8'hab              : sbox_out <= 8'h62;
       8'hac              : sbox_out <= 8'h91;
       8'had              : sbox_out <= 8'h95;
       8'hae              : sbox_out <= 8'he4;
       8'haf              : sbox_out <= 8'h79;
       8'hb0              : sbox_out <= 8'he7;
       8'hb1              : sbox_out <= 8'hc8;
       8'hb2              : sbox_out <= 8'h37;
       8'hb3              : sbox_out <= 8'h6d;
       8'hb4              : sbox_out <= 8'h8d;
       8'hb5              : sbox_out <= 8'hd5;
       8'hb6              : sbox_out <= 8'h4e;
       8'hb7              : sbox_out <= 8'ha9;
       8'hb8              : sbox_out <= 8'h6c;
       8'hb9              : sbox_out <= 8'h56;
       8'hba              : sbox_out <= 8'hf4;
       8'hbb              : sbox_out <= 8'hea;
       8'hbc              : sbox_out <= 8'h65;
       8'hbd              : sbox_out <= 8'h7a;
       8'hbe              : sbox_out <= 8'hae;
       8'hbf              : sbox_out <= 8'h08;
       8'hc0              : sbox_out <= 8'hba;
       8'hc1              : sbox_out <= 8'h78;
       8'hc2              : sbox_out <= 8'h25;
       8'hc3              : sbox_out <= 8'h2e;
       8'hc4              : sbox_out <= 8'h1c;
       8'hc5              : sbox_out <= 8'ha6;
       8'hc6              : sbox_out <= 8'hb4;
       8'hc7              : sbox_out <= 8'hc6;
       8'hc8              : sbox_out <= 8'he8;
       8'hc9              : sbox_out <= 8'hdd;
       8'hca              : sbox_out <= 8'h74;
       8'hcb              : sbox_out <= 8'h1f;
       8'hcc              : sbox_out <= 8'h4b;
       8'hcd              : sbox_out <= 8'hbd;
       8'hce              : sbox_out <= 8'h8b;
       8'hcf              : sbox_out <= 8'h8a;
       8'hd0              : sbox_out <= 8'h70;
       8'hd1              : sbox_out <= 8'h3e;
       8'hd2              : sbox_out <= 8'hb5;
       8'hd3              : sbox_out <= 8'h66;
       8'hd4              : sbox_out <= 8'h48;
       8'hd5              : sbox_out <= 8'h03;
       8'hd6              : sbox_out <= 8'hf6;
       8'hd7              : sbox_out <= 8'h0e;
       8'hd8              : sbox_out <= 8'h61;
       8'hd9              : sbox_out <= 8'h35;
       8'hda              : sbox_out <= 8'h57;
       8'hdb              : sbox_out <= 8'hb9;
       8'hdc              : sbox_out <= 8'h86;
       8'hdd              : sbox_out <= 8'hc1;
       8'hde              : sbox_out <= 8'h1d;
       8'hdf              : sbox_out <= 8'h9e;
    
       8'he0              : sbox_out <= 8'he1;
       8'he1              : sbox_out <= 8'hf8;
       8'he2              : sbox_out <= 8'h98;
       8'he3              : sbox_out <= 8'h11;
       8'he4              : sbox_out <= 8'h69;
       8'he5              : sbox_out <= 8'hd9;
       8'he6              : sbox_out <= 8'h8e;
       8'he7              : sbox_out <= 8'h94;
       8'he8              : sbox_out <= 8'h9b;
       8'he9              : sbox_out <= 8'h1e;
       8'hea              : sbox_out <= 8'h87;
       8'heb              : sbox_out <= 8'he9;
       8'hec              : sbox_out <= 8'hce;
       8'hed              : sbox_out <= 8'h55;
       8'hee              : sbox_out <= 8'h28;
       8'hef              : sbox_out <= 8'hdf;
    
       8'hf0              : sbox_out <= 8'h8c;
       8'hf1              : sbox_out <= 8'ha1;
       8'hf2              : sbox_out <= 8'h89;
       8'hf3              : sbox_out <= 8'h0d;
       8'hf4              : sbox_out <= 8'hbf;
       8'hf5              : sbox_out <= 8'he6;
       8'hf6              : sbox_out <= 8'h42;
       8'hf7              : sbox_out <= 8'h68;
       8'hf8              : sbox_out <= 8'h41;
       8'hf9              : sbox_out <= 8'h99;
       8'hfa              : sbox_out <= 8'h2d;
       8'hfb              : sbox_out <= 8'h0f;
       8'hfc              : sbox_out <= 8'hb0;
       8'hfd              : sbox_out <= 8'h54;
       8'hfe              : sbox_out <= 8'hbb;
       8'hff              : sbox_out <= 8'h16;
       default            : sbox_out <= 8'h00;
endcase
end

endmodule


module pipe( input clk,
	input [127:0] d,input [127:0] d1,
	output reg [127:0] t,output reg [127:0] t1 );

    always @(posedge clk)begin
		t <= d;
        t1 <=d1;
    end

endmodule