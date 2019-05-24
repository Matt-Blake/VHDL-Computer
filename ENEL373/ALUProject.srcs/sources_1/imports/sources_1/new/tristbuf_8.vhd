----------------------------------------------------------------------------------
-- Team: Dan Greenhalgh (95484481), Matthew Blake (58979250), Matthew Robertson (49615199)
-- Group 10

-- Create Date: 13.03.2019 14:29:04
-- Module Name: tristbuf_8.vhd - Behavioral
-- Project Name: ALU Project

-- Description: An 8-bit tri-state buffer which is implemented at the output of 
-- each register to ensure that the output is only moved when necessary. Below are 
-- the original comments which show ownership of the file/module.

        -- tristbuf_8
        -- VHDL code for an 8-bit tristate buffer
        -- Based on B&V Fig 7.62s
        -- P.J. Bones 3.5.2016

-- Revision: Final
-----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity tristbuf_8 is
    port(X : in std_logic_vector(7 downto 0);
         En : in std_logic;
         F : out std_logic_vector(7 downto 0));
end tristbuf_8;

architecture behaviour of tristbuf_8 is
begin
    F <= (others =>'Z') when En = '0' else X;
end behaviour; 