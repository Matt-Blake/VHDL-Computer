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
--
-- The FSM also includes a debouncing process which ensures that the input from
-- button C is consistent with real-life pushes, e.g no switching more than one state
-- per button push. This process implements a timer which counts how long the button
-- is pushed for.

-- Revision: Final
-----------------------------------------------------------------------------------

-- IEE Libraries for logic
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    Port ( ButtonC: in STD_LOGIC;                  -- signal from Button C on board
           state0Out, state1Out, state2Out, state3Out : out STD_LOGIC;   -- four 1-bit outputs for each state
           Clk : in STD_LOGIC);              -- clock input 
end FSM;

architecture Behavioral of FSM is -- Behavioural architecture

type state_type is (s0, s1, s2, s3); -- Four states as explained above

signal current_state, next_state: state_type := s0; -- Initialise at state s0.

begin 
process (Clk) -- Process runs when clock changes value, this process handles debouncing
variable count: integer := 0; -- a varible used for counting 
variable flag: STD_LOGIC;     -- flag set to '1' if a successful button push is detected
    begin 
        if Clk'event and Clk = '1' then -- for a rising clock edge
            if ButtonC = '0' then -- debouncer
               count := 0; -- count is 0 while button isnt pushed
               flag := '0'; -- flag is 0 which button isnt pushed
              elsif ButtonC = '1' then -- if button has been pushed
                count := count + 1; -- if the button is pushed increment count per clock tick
             end if;
        end if;
         if count >= 50 and ButtonC = '1' and flag = '0' then -- if the button has been high for 1/1000 * 50 = 0.05 seconds
               current_state <= next_state; -- if a successful button push has been detected, change state
               flag := '1'; -- button push detected, set flag = '1'
         else
               current_state <= current_state; -- stay at same state if a successful button push has not been detected
          end if;
end process;

process (current_state) -- process starts when state changes
    begin
        case current_state is -- check current state value
            when s0 =>
                state3Out <= '0'; -- set previous states output to '0' (s3 in this case)
                state0Out <= '1'; -- set current state output to '1' 
                next_state <= s1; --change next_state to the next state so that it can change when a button push is detected
            when s1 =>
                state0Out <= '0'; -- set previous states output to '0' (s0 in this case)
                state1Out <= '1'; -- set current state output to '1' 
                next_state <= s2; --change next_state to the next state so that it can change when a button push is detected
            
            when s2 =>
                state1Out <= '0'; -- set previous states output to '0' (s1 in this case)
                state2Out <= '1'; -- set current state output to '1' 
                next_state <= s3; --change next_state to the next state so that it can change when a button push is detected             
            
            when s3 =>
                state2Out <= '0'; -- set previous states output to '0' (s2 in this case)
                state3Out <= '1'; -- set current state output to '1' 
                next_state <= s0; --change next_state to the next state so that it can change when a button push is detected
        end case;
    end process; 
end Behavioral;
