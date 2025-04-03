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

architecture simple of mux2_1 is
begin
      o <= (x and not sel) or (y and sel);
end simple;