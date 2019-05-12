----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2019 15:58:18
-- Design Name: 
-- Module Name: my_lab - Behavioral
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

entity Ddecoder is
    Port ( Input : in STD_LOGIC_VECTOR (3  downto 0);
           numbers : out STD_LOGIC_VECTOR (0 to 6);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end Ddecoder;

architecture Behavioral of Ddecoder is

begin
    AN <= "11111110";
    my_seg_proc: process (Input)		-- Enter this process whenever BCD input changes state
		begin
			case Input is					 -- abcdefg segments
				when "0000"	=> numbers <= "0000001";	  -- 0
				when "0001"	=> numbers <= "1001111";	  -- 1
				when "0010"	=> numbers <= "0010010";      -- 2
				when "0011"	=> numbers <= "0000110";      -- 3
				when "0100"	=> numbers <= "1001100";      -- 4
				when "0101"	=> numbers <= "0100100";      -- 5
				when "0110"	=> numbers <= "1100000";      -- 6
				when "0111"	=> numbers <= "0001111";      -- 7
				when "1000"	=> numbers <= "0000000";      -- 8
				when "1001"	=> numbers <= "0001100";      -- 9
				when others => numbers <= "-------";      -- Blank
			end case;
	end process my_seg_proc;

end Behavioral;
