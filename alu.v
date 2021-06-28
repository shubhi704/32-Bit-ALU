 
 `timescale 1ns/1ns

  module alu(

   input [DATA_WIDTH-1:0]in1,in2,

   input [CONTROL-1:0]opcode,

   output [DATA_WIDTH-1:0]alu_out,

  //input Enable,

   output parity_flag,
          zero_flag,
	      sign_flag,
          carry_flag,
	      auxillary_flag
          );

   localparam DATA_WIDTH = 32, CONTROL = 4;

   wire [DATA_WIDTH-1:0] adder_sub_out,logic_operation_out,bitwise_operation_out,shift_operation_out;

                                              //   opcode[1:0] = 00  +  opcode[2]                         // 0/1 (ADDITION/SUBTRACTION) -> 1-BIT   
					      //   opcode[1:0] = 01  +  opcode[3:2]			  // 00/01/10/11 (Logical Operation) --> 2-BIT
					      //   opcode[1:0] = 10  +  opcode[3:2]			  // 00/01/10/11 (bitwise Operation) --> 2-BIT
					      //   opcode[1:0] = 11  +  opcode[3:2]			  // 00/01/10/11 (shift Operation) --> 2-BIT

  assign parity_flag = ~^alu_out ;
  assign zero_flag = (alu_out == 0) ;
  assign sign_flag = alu_out[DATA_WIDTH-1] ;

  assign alu_out = (opcode[1:0] == 0) ? adder_sub_out : 
		   ((opcode[1:0] == 2'd1) ? logic_operation_out : 
		   ((opcode[1:0] == 2'd2) ? bitwise_operation_out: 
	           ((opcode[1:0] == 2'd3) ? shift_operation_out : in1))) ;



   adder_sub a1(                                   // ADDITION AND SUBTRACTION Operation
	      in1,in2,
	      opcode[2],
	      adder_sub_out,
	      carry_flag,
	      auxillary_flag 
	      );
		                                          
                                                  

   logic_operation a2(
	              in1,in2,
	             opcode[3:2],                  // AND,OR,NOT,logical equality
	              logic_operation_out 
	             );

   bitwise_operation a3(
	              in1,in2,
	              opcode[3:2],                  // bitwise- (AND,OR,NOT,xor)
	               bitwise_operation_out
	               );

   shift_operation a4(
	             in1,in2,
	             opcode[3:2],                  // shift- (right,left,arithmetic left,arithmetic right)
	             shift_operation_out
	             );


 endmodule  


     module adder_sub(                                   // ADDITION AND SUBTRACTION Operation
	   input [DATA_WIDTH-1:0]in1,in2,
	   input opcode,
	   output [DATA_WIDTH-1:0]add_sum,
	   output carry_flag,
	   output auxillary_carry 
	   );
	   localparam DATA_WIDTH = 32;
           wire [DATA_WIDTH-1:0]temp;

           adder_sub_16 we1(in1[15:0],in2[15:0],opcode,1'b0,add_sum[15:0],auxillary_carry);
           adder_sub_16 we2(in1[31:16],in2[31:16],opcode,auxillary_carry,add_sum[31:16],carry_flag);

	  endmodule

      module adder_sub_16(                                   // ADDITION AND SUBTRACTION Operation
	   input [((DATA_WIDTH/2)-1):0]in1,in2,
	   input opcode,cin,
	   output [((DATA_WIDTH/2)-1):0]add_sum,
	   output carry
	   );
	   localparam DATA_WIDTH = 32;
           wire [(DATA_WIDTH/2):0]temp;
        
       	  //assign temp = {(DATA_WIDTH/2){opcode}} ^ {in2,cin};                                        // 2's complement logic

          //  assign {auxillary_carry,add_sum[15:0]} = in1[15:0] + temp[15:0] + opcode;       // if opcode = 1 SUB else ADD operation
     
	  // assign {carry,add_sum} = in1 + temp + opcode ;
	 
	  assign {carry,add_sum} = opcode ? (in1-in2-cin) : (in1+in2+cin) ;

	  endmodule



  module logic_operation(
	   input [DATA_WIDTH-1:0]a,b,
	   input [1:0]opcode,                  // AND,OR,NOT,logical equality
	   output [DATA_WIDTH-1:0]out 
	   );
    localparam DATA_WIDTH = 32;

	   assign out = (opcode == 0) ? a&&b : 
		          ((opcode==2'd1) ? (a||b) : 
		     	  ((opcode==2'd2) ? !a : 
			      ((opcode==2'd3) ? (a==b) : a))) ;

		endmodule

   module bitwise_operation(
	   input [DATA_WIDTH-1:0]a,b,
	   input [1:0]opcode,                  // bitwise- (AND,OR,NOT,xor)
	   output [DATA_WIDTH-1:0]out 
	   );
    localparam DATA_WIDTH = 32;

	   assign out = (opcode == 0) ? a&b : 
		        ((opcode==2'd1) ? (a|b) : 
			     ((opcode==2'd2) ? ~a : 
			    ((opcode==2'd3) ? (a^b) : a ))) ;

		endmodule


   module shift_operation(
	   input [DATA_WIDTH-1:0]a,b,
	   input [1:0]opcode,                  // shift- (right,left,arithmetic left,arithmetic right)
	   output [DATA_WIDTH-1:0]out 
	   );
   localparam DATA_WIDTH = 32;

	   assign out = (opcode == 0) ? a>>b : 
		        ((opcode==2'd1) ? (a<<b) : 
			((opcode==2'd2) ? a<<<b : 
			((opcode==2'd3) ? (a>>>b) : a))) ;

		endmodule



		         	
  

