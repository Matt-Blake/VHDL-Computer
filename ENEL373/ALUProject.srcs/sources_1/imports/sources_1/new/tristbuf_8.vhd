-- tristbuf_8
-- VHDL code for an 8-bit tristate buffer
-- Based on B&V Fig 7.62
-- P.J. Bones 3.5.2016
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