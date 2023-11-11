module inv_aes1(input [127:0] in,
 input [127:0] key, input clk, output [127:0] round0, output [127:0] round1, output [127:0] round2,
 output[127:0] round3, output[127:0] round4, output[127:0] round5, output[127:0] round6, output[127:0] round7,
 output[127:0] round8, output[127:0] round9,output[127:0] round10);

 wire [127:0] k1,k2,k3,k4,k5,k6,k7,k8,k9,k10;
 ikey_exp key_exp1(clk, key, k1,k2,k3,k4,k5,k6,k7,k8,k9,k10);
 
 wire [127:0] k01,k02,k03,k04,k05,k06,k07,k08,k09,k010,in0;
 pipe pipe0(clk,in,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,in0,k01,k02,k03,k04,k05,k06,k07,k08,k09,k010);
 //round0
 assign round0=in0^k010;

 wire [127:0] k101,k102,k103,k104,k105,k106,k107,k108,k109,k1010,in10;
 pipe pipe10(clk,round0,k01,k02,k03,k04,k05,k06,k07,k08,k09,k010,in10,k101,k102,k103,k104,k105,k106,k107,k108,k109,k1010);
 
 //round10
 wire[127:0] sr10;
 inv_shift_rows shift10(in10, sr10);

 wire[127:0] s10;
 inverseSubBytes sub10(sr10,s10);

 wire [127:0] a10;
 assign a10=s10^k109;

 inverseMixColumns inv10(a10, round10);


 wire [127:0] k91,k92,k93,k94,k95,k96,k97,k98,k99,k910,in9;
 pipe pipe9(clk,round10,k101,k102,k103,k104,k105,k106,k107,k108,k109,k1010,in9,k91,k92,k93,k94,k95,k96,k97,k98,k99,k910);

 //round9
 wire[127:0] sr9;
 inv_shift_rows shift9(in9, sr9);

 wire[127:0] s9;
 inverseSubBytes sub9(sr9,s9);

 wire [127:0] a9;
 assign a9=s9^k98;

 inverseMixColumns inv9(a9, round9);


 wire [127:0] k81,k82,k83,k84,k85,k86,k87,k88,k89,k810,in8;
 pipe pipe8(clk,round9,k91,k92,k93,k94,k95,k96,k97,k98,k99,k910,in8,k81,k82,k83,k84,k85,k86,k87,k88,k89,k810);

  //round8
 wire[127:0] sr8;
 inv_shift_rows shift8(in8, sr8);

 wire[127:0] s8;
 inverseSubBytes sub8(sr8,s8);

 wire [127:0] a8;
 assign a8=s8^k87;

 inverseMixColumns inv8(a8, round8);

 //k1,k2,k3,k4,k5,k6,k7,k8,k9,k10
 wire [127:0] k71,k72,k73,k74,k75,k76,k77,k78,k79,k710,in7;
 pipe pipe7(clk,round8,k81,k82,k83,k84,k85,k86,k87,k88,k89,k810,in7,k71,k72,k73,k74,k75,k76,k77,k78,k79,k710);

   //round7
 wire[127:0] sr7;
 inv_shift_rows shift7(in7, sr7);

 wire[127:0] s7;
 inverseSubBytes sub7(sr7,s7);

 wire [127:0] a7;
 assign a7=s7^k76;

 inverseMixColumns inv7(a7, round7);



 //k1,k2,k3,k4,k5,k6,k7,k8,k9,k10
 wire [127:0] k61,k62,k63,k64,k65,k66,k67,k68,k69,k610,in6;
 pipe pipe6(clk,round7,k71,k72,k73,k74,k75,k76,k77,k78,k79,k710,in6,k61,k62,k63,k64,k65,k66,k67,k68,k69,k610);

 //round6
 wire[127:0] sr6;
 inv_shift_rows shift6(in6, sr6);

 wire[127:0] s6;
 inverseSubBytes sub6(sr6,s6);

 wire [127:0] a6;
 assign a6=s6^k65;

 inverseMixColumns inv6(a6, round6);

 
 //k1,k2,k3,k4,k5,k6,k7,k8,k9,k10
 wire [127:0] k51,k52,k53,k54,k55,k56,k57,k58,k59,k510,in5;
 pipe pipe5(clk,round6,k61,k62,k63,k64,k65,k66,k67,k68,k69,k610,in5,k51,k52,k53,k54,k55,k56,k57,k58,k59,k510);


