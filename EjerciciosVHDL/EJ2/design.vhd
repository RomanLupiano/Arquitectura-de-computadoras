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
    with sel select
    		x <= a when sel=‘0’,
    		b when sel=‘1’,
    		‘0’ when others; 
      o <= (x and not sel) or (y and sel);
end sent_concurrentes;

architecture proc_explicitos of mux2_1 is
begin
	pr_ex: process(x, y, sel)
    begin
    	o <= x when sel='0' else y;
    end process;
      
end proc_explicitos;

architecture instan_componentes of mux2_1 is
begin
	pr_ex: process(x, y, sel)
    begin
    	o <= x when sel='0' else y;
    end process;
      
end instan_componentes;