-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity or_unit_tb is 
end or_unit_tb;

architecture beh of or_unit_tb is
component or_unit
	port (
    	a: in std_logic_vector(2 downto 0);
        o: out std_logic
    );
end component;

signal a: std_logic_vector(2 downto 0);
signal o: std_logic;

begin

	uut: or_unit
    	port map (
        	a => a,
            o => o
        );
        
    tb: process
    begin
    
    	a <= "010";
        wait for 10 ns;
        a <= "001";
        wait for 10 ns;
        a <= "011";
        wait for 10 ns;
        a <= "000";
        wait; 
        
    end process;

end beh;