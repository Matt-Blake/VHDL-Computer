----------------------------------------------------------------------------------
-- Team: Dan Greenhalgh (95484481), Matthew Blake (58979250), Matthew Robertson (49615199)
-- Group 10

-- Create Date: 13.03.2019 14:29:04
-- Module Name: FSM.vhd - Behavioral
-- Project Name: ALU Project

-- Description: A Finite State Machine (FSM) which implements four different states
-- depending on which operation is being carried out. The first state inputs an 
-- 8-bit number from the switch driven data-bus into an 8-bit register. The 
-- second state does the same thing but for another 8-bit register. The third state
-- sends the OPCode from the 8-bit data bus into the ALU along with the operands 
-- from the registers (state 1 and 2) and the output of the ALU is put into yet 
-- register which is displayed on the 8 left LED's.

-- Revision: Final
-----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    Port ( x: in STD_LOGIC;
           y0, y1, y2, y3 : out STD_LOGIC;
           Clk : in STD_LOGIC);
end FSM;

architecture Behavioral of FSM is

type state_type is (s0, s1, s2, s3);

signal current_state, next_state: state_type := s0;

signal led0, led1, led2, led3: STD_LOGIC;
--signal delay0, delay1, delay2, debounced_x : STD_LOGIC;


begin
process (Clk)
variable count: integer := 0;
variable flag: STD_LOGIC;
    begin 
        if Clk'event and Clk = '1' then
            if x = '0' then -- debouncer
               count := 0;
               flag := '0';
              elsif x = '1' then -- if button has been pushed
                count := count + 1;
             end if;
        end if;
         if count >= 50 and x = '1' and flag = '0' then
               current_state <= next_state;
               flag := '1';
         else
               current_state <= current_state;
          end if;
end process;

process (current_state)
    begin
        case current_state is
            when s0 =>
                y3 <= '0';
                y0 <= '1';
                next_state <= s1;
            when s1 =>
                y0 <= '0';
                y1 <= '1';
                next_state <= s2;
            
            when s2 =>
                y1 <= '0';
                y2 <= '1';
                next_state <= s3;             
            
            when s3 =>
                y2 <= '0';
                y3 <= '1';
                next_state <= s0;
        end case;
    end process; 
end Behavioral;
