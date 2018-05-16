timeunit 1ns;
timeprecision 1ps;

import MAC_PKG::*;

extern module MAC(
	input logic [IN1_WIDTH-1:0]A,
		  logic [IN2_WIDTH-1:0]B,
		  logic SYS_CLK,
		  logic SCLR,LOAD,
	output logic [OUT_WIDTH-1:0]MAC_OUT);  
	
module MAC(.*);  

logic[5:0] SUM, PRODUCT;

always_comb
begin: ADDER_MULT
PRODUCT=A*B;
SUM=PRODUCT+MAC_OUT;
//S=A*B;	 // checking the output of A * B
end:ADDER_MULT 

always_ff@(posedge SYS_CLK)
begin: REG
if(SCLR) MAC_OUT<=0;
else if(LOAD) MAC_OUT<=SUM;
else MAC_OUT<=MAC_OUT;
end: REG

endmodule: MAC