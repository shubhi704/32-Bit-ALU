# 32-Bit-ALU




# Operation Table:

<meta name="ProgId" content="PowerPoint.Slide">
<meta name="Generator" content="Microsoft PowerPoint 15">
<style>
<!--tr
	{mso-height-source:auto;}
col





	{mso-width-source:auto;}
td
	{padding-top:1.0px;
	padding-right:1.0px;
	padding-left:1.0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:18.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;}
.oa1
	{border-top:1.0pt solid white;
	border-right:1.0pt solid white;
	border-bottom:3.0pt solid white;
	border-left:1.0pt solid white;
	background:#4472C4;
	mso-pattern:auto none;
	vertical-align:top;
	padding-bottom:3.6pt;
	padding-left:7.2pt;
	padding-top:3.6pt;
	padding-right:7.2pt;}
.oa2
	{border-top:3.0pt solid white;
	border-right:1.0pt solid white;
	border-bottom:1.0pt solid white;
	border-left:1.0pt solid white;
	background:#CFD5EA;
	mso-pattern:auto none;
	vertical-align:top;
	padding-bottom:3.6pt;
	padding-left:7.2pt;
	padding-top:3.6pt;
	padding-right:7.2pt;}
.oa3
	{border:1.0pt solid white;
	background:#E9EBF5;
	mso-pattern:auto none;
	vertical-align:top;
	padding-bottom:3.6pt;
	padding-left:7.2pt;
	padding-top:3.6pt;
	padding-right:7.2pt;}
.oa4
	{border:1.0pt solid white;
	background:#CFD5EA;
	mso-pattern:auto none;
	vertical-align:top;
	padding-bottom:3.6pt;
	padding-left:7.2pt;
	padding-top:3.6pt;
	padding-right:7.2pt;}
-->
</style>



<!--StartFragment-->


opcode | Operation
-- | --
4’d0 | Arithmetic Addition
4’d1 | Arithmetic Subtraction
4’d2 | Multiplication
4’d3 | Bitwise AND
4’d4 | Bitwise NAND
4’d5 | Bitwise OR
4’d6 | Bitwise NOT
4’d7 | Bitwise NOR
4’d8 | Left Shift by 1
4’d9 | Right Shift by 1
4’d10 | Arithmetic Right Shift
4’d11 | Arithmetic Left Shift
4’d12 | Decrement
4’d13 | Increment
4’d14 | Greater than
4’d15 | Equal to



<!--EndFragment-->

# ALU Flags:

Sign_flag   
Carry_flag 
zero_flag
Parity_flag


