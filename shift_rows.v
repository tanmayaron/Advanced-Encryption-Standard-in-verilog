module shift_rows(
    input [127:0] in, input clk, output reg [127:0] out
); 

always@(posedge clk)
    begin
        out[7:0]<=in[7:0]; //0
        out[15:8]<=in[47:40]; //1
        out[23:16]<=in[87:80]; //2
        out[31:24]<=in[127:120]; //3

        out[39:32]<=in[39:32]; //4
        out[47:40]<=in[79:72]; //5
        out[55:48]<=in[119:112]; //6
        out[63:56]<=in[31:24]; //7

        out[71:64]<=in[71:64]; //8
        out[79:72]<=in[111:104]; //9
        out[87:80]<=in[23:16]; //10
        out[95:88]<=in[63:56]; //11

        out[103:96]<=in[103:96]; //12
        out[111:104]<=in[15:8]; //13
        out[119:112]<=in[55:48]; //14
        out[127:120]<=in[95:88]; //15
    end

    
endmodule