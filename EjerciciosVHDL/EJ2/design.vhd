-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_1 is
	port(
    	x: in std_logic;
        y: in std_logic;
        sel: in std_logic;
        o: out std_logic);
end mux2_1;

architecture sent_concurrentes of mux2_1 is
begin
      o <= (x and not sel) or (y and sel);
end sent_concurrentes;





architecture proc_explicitos of mux2_1 is
begin
	pr_ex: process(x, y, sel)
    begin
    	if (sel='0') then
        	o <= x;
        else
        	o <= y;
        end if;
    end process;
      
end proc_explicitos;




architecture instan_componentes of mux2_1 is
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


signal not_sel, x_and_not_sel, y_and_sel, result: std_Logic;
begin
	--o <= (x and not sel) or (y and sel);
	comp_not_sel: comp_not port map(
    	a => sel,
        o => not_sel
    );
    
    comp_x_and_not_sel: comp_and port map(
    	a => x,
        b => not_sel,
        o => x_and_not_sel
    );
    
    comp_y_and_sel: comp_and port map(
    	a => y,
        b => sel,
        o => y_and_sel
    );
    
    comp_final: comp_or port map(
    	a => x_and_not_sel,
        b => y_and_sel,
        o => o
    );
end instan_componentes;
