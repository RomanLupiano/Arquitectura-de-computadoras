-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity comparador is
	port(
            a: in std_logic_vector(1 downto 0);
            b: in std_logic_vector(1 downto 0);
    		g: out std_logic;
            e: out std_logic
    	);
end comparador;

architecture comparador_archi of comparador is
begin
	process(a, b)
    begin
    	if (a>b) 
        	then g<='1'; 
        else g<='0';
        end if;
        
        if (a=b) 
        	then e<='1'; 
        else e<='0';
        end if;
    end process;
end comparador_archi;