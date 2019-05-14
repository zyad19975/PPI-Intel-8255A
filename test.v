`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:59:33 11/28/2018
// Design Name:   PPI_8255
// Module Name:   D:/Courses/Digital/KOLIA/PPI_Project/Programmable_preripheral_interface/test.v
// Project Name:  Programmable_preripheral_interface
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PPI_8255
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg write;
	reg read;
	reg cs;
	reg reset;
	reg [1:0] A;

	// Bidirs
	wire [7:0] D;
	wire [7:0] PA;
	wire [7:0] PB;
	wire [7:0] PC;

	// Instantiate the Unit Under Test (UUT)
	PPI_8255 uut (
		.D(D), 
		.PA(PA), 
		.PB(PB), 
		.PC(PC), 
		.write(write), 
		.read(read), 
		.cs(cs), 
		.reset(reset), 
		.A_in(A)
	);

assign D = (!read && write ) ? 8'b1000_0000 : 8'bzzzz_zzzz ; //write in D and output on ports
assign PA =(read && !write )? 8'b1111_0000 : 8'bzzzz_zzzz;
assign PB =  (read && !write)? 8'b0000_1111 : 8'bzzzz_zzzz;
assign PC = (read && !write && A==2'b10)? 8'b1111_1111 : 8'bzzzz_zzzz;


	initial begin
	
// read control word	
cs =  0;
reset = 0;
A = 2'b11;


//Write Controls
read = 0;
write = 1;


#10
// Write on port A
A = 2'b00;


#10
//Write on port B

A = 2'b01;#10
//Write on port C
A = 2'b10;#10


// read from ports
read = 1;
write = 0;

//A
A = 2'b00;#10
//B
A = 2'b01;#10
//C
A = 2'b10;





	end
      
endmodule

