`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:52 11/24/2018 
// Design Name: 
// Module Name:    Data_bus_buffer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Data_bus_buffer(
input control_logic,
inout [7:0] bus_cpu,
inout [7:0] bus
    );


assign bus = (control_logic)? bus_cpu : 8'bzzzz_zzzz ; // if control = 1 A processor write on ports
assign bus_cpu = (control_logic)? 8'bzzzz_zzzz : bus; // if control = 0 processor read from ports

endmodule

/*

module testbuffer();


reg control_logic;
wire [7:0] bus_cpu,bus;

Data_bus_buffer databus (
    .control_logic(control_logic), 
    .bus_cpu(bus_cpu), 
    .bus(bus)
    );


assign bus=(control_logic)?8'hff:8'bzzzz_zzzz;

assign bus_cpu= (control_logic)? 8'bzzzz_zzzz :8'h00;

initial
begin

control_logic=1'b1;
#10


control_logic=1'b0;
#10


control_logic=1'b1;
#10


control_logic=1'b0;




end



endmodule
*/