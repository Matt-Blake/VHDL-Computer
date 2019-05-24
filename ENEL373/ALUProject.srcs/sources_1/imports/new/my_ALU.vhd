----------------------------------------------------------------------------------
-- Team: Dan Greenhalgh (95484481), Matthew Blake (58979250), Matthew Robertson (49615199)
-- Group 10

-- Create Date: 13.03.2019 14:29:04
-- Module Name: my_ALU.vhd - Behavioral
-- Project Name: ALU Project

-- Description: An ALU which takes in two 8-bit operands and a 4 bit OPCode. 
-- The ALU can complete four different arithmetic processes using four distinct
-- OPCodes, which are defined in the code below. All three inputs are moved into the
-- ALU at the same time using a shared enable between the tri-state buffers and 
-- registers. This ALU also compensates for a Carry out if the binary addition of
-- the two 8-bit operands exceeds 255 (largest 8-bit number). 

-- Revision: Final
-----------------------------------------------------------------------------------


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
            when "00000000" => Output <= OperandA AND OperandB; -- Perform an AND operation if the OPCode is 0000
            when "00000001" => Output <= OperandA OR OperandB; -- Perform a OR operation if the OPCode is 0001
            when "00000010" => Output <= OperandA + OperandB; -- Perform an addition operation if the OPCode is 0010
            when "00000011" => Output <= OperandA - OperandB; -- Perform a subtraction operation if the OPCode is 0011
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
