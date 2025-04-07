-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_4 is
	port(
    	x: in std_logic_vector(3 downto 0);
        y: in std_logic_vector(3 downto 0);
        sel: in std_logic;
        o: out std_logic_vector(3 downto 0)
        );
end mux2_4;

architecture sent_concurrentes of mux2_4 is
begin
	o <= x when sel='0' else y;
end sent_concurrentes;

architecture proc_explicitos of mux2_4 is
begin
	pr_ex: process(x, y, sel)
    begin
    	if (sel='0') 
        	then o<=x;
        else o<=y;
        end if;
    end process;
      
end proc_explicitos;

architecture instan_componentes of mux2_4 is
begin
	pr_ex: process(x, y, sel)
    begin
    	o <= x when sel='0' else y;
    end process;
      
end instan_componentes;