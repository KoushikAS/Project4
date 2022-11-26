// ---------- SAMPLE TEST BENCH ----------
`timescale 1 ns / 100 ps
module processor_tb();

    reg  clock, ctrl_reset;
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
	

	/**
	 integer counter =0;
	 integer previous_counter =0 ;
 
	processor ptest(clock, ctrl_reset, address_imem, q_imem, address_dmem, data, wren, q_dmem, ctrl_writeEnable, ctrl_writeReg, 
ctrl_readRegA, ctrl_readRegB, data_writeReg,  data_readRegA, data_readRegB);

	 initial
	 begin
		  $display($time, " << Starting the Simulation >>");
		  clock = 1'b0;    // at time 0
		  
		  ctrl_reset = 1'b1;    // assert reset
		  @(negedge clock);    // wait until next negative edge of clock
		  @(negedge clock);    // wait until next negative edge of clock

		  if(address_imem != counter) begin
			 $display("**Timescale 1 :Error on address_imem read %h but expected %h.", address_imem, counter);
		  end
			
		  ctrl_reset = 1'b0;    // de-assert reset
		  @(negedge clock);    // wait until next negative edge of clock
		  
		  counter = counter +1;
		  if(address_imem != counter) begin
				$display("**Timescale 2 :Error on address_imem read %h but expected %h.", address_imem, counter);
			end
		  
		  //ADD Rtype
		  //ADD $1, $2, $3
			q_imem = 32'b00000000010001000011000000000000;
			data_readRegA = 32'd5;
			data_readRegB = 32'd6;
			q_dmem = 32'd6;
			$display($time, " << Checking Addition >>");
			
			begin
				@(negedge clock); 
			
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
			
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
			q_dmem = 32'd6;
			$display($time, " << Checking Addition Overflow >>");
			
			begin
				@(negedge clock); 

				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
				
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
			q_dmem = 32'd6;
			$display($time, " << Checking Addition I >>");
			
			begin
				@(negedge clock); 
			
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end

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
			q_dmem = 32'd6;
			$display($time, " << Checking Addition I Overflow >>");
			
			begin
				@(negedge clock); 
	
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
				
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
			q_dmem = 32'd6;
			$display($time, " << Checking Subtraction >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
							
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
			q_dmem = 32'd6;
			$display($time, " << Checking Sub Overflow >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
										
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
			q_dmem = 32'd6;
			$display($time, " << Checking AND >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
										
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
			q_dmem = 32'd6;
			$display($time, " << Checking OR >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
										
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
			q_dmem = 32'd6;
			$display($time, " << Checking SLL >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
										
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
			q_dmem = 32'd6;
			$display($time, " << Checking SRR >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
										
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
			q_dmem = 32'd6;
			$display($time, " << Checking SW >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
										
				
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
			
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
											
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
		  
		  //J T
		  //J 5
			q_imem = 32'b00001000000000000000000000000101;
			data_readRegA = 32'd5;
			data_readRegB = 32'd3;
			q_dmem = 32'd6;
			$display($time, " << Checking J T >>");
			
			begin
				@(negedge clock); 
			
				
				counter = 5;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
				
				if( ctrl_writeEnable != 1'b0) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b0);
				end	
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end				
			end
			
			//BNE RD, RS, N 
		  //bne $1, $2, 2
			q_imem = 32'b00010000010001000000000000000010;
			data_readRegA = 32'd3;
			data_readRegB = 32'd3;
			q_dmem = 32'd6;
			$display($time, " << Checking BNE False>>");

						
			begin
				@(negedge clock); 
			
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
										
				if( ctrl_readRegB != 5'd1) begin
					$display("**Error on  ctrl_readRegB: read %h but expected %h.", ctrl_readRegB, 5'd1);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
				
				if( ctrl_writeEnable != 1'b0) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b0);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
		
			//BNE RD, RS, N 
		  //bne $1, $2, 2
			q_imem = 32'b00010000010001000000000000000010;
			data_readRegA = 32'd5;
			data_readRegB = 32'd3;
			q_dmem = 32'd6;
			$display($time, " << Checking BNE  True>>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1 +2;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
													
				if( ctrl_readRegB != 5'd1) begin
					$display("**Error on  ctrl_readRegB: read %h but expected %h.", ctrl_readRegA, 5'd1);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
				
				if( ctrl_writeEnable != 1'b0) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b0);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//BLT RD, RS, N 
		  //blt $1, $2, 2
			q_imem = 32'b00110000010001000000000000000010;
			data_readRegA = 32'd5;
			data_readRegB = 32'd3;
			q_dmem = 32'd6;
			$display($time, " << Checking BLT False >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end									
				
				if( ctrl_readRegB != 5'd1) begin
					$display("**Error on  ctrl_readRegB: read %h but expected %h.", ctrl_readRegA, 5'd1);
				end
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
				
				if( ctrl_writeEnable != 1'b0) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b0);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//BLT RD, RS, N 
		  //blt $1, $2, 2
			q_imem = 32'b00110000010001000000000000000010;
			data_readRegA = 32'd3;
			data_readRegB = 32'd5;
			q_dmem = 32'd6;
			$display($time, " << Checking BLT True >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1 +2;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end			
				
				if( ctrl_readRegA != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
				
				if( ctrl_readRegB != 5'd1) begin
					$display("**Error on  ctrl_readRegB: read %h but expected %h.", ctrl_readRegA, 5'd1);
				end
				
				if( ctrl_writeEnable != 1'b0) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b0);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//JAL T 
		  //jal 5
			q_imem = 32'b00011000000000000000000000000101;
			data_readRegA = 32'd3;
			data_readRegB = 32'd5;
			q_dmem = 32'd6;
			previous_counter = counter + 1;
			$display($time, " << Checking JAL >>");
			
			begin				
				@(negedge clock); 
				
				counter = 5;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end
				//Should test it properly
				if( data_writeReg != previous_counter) begin
					$display("**Error on  data_writeReg: read %h but expected %h.", data_writeReg, previous_counter);
				end
										
				if( ctrl_writeReg != 5'd31) begin
					$display("**Error on  ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd31);
				end
				
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//JR R 
		  //jr $2
			q_imem = 32'b00100000100000000000000000000000;
			data_readRegA = 32'd4;
			data_readRegB = 32'd8;
			q_dmem = 32'd6;
			$display($time, " << Checking JR >>");
			
			begin
				@(negedge clock); 
				
				counter = 8;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end								
				
				if( ctrl_readRegB != 5'd2) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd2);
				end
				
				if( ctrl_writeEnable != 1'b0) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b0);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//BEX False
		  //bex 5
			q_imem = 32'b10110000000000000000000000000101;
			data_readRegA = 32'd4;
			data_readRegB = 32'd0;
			q_dmem = 32'd6;
			$display($time, " << Checking BEX False >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end								
				
				if( ctrl_readRegB != 5'd30) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd30);
				end
				
				if( ctrl_writeEnable != 1'b0) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b0);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//BEX True
		  //bex 5
			q_imem = 32'b10110000000000000000000000000101;
			data_readRegA = 32'd4;
			data_readRegB = 32'd1;
			q_dmem = 32'd6;
			$display($time, " << Checking BEX True >>");
			
			begin
				@(negedge clock); 
				
				counter = 5;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end								
				
				if( ctrl_readRegB != 5'd30) begin
					$display("**Error on  ctrl_readRegA: read %h but expected %h.", ctrl_readRegA, 5'd30);
				end
				
				if( ctrl_writeEnable != 1'b0) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b0);
				end
				
				if( wren != 1'b0) begin
					$display("**Error on  wren: read %h but expected %h.", wren, 1'b0);
				end	
			end
			
			//SETX 
		  //setx 5
			q_imem = 32'b10101000000000000000000000000101;
			data_readRegA = 32'd4;
			data_readRegB = 32'd1;
			q_dmem = 32'd6;
			$display($time, " << Checking SETX >>");
			
			begin
				@(negedge clock); 
				
				counter = counter +1;
				if(address_imem != counter) begin
					$display("**Timescale 3 :Error on address_imem read %h but expected %h.", address_imem, counter);
				end								
				
				if( data_writeReg != 5) begin
					$display("**Error on  data_writeReg: read %h but expected %h.", data_writeReg, 32'd5);
				end
				
				if( ctrl_writeEnable != 1'b1) begin
					$display("**Error on  ctrl_writeEnable: read %h but expected %h.", ctrl_writeEnable, 1'b1);
				end
										
				if( ctrl_writeReg != 5'd30) begin
					$display("**Error on  ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd30);
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
**/
		
	 reg  main_clock, main_ctrl_reset;
    wire imem_clock, dmem_clock, processor_clock, regfile_clock;
    wire [31:0] main_q_imem;
	 wire [11:0] main_address_dmem, main_address_imem, pc_in;
    wire [31:0] main_data;
    wire main_wren;
	 wire main_ctrl_writeEnable;
    wire [4:0] main_ctrl_writeReg;
    wire [31:0] main_data_writeReg;
	 wire [31:0] main_q_dmem;
	 

	 
	 integer main_counter;
	 
	 skeleton s1(main_clock, main_ctrl_reset, imem_clock, dmem_clock, processor_clock, regfile_clock,
    main_q_imem,  main_ctrl_writeEnable, main_ctrl_writeReg, main_data_writeReg, main_address_dmem, main_data, main_wren, main_address_imem, main_q_dmem);
	// main_address_dmem, main_data, main_wren, main_ctrl_writeEnable, main_ctrl_writeReg, main_data_writeReg );

	 initial 
	 begin
		  $display($time, " << Starting the Simulation for skeleton >>");
		  main_clock = 1'b0;    // at time 0
		
	
		  main_ctrl_reset = 1'b1;    // assert reset
		  @(posedge main_clock);    // wait until next positive edge of clock
		  @(posedge main_clock);    // wait until next positive edge of clock
		  @(posedge main_clock);    // wait until next positive edge of clock
		  @(posedge main_clock);    // wait until next positive edge of clock
		  @(posedge main_clock);    // wait until next positive edge of clock
		  @(posedge main_clock);    // wait until next positive edge of clock

		  if(main_q_imem != 32'b0000000000000000000000000000000) begin
			 $display("**nop Error on main_q_imem read %h but expected %h.", main_q_imem, 32'b0000000000000000000000000000000);
		  end
		  	
		  main_ctrl_reset = 1'b0;    // de-assert reset
		 @(posedge main_clock);     // wait until next positive edge of clock
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);
				$display("*Checking nop.");
				if(main_q_imem != 32'b0000000000000000000000000000000) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b0000000000000000000000000000000);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);
				$display("*Checking addi $1, $0, 5");
				if(main_q_imem != 32'b00101000010000000000000000000101) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd5) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd5);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);
				$display("*Checking addi $2, $0, 3");
			  if(main_q_imem != 32'b00101000100000000000000000000011) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000100000000000000000000011);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd2) begin
				 $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
			  end
			  if(main_data_writeReg != 32'd3) begin
		       $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd3);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);
				$display("*Checking add  $3, $1, $2");
				if(main_q_imem != 32'b00000000110000100010000000000000) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000000110000100010000000000000);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd3) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd3);
			  end
			  if(main_data_writeReg != 32'd8) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd8);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock); 
			  $display("*Checking sub $4, $1, $2");
			  if(main_q_imem != 32'b00000001000000100010000000000100) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000001000000100010000000000100);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd4) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd4);
			  end
			  if(main_data_writeReg != 32'd2) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd2);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock); 
			  $display("*Checking and $5, $0, $1");
			  if(main_q_imem != 32'b00000001010000000001000000001000) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000001010000000001000000001000);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd5) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd5);
			  end
			  if(main_data_writeReg != 32'd0) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd0);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock); 
			  $display("*Checking and $6, $1, $2");
			  if(main_q_imem != 32'b00000001100000100010000000001000) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000001100000100010000000001000);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd6) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd6);
			  end
			  if(main_data_writeReg != 32'd1) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd1);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end 
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock); 
			  $display("*Checking or $7, $0, $2");
			  if(main_q_imem != 32'b00000001110000000010000000001100) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000001110000000010000000001100);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd7) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd7);
			  end
			  if(main_data_writeReg != 32'd3) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd3);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock); 
			  $display("*Checking sll $8, $1, 2");
			  if(main_q_imem != 32'b00000010000000100000000100010000) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000010000000100000000100010000);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd8) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd8);
			  end
			  if(main_data_writeReg != 32'd20) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd20);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);  
			  $display("*Checking sra $9, $3, 1");
			  if(main_q_imem != 32'b00000010010001100000000010010100) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000010010001100000000010010100);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd9) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd9);
			  end
			  if(main_data_writeReg != 32'd4) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd4);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);  
			  $display("*Checking and addi $10, $0, 345");
			  if(main_q_imem != 32'b00101010100000000000000101011001) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101010100000000000000101011001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd10) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd10);
			  end
			  if(main_data_writeReg != 32'd345) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd345);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $11, $0, 567");
			  if(main_q_imem != 32'b00101010110000000000001000110111) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101010110000000000001000110111);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd11) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd11);
			  end
			  if(main_data_writeReg != 32'd567) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd567);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);  
			  $display("*Checking sw $10, 1($0)");
			  if(main_q_imem != 32'b00111010100000000000000000000001) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010100000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end				
				if(main_address_dmem != 5'd1) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  5'd1);
			  end
			  if(main_data != 32'd345) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd345);
			  end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);  
			  $display("*Checking sw $11, 2($0)");
			  if(main_q_imem != 32'b00111010110000000000000000000010) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 5'd2) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  5'd2);
			  end
			  if(main_data != 32'd567) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd567);
			  end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);  
			  $display("*Checking lw $12, 1($0)");
			  if(main_q_imem != 32'b01000011000000000000000000000001) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd12) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd12);
			  end
			  if(main_data_writeReg != 32'd345) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd345);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);  
			  $display("*Checking lw $13, 2($0)");
			  if(main_q_imem != 32'b01000011010000000000000000000010) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011010000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd13) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd13);
			  end
			  if(main_data_writeReg != 32'd567) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd567);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock); 
				$display("*Checking addi $1, $0, 162");
				if(main_q_imem != 32'b00101000010000000000000010100010) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd162) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock); 
				$display("*Checking addi $2, $0, 3");
				if(main_q_imem != 32'b00101000100000000000000000000011) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd3) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd3);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock);  
			  $display("*Checking sw $2, 1($1)");
			  if(main_q_imem != 32'b00111000100000100000000000000001) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111000100000100000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd163) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd163);
			  end
			  if(main_data != 32'd3) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd3);
			  end
		  end
		  
		  begin
		  @(posedge processor_clock);
		   @(posedge regfile_clock); 
				$display("*Checking addi $2, $0, 6");
				if(main_q_imem != 32'b00101000100000000000000000000110) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000100000000000000000000110);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd6) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd6);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock);
		 @(posedge regfile_clock);  
			  $display("*Checking sw $2, 2($1)");
			  if(main_q_imem != 32'b00111000100000100000000000000010) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd164) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd164);
			  end
			  if(main_data != 32'd6) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd6);
			  end
		  end
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge regfile_clock); 
				$display("*Checking addi $2, $0, 9");
				if(main_q_imem != 32'b00101000100000000000000000001001) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd9) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd9);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 2($1)");
			  if(main_q_imem != 32'b00111000100000100000000000000011) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd165) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd165);
			  end
			  if(main_data != 32'd9) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd9);
			  end
		  end

		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 12");
				if(main_q_imem != 32'b00101000100000000000000000001100) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd12) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd12);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 4($1)");
			  if(main_q_imem != 32'b00111000100000100000000000000100) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd166) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd166);
			  end
			  if(main_data != 32'd12) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd12);
			  end
		  end		  

		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 15");
				if(main_q_imem != 32'b00101000100000000000000000001111) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd15) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd15);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 6($1)");
			  if(main_q_imem != 32'b00111000100000100000000000000101) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd167) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd167);
			  end
			  if(main_data != 32'd15) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd15);
			  end
		  end		

		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 18");
				if(main_q_imem != 32'b00101000100000000000000000010010) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd18) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd18);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 6($1)");
			  if(main_q_imem != 32'b00111000100000100000000000000110) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd168) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd168);
			  end
			  if(main_data != 32'd18) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd18);
			  end
		  end	
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 21");
				if(main_q_imem != 32'b00101000100000000000000000010101) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd21) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd21);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 7($1)");
			  if(main_q_imem != 32'b00111000100000100000000000000111) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd169) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd169);
			  end
			  if(main_data != 32'd21) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd21);
			  end
		  end	

		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 24");
				if(main_q_imem != 32'b00101000100000000000000000011000) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd24) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd24);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 7($1)");
			  if(main_q_imem != 32'b00111000100000100000000000001000) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd170) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd170);
			  end
			  if(main_data != 32'd24) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd24);
			  end
		  end	

		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 27");
				if(main_q_imem != 32'b00101000100000000000000000011011) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd27) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd27);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 9($1)");
			  if(main_q_imem != 32'b00111000100000100000000000001001) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd171) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd171);
			  end
			  if(main_data != 32'd27) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd27);
			  end
		  end	 
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 30");
				if(main_q_imem != 32'b00101000100000000000000000011110) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd30) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd30);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 10($1)");
			  if(main_q_imem != 32'b00111000100000100000000000001010) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd172) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd172);
			  end
			  if(main_data != 32'd30) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd30);
			  end
		  end	 
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 33");
				if(main_q_imem != 32'b00101000100000000000000000100001) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd33) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd33);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 11($1)");
			  if(main_q_imem != 32'b00111000100000100000000000001011) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd173) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd173);
			  end
			  if(main_data != 32'd33) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd33);
			  end
		  end	

		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 36");
				if(main_q_imem != 32'b00101000100000000000000000100100) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd36) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd36);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 11($1)");
			  if(main_q_imem != 32'b00111000100000100000000000001100) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd174) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd174);
			  end
			  if(main_data != 32'd36) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd36);
			  end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 39");
				if(main_q_imem != 32'b00101000100000000000000000100111) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd2);
				end
				if(main_data_writeReg != 32'd39) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd39);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking sw $2, 11($1)");
			  if(main_q_imem != 32'b00111000100000100000000000001101) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00111010110000000000000000000010);
			  end
			  if(main_ctrl_writeEnable != 1'b0) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
			  end
				if(main_wren != 1'b1) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end 
				if(main_address_dmem != 12'd175) begin
			    $display("**Error on main_address_dmem read %h but expected %h.", main_address_dmem,  12'd175);
			  end
			  if(main_data != 32'd39) begin
			    $display("**Error on main_data read %h but expected %h.", main_data,  32'd39);
			  end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $4, 1($1)");
			  if(main_q_imem != 32'b01000001000000100000000000000001) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd4) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd4);
			  end
			  if(main_data_writeReg != 32'd3) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd3);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $5, 2($1)");
			  if(main_q_imem != 32'b01000001010000100000000000000010) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd5) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd5);
			  end
			  if(main_data_writeReg != 32'd6) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd6);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $6, 3($1)");
			  if(main_q_imem != 32'b01000001100000100000000000000011) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd6) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd6);
			  end
			  if(main_data_writeReg != 32'd9) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd9);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $7, 4($1)");
			  if(main_q_imem != 32'b01000001110000100000000000000100) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd7) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd7);
			  end
			  if(main_data_writeReg != 32'd12) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd12);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $8, 5($1)");
			  if(main_q_imem != 32'b01000010000000100000000000000101) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd8) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd8);
			  end
			  if(main_data_writeReg != 32'd15) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd15);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $9, 6($1)");
			  if(main_q_imem != 32'b01000010010000100000000000000110) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd9) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd9);
			  end
			  if(main_data_writeReg != 32'd18) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd18);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $10, 7($1)");
			  if(main_q_imem != 32'b01000010100000100000000000000111) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd10) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd10);
			  end
			  if(main_data_writeReg != 32'd21) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd21);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $11, 8($1)");
			  if(main_q_imem != 32'b01000010110000100000000000001000) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd11) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd11);
			  end
			  if(main_data_writeReg != 32'd24) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd24);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $12, 9($1)");
			  if(main_q_imem != 32'b01000011000000100000000000001001) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd12) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd12);
			  end
			  if(main_data_writeReg != 32'd27) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd27);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $13, 10($1)");
			  if(main_q_imem != 32'b01000011010000100000000000001010) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd13) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd13);
			  end
			  if(main_data_writeReg != 32'd30) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd30);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $14, 11($1)");
			  if(main_q_imem != 32'b01000011100000100000000000001011) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd14) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd14);
			  end
			  if(main_data_writeReg != 32'd33) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd33);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $15, 12($1)");
			  if(main_q_imem != 32'b01000011110000100000000000001100) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd15) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd15);
			  end
			  if(main_data_writeReg != 32'd36) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd36);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking lw $16, 13($1)");
			  if(main_q_imem != 32'b01000100000000100000000000001101) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b01000011000000000000000000000001);
			  end
			  if(main_ctrl_writeEnable != 1'b1) begin
				 $display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
			  end
			  if(main_ctrl_writeReg != 5'd16) begin
			    $display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd16);
			  end
			  if(main_data_writeReg != 32'd39) begin
			    $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd39);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  
	
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking J 58");
				if(main_q_imem != 32'b00001000000000000000000000111010) begin
					$display("**Error on main_q_imem read %b but expected %b.", main_q_imem,  32'b00001000000000000000000000111010);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
				if(main_address_imem != 12'd58) begin
					$display("**Error on main_address_imem read %d but expected %d.", main_address_imem,  12'd58);
				end
				if(pc_in != 12'd58) begin
					$display("**Error on pc_in read %d but expected %d.", pc_in,  12'd58);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking jal 60");
				if(main_q_imem != 32'b00011000000000000000000000111100) begin
					$display("**Error on main_q_imem read %b but expected %b.", main_q_imem,  32'b00011000000000000000000000111100);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd31) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd31);
				end
				if(main_data_writeReg != 32'd57) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd57);
				end
				if(main_address_imem != 12'd60) begin
					$display("**Error on main_address_imem read %d but expected %d.", main_address_imem,  12'd60);
				end
				if(pc_in != 12'd60) begin
					$display("**Error on pc_in read %d but expected %d.", pc_in,  12'd60);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
	
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $4, $0, 63");
				if(main_q_imem != 32'b00101001000000000000000000111111) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd4) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd63) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking jr $4");
				if(main_q_imem != 32'b00100001000000000000000000000000) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
				if(main_address_imem != 12'd63) begin
					$display("**Error on main_address_imem read %d but expected %d.", main_address_imem,  12'd60);
				end
				if(pc_in != 12'd63) begin
					$display("**Error on pc_in read %d but expected %d.", pc_in,  12'd60);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking setx 0");
				if(main_q_imem != 32'b10101000000000000000000000000000) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd30) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd0) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking bex 100");
				if(main_q_imem != 32'b10110000000000000000000001100100) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking setx 4");
				if(main_q_imem != 32'b10101000000000000000000000000100) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd30) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd4) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking bex 68");
				if(main_q_imem != 32'b10110000000000000000000001000100) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
				if(main_address_imem != 12'd68) begin
					$display("**Error on main_address_imem read %d but expected %d.", main_address_imem,  12'd69);
				end
				if(pc_in != 12'd68) begin
					$display("**Error on pc_in read %d but expected %d.", pc_in,  12'd69);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 10");
				if(main_q_imem != 32'b00101000100000000000000000001010) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd10) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $1, $0, 5");
				if(main_q_imem != 32'b00101000010000000000000000000101) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd5) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking bne $1, $2, 1");
				if(main_q_imem != 32'b00010000010001000000000000000001) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
				if(main_address_imem != 12'd72) begin
					$display("**Error on main_address_imem read %d but expected %d.", main_address_imem,  12'd69);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $1, $0, 10");
				if(main_q_imem != 32'b00101000010000000000000000001010) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd10) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking bne $1, $2, 100");
				if(main_q_imem != 32'b00010000010001000000000001100100) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
				if(main_address_imem != 12'd74) begin
					$display("**Error on main_address_imem read %d but expected %d.", main_address_imem,  12'd69);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $1, $0, 0");
				if(main_q_imem != 32'b00101000010000000000000000000000) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd0) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		   begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking blt $1, $2, 1");
				if(main_q_imem != 32'b00110000010001000000000000000001) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
				if(main_address_imem != 12'd77) begin
					$display("**Error on main_address_imem read %d but expected %d.", main_address_imem,  12'd77);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $1, $0, 10");
				if(main_q_imem != 32'b00101000010000000000000000001010) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd10) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking blt $1, $2, 100");
				if(main_q_imem != 32'b00110000010001000000000001100100) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
				if(main_address_imem != 12'd79) begin
					$display("**Error on main_address_imem read %d but expected %d.", main_address_imem,  12'd69);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $1, $0, 5");
				if(main_q_imem != 32'b00101000010000000000000000000101) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd5) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking end");
			  if(main_q_imem != 32'b00000000000000000000000000000000) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000000000000000000000000000000);
			  end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking end");
			  if(main_q_imem != 32'b00000000000000000000000000000000) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000000000000000000000000000000);
			  end
		  end
		  
		  		/** 
		  	  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $1, $0, 1");
				if(main_q_imem != 32'b00101000010000000000000000000001) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd1) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $2, $0, 1");
				if(main_q_imem != 32'b00101000100000000000000000000001) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd2) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd1) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $3, $0, 3");
				if(main_q_imem != 32'b00101000110000000000000000000011) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd3) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd3) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking add $1, $3, $2");
				if(main_q_imem != 32'b00000000010000100010000000000000) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd4) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd2);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking bne $3, $1, 58");
				if(main_q_imem != 32'b00010000110000100000000000111010) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking add $1, $1, $2");
				if(main_q_imem != 32'b00000000010000100010000000000000) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd3) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd3);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking bne $3, $1, 58");
				if(main_q_imem != 32'b00010000110000100000000000111010) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end

		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $1, $0, 1");
				if(main_q_imem != 32'b00101000010000000000000000000001) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd1) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end		  
 
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $1, $1, $2");
				if(main_q_imem != 32'b00000000010000100010000000000000) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd2) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking blt $3, $1, 61");
				if(main_q_imem != 32'b00110000110000100000000000111101) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking addi $1, $1, $2");
				if(main_q_imem != 32'b00000000010000100010000000000000) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b1) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_ctrl_writeReg != 5'd1) begin
					$display("**Error on main_ctrl_writeReg read %h but expected %h.", main_ctrl_writeReg,  5'd1);
				end
				if(main_data_writeReg != 32'd3) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd162);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end	
		  
		  begin
		  @(posedge processor_clock); 
		  @(posedge regfile_clock); 
			  $display("*Checking blt $3, $1, 60");
				if(main_q_imem != 32'b00110000110000100000000000111101) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00101000010000000000000000000101);
				end
				if(main_ctrl_writeEnable != 1'b0) begin
					$display("**Error on main_ctrl_writeEnable read %h but expected %h.", main_ctrl_writeEnable,  1'b1);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  	**/	  

		  $display($time, " << End  Simulation Skeleton>>");
		  $stop;
	end
	
	always
	#10     main_clock = ~main_clock;    // toggle


	
endmodule 