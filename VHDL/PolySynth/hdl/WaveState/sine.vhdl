library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity sine is 
port (
     en_s1: in std_logic;
     clk  : in std_logic;
     rst  : in std_logic; -- Assuming active-low based on your code
     sine : out std_logic_vector(15 downto 0)
     );
end sine;

architecture behavior of sine is 
  type LUT_TYPE is array(0 to 499) of integer;
  constant LUT: LUT_TYPE := (
);

  signal lut_sig : unsigned(15 downto 0);
  signal state   : std_logic;

begin 
  sine <= std_logic_vector(lut_sig) when state = '0' else
          std_logic_vector(to_unsigned(15000, 16) - lut_sig);

  process(clk)
    variable cnt: integer range 0 to 500;
  begin 
    if rst = '0' then 
      cnt := 0;
      state <= '0';
      lut_sig <= (others => '0');
    elsif rising_edge(clk) then 
      lut_sig <= to_unsigned(LUT(cnt), 16);
      
      if cnt = 499 then 
        state <= not state;
        cnt := 0;
      else 
        cnt := cnt + 1;
      end if;
    end if;
  end process;
end behavior;
