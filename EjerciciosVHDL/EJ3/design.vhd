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




architecture instan_componentes of demux2_1 is
component comp_and is
	port(
    	a: in std_logic;
        b: in std_logic;
        o: out std_logic
    );
end component;

component comp_or is
	port(
    	a: in std_logic;
        b: in std_logic;
        o: out std_logic
    );
end component;

component comp_not is
	port(
    	a: in std_logic;
        o: out std_logic
    );
end component;


signal not_sel, x_and_not_sel, x_and_sel: std_Logic;
begin
	-- a <= x and not sel;
    -- b <= x and sel;
    
	comp_not_sel: comp_not port map(
    	a => sel,
        o => not_sel
    );
    
    comp_x_and_not_sel: comp_and port map(
    	a => x,
        b => sel,
        o => b
    );
    
    comp_y_and_sel: comp_and port map(
    	a => x,
        b => not_sel,
        o => a
    );
end instan_componentes;