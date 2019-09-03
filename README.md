# PPI-Intel-8255A
PPI stands for Programmable Peripheral Interface this chip was developed and manufactured by Intel and it's widely used in many microcomputer/microcontroller systems and home computers 

gives a CPU or digital system access to programmable parallel I/O.[5] The 8255 has 24 input/output pins. These are divided into three 8-bit ports (A, B, C). Port A and port B can be used as 8-bit input/output ports. Port C can be used as an 8-bit input/output port or as two 4-bit input/output ports or to produce handshake signals for ports A and B.

The three ports are further grouped as follows:

Group A consisting of port A and upper part of port C.
Group B consisting of port B and lower part of port C.
Eight data lines (D0–D7) are available (with an 8-bit data buffer) to read/write data into the ports or control register under the status of the RD (pin 5) and WR (pin 36), which are active-low signals for read and write operations respectively. Address lines A1 and A0 allow to access a data register for each port or a control register.

This repository is an implementation of  PPI-Intel-8255A in verilog
