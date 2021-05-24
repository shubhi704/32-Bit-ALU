
module ALU(
   input [31:0]in1,in2,
   input [3:0]opcode,
   output reg[31:0]alu_out,
   input Enable,
   output parity_flag,zero_flag,sign_flag,carry_flag );

wire [32:0]temp;

assign parity_flag = ~^alu_out ;
assign zero_flag = (alu_out == 0) ;
assign sign_flag = alu_out[31] ;
assign carry_flag = temp[32] ;

assign temp = in1 + in2 ;

always @(*)
  begin
   case(opcode) 
     4'd0 : alu_out =  in1 + in2 ;
     4'd1 : alu_out =  in1 - in2 ;
     4'd2 : alu_out =  in1 * in2 ;
     4'd3 : alu_out =  in1 & in2 ;
     4'd4 : alu_out = ~(in1 & in2); 
     4'd5 : alu_out =  in1 | in2 ;
     4'd6 : alu_out = ~in1;
     4'd7 : alu_out = ~(in1 ^ in2);
     4'd8 : alu_out =  {in1[30:0],1'b0} ;
     4'd9 : alu_out =  {1'b0,in1[31:1]} ;
    4'd10 : alu_out =  {in1[31],in1[31:1]} ;
    4'd11 : alu_out =  {in1[30:0],in1[0]} ;
    4'd12 : alu_out =  in1 - 1 ;
    4'd13 : alu_out = in1 + 1 ;
    4'd14 : alu_out =  (in1 > in2) ;
    4'd15 : alu_out =  (in1 == in2 ) ;  
    default: alu_out =  in1 ;
   endcase
 end
endmodule  

  

