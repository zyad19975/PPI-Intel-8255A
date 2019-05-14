`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:32 11/22/2018 
// Design Name: 
// Module Name:    Port_C_L 
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
module Port_C(
inout  [3:0] C,
inout  [3:0] C_cpu,
input group_control,// control on or out
input control_logic, // to activate the port
input [3:0] BSR,
input BSR_mode
    );


assign C = (BSR_mode)? BSR :(!control_logic)? 4'bzzzz : (!group_control)? C_cpu: 4'bzzzz; // if group_control = 0 A is output
assign C_cpu =(BSR_mode)? 4'bzzzz : (!control_logic)? C : (group_control)? C: 4'bzzzz; // if control_group = 0 "reset" then A is input . if group_control = 1 A input  




endmodule


/*

module test_port();


wire [3:0] A,A_cpu;
reg group_control,control_logic;


 
 assign A=(group_control)? 4'd5:4'bzzzz;
 assign A_cpu=(group_control)?4'bzzzz:(!control_logic)? A : 4'd30;
 
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
	 
 Port_C  Port1(A,A_cpu,group_control,control_logic);

 	 


endmodule*/
