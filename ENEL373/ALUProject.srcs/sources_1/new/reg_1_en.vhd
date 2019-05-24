----------------------------------------------------------------------------------
-- Team: Dan Greenhalgh (95484481), Matthew Blake (58979250), Matthew Robertson (49615199)
-- Group 10

-- Create Date: 13.03.2019 14:29:04
-- Module Name: reg_1_en.vhd - Behavioral
-- Project Name: ALU Project

-- Description: A 1-bit register for the Carry out bit from the ALU operations.
-- The component was based on the 8-bit register, reg_8_en.vhd, but being changed
-- to a 1-bit system.

-- Revision: Final
-----------------------------------------------------------------------------------

-- We want to use the IEEE libraries.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity reg_1_en is
    Port ( D : in STD_LOGIC; -- 1-bit input
           Clk : in STD_LOGIC; -- Clock input
           En : in STD_LOGIC; -- Enable input for allowing 
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
