----------------------------------------------------------------------------------
-- Authors: Dan Greenhalgh, Matthew Blake, Matthew Robertson

-- Create Date: 13.03.2019
-- Last updated: 25.08.21
-- Module Name: tristbuf_8.vhd - Behavioral
-- Project Name: ALU Project

-- Description: An 8-bit tri-state buffer which is implemented at the output of 
-- each register to ensure that the output is only moved when necessary. Below are 
-- the original comments which show ownership of the file/module.

        -- tristbuf_8
        -- VHDL code for an 8-bit tristate buffer
        -- Based on B&V Fig 7.62s
        -- P.J. Bones 3.5.2016
-----------------------------------------------------------------------------------

-- IEE Libraries for logic
library ieee;
use ieee.std_logic_1164.all;

entity tristbuf_8 is
    port(X : in std_logic_vector(7 downto 0);   -- 8-bit input
         En : in std_logic;                     -- Enable for allowing dataflow
         F : out std_logic_vector(7 downto 0)); -- 8-bit output
end tristbuf_8;

architecture behaviour of tristbuf_8 is
begin
    F <= (others =>'Z') when En = '0' else X;   -- Output is in high-impedance mode (Z) when enable is '0'
end behaviour;                                  -- or is equal to the input when enable is '1'.