library ieee;
use ieee.std_logic_1164.all;
entity ControlUnit is
Port(
clk: in std_logic; 
Wstore: in std_logic_vector(8 downto 0);
Rstore: in std_logic_vector(7 downto 0);
enable: in std_logic;
MemoryStore: out std_logic;
AluOFF_ON: out std_logic;
ALUsignal: out std_logic_vector(2 downto 0);
ResetSignal: out std_logic;
StoreRam: in std_logic;
RegisterAddress: out std_logic_vector(7 downto 0);
MemoryAddressIN: in std_logic_vector(3 downto 0);
StartSignal: in std_logic; -- Nothing can be executed until the enable signal is active 
MemReset:in std_logic;
AddressIn: in std_logic_vector(3 downto 0);
CarrySignal,ZeroSignal: out std_logic; -- signal used for carry and zero results 
MainInstruction: out std_logic_vector(31 downto 0); --32 bit instruction set for the cpu to exexute
DecoderInstruct: in std_logic_vector(31 downto 0);
RegHighlightA,RegHighlightB: out std_logic; --shows if a register contains any values 
Mux: out std_logic; -- A is a 2 to 1 mux and B is a 4 to 1 mux 
WriteEnable: out std_logic; 
Addr: out std_logic_vector(4 downto 0);
MemoryAddressOut: out std_logic_vector(3 downto 0);
SelReg : out std_logic_vector(3 downto 0); -- tells the multiplexer which register to store the alu result in
MemResetOut: out std_logic;
DataOut: out std_logic_vector(8 downto 0);
DataR: out std_logic_vector(7 downto 0);
RegisterReset: out std_logic; -- clears all registers
ControlSignal: out std_logic_vector(2 downto 0)
);
end ControlUnit;

architecture Logic of ControlUnit is 
  type State is (Fetch,Decode,Execute);
  signal CurrentState: state:= fetch;
  begin


Flow: Process(clk)
begin 
  case CurrentState is
    when Fetch => 
      CurrentState <= Decode;
    when Decode =>
      CurrentState <= Execute;
    when Execute =>
      CurrentState <= Fetch;


  end case;
end process;



Exe: Process(clk)
begin 
if enable = '1' and rising_edge(clk) and CurrentState = Execute then 
   AluOFF_ON <= '1';
    case DecoderInstruct(31 downto 29) is
      when "000" =>
        ALUsignal <= "000";
      when "001" =>
        ALUsignal <= "001";
      when "010" =>
        ALUsignal <= "010";
      when "011" =>
        ALUsignal <= "011";
      when "100" =>
        ALUsignal <= "011";
      when "101" =>
        ALUsignal <= "101";
      when "110" =>
        ALUsignal <= "110";
      when "111" =>
        ALUsignal <= "111";
    end case;  -- End ALUsignal case
  if Mstore = '1' then
    case MemoryAddressIN is  -- tells what register to use
      when "0000" => -- 0
        DataOut <= Wstore;
        Addr<= "00000";
      when "00001" => -- 1
        DataOut <= Wstore;
        Addr <= "00001";
      when "00010" => -- 2
        DataOut <= Wstore;
        Addr <= "00010";
      when "00011" => -- 3
        DataOut <= Wstore;
        Addr <= "00011";
      when "00100" => -- 4
        DataOut <= Wstore;
        Addr <= "00100";
      when "00101" => -- 5
        DataOut <= Wstore;
        Addr <= "00101";
      when "00110" => -- 6
        DataOut <= Wstore;
        Addr <= "00110";
      when "00111" => -- 7
        DataOut <= Wstore;
        Addr <= "00111";
      when "01000" => -- 8
        DataOut <= Wstore;
        Addr <= "01000";
      when "01001" => -- 9
        DataOut <= Wstore;
        Addr <= "01001";
      when "01010" => -- 10
        DataOut <= Wstore;
        Addr <= "01010";
      when "01011" => -- 11
        DataOut <= Wstore;
        Addr <= "01011";
      when "01100" => -- 12
        DataOut <= Wstore;
        Addr <= "01100";
      when "01101" => -- 13
        DataOut <= Wstore;
        Addr <= "01101";
      when "01110" => -- 14
        DataOut <= Wstore;
        Addr <= "01110";
      when "01111" => -- 15
        DataOut <= Wstore;
        Addr <= "01111";
      when "10000" => -- 16
        DataOut <= Wstore;
        MemoryAddressOut <= "10000";
        end case;
    end if;  -- End MemoryAddress case

    if StoreRam = '1' then 
    case RegisterAddress is 
      
        
          when"00000" => -- 0
          DataR <= Rstore;
          Addr<= "00000";
        when "00001" => -- 1
          DataR <= Rstore;
          Addr <= "00001";
        when "00010" => -- 2
          DataR <= Rstore;
          Addr <= "00010";
        when "00011" => -- 3
          DataR <= Rstore;
          Addr <= "00011";
        when "00100" => -- 4
          DataR <= Rstore;
          Addr <= "00100";
        when "00101" => -- 5
          DataR <= Rstore;
          Addr <= "00101";
        when "00110" => -- 6
          DataR <= Rstore;
          Addr <= "00110";
        when "00111" => -- 7
          DataR <= Rstore;
          Addr <= "00111";
        when "01000" => -- 8
          DataR <= Rstore;
          Addr <= "01000";
        when "01001" => -- 9
          DataR <= Rstore;
          Addr <= "01001";
        when "01010" => -- 10
          DataR <= Rstore;
          Addr <= "01010";
        when "01011" => -- 11
          DataR <= Rstore;
          Addr <= "01011";
        when "01100" => -- 12
          DataR <= Rstore;
          Addr <= "01100";
        when "01101" => -- 13
          DataR <= Rstore;
          Addr <= "01101";
        when "01110" => -- 14
          DataR <= Rstore;
          Addr <= "01110";
        when "01111" => -- 15
          DataR<= Rstore;
          Addr <= "01111";
        when "10000" => -- 16
          DataR <= Rstore;
          Addr <= "10000";
      end case;
    end if ;  -- End RegisterAddress case
  end if;  -- End StoreRam if
end process;
end architecture;
