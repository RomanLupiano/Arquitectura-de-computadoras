-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity ALU_tb is
end ALU_tb;

architecture tb_ALU of ALU_tb is
component ALU is
	port(
    	a: in std_logic_vector(31 downto 0);
        b: in std_logic_vector(31 downto 0);
        control: in std_logic_vector(2 downto 0);
        result: out std_logic_vector(31 downto 0);
        zero: out std_logic
    );
end component;
signal a, b, result: std_logic_vector(31 downto 0);
signal control: std_logic_vector(2 downto 0);
signal zero: std_logic;
begin
	uut: ALU port map(a=>a, b=>b, control=>control, result=>result, zero=> zero);
    
    process
    begin
    a <= x"00001111";
    b <= x"00000001";
    control <= "010";
	wait for 5 ns;
    
    control <= "000";
   	wait for 5 ns;
    
    a <= X"00000000";

    wait;
    end process;
    

end tb_ALU;