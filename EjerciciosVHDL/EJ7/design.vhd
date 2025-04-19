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
	g <= '1' when a>b else '0';
    e <= '1' when a=b else '0';
end comparador_archi;