//round5
 wire[127:0] sr5;
 inv_shift_rows shift5(in5, sr5);

 wire[127:0] s5;
 inverseSubBytes sub5(sr5,s5);

 wire [127:0] a5;
 assign a5=s5^k54;

 inverseMixColumns inv5(a5, round5);


  //k1,k2,k3,k4,k5,k6,k7,k8,k9,k10
 wire [127:0] k41,k42,k43,k44,k45,k46,k47,k48,k49,k410,in4;
 pipe pipe4(clk,round5,k51,k52,k53,k54,k55,k56,k57,k58,k59,k510,in4,k41,k42,k43,k44,k45,k46,k47,k48,k49,k410);

 //round4
 wire[127:0] sr4;
 inv_shift_rows shift4(in4, sr4);

 wire[127:0] s4;
 inverseSubBytes sub4(sr4,s4);

 wire [127:0] a4;
 assign a4=s4^k43;

 inverseMixColumns inv4(a4, round4);


//k1,k2,k3,k4,k5,k6,k7,k8,k9,k10
 wire [127:0] k31,k32,k33,k34,k35,k36,k37,k38,k39,k310,in3;
 pipe pipe3(clk,round4,k41,k42,k43,k44,k45,k46,k47,k48,k49,k410,in3,k31,k32,k33,k34,k35,k36,k37,k38,k39,k310);

 //round3
 wire[127:0] sr3;
 inv_shift_rows shift3(in3, sr3);

 wire[127:0] s3;
 inverseSubBytes sub3(sr3,s3);

 wire [127:0] a3;
 assign a3=s3^k32;

 inverseMixColumns inv3(a3, round3);

 //k1,k2,k3,k4,k5,k6,k7,k8,k9,k10
 wire [127:0] k21,k22,k23,k24,k25,k26,k27,k28,k29,k210,in2;
 pipe pipe2(clk,round3,k31,k32,k33,k34,k35,k36,k37,k38,k39,k310,in2,k21,k22,k23,k24,k25,k26,k27,k28,k29,k210);

 //round2
 wire[127:0] sr2;
 inv_shift_rows shift2(in2, sr2);

 wire[127:0] s2;
 inverseSubBytes sub2(sr2,s2);

 wire [127:0] a2;
 assign a2=s2^k21;

 inverseMixColumns inv2(a2, round2);


//k1,k2,k3,k4,k5,k6,k7,k8,k9,k10
 wire [127:0] k11,k12,k13,k14,k15,k16,k17,k18,k19,k110,in1;
 pipe pipe1(clk,round2,k21,k22,k23,k24,k25,k26,k27,k28,k29,k210,in1,k11,k12,k13,k14,k15,k16,k17,k18,k19,k110);

  //round1
 wire[127:0] sr1;
 inv_shift_rows shift1(in1, sr1);

 wire[127:0] s1;
 inverseSubBytes sub1(sr1,s1);

 //wire [127:0] a1;
 assign round1=s1^key;

 //inverseMixColumns inv1(a1, round1);



 endmodule

 module inverseMixColumns(in,out);
input [127:0] in;
output [127:0] out;


