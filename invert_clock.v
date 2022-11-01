module invert_clock(clk, in_clk, rst);
	output reg clk;
	input in_clk, rst;
	
	always
	begin
		if(rst == 0)
		begin
			clk <= ~in_clk;
		end
		else
		begin
			clk <= 1'b0;
		end
	end
	
endmodule 

//citation :
//http://referencedesigner.com/tutorials/verilogexamples/verilog_ex_02.php