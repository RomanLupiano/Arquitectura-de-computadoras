-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity demux2_1 is
	port(
    		sel: in std_logic;
            x: in std_logic;
            a: out std_logic;
    		b: out std_logic
    	);
end demux2_1;

architecture senten_secuenciales of demux2_1 is
begin
	process(x, sel)
    begin
    	a <= x when sel='0' else '0';
        b <= x when sel='1' else '0';
    end process;

end senten_secuenciales;

architecture senten_concurrentes of demux2_1 is
begin
    	a <= x and not sel;
        b <= x and sel;
end senten_concurrentes;