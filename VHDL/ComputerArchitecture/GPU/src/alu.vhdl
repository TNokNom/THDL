library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity glu is  
port (
clk: in std_logic;
rst: in std_logic; -- reset
en: in std_logic; -- enable
su: in std_logic; -- tells you if the operands is unsigned or signed
muxa: in std_logic_vector(1 downto 0); -- arithmetic operation
r1: in std_logic_vector(7 downto 0); --register 1
r2: in std_logic_vector(7 downto 0); --register 2
muxo: out std_logic; -- mux out signal
flag: out std_logic_vector(1 downto 0); -- "01" Zero, "10", Negative, "11" Carry
ro: out std_logic_vector(7 downto 0) -- final alu calc 

     );
end glu;
architecture logic of glu is 
signal roh: std_logic_vector(7 downto 0);
signal flagger: std_logic_vector(1 downto 0);
signal r1_su: std_logic_vector(7 downto 0);
signal r2_su: std_logic_vector(7 downto 0);
begin 
ro <= roh;
flag <= flagger;
r1_su <= r1;
r2_su <= r2;
process(clk)
begin 

if rising_edge(clk) then
    if rst = '1' then 
    roh <= (others => '0');

    elsif en = '1' then  

    case muxa is 
      when "00" =>
      roh <= (r1 or r2); 
      muxo <= '1';
      if  ((roh) = "00000000") then
      flagger <= "01";
      elsif (roh < "00000000") then
      flagger <= "10";
      elsif  (r1(7) = '1' and  r2(7) = '1') then 
      flagger <= "11";
      else 
        flagger <= "00";
      end if;

      when "01" =>
      roh <= std_logic_vector(signed(r1) - signed(r2));
      muxo <= '1';
      if  (signed(r1) - signed(r2) = 0) then
      flagger <= "01";
      elsif (signed(r1) - signed(r2) < 0) then
      flagger <= "10";
      elsif  (r1(7) = '1' and  r2(7) = '1') then 
      flagger <= "11";
      else 
        flagger <= "00";
      end if;

      when "10" =>
      roh <= std_logic_vector(signed(r1) *signed(r2));
      muxo <= '1';
      if  (signed(r1) * signed(r2) = 0) then
      flagger <= "01";
      elsif (signed(r1) * signed(r2) < 0) then
      flagger <= "10";
      elsif  (r1(7) = '1' and  r2(7) = '1') then 
      flagger <= "11";
      else 
        flagger <= "00";
      end if;

      when "11" =>
      roh <= std_logic_vector(signed(r1)/ signed(r2));
      muxo <= '1';
      if  (signed(r1) / signed(r2) = 0) then
      flagger <= "01";
      elsif (signed(r1) / signed(r2) < 0) then
      flagger <= "10";
      elsif  (r1(7) = '1' and  r2(7) = '1') then 
      flagger <= "11";
      else 
        flagger <= "00";
      end if;

      when others =>
    roh <= (others => '0');
    muxo <= '0';

  end case;
  else 
  roh <= (others => '0');
end if;
    end if;
  end process;
