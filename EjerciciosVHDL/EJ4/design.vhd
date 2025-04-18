-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_1 is
	port(
    		sel: in std_logic_vector(1 downto 0);
            a: in std_logic;
            b: in std_logic;
            c: in std_logic;
            d: in std_logic;
    		o: out std_logic
    	);
end mux4_1;

architecture senten_concurrentes of mux4_1 is
begin
	o <= a when (sel(1)='0' and sel(0)='0') else
    	b when (sel(1)='0' and sel(0)='1') else
        c when (sel(1)='1' and sel(0)='0') else
        d;
end senten_concurrentes;


architecture proc_explicitos of mux4_1 is
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