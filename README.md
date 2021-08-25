# VHDL Computer

## Description
This project consists of the hardware description of an 8-bit ALU in VHDL. This was designed for the Digilent Nexys-4 DDR FPGA development
-- board. The ALU can perform AND, OR, addition and multipilicaiton operations on two 8-bit operands. 

## Author
+ Matt Blake
+ Matthew Robertson
+ Dan Greenhalgh

## License
Added an [MIT License](LICENSE)

## Inputs
The ALU takes 3 inputs, which are operand A, operand B and the OPCode/instruction. The operands and the opcode are entered using slideswitches 0 to 7, with slide 7 representing the MSB. Operand A is first entered, followed by operand B, then the OPCode. BTNC needs to be pushed after each operand to store that operand and proceed to the next stage of the program operation. Pushing BTNC 4 times while the switches are all down will reset the system. The opcodes are defined as the following: 
* Bitwise AND = 0000
* Bitwise OR = 0001
* Addition = 0010
* Subtraction = 0011

## Outputs
Outputs

## Testing
Testbench 

## Known Issues
There are currently no known issues

## Contact
If you encounter any issues or questions with the preprocessing, please contact 
Matt Blake by email at matt.blake.mb@gmail.com
