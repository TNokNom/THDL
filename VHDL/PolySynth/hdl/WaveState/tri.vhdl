library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity triangle is port(
en_tri: in std_logic;
freq_clk: in std_logic;
rst: in std_logic;
octave: in std_logic_vector(1 downto 0);
triangle: out std_logic_vector(7 downto 0)

                       );
end triangle;
architecture behavior of triangle is 
type me is array (90 downto 0) of integer;
signal count: integer := 0;
signal direction: std_logic := '0';
begin
process(freq_clk)
begin

  if en_tri = '1' then

  elsif rst = '1' then 
    count <= 0;

elsif rising_edge(freq_clk) then

  case octave is 
      when "00" =>
     if (direction = '0' and count < 20) then 
       count <= count + 1;

     elsif (count = 20) then  
       direction <= '1';

     elsif (direction = '1' and count < 0 ) then 
       count <= count - 1;

     elsif (count = 0) then 
       direction <= '0';

     else
       count <= 0;
      
    end if;
     when "01" =>
 if (count <= 255) then 
  else 

  end if;

    when "10" =>
if (count = 2550) then 
        count <= count - 1;
      else
    count <= count + 1;
  end if;

    when "11" =>
if (count = 25005) then 
        count <= count - 1;
      else
    count <= count + 1;
  end if;

    when others =>
      count <= 0;
  end case;
end if;
end process;
triangle <= conv_std_logic_vector(count,8);
end architecture;
