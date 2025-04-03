-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

-- Primero debemos escribir la entidad sin puertos
entity or_unit_tb is 
end or_unit_tb;

-- Escribimos el cuerpo de la unidad de testeo
architecture beh of or_unit_tb is

-- Definimos la estructura declarativa relativa al tb

-- declaración de componentes
component or_unit
	port (
    	a: in std_logic_vector(2 downto 0);
        o: out std_logic
    );
end component;

-- declaración de señales (estímulos) del componente instanciado
signal a: std_logic_vector(2 downto 0);
signal o: std_logic;

begin

	uut: or_unit
    	port map (
        	a => a,
            o => o
        );
        
    tb: process
    begin
    
    	a <= "010"; --> o debería verse 1
        wait for 10 ns;
        a <= "001"; --> o debería verse 1
        wait for 10 ns;
        a <= "011"; --> o debería verse 1
        wait for 10 ns;
        a <= "000"; --> o debería verse 0
        wait; 
        
    end process;

end beh;