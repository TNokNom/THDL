library ieee;
use ieee.std_logic_1164.all;

entity main is 
port(
clk: in std_logic;
freq_clk: out std_logic
    );
end main 
architecture behavior of main is 
signal  : std_logic;
begin
process(clk)
variable me: integer range 0 to 249
begin 

