-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity fa1bit_tb is
end entity;

architecture tb_fa1bit of fa1bit_tb is
component fa1bit is
	port(
            a: in std_logic;
            b: in std_logic;
            cin: in std_logic;
    		s: out std_logic;
            cout: out std_logic
    	);
end component;


signal a, b, cin, s, cout: std_logic; 

begin
	uut: fa1bit port map (a=>a, b=>b, cin=>cin, s=>s, cout=>cout);
	
    process
    begin
      a <= '0';
      b <= '1';
      cin <= '0';
      wait for 5 ns;
      
      cin <= '1';
      wait for 5 ns;
      
      a <= '1';
      wait;
    end process;    
	

end tb_fa1bit;