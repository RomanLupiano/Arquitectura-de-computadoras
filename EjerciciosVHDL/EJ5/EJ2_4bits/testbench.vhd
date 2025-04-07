-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_4_tb is 
end mux2_4_tb;

architecture tb_mux2_4 of mux2_4_tb is
component mux2_4 is
  port(
    x: in std_logic_vector(3 downto 0);
    y: in std_logic_vector(3 downto 0);
    sel: in std_logic;
    o: out std_logic_vector(3 downto 0)
  );
end component;

signal sel: std_logic;
signal x, y, o: std_logic_vector(3 downto 0);

begin
	-- uut: entity work.mux2_1(sent_concurrentes) port map( para la otra architecture
    uut: entity work.mux2_4(proc_explicitos) port map(
        x => x, 
        y => y, 
        sel => sel, 
        o => o
    );


    process
    begin
        x <= "0101"; 
        y <= "1010";
        sel <= '0';
        wait for 10 ns;

        sel <= '1';
        wait for 10 ns;
        
        sel <= '0';
        wait;
    end process;
end tb_mux2_4;