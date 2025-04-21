library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity Memory is 
port(
Clk: in std_logic;
Reset: in std_logic;
addr: in std_logic_vector(4 downto 0);
WriteEnable: in std_logic;
DataIn: in std_logic_vector(31 downto 0);
DataOut: out std_logic_vector(31 downto 0)
    );
end Memory;
architecture behavior of Memory is
  type mem_array is array (0 to 255) of std_logic_vector( 31 downto 0); 
  signal mem: mem_array := (others => (others =>'0')); 
begin 
process(clk)
begin
  if reset = '1' then 
  mem <= (others => (others => '0'));
elsif rising_edge(clk) and WriteEnable = '1' then 
  mem(to_integer(unsigned(addr))) <= DataIn;
end if;
DataOut <= mem(to_integer(unsigned(addr)));
end process;
end behavior;

