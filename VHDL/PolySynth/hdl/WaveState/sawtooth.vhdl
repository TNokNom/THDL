library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity sawtooth is 
port(
en_saw: in std_logic;
freq_clk: in std_logic; -- base 50 mhz clock
rst: in std_logic;
octave: in std_logic_vector(1 downto 0); --
sawtooth: out std_logic_vector(7 downto 0)
    );
end sawtooth;
architecture behavior of sawtooth is 
type octave_value is array(0 to 3, 0  to 49) of integer;
signal octav : octave_value := (
    0 => (0,1,2,3,4,5,6,7,8,9,10, others => 0), -- fill in values later 
    1 => (others => 1),
    2 => (others => 2),
    3 => (others => 3)
);
signal count: integer := 0;
begin
sawtooth <= conv_std_logic_vector(count,8);
process(freq_clk)
begin 

  if rst = '1' then
   count <= 0;

 elsif rising_edge(freq_clk) then 
   case octave is
   when "00" =>
     if (count = 255) then 
       count <= 0;
     else 
      count <= count + 1;
    end if;
   when "10" =>
     if (count = 255) then 
       count <= 0;
    else 
count <= count + 1;
end if;
   when "11" =>
     if (count = 255) then 
       count <= 0;
     else 
      count <= count + 1;
    end if;
   when others  =>
     count <= 0;
  end case;

else 

end if;
end process;
end behavior;
