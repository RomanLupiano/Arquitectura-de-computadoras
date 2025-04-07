-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity demux2_4 is
	port(
    		sel: in std_logic;
            x: in std_logic_vector(3 downto 0);
            a: out std_logic_vector(3 downto 0);
    		b: out std_logic_vector(3 downto 0)
    	);
end demux2_4;

architecture senten_secuenciales of demux2_4 is
begin
	process(x, sel)
    begin
    	a <= x when sel='0' else "0000";
        b <= x when sel='1' else "0000";
    end process;

end senten_secuenciales;

architecture senten_concurrentes of demux2_4 is
begin
    	a <= x and not sel;
        b <= x and sel;
end senten_concurrentes;