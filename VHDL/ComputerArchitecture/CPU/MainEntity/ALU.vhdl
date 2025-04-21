library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.float_pkg.all;
entity ALU is
port(
ShiftLeft: in std_logic_vector(6 downto 0);
ShiftRight: in std_logic_vector(6 downto 0);
Alu_Enable: in std_logic; 
clk: in std_logic;
ControlSignal: in std_logic_vector(2 downto 0);
Astore,Bstore: in std_logic_vector( 31 downto 0);
Ystore: out std_logic_vector( 31  downto 0);
Carry: out std_logic;
Zero: out std_logic
    );
end ALU;

architecture logic of ALU is
  signal ShiftLeftS, ShiftRightS: unsigned(6 downto 0);  -- Allow for up to 32-bit shift
  signal Car, Zer: std_logic := '0';
  signal A, B, Y: signed(31 downto 0);  -- Updated to 32-bit
  signal Al, Bl, Yl: std_logic_vector(31 downto 0) := (others => '0');
begin 
  -- Convert ShiftLeft and ShiftRight signals to unsigned
  ShiftLeftS <= unsigned(ShiftLeft);
  ShiftRightS <= unsigned(ShiftRight);

  process(clk)
  begin 
    if Alu_Enable = '1' and rising_edge(clk) then 
      case ControlSignal is

        when "000" => Y <= A + B; 
        Car <= '1' when (A(31) = '1' and B(31) = '1');
        Zer <= '1' when (A + B = 0); 

        when "001" =>
          Y <= A * B; 
          Car <= '1' when (A(31) = '1' and B(31) = '1');
          Zer <= '1' when (A * B = 0); 

        when "010" =>
          Y <= A / B;
          Car <= '1' when (A(31) = '1' and B(31) = '1');
          Zer <= '1' when (A / B = 0);

        when "011" =>
          Yl <= Al and Bl;

        when "100" =>
          Yl <= Al xor Bl;

        when "101" =>
          Yl <= Al or Bl;

        when "110" =>
          Yl <= Al sll to_integer(ShiftLeftS);  -- Use ShiftLeftS for left shift operation

        when "111" =>
          Yl <= Bl srl to_integer(ShiftRightS); -- Use ShiftRightS for right shift operation

        when others => 
          Yl <= (others => '0');
          Y <= (others => '0');

      end case;
    end if;
  end process;

  Carry <= Car;
  Zero <= Zer;
  Ystore <= std_logic_vector(Y);  -- Convert signed to std_logic_vector for output
  Ystore <= Yl;  -- Assign result from ALU
end logic;
