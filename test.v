`timescale 1ns/1ps

module aluTest;

reg [31:0]in1,in2;
reg [3:0]opcode;
reg Enable;

wire [31:0]alu_out;
wire parity_flag,zero_flag,sign_flag,carry_flag ;

 ALU dut(in1,in2,opcode,alu_out,Enable,parity_flag,zero_flag,sign_flag,carry_flag );


initial
 begin : random_inputs 

  in1 = 32'hffffffff;
  in2 = 32'hffffffff;
    opcode = 4'd0;  #10; 
    in1 = 32'hff;
    in2 = 32'hff;
    #10; opcode = 4'd1;  
    #10; opcode = 4'd2;   
    #10; opcode = 4'd3;   
    #10; opcode = 4'd4;   
    #10; opcode = 4'd5; 
    #10; opcode = 4'd6;  
    #10; opcode = 4'd7;  
    #10; opcode = 4'd8;  
    #10; opcode = 4'd9;  
    #10; opcode = 4'd10; 
    #10; opcode = 4'd11;  
    #10; opcode = 4'd12;  
    #10; opcode = 4'd13; 
    #10; opcode = 4'd14;
    #10; opcode = 4'd15; 
   #40;
    fork // parallel blocks
        	#4.7 opcode = 4'h5; // all the statements will execute at 0 ns
        	#4.8 opcode = 4'h6; // all the statements will execute at 0 ns
        	#4.9 opcode = 4'h3; // all the statements will execute at 0 ns
        	#5.0 opcode = 4'h5; // all the statements will execute at 0 ns
        	#5.1 opcode = 4'h6; // all the statements will execute at 0 ns
        	#5.2 opcode = 4'h7; // all the statements will execute at 0 ns
      join 


   #30 $finish ;
 end

initial
 begin
  $dumpfile("aluWaveform.vcd");
  $dumpvars;
 end

endmodule
 
 