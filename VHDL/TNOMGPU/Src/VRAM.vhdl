library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity Reg is
port(
Sclk: in std_logic;
reset: in std_logic;
addrBegin: in std_logic_vector(4 downto 0);
addrEnd:in std_logic_vector(4 downto 0);
RE: in std_logic; -- Read Enable
WE: in std_logic; -- Write Enable
DataIn: in std_logic_vector(31 downto 0);
DataOut: out std_logic_vector(31 downto 0)
    );
end Reg;
architecture behavior of Reg is
  type mem_array is array (0 to 320000) of std_logic_vector( 31 downto 0);
  signal mem: mem_array := (others => (others =>'0'));
begin
process(Sclk)
begin
  if reset = '1' then
  mem <= (others => (others => '0'));
elsif rising_edge(Sclk) and WE = '1' then

end if;
DataOut <= mem(to_integer(unsigned(addr)));
end process;
end behavior;
