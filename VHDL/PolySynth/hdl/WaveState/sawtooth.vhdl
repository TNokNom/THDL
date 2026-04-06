library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sawtooth is 
port(
freq_clk: in std_logic;
rst: in std_logic;
octave: in std_logic_vector(1 downto 0) --
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
signal tmp: std_logic;
signal count: std_logic;
begin

process(freq_clk)
begin 
  if rst = '1' then
   tmp <= '1'; 
   count <= '0';
 elsif rising_edge(freq_clk) then 
   case octave is
   when "00" =>
   when "01" =>
   when "10" =>
   when "11" =>
   when others  =>
  end case;

else 

end if;
end process;
end behavior;
