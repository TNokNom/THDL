library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is 
port(
WriteEnable: in std_logic;
Clk: in std_logic;
Ystore: in std_logic_vector;
RegSel: in std_logic; 
RegA: in std_logic_vector(31 downto 0);
RegB: in std_logic_vector(31 downto 0);
Store: out std_logic_vector(31 downto 0)
    );
  end mux2to1;
architecture logic of mux2to1 is 
begin 
process(clk)
begin 
if WriteEnable = '1' and rising_edge(clk) then 
  case RegSel is 
  when '1' =>
  Store <= RegA;
when '0' =>
  Store <= RegB; 
end case;
end if;
end process;
end logic;
