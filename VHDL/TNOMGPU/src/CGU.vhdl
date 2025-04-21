library IEEE;
use IEEE.std_logic_1164.all;

entity CGU is
port(

GCLK:in std_logic; -- GPU clock used for synchronizing everything as a whole
SClk: in std_logic; -- CLK used for fetching instructions
LoadReg: in std_logic_vector(3 downto 0); -- tells which reg to write too
WriteReg: out std_logic
);
end CGU;
architecture behavior of CGU is
type state is (fetch,deocde,execute,halt,idle,wrlte,rad);
signal currenstate: state:= idle;
begin
process(GCLK)
begin

end process;
end behavior;
