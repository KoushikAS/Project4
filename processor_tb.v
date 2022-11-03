// ---------- SAMPLE TEST BENCH ----------
`timescale 1 ns / 100 ps
module processor_tb();

    reg  clock, ctrl_reset;
    wire imem_clock, dmem_clock, processor_clock, regfile_clock;
	 wire [11:0] address_imem;
    reg [31:0] q_imem;
	 wire [11:0] address_dmem;
    wire [31:0] data;
    wire wren;
    reg  [31:0] q_dmem;	 
	 wire ctrl_writeEnable;
    wire [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    wire [31:0] data_writeReg;
    reg  [31:0] data_readRegA, data_readRegB;

	 
	processor ptest(clock, ctrl_reset, address_imem, q_imem, address_dmem, data, wren, q_dmem, ctrl_writeEnable, ctrl_writeReg, 
ctrl_readRegA, ctrl_readRegB, data_writeReg,  data_readRegA, data_readRegB);

	 initial
	 begin
		  $display($time, " << Starting the Simulation >>");
		  clock = 1'b0;    // at time 0
		  
		  ctrl_reset = 1'b1;    // assert reset
		  @(negedge clock);    // wait until next negative edge of clock
		  @(negedge clock);    // wait until next negative edge of clock

		  ctrl_reset = 1'b0;    // de-assert reset
		  @(negedge clock);    // wait until next negative edge of clock
		  
		  //ADD Rtype
		  //ADD $1, $2, $3
			q_imem = 32'b00000000010001000011000000000000;
			data_readRegA = 32'd5;
			data_readRegB = 32'd6;
			$display($time, " << Checking Addition >>");
			
			begin
				@(negedge clock); 
			
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on Addition ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on Addition ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
				
				if( ctrl_readRegB != 5'd3) begin
					$display("**Error on Addition ctrl_readRegB: read %h but expected %h.", ctrl_readRegB, 5'd3);
				end
				
				if( data_writeReg != 32'd11) begin
					$display("**Error on Addition data_writeReg: read %h but expected %h.", data_writeReg, 32'd11);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on Addition ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
		   //ADD Rtype Overflow
		  //ADD $1, $2, $3
			q_imem = 32'b00000000010001000011000000000000;
			data_readRegA = 32'h80000000;
			data_readRegB = 32'h80000000;
			$display($time, " << Checking Addition Overflow >>");
			
			begin
				@(negedge clock); 
			
				if( ctrl_writeReg != 5'd30) begin
					$display("**Error on Addition ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd30);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on Addition ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
				
				if( ctrl_readRegB != 5'd3) begin
					$display("**Error on Addition ctrl_readRegB: read %h but expected %h.", ctrl_readRegB, 5'd3);
				end
				
				if( data_writeReg != 32'd1) begin
					$display("**Error on Addition data_writeReg: read %h but expected %h.", data_writeReg, 32'd1);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on Addition ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//ADD Itype
		  //ADD $1, $2, $3
			q_imem = 32'b00101000010001000000000000010100;
			data_readRegA = 32'd5;
			data_readRegB = 32'd6;
			$display($time, " << Checking Addition I >>");
			
			begin
				@(negedge clock); 
			
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on Addition ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on Addition ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
						
				if( data_writeReg != 32'd25) begin
					$display("**Error on Addition data_writeReg: read %h but expected %h.", data_writeReg, 32'd25);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on Addition ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			
		  //ADD Itype
		  //ADD $1, $2, $3
			q_imem = 32'b00101000010001000000000000000001;
			data_readRegA = 32'h7FFFFFFF;
			data_readRegB = 32'd6;
			$display($time, " << Checking Addition I Overflow >>");
			
			begin
				@(negedge clock); 
			
				if( ctrl_writeReg != 5'd30) begin
					$display("**Error on Addition ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd30);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on Addition ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
						
				if( data_writeReg != 32'd2) begin
					$display("**Error on Addition data_writeReg: read %h but expected %h.", data_writeReg, 32'd2);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on Addition ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end

				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//SUB 
		  //SUB $1, $2, $3
			q_imem = 32'b00000000010001000011000000000100;
			data_readRegA = 32'd7;
			data_readRegB = 32'd6;
			$display($time, " << Checking Subtraction >>");
			
			begin
				@(negedge clock); 
			
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on Sub ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on Sub ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
								
				if( ctrl_readRegB != 5'd3) begin
					$display("**Error on Sub ctrl_readRegB: read %h but expected %h.", ctrl_readRegA, 5'd3);
				end
						
				if( data_writeReg != 32'd1) begin
					$display("**Error on Sub data_writeReg: read %h but expected %h.", data_writeReg, 32'd1);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on Sub ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end

				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
		  
		  			
			//SUB 
		  //SUB $1, $2, $3
			q_imem = 32'b00000000010001000011000000000100;
			data_readRegA = 32'h80000000;
			data_readRegB = 32'h0F000000;
			$display($time, " << Checking Sub Overflow >>");
			
			begin
				@(negedge clock); 
			
				if( ctrl_writeReg != 5'd30) begin
					$display("**Error on ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd30);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
								
				if( ctrl_readRegB != 5'd3) begin
					$display("**Error on ctrl_readRegB: read %h but expected %h.", ctrl_readRegA, 5'd3);
				end
						
				if( data_writeReg != 32'd3) begin
					$display("**Error on data_writeReg: read %h but expected %h.", data_writeReg, 32'd3);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end

				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//AND 
		  //AND $1, $2, $3
			q_imem = 32'b00000000010001000011000000001000;
			data_readRegA = 32'd5;
			data_readRegB = 32'd3;
			$display($time, " << Checking AND >>");
			
			begin
				@(negedge clock); 
			
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on  ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
								
				if( ctrl_readRegB != 5'd3) begin
					$display("**Error on  ctrl_readRegB: read %h but expected %h.", ctrl_readRegA, 5'd3);
				end
						
				if( data_writeReg != 32'd1) begin
					$display("**Error on  data_writeReg: read %h but expected %h.", data_writeReg, 32'd1);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
		
			//OR 
		  //OR $1, $2, $3
			q_imem = 32'b00000000010001000011000000001100;
			data_readRegA = 32'd5;
			data_readRegB = 32'd3;
			$display($time, " << Checking OR >>");
			
			begin
				@(negedge clock); 
			
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on  ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
								
				if( ctrl_readRegB != 5'd3) begin
					$display("**Error on  ctrl_readRegB: read %h but expected %h.", ctrl_readRegA, 5'd3);
				end
						
				if( data_writeReg != 32'd7) begin
					$display("**Error on  data_writeReg: read %h but expected %h.", data_writeReg, 32'd7);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//SLL 
		  //SLL $1, $2, 2
			q_imem = 32'b00000000010001000011000100010000;
			data_readRegA = 32'd5;
			data_readRegB = 32'd3;
			$display($time, " << Checking SLL >>");
			
			begin
				@(negedge clock); 
			
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on  ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
								
						
				if( data_writeReg != 32'd20) begin
					$display("**Error on  data_writeReg: read %h but expected %h.", data_writeReg, 32'd20);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//SRR 
		  //SRR $1, $2, 2
			q_imem = 32'b00000000010001000011000100010100;
			data_readRegA = 32'd5;
			data_readRegB = 32'd3;
			$display($time, " << Checking SRR >>");
			
			begin
				@(negedge clock); 
			
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on  ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
								
						
				if( data_writeReg != 32'd1) begin
					$display("**Error on  data_writeReg: read %h but expected %h.", data_writeReg, 32'd1);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end		
			end
			
			
			//SW 
		  //SW $1, 20($2)
			q_imem = 32'b00111000010001000000000000010100;
			data_readRegA = 32'd5;
			data_readRegB = 32'd3;
			$display($time, " << Checking SW >>");
			
			begin
				@(negedge clock); 
			
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end

				if( ctrl_readRegB != 5'd1) begin
					$display("**Error on  ctrl_readRegB: read %h but expected %h.", ctrl_readRegA, 5'd1);
				end
				
				if( ctrl_writeEnable != 1'b0) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b0);
				end
				
				if( address_dmem != 12'd25) begin
					$display("**Error on  address_dmem: read %h but expected %h.", address_dmem, 12'd25);
				end
				
				if( data != 32'd3) begin
					$display("**Error on  data: read %h but expected %h.", data, 32'd3);
				end
				
				if( wren != 1'b1) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b1);
				end				
			end
			
			//LW
		  //LW $1, 20($2)
			q_imem = 32'b01000000010001000000000000010100;
			data_readRegA = 32'd5;
			data_readRegB = 32'd3;
			q_dmem = 32'd6;
			$display($time, " << Checking LW >>");
			
			begin
				@(negedge clock); 
			
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end
				
										
				if( data_writeReg != 32'd6) begin
					$display("**Error on  data_writeReg: read %h but expected %h.", data_writeReg, 32'd6);
				end
				
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on  ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
				end
				
				if( address_dmem != 12'd25) begin
					$display("**Error on  address_dmem: read %h but expected %h.", address_dmem, 12'd25);
				end
				
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end				
			end
		  
		  $display($time, " << End  Simulation >>");
		  $stop;
	 end
		  
	
	// Clock generator
	always
		#10     clock = ~clock;    // toggle
	
endmodule 