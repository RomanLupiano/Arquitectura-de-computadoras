-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_1_tb is 
end mux2_1_tb;

architecture tb_mux2_1 of mux2_1_tb is
    component mux2_1 is
        port(
            x: in std_logic;
            y: in std_logic;
            sel: in std_logic;
            o: out std_logic
        );
    end component;

    signal x, y, sel, o: std_logic;
begin
    uut: mux2_1 port map(
        x => x, 
        y => y, 
        sel => sel, 
        o => o
    );

    process
    begin
        x <= '1'; 
        y <= '0';
        sel <= '0';
        wait for 10 ns;

        sel <= '1';
        wait for 10 ns;

        wait;
    end process;
end tb_mux2_1;