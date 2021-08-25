----------------------------------------------------------------------------------
-- Authors: Dan Greenhalgh, Matthew Blake, Matthew Robertson

-- Create Date: 13.03.2019
-- Last updated: 25.08.21
-- Module Name: Project_File.vhd - Structural
-- Project Name: ALU Project

-- Description: This is the main top file which combines all of the components 
-- together to implement the overall project. Performs arithmetic logic operations
-- on two 8-bit operands is implemented on a Digilent Nexys-4 DDR FPGA development
-- board. The project also provides physical feedback to the user on the input
-- operands, input opcode and the resulting bitwise value.
-----------------------------------------------------------------------------------

-- IEE Libraries for logic
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Project_File is
    port(
         SW : in std_logic_vector(7 downto 0);                  -- 8-bit Switch driven databus input
         BTNC, CLK100MHZ : in std_logic;                        -- 1-bit inputs for Button C (BTNC) and the 100 MHZ clock signal
         LED : out std_logic_vector(7 downto 0);                -- 8-bit LED for showing the input of the switch driven databus
         LED2 : out std_logic_vector(15 downto 8);              -- 8-bit LED for showing the 8-bit result of the ALU
         LED16_B, LED17_B, LED17_G, LED17_R : out std_logic);   -- Outputs to LED 16 and 17. The blue portion of LED 16 is used to show a carry out from bitwise addition.
end Project_File;                                               -- LED 17 shows the state (s0, s1, s2, s3) <=> (off, blue, green, red)

architecture structural of Project_File is
    signal OperandA, OperandB, OPCode, ALUOperandA, ALUOperandB, ALUOPCode, OutputALU, displayOutput : std_logic_vector(7 downto 0); -- 8-bit signals in between components
    signal Carry, s0, s1, s2, s3, CLK1KHZ : std_logic; -- 1-bit signals in between components
        
    component reg_8_en                              -- The 8-bit register component (the I/O ports are commented in the module files)
        port(D : in std_logic_vector(7 downto 0);
             Clk : in std_logic; 
             En : in std_logic;
             Q : out std_logic_vector(7 downto 0));
    end component;
    
    component reg_1_en is                           -- The 1-bit register component (the I/O ports are commented in the module files)
        Port ( D : in STD_LOGIC;
               Clk : in STD_LOGIC;
               En : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
    
    component tristbuf_8                            -- The 8-bit tri-state buffer component (the I/O ports are commented in the module files)
        port(X : in std_logic_vector(7 downto 0);
             En : in std_logic;
             F : out std_logic_vector(7 downto 0));
    end component;
    
    component my_ALU                                -- The ALU component (the I/O ports are commented in the module files)
        port(OperandA: in STD_LOGIC_VECTOR(7 downto 0);
             OperandB: in STD_LOGIC_VECTOR(7 downto 0);
             OPCode: in STD_LOGIC_VECTOR(7 downto 0);
             Output: out STD_LOGIC_VECTOR(7 downto 0);
             CarryOut: out STD_LOGIC);
    end component;
    
    component FSM is                                -- The FSM component (the I/O ports are commented in the module files)
        Port ( ButtonC: in STD_LOGIC;
               state0Out, state1Out, state2Out, state3Out : out STD_LOGIC;
               Clk : in STD_LOGIC);
    end component;
    
    component clock_divider is                      -- The Clock divider component (the I/O ports are commented in the module files)
        Port ( in_clock, enable : in  STD_LOGIC;
               out_clock : out std_logic := '0');
    end component;

begin

    LED <= SW; -- The first 8 switches (right to left) light up the first 8 LED's (right to left) to show the current input
    stage0: clock_divider port map(in_clock=>CLK100MHZ, out_clock=>CLK1KHZ, enable=>'1'); -- Use the clock divider to set the clock to 1 KHz from the 100MHz clock with a permanent enable 
    stage2: FSM port map(ButtonC=>BTNC, state0Out=>s0, state1Out=>s1, state2Out=>s2, state3Out=>s3, Clk=>CLK1KHZ); -- Use the 1 KHz clock from the clock divider
    stage3: reg_8_en port map(D=>SW, Clk=>CLK100MHZ, En=>s0, Q=>OperandA); -- While in state s0, a push on button C will input an 8-bit operand from the switches
    stage4: reg_8_en port map(D=>SW, Clk=>CLK100MHZ, En=>s1, Q=>OperandB); -- While in state s1, a push on button C will input an 8-bit operand from the switches
    stage5: reg_8_en port map(D=>SW, Clk=>CLK100MHZ, En=>s2, Q=>OPCode); -- While in state s2, a push on button C will input an 8-bit (4-bit) OpCode from the switches
    stage6: tristbuf_8 port map(X=>OperandA, En=>s3, F=>ALUOperandA); -- While in state s3, a push on button C will input OperandA into ALU
    stage7: tristbuf_8 port map(X=>OperandB, En=>s3, F=>ALUOperandB); -- While in state s3, a push on button C will input OperandB into ALU
    stage8: tristbuf_8 port map(X=>OPCode, En=>s3, F=>ALUOPCode); -- While in state s3, a push on button C will input the OPCode into ALU
    stage9: my_ALU port map(OperandA=>ALUOperandA, OperandB=>ALUOperandB, OPCode=>ALUOPCode, Output=>OutputALU, CarryOut=>Carry); -- Accept all inputs and output the carry and result
    stage10: reg_8_en port map(D=>OutputALU, Clk=>CLK100MHZ, En=>s3, Q=>displayOutput); -- Put the ALU result into an 8-bit register so that it can be displayed
    stage11: reg_1_en port map(D=>Carry, Clk=>CLK100MHZ, En=>s3, Q=>LED16_B); -- Put the carry into a 1-bit register so that it can be displayed
    LED2 <= displayOutput; -- display result on left-most LED's
    LED17_B <= s1; -- display state s1
    LED17_G <= s2; -- display state s2
    LED17_R <= s3; -- display state s3
    
end structural;
