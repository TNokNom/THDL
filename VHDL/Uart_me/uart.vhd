library ieee;
use ieee.std_logic_1164.all;

entity uartd is 
generic(
baud: positive;
clk_freq: positive
    );
port(
clk: in std_logic;
rx: in std_logic;
r_ready: in std_logic;
r_present: in std_logic;
r_db: in std_logic_vector(7 downto 0);
tx: out std_logic;
tx_present: out std_logic;
t_db: out std_logic_vector(7 downto 0)
    );
end entity;
architecture behavior of uartd is 

