module assign_clock(clk, rst, in_clk);
	output reg clk;
	input in_clk, rst;
	
	always @(in_clk)
	begin
		if(rst == 0)
		begin
			clk <= in_clk;
		end
		else
		begin
			clk <= 1'b0;
		end
	end
	
	
endmodule 

//citation :
//http://referencedesigner.com/tutorials/verilogexamples/verilog_ex_02.php