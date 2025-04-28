-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Registers is
	port (
    	clk : in std_logic;
        reset : in std_logic;
        wr : in std_logic;
        reg1_rd : in std_logic_vector(4 downto 0); 
        reg2_rd : in std_logic_vector(4 downto 0); 
        reg_wr : in std_logic_vector(4 downto 0); 
        data_wr : in std_logic_vector(31 downto 0);
        data1_rd : out std_logic_vector(31 downto 0);
        data2_rd : out std_logic_vector(31 downto 0)
    );
end Registers;

architecture BancoRegistros_arch of BancoRegistros is

type tBanco is Array(0 to 31) of std_logic_vector(31 downto 0);
signal Regs : tBanco;

begin
	-- conv_integer(std_logic_vector) devuelve el número del vector en tipo integer, ya que el arreglo requiere un indice en integer para poder recorrerlo.
	-- Lectura del registro apuntado por reg1_rd
    data1_rd <= Regs(conv_integer(reg1_rd)) when reg1_rd /= "00000"
    		else x"00000000";
    
    -- Lectura del registro apuntado por reg2_rd
	data2_rd <=  Regs(conv_integer(reg2_rd)) when reg2_rd /= "00000"
			else x"00000000";    
    
    -- Escritura de registros y reset
	escritura: process (reset, clk, wr, data_wr) 
    begin
    	if (reset = '1') then
            Regs <= (others => ( others => '0')); -- Todos los registros toman el valor x"00000000"
        end if;
        
        if (clk'event and clk='0' and wr='1') then 
    		Regs(conv_integer(reg_wr)) <= data_wr;
    	end if;
    end process;
end BancoRegistros_arch;
