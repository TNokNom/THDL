library ieee;
use ieee.std_logic_1164.all;

entity spi_master is 
port(
en: in std_logic;
clk: in std_logic;

miso: in std_logic;
sclk: in std_logic;
mosi: out std_logic;
ss: out std_logic;



    );
end spi_master;
architecture behavior of spi is 
signal 
