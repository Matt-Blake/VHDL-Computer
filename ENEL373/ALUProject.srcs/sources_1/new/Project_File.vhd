----------------------------------------------------------------------------------
-- Team: Dan Greenhalgh (95484481), Matthew Blake (58979250), Matthew Robertson (49615199)
-- Group 10

-- Create Date: 13.03.2019 14:29:04
-- Module Name: Project_File.vhd - Structural
-- Project Name: ALU Project

-- Description: This is the main top file which combines all of the components 
-- together to implement the overall project. 

-- Revision: Final
-- Additional Comments: ENEL 373 Project which implements VHDL and a Xilinx FPGA, 
-- to create an ALU with the required components.
-----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Project_File is
    port(
         SW : in std_logic_vector(7 downto 0);
         BTNC, CLK100MHZ : in std_logic;
         AN, LED : out std_logic_vector(7 downto 0);
         numbers : out std_logic_vector(0 to 6);
         LED2 : out std_logic_vector(15 downto 8);
         LED16_B, LED17_B, LED17_G, LED17_R : out std_logic);
end Project_File;

architecture structural of Project_File is
    signal Output1, OutputT1, Output2, OutputT2, Output3, OutputF, OutputOPC, OutputALU : std_logic_vector(7 downto 0);
    signal OutputC, But0, But1, But2, But3, CLK1KHZ : std_logic;
        
    component reg_8_en
        port(D : in std_logic_vector(7 downto 0);
             Clk : in std_logic; 
             En : in std_logic;
             Q : out std_logic_vector(7 downto 0));
    end component;
    
    component reg_1_en is
        Port ( D : in STD_LOGIC;
               Clk : in STD_LOGIC;
               En : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
    
    component tristbuf_8
        port(X : in std_logic_vector(7 downto 0);
             En : in std_logic;
             F : out std_logic_vector(7 downto 0));
    end component;
    
    component my_ALU
        port(OperandA: in STD_LOGIC_VECTOR(7 downto 0);
             OperandB: in STD_LOGIC_VECTOR(7 downto 0);
             OPCode: in STD_LOGIC_VECTOR(7 downto 0);
             Output: out STD_LOGIC_VECTOR(7 downto 0);
             CarryOut: out STD_LOGIC);
    end component;
    
    component FSM is
        Port ( x: in STD_LOGIC;
               y0, y1, y2, y3 : out STD_LOGIC;
               Clk : in STD_LOGIC);
    end component;
    
    component clock_divider is
        Port ( in_clock, enable : in  STD_LOGIC;
               out_clock : out std_logic := '0');
    end component;

begin

    LED <= SW;
    stage0: clock_divider port map(in_clock=>CLK100MHZ, out_clock=>CLK1KHZ, enable=>'1');
    stage2: FSM port map(x=>BTNC, y0=>But0, y1=>But1, y2=>But2, y3=>But3, Clk=>CLK1KHZ);
    stage3: reg_8_en port map(D=>SW, Clk=>CLK100MHZ, En=>But0, Q=>Output1); 
    stage4: reg_8_en port map(D=>SW, Clk=>CLK100MHZ, En=>But1, Q=>Output2);
    stage5: reg_8_en port map(D=>SW, Clk=>CLK100MHZ, En=>But2, Q=>Output3);
    stage6: tristbuf_8 port map(X=>Output1, En=>But3, F=>OutputT1);
    stage7: tristbuf_8 port map(X=>Output2, En=>But3, F=>OutputT2);
    stage8: tristbuf_8 port map(X=>Output3, En=>But3, F=>OutputOPC);
    stage9: my_ALU port map(OperandA=>OutputT1, OperandB=>OutputT2, OPCode=>OutputOPC, Output=>OutputALU, CarryOut=>OutputC);
    stage10: reg_8_en port map(D=>OutputALU, Clk=>CLK100MHZ, En=>But3, Q=>OutputF);
    stage11: reg_1_en port map(D=>OutputC, Clk=>CLK100MHZ, En=>But3, Q=>LED16_B);
    LED2 <= OutputF;
    LED17_B <= But1;
    LED17_G <= But2;
    LED17_R <= But3;
    
end structural;