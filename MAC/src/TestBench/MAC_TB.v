timeunit 1ns;
timeprecision 1ps;
module MAC_tb;


//Internal signals declarations:
logic SYS_CLK;
logic SCLR;
logic LOAD;
logic [MAC_PKG::IN1_WIDTH-1:0]A;
logic [MAC_PKG::IN2_WIDTH-1:0]B;
logic [MAC_PKG::OUT_WIDTH-1:0]MAC_OUT;	



// Unit Under Test port map
	MAC UUT (
		.SYS_CLK(SYS_CLK),
		.SCLR(SCLR),
		.LOAD(LOAD),
		.A(A),
		.B(B),	
		.MAC_OUT(MAC_OUT));	  
		
		
time CLOCK_PERIOD=100ns;
time RUN_TIME=3600ns;

initial
	begin: CLOCK_GENERATOR 
	SYS_CLK='b0;
	forever
	begin  
	
	#(CLOCK_PERIOD/2);
	SYS_CLK=~SYS_CLK;
	
	end
	end	:CLOCK_GENERATOR 
	
initial 
	begin: INPUT_GENERATOR
	A=3;
	B=1;
	
	fork 
	forever
	begin
	#150ns;
	A=A+1;
	end
	
	forever
	begin
	#600ns;
	B=B+1;
	end
	join
	
	end:   INPUT_GENERATOR

initial
	begin: CONTROL
	SCLR=1'b1;
	LOAD=1'b0;
	#100ns;
	SCLR=1'b0;
	LOAD='b1;
	#3000ns;
	SCLR='b1;
	#150ns;
	SCLR='b0;
	
	end: CONTROL	 
	
initial 
	begin: SYSTEM_RUN_TIME
	#RUN_TIME;
	$finish;
	end: SYSTEM_RUN_TIME
endmodule
