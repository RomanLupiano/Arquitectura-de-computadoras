-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity demux2_1_tb is
end entity;

architecture tb_demux2_1 of demux2_1_tb is
component demux2_1 is
	port(
    		sel: in std_logic;
            x: in std_logic;
            a: out std_logic;
    		b: out std_logic
    	);
end component;

signal a, b, sel, x: std_logic;

begin
	uut: entity work.demux2_1(senten_concurrentes) port map (sel=>sel, x=>x, a=>a, b=>b);
	
    process
    begin
    x <='1';
    sel <= '0';
    wait for 5 ns;
    sel <= '1';
    wait for 5 ns;
    sel <= '0';
    wait;
    end process;    
	

end tb_demux2_1;