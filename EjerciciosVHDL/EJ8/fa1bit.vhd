-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity fa1bit is
	port(
            a: in std_logic;
            b: in std_logic;
            cin: in std_logic;
    		s: out std_logic;
            cout: out std_logic
    	);
end fa1bit;

architecture fa1bit_archi of fa1bit is
begin
	process(a, b, cin)
    begin
    	s <= (a xor b) xor cin;
        cout <= (a and b) or ((a xor b) and cin);
    end process;

end fa1bit_archi;