library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sawtooth is 
port(
freq_clk: in std_logic;
reset: in std_logic;
octave: in std_logic_vector(1 downto 0)
    );
end sawtooth;
