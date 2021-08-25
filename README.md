# VHDL Computer

## Description
This project consists of the hardware description of an 8-bit ALU in VHDL. This was designed for the Digilent Nexys-4 DDR FPGA development board. The ALU can perform AND, OR, addition and multipilicaiton operations on two 8-bit operands. 

## Author
+ Matt Blake
+ Matthew Robertson
+ Dan Greenhalgh

## License
Added an [MIT License](LICENSE)

## Inputs
The ALU takes 3 inputs, which are operand A, operand B and the opcode/instruction. The operands and the opcode are entered using slideswitches 0 to 7, with slide 7 representing the MSB. Operand A is first entered, followed by operand B, then the opcode. BTNC needs to be pushed after each operand to store that operand and proceed to the next stage of the program operation. Pushing BTNC 4 times while the switches are all down will reset the system. The opcodes are defined as the following: 
* Bitwise AND = 00000000
* Bitwise OR = 00000001
* Addition = 00000010
* Subtraction = 00000011

## Outputs
After each input are stored, it will be displayed using LEDs 0 to 7 (with LED 8 being the MSB). LED 17 is used to display the state of the system and will start turned off, then turn blue once operand A has been stored, then turn green when operand B has been stored and finally turn red when the operation has been performed. The 8-bit results of the operation are displayed on LEDs 8 to 15 (with LED 15 being the MSB) If a carry out (overflow) bit is computed during an addition operation, it will be displayed using LED 16 blue.

## Testing
"my_ALU_tb.vhd" can be used to validate the behavior of the circuit/program by testing the ALU with opcode and operand inputs.

## Known Issues
There are currently no known issues

## Contact
If you encounter any issues or questions with the preprocessing, please contact 
Matt Blake by email at matt.blake.mb@gmail.com
