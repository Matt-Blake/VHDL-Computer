----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2019 10:40:50
-- Design Name: 
-- Module Name: reg_1_en - Behavioral
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

entity reg_1_en is
    Port ( D : in STD_LOGIC;
           Clk : in STD_LOGIC;
           En : in STD_LOGIC;
           Q : out STD_LOGIC);
end reg_1_en;

architecture Behavioral of reg_1_en is
begin
    process(Clk)
    begin
        if Clk'event and Clk = '1' then
            if En = '1' then
                Q <= D;
            end if;
        end if;
    end process;
end Behavioral;
