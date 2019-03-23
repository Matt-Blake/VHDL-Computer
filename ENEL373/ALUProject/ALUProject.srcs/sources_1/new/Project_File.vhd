----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 14:29:04
-- Design Name: 
-- Module Name: Project_File - Behavioral
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

entity Project_File is
    port(--Clk_in, Enable : in std_logic;
         --Data_in : in std_logic_vector(3 downto 0);
         SW : in std_logic_vector(3 downto 0);
         AN : out std_logic_vector(7 downto 0);
         numbers : out std_logic_vector(0 to 6));
end Project_File;

architecture Behavioral of Project_File is
    signal Output: std_logic_vector(3 downto 0);
    
    component reg_8_en
        port(D : in std_logic_vector(7 downto 0);
             Clk, En : in std_logic;
             Q : out std_logic_vector(7 downto 0));
    end component;
    
    component Ddecoder 
        port(Output : in STD_LOGIC_VECTOR (3 downto 0);
             numbers : out STD_LOGIC_VECTOR (0 to 6);
             AN : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component tristbuf_8
        port(X : in std_logic_vector(7 downto 0);
             En : in std_logic;
             F : out std_logic_vector(7 downto 0));
    end component;
    
    component my_ALU
        port(OperandA: in STD_LOGIC_VECTOR(3 downto 0);
             OperandB: in STD_LOGIC_VECTOR(3 downto 0);
             OPCode: in STD_LOGIC_VECTOR(3 downto 0);
             Output: out STD_LOGIC_VECTOR(3 downto 0));
             --CarryOut: out STD_LOGIC);
    end component;

begin
    stage0: my_ALU port map(SW, "0001", "0000", Output);
    stage1: Ddecoder port map(Output, numbers, AN);


end Behavioral;
