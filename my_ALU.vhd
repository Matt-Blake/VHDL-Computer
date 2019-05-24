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

-- IEE Libraries for logic
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my_ALU is
    Port (OperandA: in STD_LOGIC_VECTOR(7 downto 0);    -- 8-Bit operand input A
          OperandB: in STD_LOGIC_VECTOR(7 downto 0);    -- 8-Bit operand input B
          OPCode: in STD_LOGIC_VECTOR(7 downto 0);      -- 8-bit input OPCode, first four bits are ignored, so essentially 4-bit. This was made 8-bit so there was no need for a 4-bit tristate buffer.
          Output: out STD_LOGIC_VECTOR(7 downto 0);     -- 8-bit output
          CarryOut: out STD_LOGIC);                     -- Carry out for numbers larger than 255
end my_ALU;

architecture Behavioral of my_ALU is       -- Behavioural architecture
signal temp: std_logic_vector(8 downto 0); -- temporary 9-bit signal which is used to check if there is a carry out
begin
    choice : process(OPCode) -- when OPCode changes 
    begin
        case OPCode is -- case statement which performs tasks depending on the value of OPCode
            when "00000000" => Output <= OperandA AND OperandB; -- Perform an AND operation if the OPCode is 0000
            when "00000001" => Output <= OperandA OR OperandB;  -- Perform a OR operation if the OPCode is 0001
            when "00000010" => Output <= OperandA + OperandB;   -- Perform an addition operation if the OPCode is 0010
            when "00000011" => Output <= OperandA - OperandB;   -- Perform a subtraction operation if the OPCode is 0011
            when others => Output <= OperandA + "0000";         -- Handle invald OPCode cases
        end case;
        if (OPCode = "0010") then -- If we are performing an addition (0010 = 0000 0010)
            temp <= ('0' & OperandA) + ('0' & OperandB); -- set temp to the 9-bit addition of both operands
            CarryOut <= temp(8); -- CarryOut = 1 if temp has a 1 as the ninth bit (larger than 255)
        else
            CarryOut <= '0'; -- CarryOut = 0 otherwise
        end if;
    end process choice;
    
    
end Behavioral;
