library IEEE;
use IEEE.std_logic_1164.all;

entity comp_not is
	port(
    	a: in std_logic;
        o: out std_logic
    );
end comp_not;

architecture comp_not_arc of comp_not is
begin
	o <= not a;
end comp_not_arc;