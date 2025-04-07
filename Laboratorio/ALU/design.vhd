-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity ALU is
	port(
    	a: in std_logic_vector(31 downto 0);
        b: in std_logic_vector(31 downto 0);
        control: in std_logic_vector(2 downto 0);
        result: out std_logic_vector(31 downto 0);
        zero: out std_logic
    );
end ALU;

architecture ALU_archi of ALU is
begin
	pr_control: process (a, b, control)
    begin
      case control is
          when "000" =>
              result <= a and b;
          when "001" =>
              result <= a or b;
          when "010" =>
              result <= a + b;
          --when "011" =>
          when "100" =>
              result <= b(15 downto 0) & x"0000";
          --when "101" =>
          when "110" =>
              result <= a - b;
          when "111" =>
              if (a>b) then result<= x"00000001";
              else result<= x"00000000";
              end if;
          when others =>
              result <= x"00000000";
      end case;
    end process;
    
    zero <= '1' when result=x"00000000" else '0';
        
end ALU_archi;