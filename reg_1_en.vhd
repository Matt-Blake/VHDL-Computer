----------------------------------------------------------------------------------
-- Authors: Dan Greenhalgh, Matthew Blake, Matthew Robertson

-- Create Date: 13.03.2019
-- Last updated: 25.08.21
-- Module Name: reg_1_en.vhd - Behavioral
-- Project Name: ALU Project

-- Description: A 1-bit register for the Carry out bit from the ALU operations.
-- The component was based on the 8-bit register, reg_8_en.vhd, but being changed
-- to a 1-bit system.
-----------------------------------------------------------------------------------

-- We want to use the IEEE libraries.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity reg_1_en is
    Port ( D : in STD_LOGIC;    -- 1-bit input
           Clk : in STD_LOGIC;  -- Clock input
           En : in STD_LOGIC;   -- Enable input for allowing the output to change
           Q : out STD_LOGIC);  -- 1-bit Output
end reg_1_en;

architecture Behavioral of reg_1_en is -- Behavioural architecture
begin
    process(Clk) -- Process runs when clock changes value 
    begin
        if Clk'event and Clk = '1' then -- if rising edge
            if En = '1' then -- if Enable = '1'
                Q <= D; -- Set output to input
            end if;
        end if;
    end process;
end Behavioral;
