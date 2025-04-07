-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_1_tb is
end entity;

architecture tb_mux4_1 of mux4_1_tb is
component mux4_1 is
	port(
    		sel: in std_logic_vector(1 downto 0);
            a: in std_logic;
            b: in std_logic;
            c: in std_logic;
            d: in std_logic;
    		o: out std_logic
    	);
end component;


signal a, b, c, d, o: std_logic; 
signal sel: std_logic_vector(1 downto 0);

begin
	uut: mux4_1 port map (a=>a, b=>b, c=>c, d=>d, sel=>sel, o=>o);
	
    process
    begin
    a <= '0';
    b <= '1';
    c <= '1';
    d <= '0';
    sel <= "00";
    wait for 5 ns;
    sel <= "10";
    wait for 5 ns;
    sel <= "11";
    wait for 5 ns;
    sel <= "01";
    wait;
    end process;    
	

end tb_mux4_1;