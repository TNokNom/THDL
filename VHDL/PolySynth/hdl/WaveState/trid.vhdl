library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tringle is port(
en_tri: in std_logic;
freq_clk: in std_logic;
rst: in std_logic;
octave: in std_logic_vector(1 downto 0);
data: in std_logic_vector(7 downto 0);
triangle: out std_logic_vector(7 downto 0)

                       );
end tringle;
architecture behavior of triangle is 
type  tri_v is array (80 downto 0, 2 downto 0 ) of integer;
signal tri_t: tri_v;
signal tri_h: integer := 0;
signal idx: integer := 0;
begin
process(freq_clk)
variable temp: integer;
begin
  if en_tri = '1' then
    tri_h <= 0;

  elsif (rising_edge(freq_clk)) then
    if idx < 80 then 
      idx <= idx + 1;
    else 
      idx <= 0;

  for i in 0 to 3 loop
    temp := 
    




end if;
end if;
end process;
triangle <= conv_std_logic_vector(tri_t(),8 )
end architecture;
