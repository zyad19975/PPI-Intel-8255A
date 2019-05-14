`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:21:57 11/22/2018 
// Design Name: 
// Module Name:    Port_A 
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
module Port_A(
inout  [7:0] A,
inout  [7:0] A_cpu,
input group_control,// control on or out
input control_logic // to activate the port
    );
	 
	 /*
	 A is the wire connected to IO device 
	 A_CPU is the wire connected to the internal bus 
	 group_control is responable for making port input "1" or output "if 0"
	 control logic is responsable for enable the port " if 1" or not "if 0" 
	 
	 */
assign A = (!control_logic)? 8'bzzzz_zzzz : (!group_control)? A_cpu: 8'bzzzz_zzzz; // if group_control = 0 A is output
assign A_cpu = (!control_logic)? 8'bzzzz_zzzz: (group_control)? A: 8'bzzzz_zzzz; // if control_group = 0 "reset" then A is input . if group_control = 1 A input  

endmodule

/*

module test_port();


wire [7:0] A,A_cpu;
reg group_control,control_logic;


 
 assign A=(group_control)? 8'd20:8'bzzzz_zzzz;
 assign A_cpu=(group_control)?8'bzzzz_zzzz:(!control_logic)? A : 8'd30;
 
 initial
 begin
 control_logic <=1'b1;
 group_control=1'b1;
 #10      //A= 20 //A_cpu =20
 
 group_control=1'b0;
 #10 //both 30


control_logic <=1'b0;
 group_control=1'b1;
 #10
 
 group_control=1'b0; 
 
 
 end
	 
 Port_A  Port1(A,A_cpu,group_control,control_logic);

 	 


endmodule*/