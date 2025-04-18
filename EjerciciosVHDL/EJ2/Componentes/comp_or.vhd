library IEEE;
use IEEE.std_logic_1164.all;

entity comp_or is
	port(
    	a: in std_logic;
        b: in std_logic;
        o: out std_logic
    );
end comp_or;

architecture comp_or_arc of comp_or is
begin
	o<= a or b;
end comp_or_arc;