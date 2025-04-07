-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity demux2_4_tb is
end entity;

architecture tb_demux2_4 of demux2_4_tb is
component demux2_4 is
	port(
    		sel: in std_logic;
            x: in std_logic_vector(3 downto 0);
            a: out std_logic_vector(3 downto 0);
    		b: out std_logic_vector(3 downto 0)
    	);
end component;

signal sel: std_logic;
signal a, b, x: std_logic_vector(3 downto 0);

begin
	uut: entity work.demux2_4(senten_concurrentes) port map (sel=>sel, x=>x, a=>a, b=>b);
	
    process
    begin
    x <="0101";
    sel <= '0';
    wait for 5 ns;
    sel <= '1';
    wait for 5 ns;
    sel <= '0';
    wait;
    end process;    
	

end tb_demux2_4;