-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_4 is
	port(
    		sel: in std_logic_vector(1 downto 0);
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            c: in std_logic_vector(3 downto 0);
            d: in std_logic_vector(3 downto 0);
    		o: out std_logic_vector(3 downto 0)
    	);
end mux4_4;

architecture senten_concurrentes of mux4_4 is
begin
	o <= a when (sel(1)='0' and sel(0)='0') else
    	b when (sel(1)='0' and sel(0)='1') else
        c when (sel(1)='1' and sel(0)='0') else
        d;
end senten_concurrentes;


architecture proc_explicitos of mux4_4 is
begin
	process(sel, a, b, c, d)
    begin
    	case sel is
        	when "00" => 
            		o <= a;
            when "01" => 
            		o <= b;
            when "10" => 
            		o <= c;
            when others => 
            		o <= d;
        end case;
    end process;
end proc_explicitos;