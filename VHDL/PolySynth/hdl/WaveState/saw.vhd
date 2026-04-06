process
begin
    for r in 0 to 3 loop
        for c in 0 to 50 loop
            octave(r,c) <= r * 100 + c;
        end loop;
    end loop;
    wait;
end process;

type me is array (0 to 40, 0 to 30) of integer;
