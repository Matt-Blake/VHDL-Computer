----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2019 15:46:13
-- Design Name: 
-- Module Name: Switch_Debouncer - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Switch_Debouncer is
    Port ( S_in : in STD_LOGIC;
           S_out : out STD_LOGIC;
           Clk : in STD_LOGIC);
end Switch_Debouncer;

architecture Behavioral of Switch_Debouncer is

signal delay0, delay1, delay2 : STD_LOGIC;

begin
    process(Clk)
    begin
        if(Clk'event and Clk='1') then
            delay0 <= S_in;
            delay1 <= delay0;
            delay2 <= delay1;
        end if;
    end process;
    
    S_out <= delay0 and delay1 and delay2;
end Behavioral;
