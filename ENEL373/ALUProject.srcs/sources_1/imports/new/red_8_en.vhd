-- reg_8_en
-- VHDL code for an 8-bit register with enable
-- Based on B&V Fig A.37
-- P.J. Bones 3.5.2016
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
