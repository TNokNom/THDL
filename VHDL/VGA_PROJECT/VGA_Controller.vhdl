library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VGA is 
port(
CLK_50: in std_logic;
RST: in std_logic;
VIDON: out std_logic;
Vsync:out std_logic;
Hsync: out std_logic;
X: out std_logic_vector(9 downto 0);
Y: out std_logic_vector(9 downto 0)

    );
end VGA;
architecture behavior of VGA is 
constant H_DISPLAY : integer := 640; 
constant H_FRONT : integer := 16; 
constant H_SYNC  : integer := 96;
constant H_BACK  : integer := 48;
constant H_TOTAL : integer := 800;

begin

process(CLK_50)
begin

end process;
end behavior;
