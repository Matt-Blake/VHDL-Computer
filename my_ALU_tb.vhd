----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2019 10:30:19
-- Design Name: 
-- Module Name: my_ALU_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_ALU_tb is
--  Port ( );
end my_ALU_tb;

architecture Behavioral of my_ALU_tb is
    component my_ALU
        port(OperandA: in STD_LOGIC_VECTOR(7 downto 0);
             OperandB: in STD_LOGIC_VECTOR(7 downto 0);
             OPCode: in STD_LOGIC_VECTOR(7 downto 0);
             Output: out STD_LOGIC_VECTOR(7 downto 0);
             CarryOut: out STD_LOGIC);
    end component;
    
    signal OperandA, OperandB, OpCode, Output : STD_LOGIC_VECTOR(7 downto 0);
    signal CarryOut: STD_LOGIC;
    constant ClockPeriod : TIME := 50ns;
begin
    UUT: my_ALU port map (OperandA=>OperandA, OperandB=>OperandB, OPCode=>OPCode, Output=>Output, CarryOut=>CarryOut);
    
    process
        begin
            OperandA <= "11110000";
            wait for 100 ns;
            OperandB <= "11110000";
            wait for 100 ns;
            OPCode <= "00000000";
            wait;
        end process;
end Behavioral;
