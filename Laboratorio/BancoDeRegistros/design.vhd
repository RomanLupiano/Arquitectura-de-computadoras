-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity BancoRegistros is
	port ( 
    	clk: in std_logic;
    	reset: in std_logic;
        reg1_rd: in std_logic_vector(4 downto 0);
        reg2_rd: in std_logic_vector(4 downto 0);
        wr: in std_logic;
        reg_wr: in std_logic_vector(4 downto 0);
        data_wr: in std_logic_vector(31 downto 0);
        data1_rd: out std_logic_vector(31 downto 0);
        data2_rd: out std_logic_vector(31 downto 0)
    );
end BancoRegistros;

architecture BancoRegistros_arch of BancoRegistros is
type tBanco is array(0 to 31) of std_logic_vector(31 downto 0);
signal Regs: tBanco;
begin
    -- If reg1_rd!= 0 then data1_rd<= Regs(reg1_rd) else data1_rd<= x”00000000”
    -- If reg2_rd!= 0 then data2_rd<= Regs(reg2_rd) else data2_rd<= x”00000000”
    -- If falling_edge(clk) and wr=’1’ then Regs(reg_wr) <= data_wr;
    
    -- conv_integer(std_logic_vecto) -> pasa un std_logic_vector a un integer.
    data1_rd <= Regs(conv_integer(reg1_rd)) when reg1_rd /= "00000" else x"00000000";
    data2_rd <= Regs(conv_integer(reg2_rd)) when reg2_rd /= "00000" else x"00000000";
    
    process
    begin
      if (clk'event and clk='0' and wr='1') then
       Regs(conv_integer(reg_wr)) <= data_wr;
      end if;
    end process;
    
    
end BancoRegistros_arch;