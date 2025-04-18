library IEEE;
use IEEE.std_logic_1164.all;

entity comp_and is
	port(
    	a: in std_logic;
        b: in std_logic;
        o: out std_logic
    );
end comp_and;

architecture comp_and_arc of comp_and is
begin
	o<= a and b;
end comp_and_arc;