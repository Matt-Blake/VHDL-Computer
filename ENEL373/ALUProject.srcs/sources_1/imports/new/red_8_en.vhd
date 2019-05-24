----------------------------------------------------------------------------------
-- Team: Dan Greenhalgh (95484481), Matthew Blake (58979250), Matthew Robertson (49615199)
-- Group 10

-- Create Date: 13.03.2019 14:29:04
-- Module Name: reg_8_en.vhd - Behavioral
-- Project Name: ALU Project

-- Description: An 8-bit register for holding operands from the switch driven data
-- bus. Below are the original comments which show ownership of the file/module.

        -- reg_8_en
        -- VHDL code for an 8-bit register with enable
        -- Based on B&V Fig A.37
        -- P.J. Bones 3.5.2016

-- Revision: Final
-----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity reg_8_en is
    port(D : in std_logic_vector(7 downto 0);
         Clk : in std_logic;
         En : in std_logic;
         Q : out std_logic_vector(7 downto 0));
end reg_8_en;

architecture behaviour of reg_8_en is
begin
    process(Clk)
    begin
        if Clk'event and Clk = '1' then
            if En = '1' then
                Q <= D;
            end if;
        end if;
    end process;
end behaviour;
