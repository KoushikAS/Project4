module extend_clock(clk, in_clk, rst);
	 output reg clk;
	input in_clk, rst;
	
	integer count;
	
	always @(posedge in_clk)
	begin
		if(rst == 0)
		begin
			count <= count + 1;
			if(count % 2 == 0)
			begin
				clk <= ~clk;
			end
		end
		else
		begin
			count <= 0;
			clk <= 1'b0; 
		end
	end
endmodule 

//citation :
//http://referencedesigner.com/tutorials/verilogexamples/verilog_ex_02.php