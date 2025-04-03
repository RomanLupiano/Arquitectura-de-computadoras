library IEEE;
use IEEE.std_logic_1164.all;

entity or_unit is
	port (
    	a: in std_logic_vector(2 downto 0);
        o: out std_logic
    );
end or_unit;
    
architecture or_archi of or_unit is
begin

	pr_or: process(a) 
    begin
   		o <= a(0) or a(1) or a(2);
    end process;

end or_archi;