-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity comparador_tb is
end comparador_tb;

architecture tb_comparador_archi of comparador_tb is
component comparador is
	port(
            a: in std_logic_vector(1 downto 0);
            b: in std_logic_vector(1 downto 0);
    		g: out std_logic;
            e: out std_logic
    	);
end component;
signal a, b: std_logic_vector(1 downto 0);
signal g, e: std_logic;
begin
    uut: comparador port map(a => a, b => b, g => g, e => e);

	process
    begin
        a <= "01";
        b <= "01";
        wait for 5 ns;

        a <= "10";
        b <= "01";
        wait for 5 ns;

        a <= "00";
        b <= "00";
        wait for 5 ns;
        
        a <= "11";
        b <= "00";
        wait;
    end process;
end tb_comparador_archi;