function[7:0] multiply(input [7:0]x,input integer n);
integer i;
begin
	for(i=0;i<n;i=i+1)begin
		if(x[7] == 1) x = ((x << 1) ^ 8'h1b);
		else x = x << 1; 
	end
	multiply=x;
end

endfunction


function [7:0] f1; //multiply by {0e}
input [7:0] x;
begin
	f1=multiply(x,3) ^ multiply(x,2)^ multiply(x,1);
end
endfunction


function [7:0] f2; //multiply by {0d}
input [7:0] x;
begin
	f2=multiply(x,3) ^ multiply(x,2)^ x;
end
endfunction


function [7:0] f3;  //multiply by {0b}
input [7:0] x;
begin
	f3=multiply(x,3) ^ multiply(x,1)^ x;
end
endfunction

function [7:0] f4; //multiply by {09}
input [7:0] x;
begin
	f4=multiply(x,3) ^  x;
end
endfunction

genvar i;

generate 
for(i=0;i< 4;i=i+1) begin : m_col

	assign out[(i*32 + 24)+:8]= f1(in[(i*32 + 24)+:8]) ^ f3(in[(i*32 + 16)+:8]) ^ f2(in[(i*32 + 8)+:8]) ^ f4(in[i*32+:8]);
	assign out[(i*32 + 16)+:8]= f4(in[(i*32 + 24)+:8]) ^ f1(in[(i*32 + 16)+:8]) ^ f3(in[(i*32 + 8)+:8]) ^ f2(in[i*32+:8]);
	assign out[(i*32 + 8)+:8]= f2(in[(i*32 + 24)+:8]) ^ f4(in[(i*32 + 16)+:8]) ^ f1(in[(i*32 + 8)+:8]) ^ f3(in[i*32+:8]);
   assign out[i*32+:8]= f3(in[(i*32 + 24)+:8]) ^ f2(in[(i*32 + 16)+:8]) ^ f4(in[(i*32 + 8)+:8]) ^ f1(in[i*32+:8]);

end

endgenerate


endmodule

module inv_shift_rows(
    input [127:0] in, output reg [127:0] out
); 

always@(in)
    begin
        out[7:0]<=in[103:96]; //0
        out[15:8]<=in[79:72]; //1
        out[23:16]<=in[55:48]; //2
        out[31:24]<=in[31:24]; //3

        out[39:32]<=in[7:0]; //4
        out[47:40]<=in[111:104]; //5
        out[55:48]<=in[87:80]; //6
        out[63:56]<=in[63:56]; //7

        out[71:64]<=in[39:32]; //8
        out[79:72]<=in[15:8]; //9
        out[87:80]<=in[119:112]; //10
        out[95:88]<=in[95:88]; //11

        out[103:96]<=in[71:64]; //12
        out[111:104]<=in[47:40]; //13
        out[119:112]<=in[23:16]; //14
        out[127:120]<=in[127:120]; //15
    end

    
endmodule



module pipe( input clk,
	input [127:0] d,input [127:0] k1, input [127:0] k2,input [127:0] k3,input [127:0] k4,
	input [127:0] k5,input [127:0] k6,input [127:0] k7,input [127:0] k8,input [127:0] k9,
	input [127:0] k10,
	output reg [127:0] t,output reg [127:0] key1, output reg [127:0] key2,
	 output reg [127:0] key3,
	output reg [127:0] key4, output reg [127:0] key5, output reg [127:0] key6, 
	output reg [127:0] key7, output reg [127:0] key8, output reg [127:0] key9, 
	output reg [127:0] key10 );

    always @(posedge clk)begin
		t <= d;
        key1 <=k1;
		key2 <=k2;
		key3 <=k3;
		key4 <=k4;
		key5 <=k5;
		key6 <=k6;
		key7 <=k7;
		key8 <=k8;
		key9 <=k9;
		key10 <=k10;
    end

endmodule

module ikey_exp(input clk, input [127:0] wi, 
                output [127:0] key91,  output [127:0] key92, output [127:0] key93, output [127:0] key94
                , output [127:0] key95, output [127:0] key96, output [127:0] key97, output [127:0] key98
                , output [127:0] key99, output [127:0] key910);

    
    wire [127:0] k0;
    assign k0=wi;

    //round1
    wire [127:0] k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;
    wire [31:0] g1;
    g_func r1(wi, 4'h1,g1); 
    assign k1[127:96]=wi[127:96]^g1;
    assign k1[95:64]=wi[95:64]^k1[127:96];
    assign k1[63:32]=wi[63:32]^k1[95:64];
    assign k1[31:0]=wi[31:0]^k1[63:32];

    pipe2 p1(clk,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10);

    //round2
    wire [127:0] key21,key22,key23,key24,key25,key26,key27,key28,key29,key210;
    wire [31:0] g2;
    g_func r2(key1, 4'h2,g2); 
    assign key2[127:96]=key1[127:96]^g2;
    assign key2[95:64]=key1[95:64]^key2[127:96];
    assign key2[63:32]=key1[63:32]^key2[95:64];
    assign key2[31:0]=key1[31:0]^key2[63:32];

    pipe2 p2(clk,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key21,key22,key23,key24,key25,key26,key27,key28,key29,key210);

    //round3
    wire [127:0] key31,key32,key33,key34,key35,key36,key37,key38,key39,key310;
    wire [31:0] g3;
    g_func r3(key22, 4'h3,g3); 
    assign key23[127:96]=key22[127:96]^g3;
    assign key23[95:64]=key22[95:64]^key23[127:96];
    assign key23[63:32]=key22[63:32]^key23[95:64];
    assign key23[31:0]=key22[31:0]^key23[63:32];
    pipe2 p3(clk,key21,key22,key23,key24,key25,key26,key27,key28,key29,key210,key31,key32,key33,key34,key35,key36,key37,key38,key39,key310);
    //round4
    wire [31:0] g4;
    wire [127:0] key41,key42,key43,key44,key45,key46,key47,key48,key49,key410;
    g_func r4(key33, 4'h4,g4); 
    assign key34[127:96]=key33[127:96]^g4;
    assign key34[95:64]=key33[95:64]^key34[127:96];
    assign key34[63:32]=key33[63:32]^key34[95:64];
    assign key34[31:0]=key33[31:0]^key34[63:32];
    pipe2 p4(clk,key31,key32,key33,key34,key35,key36,key37,key38,key39,key310,key41,key42,key43,key44,key45,key46,key47,key48,key49,key410);
    //round5
    wire [31:0] g5;
    wire [127:0] key51,key52,key53,key54,key55,key56,key57,key58,key59,key510;
    g_func r5(key44, 4'h5,g5); 
    assign key45[127:96]=key44[127:96]^g5;
    assign key45[95:64]=key44[95:64]^key45[127:96];
    assign key45[63:32]=key44[63:32]^key45[95:64];
    assign key45[31:0]=key44[31:0]^key45[63:32];
    pipe2 p5(clk,key41,key42,key43,key44,key45,key46,key47,key48,key49,key410,key51,key52,key53,key54,key55,key56,key57,key58,key59,key510);
    //round6
    wire [31:0] g6;
    wire [127:0] key61,key62,key63,key64,key65,key66,key67,key68,key69,key610;
    g_func r6(key55, 4'h6,g6); 
    assign key56[127:96]=key55[127:96]^g6;
    assign key56[95:64]=key55[95:64]^key56[127:96];
    assign key56[63:32]=key55[63:32]^key56[95:64];
    assign key56[31:0]=key55[31:0]^key56[63:32];

    pipe2 p6(clk,key51,key52,key53,key54,key55,key56,key57,key58,key59,key510,key61,key62,key63,key64,key65,key66,key67,key68,key69,key610);
    //round7
    wire [31:0] g7;
    wire [127:0] key71,key72,key73,key74,key75,key76,key77,key78,key79,key710;
    g_func r7(key66, 4'h7,g7); 
    assign key67[127:96]=key66[127:96]^g7;
    assign key67[95:64]=key66[95:64]^key67[127:96];
    assign key67[63:32]=key66[63:32]^key67[95:64];
    assign key67[31:0]=key66[31:0]^key67[63:32];
    pipe2 p7(clk,key61,key62,key63,key64,key65,key66,key67,key68,key69,key610,key71,key72,key73,key74,key75,key76,key77,key78,key79,key710);
    //round8
    wire [31:0] g8;
    wire [127:0] key81,key82,key83,key84,key85,key86,key87,key88,key89,key810;
    g_func r8(key77, 4'h8,g8); 
    assign key78[127:96]=key77[127:96]^g8;
    assign key78[95:64]=key77[95:64]^key78[127:96];
    assign key78[63:32]=key77[63:32]^key78[95:64];
    assign key78[31:0]=key77[31:0]^key78[63:32];
    pipe2 p8(clk,key71,key72,key73,key74,key75,key76,key77,key78,key79,key710,key81,key82,key83,key84,key85,key86,key87,key88,key89,key810);
    //round9
    wire [31:0] g9;
    //wire [127:0] key91,key92,key93,key94,key95,key96,key97,key98,key99,key910;
    g_func r9(key88, 4'h9,g9); 
    assign key89[127:96]=key88[127:96]^g9;
    assign key89[95:64]=key88[95:64]^key89[127:96];
    assign key89[63:32]=key88[63:32]^key89[95:64];
    assign key89[31:0]=key88[31:0]^key89[63:32];
    pipe2 p9(clk,key81,key82,key83,key84,key85,key86,key87,key88,key89,key810,key91,key92,key93,key94,key95,key96,key97,key98,key99,key910);
    //round10
    wire [31:0] g10;
    wire [127:0] key101,key102,key103,key104,key105,key106,key107,key108,key109,key1010;
    g_func r10(key99, 4'd10,g10); 
    assign key910[127:96]=key99[127:96]^g10;
    assign key910[95:64]=key99[95:64]^key910[127:96];
    assign key910[63:32]=key99[63:32]^key910[95:64];
    assign key910[31:0]=key99[31:0]^key910[63:32];


endmodule

module pipe2(input clk, input [127:0] a1,input [127:0] a2,input [127:0] a3,input [127:0] a4,input [127:0] a5,input [127:0] a6,
input [127:0] a7,input [127:0] a8,input [127:0] a9,input [127:0] a10,
 output reg [127:0] b1,output reg [127:0] b2,output reg [127:0] b3,output reg [127:0] b4,output reg [127:0] b5,output reg [127:0] b6,
 output reg [127:0] b7,output reg [127:0] b8,output reg [127:0] b9,output reg [127:0] b10);
   always@(posedge clk)
   begin
      b1<=a1;
      b2<=a2;
      b3<=a3;
      b4<=a4;
      b5<=a5;
      b6<=a6;
      b7<=a7;
      b8<=a8;
      b9<=a9;
      b10<=a10;
   end

endmodule

module g_func(input [31:0]wi, input[3:0] r, output [31:0] g);
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

    //wire [31:0] g;
    assign g=wf;

endmodule


module sbox(sbox_in,sbox_out);
	 input [7:0] sbox_in;
	 output reg [7:0] sbox_out;
	 
	 always@(sbox_in)
	 begin
	 
	 
	 case (sbox_in)          
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

module inverseSubBytes(sub_in,sub_out);
input [127:0] sub_in;
output [127:0] sub_out;

genvar i;
generate 
for(i=0;i<128;i=i+8) begin :sub_Bytes 
	inverseSbox s(sub_in[i +:8],sub_out[i +:8]);
	end
endgenerate


endmodule


module inverseSbox(in,out);
input  [7:0] in; 
output reg [7:0] out;

 always@(*)
 begin  
    case(in)
				8'h00:out =8'h52;
				8'h01:out =8'h09;
				8'h02:out =8'h6a;
				8'h03:out =8'hd5;
				8'h04:out =8'h30;
				8'h05:out =8'h36;
				8'h06:out =8'ha5;
				8'h07:out =8'h38;
				8'h08:out =8'hbf;
				8'h09:out =8'h40;
				8'h0a:out =8'ha3;
				8'h0b:out =8'h9e;
				8'h0c:out =8'h81;
				8'h0d:out =8'hf3;
				8'h0e:out =8'hd7;
				8'h0f:out =8'hfb;
				8'h10:out =8'h7c;
				8'h11:out =8'he3;
				8'h12:out =8'h39;
				8'h13:out =8'h82;
				8'h14:out =8'h9b;
				8'h15:out =8'h2f;
				8'h16:out =8'hff;
				8'h17:out =8'h87;
				8'h18:out =8'h34;
				8'h19:out =8'h8e;
				8'h1a:out =8'h43;
				8'h1b:out =8'h44;
				8'h1c:out =8'hc4;
				8'h1d:out =8'hde;
				8'h1e:out =8'he9;
				8'h1f:out =8'hcb;
				8'h20:out =8'h54;
				8'h21:out =8'h7b;
				8'h22:out =8'h94;
				8'h23:out =8'h32;
				8'h24:out =8'ha6;
				8'h25:out =8'hc2;
				8'h26:out =8'h23;
				8'h27:out =8'h3d;
				8'h28:out =8'hee;
				8'h29:out =8'h4c;
				8'h2a:out =8'h95;
				8'h2b:out =8'h0b;
				8'h2c:out =8'h42;
				8'h2d:out =8'hfa;
				8'h2e:out =8'hc3;
				8'h2f:out =8'h4e;
				8'h30:out =8'h08;
				8'h31:out =8'h2e;
				8'h32:out =8'ha1;
				8'h33:out =8'h66;
				8'h34:out =8'h28;
				8'h35:out =8'hd9;
				8'h36:out =8'h24;
				8'h37:out =8'hb2;
				8'h38:out =8'h76;
				8'h39:out =8'h5b;
				8'h3a:out =8'ha2;
				8'h3b:out =8'h49;
				8'h3c:out =8'h6d;
				8'h3d:out =8'h8b;
				8'h3e:out =8'hd1;
				8'h3f:out =8'h25;
				8'h40:out =8'h72;
				8'h41:out =8'hf8;
				8'h42:out =8'hf6;
				8'h43:out =8'h64;
				8'h44:out =8'h86;
				8'h45:out =8'h68;
				8'h46:out =8'h98;
				8'h47:out =8'h16;
				8'h48:out =8'hd4;
				8'h49:out =8'ha4;
				8'h4a:out =8'h5c;
				8'h4b:out =8'hcc;
				8'h4c:out =8'h5d;
				8'h4d:out =8'h65;
				8'h4e:out =8'hb6;
				8'h4f:out =8'h92;
				8'h50:out =8'h6c;
				8'h51:out =8'h70;
				8'h52:out =8'h48;
				8'h53:out =8'h50;
				8'h54:out =8'hfd;
				8'h55:out =8'hed;
				8'h56:out =8'hb9;
				8'h57:out =8'hda;
				8'h58:out =8'h5e;
				8'h59:out =8'h15;
				8'h5a:out =8'h46;
				8'h5b:out =8'h57;
				8'h5c:out =8'ha7;
				8'h5d:out =8'h8d;
				8'h5e:out =8'h9d;
				8'h5f:out =8'h84;
				8'h60:out =8'h90;
				8'h61:out =8'hd8;
				8'h62:out =8'hab;
				8'h63:out =8'h00;
				8'h64:out =8'h8c;
				8'h65:out =8'hbc;
				8'h66:out =8'hd3;
				8'h67:out =8'h0a;
				8'h68:out =8'hf7;
				8'h69:out =8'he4;
				8'h6a:out =8'h58;
				8'h6b:out =8'h05;
				8'h6c:out =8'hb8;
				8'h6d:out =8'hb3;
				8'h6e:out =8'h45;
				8'h6f:out =8'h06;
				8'h70:out =8'hd0;
				8'h71:out =8'h2c;
				8'h72:out =8'h1e;
				8'h73:out =8'h8f;
				8'h74:out =8'hca;
				8'h75:out =8'h3f;
				8'h76:out =8'h0f;
				8'h77:out =8'h02;
				8'h78:out =8'hc1;
				8'h79:out =8'haf;
				8'h7a:out =8'hbd;
				8'h7b:out =8'h03;
				8'h7c:out =8'h01;
				8'h7d:out =8'h13;
				8'h7e:out =8'h8a;
				8'h7f:out =8'h6b;
				8'h80:out =8'h3a;
				8'h81:out =8'h91;
				8'h82:out =8'h11;
				8'h83:out =8'h41;
				8'h84:out =8'h4f;
				8'h85:out =8'h67;
				8'h86:out =8'hdc;
				8'h87:out =8'hea;
				8'h88:out =8'h97;
				8'h89:out =8'hf2;
				8'h8a:out =8'hcf;
				8'h8b:out =8'hce;
				8'h8c:out =8'hf0;
				8'h8d:out =8'hb4;
				8'h8e:out =8'he6;
				8'h8f:out =8'h73;
				8'h90:out =8'h96;
				8'h91:out =8'hac;
				8'h92:out =8'h74;
				8'h93:out =8'h22;
				8'h94:out =8'he7;
				8'h95:out =8'had;
				8'h96:out =8'h35;
				8'h97:out =8'h85;
				8'h98:out =8'he2;
				8'h99:out =8'hf9;
				8'h9a:out =8'h37;
				8'h9b:out =8'he8;
				8'h9c:out =8'h1c;
				8'h9d:out =8'h75;
				8'h9e:out =8'hdf;
				8'h9f:out =8'h6e;
				8'ha0:out =8'h47;
				8'ha1:out =8'hf1;
				8'ha2:out =8'h1a;
				8'ha3:out =8'h71;
				8'ha4:out =8'h1d;
				8'ha5:out =8'h29;
				8'ha6:out =8'hc5;
				8'ha7:out =8'h89;
				8'ha8:out =8'h6f;
				8'ha9:out =8'hb7;
				8'haa:out =8'h62;
				8'hab:out =8'h0e;
				8'hac:out =8'haa;
				8'had:out =8'h18;
				8'hae:out =8'hbe;
				8'haf:out =8'h1b;
				8'hb0:out =8'hfc;
				8'hb1:out =8'h56;
				8'hb2:out =8'h3e;
				8'hb3:out =8'h4b;
				8'hb4:out =8'hc6;
				8'hb5:out =8'hd2;
				8'hb6:out =8'h79;
				8'hb7:out =8'h20;
				8'hb8:out =8'h9a;
				8'hb9:out =8'hdb;
				8'hba:out =8'hc0;
				8'hbb:out =8'hfe;
				8'hbc:out =8'h78;
				8'hbd:out =8'hcd;
				8'hbe:out =8'h5a;
				8'hbf:out =8'hf4;
				8'hc0:out =8'h1f;
				8'hc1:out =8'hdd;
				8'hc2:out =8'ha8;
				8'hc3:out =8'h33;
				8'hc4:out =8'h88;
				8'hc5:out =8'h07;
				8'hc6:out =8'hc7;
				8'hc7:out =8'h31;
				8'hc8:out =8'hb1;
				8'hc9:out =8'h12;
				8'hca:out =8'h10;
				8'hcb:out =8'h59;
				8'hcc:out =8'h27;
				8'hcd:out =8'h80;
				8'hce:out =8'hec;
				8'hcf:out =8'h5f;
				8'hd0:out =8'h60;
				8'hd1:out =8'h51;
				8'hd2:out =8'h7f;
				8'hd3:out =8'ha9;
				8'hd4:out =8'h19;
				8'hd5:out =8'hb5;
				8'hd6:out =8'h4a;
				8'hd7:out =8'h0d;
				8'hd8:out =8'h2d;
				8'hd9:out =8'he5;
				8'hda:out =8'h7a;
				8'hdb:out =8'h9f;
				8'hdc:out =8'h93;
				8'hdd:out =8'hc9;
				8'hde:out =8'h9c;
				8'hdf:out =8'hef;
				8'he0:out =8'ha0;
				8'he1:out =8'he0;
				8'he2:out =8'h3b;
				8'he3:out =8'h4d;
				8'he4:out =8'hae;
				8'he5:out =8'h2a;
				8'he6:out =8'hf5;
				8'he7:out =8'hb0;
				8'he8:out =8'hc8;
				8'he9:out =8'heb;
				8'hea:out =8'hbb;
				8'heb:out =8'h3c;
				8'hec:out =8'h83;
				8'hed:out =8'h53;
				8'hee:out =8'h99;
				8'hef:out =8'h61;
				8'hf0:out =8'h17;
				8'hf1:out =8'h2b;
				8'hf2:out =8'h04;
				8'hf3:out =8'h7e;
				8'hf4:out =8'hba;
				8'hf5:out =8'h77;
				8'hf6:out =8'hd6;
				8'hf7:out =8'h26;
				8'hf8:out =8'he1;
				8'hf9:out =8'h69;
				8'hfa:out =8'h14;
				8'hfb:out =8'h63;
				8'hfc:out =8'h55;
				8'hfd:out =8'h21;
				8'hfe:out =8'h0c;
				8'hff:out =8'h7d;
				endcase
end

endmodule