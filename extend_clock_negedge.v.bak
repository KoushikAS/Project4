module extend_clock_negedge(clock, reset, in_clock);
	 output reg clock;
	input in_clock, reset;
	
	integer counter =0;
	
	always @(negedge in_clock)
	begin
		counter = counter +1;
		if(reset == 0)
			begin
				if(counter % 2 != 0)
					begin
						clock <=1'b1;
					end
				else
					begin
						clock <= 1'b0;
					end
			end
		else
		begin
			counter = 0;
			clock <= 1'b0; 
		end
	end
endmodule 

//citation :
//http://referencedesigner.com/tutorials/verilogexamples/verilog_ex_02.php