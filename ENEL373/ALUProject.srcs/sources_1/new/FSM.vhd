----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2019 11:09:08
-- Design Name: 
-- Module Name: FSM - Behavioral
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

--process(Clk, x)
  --  begin
    --    if(Clk'event and Clk='1') then
      --      delay0 <= x;
        --    delay1 <= delay0;
          --  delay2 <= delay1;
        --end if;
    --debounced_x <= delay0 and delay1 and delay2;
    --end process;
    

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
