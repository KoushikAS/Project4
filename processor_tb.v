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
	

	 integer counter =0;
 
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
										
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on  ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
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
										
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on  ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
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
										
				if( ctrl_writeReg != 5'd1) begin
					$display("**Error on  ctrl_writeReg: read %h but expected %h.", ctrl_writeReg, 5'd1);
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
		  
		  $display($time, " << End  Simulation >>");
		  $stop;
	 end
		  
	
	// Clock generator
	always
		#10     clock = ~clock;    // toggle

/**		
	 reg  main_clock, main_ctrl_reset;
    wire imem_clock, dmem_clock, processor_clock, regfile_clock;
    wire [31:0] main_q_imem;
	 wire [11:0] main_address_dmem;
    wire [31:0] main_data;
    wire main_wren;
	 wire main_ctrl_writeEnable;
    wire [4:0] main_ctrl_writeReg;
    wire [31:0] main_data_writeReg;

	 
	 integer main_counter;
	 
	 skeleton s1(main_clock, main_ctrl_reset, imem_clock, dmem_clock, processor_clock, regfile_clock,
    main_q_imem,  main_ctrl_writeEnable, main_ctrl_writeReg, main_data_writeReg, main_address_dmem, main_data, main_wren);
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
		  @(posedge main_clock);    // wait until next positive edge of clock
		  
		  begin
		  @(posedge processor_clock);
		  @(posedge imem_clock);	  
		  @(posedge imem_clock);	//Don't know why ? Should check 

				$display("*Checking nop.");
				if(main_q_imem != 32'b0000000000000000000000000000000) begin
					$display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b0000000000000000000000000000000);
				end
		  end
		  
		  begin
		  @(posedge imem_clock);
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
				$display("*IMP 1st instruction on main_data_writeReg read %h.", main_data_writeReg);
				if(main_data_writeReg != 32'd5) begin
					$display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd5);
				end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge imem_clock);
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
			  $display("*IMP 1st instruction on main_data_writeReg read %h.", main_data_writeReg);
			  if(main_data_writeReg != 32'd3) begin
		       $display("**Error on main_data_writeReg read %h but expected %h.", main_data_writeReg,  32'd3);
			  end
				if(main_wren != 1'b0) begin
					$display("**Error on main_wren read %h but expected %h.", main_ctrl_writeEnable,  1'b0);
				end
		  end
		  
		  begin
		  @(posedge imem_clock);
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
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
		  @(posedge imem_clock); 
			  $display("*Checking end");
			  if(main_q_imem != 32'b00000000000000000000000000000000) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000000000000000000000000000000);
			  end
		  end
		  
		  begin
		  @(posedge imem_clock); 
			  $display("*Checking end");
			  if(main_q_imem != 32'b00000000000000000000000000000000) begin
				 $display("**Error on main_q_imem read %h but expected %h.", main_q_imem,  32'b00000000000000000000000000000000);
			  end
		  end
		  
		  

		  $display($time, " << End  Simulation Skeleton>>");
		  $stop;
	end
	
	always
	#10     main_clock = ~main_clock;    // toggle

**/
	
endmodule 