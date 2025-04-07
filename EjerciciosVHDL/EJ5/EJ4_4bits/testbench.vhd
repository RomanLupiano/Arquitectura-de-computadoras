-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_4_tb is
end entity;

architecture tb_mux4_4 of mux4_4_tb is
component mux4_4 is
	port(
    		sel: in std_logic_vector(1 downto 0);
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            c: in std_logic_vector(3 downto 0);
            d: in std_logic_vector(3 downto 0);
    		o: out std_logic_vector(3 downto 0)
    	);
end component;


signal a, b, c, d, o: std_logic_vector(3 downto 0); 
signal sel: std_logic_vector(1 downto 0);

begin
	uut: mux4_4 port map (a=>a, b=>b, c=>c, d=>d, sel=>sel, o=>o);
	
    process
    begin
    a <= x"a";
    b <= x"c";
    c <= x"e";
    d <= x"5";
    sel <= "00";
    wait for 5 ns;
    sel <= "10";
    wait for 5 ns;
    sel <= "11";
    wait for 5 ns;
    sel <= "01";
    wait;
    end process;    
	

end tb_mux4_4;