library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity Clock_Divider is
port ( 
freq_clk: in std_logic;
reset: in std_logic;
octave: in std_logic_vector(1 downto 0);
square: out std_logic
);
end Clock_Divider;
  
architecture bhv of Clock_Divider is
  
signal tmp : std_logic := '0';
signal count: integer range 0 to 25000 := 1;
 
begin
square <= tmp;
  
process(freq_clk,reset)
begin

if(reset='1') then
count<= 1;
tmp<='0';

elsif rising_edge(freq_clk) then

  case octave is

 when "00" =>
if (count = 24999) then
tmp <= NOT tmp;
count <= 0;
else 
count <= count + 1;
end if;

 when "01" =>
if (count = 2500) then 
  tmp <= NOT tmp;
  count <= 0;
else 
count <= count + 1;
end if;

 when "10" =>
if (count = 250) then 
  tmp <= NOT tmp;
  count <= 1;
else
count <= count + 1;
end if;

 when "11" =>
if (count = 25) then 
  tmp <= NOT tmp;
  count <= 1;
else
count <= count + 1;
end if;
end case;
end if;
end process;
  
end bhv;
