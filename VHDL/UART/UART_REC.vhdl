library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
  entity andgate is
  port(
    A: in std_logic;
    B: in std_logic;
    Y: out std_logic
);
end andgate;
architecture behavior of andgate is
  begin
    y <= A and B;
end architecture;
