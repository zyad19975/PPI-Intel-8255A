`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:36:40 11/22/2018 
// Design Name: 
// Module Name:    Port_C_U 
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
module Port_C_U(
inout reg [3:0] C,
inout reg [3:0] C_cpu,
input group_control,// control on or out
input control_logic // to activate the port
    );

if (control_logic)
begin
		always @(group_control)
		begin

			if(!group_control)
			begin
				
				C <= C_cpu;
			
			end
			else begin
				
				C_cpu <= C;
				
			end

		end //always

end //if


endmodule
