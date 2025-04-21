library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity centralunit is

 port (
Instruction: in std_logic_vector (31 downto 0);
Clk: in std_logic;
AlU: in std_logic;

)
