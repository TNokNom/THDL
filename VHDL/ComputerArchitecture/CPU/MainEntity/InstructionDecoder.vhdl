library ieee;
use ieee.std_logic_1164.all;

entity Decoder is 
port(
clk: in std_logic; 
Instruction: in std_logic_vector(31 downto 0);
MemoryStore: out std_logic;
AluOFF_ON: out std_logic;
ALUsignal: out std_logic_vector(2 downto 0);
ResetSignal: out std_logic;
StoreRam: out std_logic;
RegisterAddress: out std_logic_vector(7 downto 0);
MemoryAddress: out std_logic_vector(3 downto 0);
Wstore:out std_logic_vector(8 downto 0);
Rstore:out std_logic_vector(7 downto 0);
ImmediateValue: out std_logic_vector(14 downto 0)
);
end Decoder; 

architecture behavior of Decoder is 
begin
process(clk) 
  begin
if rising_edge(clk) then
  Alusignal <= Instruction (31 downto 29); --tells the alu what operation to do
  ALUOFF_ON <= Instruction (28); -- signals the alu to perform an operation or not
  MemoryStore <= Instruction(27); -- signals the memory to store a value
  MemoryAddress <= Instruction(26 downto 23); -- address of where to store a value in memory
  StoreRam  <=  Instruction (22); -- signals the ram to store a value
  RegisterAddress <= Instruction (21 downto 15); -- where in the ram a value should be stored
  Rstore <= Instruction(14 downto 9);
  Wstore  <= Instruction (8 downto 0); -- factors in an immedaite value to the calculation
end if;
end process;
end behavior;
