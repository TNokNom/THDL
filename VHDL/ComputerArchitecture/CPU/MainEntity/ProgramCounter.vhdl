library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity program_counter is
    port (
        clk       : in  std_logic;
        reset     : in  std_logic;
        branch    : in  std_logic;
        branch_addr : in  std_logic_vector(31 downto 0);
        pc_out    : out std_logic_vector(31 downto 0)
    );
end program_counter;

architecture behavior of program_counter is
    signal pc : std_logic_vector(31 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            pc <= (others => '0'); -- Reset to 0
        elsif rising_edge(clk) then
            if branch = '1' then
                pc <= branch_addr; -- Load branch address
            else
                pc <= std_logic_vector(unsigned(pc) + 4); -- Increment by 4
            end if;
        end if;
    end process;
    
    pc_out <= pc;
end behavior;

