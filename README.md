# Lab_A03_group_10
Dan Greenhalgh (95484481)
Matt Blake (58979250)
Matthew Robertson (49615199)

This project consists of an 8 bit ALU which can perform four
different operations on two 8 bit operands. Physical feedback on the 
values the user has entered as well as the state and results of the operation
are displayed using LEDs.

The operands and the opcode are entered using slideswitches 0 to 7.

1) Operand A is entered, then BTNC is pushed, storing this value in an 8
bit register and displaying it on LEDs 0 to 7. This will cause LED 17 blue to
turn on displaying the current state of the system.

2) Operand B is entered, then BTNC is pushed agian storing the value and
displaying it using LEDs 0 to 7. This will cause LED 17 blue to turn off
and LED 17 green to turn on.

3) Similarly the OPcode is then entered. When BTNC is pushed the result of the
operation will be displayed on LEDs 8 to 15. This will cause LED 17 green to turn
off and LED 17 red to turn on. In the case of the addition
operation, if a carry out bit is computed, it will be displayed using LED 16
blue.

4) Pushing BTNC 4 times while the switches are all down will reset the system

Operations between Operand A and Operand B are performed using the following
opcodes:
Bitwise AND = 0000
Bitwise OR = 0001
Addition = 0010
Subtraction = 0011