----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2019 02:08:00 PM
-- Design Name: 
-- Module Name: my_ALU - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_ALU is
    Port (OperandA: in STD_LOGIC_VECTOR(7 downto 0);
          OperandB: in STD_LOGIC_VECTOR(7 downto 0);
          OPCode: in STD_LOGIC_VECTOR(7 downto 0);
          Output: out STD_LOGIC_VECTOR(7 downto 0);
          CarryOut: out STD_LOGIC);
end my_ALU;

architecture Behavioral of my_ALU is
signal temp: std_logic_vector(8 downto 0);
begin
    choice : process(OPCode)
    begin
        case OPCode is
            when "0000" => Output <= OperandA AND OperandB; -- Perform an AND operation if the OPCode is 0000
            when "0001" => Output <= OperandA OR OperandB; -- Perform a OR operation if the OPCode is 0001
            when "0010" => Output <= OperandA + OperandB; -- Perform an addition operation if the OPCode is 0010
            when "0011" => Output <= OperandA - OperandB; -- Perform a subtraction operation if the OPCode is 0011
            when others => Output <= OperandA + "0000"; -- Handle invald OPCode cases
        end case;
        if (OPCode = "0010") then
            temp <= ('0' & OperandA) + ('0' & OperandB);
            CarryOut <= temp(8);
        else
            CarryOut <= '0';
        end if;

        
    end process choice;
    
    
end Behavioral;
