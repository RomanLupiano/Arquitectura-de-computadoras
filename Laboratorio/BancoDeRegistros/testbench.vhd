-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_BancoRegistros is
end tb_BancoRegistros;

architecture BancoRbegistros_tb of tb_BancoRegistros is
component BancoRegistros is
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
end component;
signal reg1_rd, reg2_rd, reg_wr: std_logic_vector(4 downto 0);
signal data_wr, data1_rd, data2_rd: std_logic_vector(31 downto 0);
signal reset, clk, wr: std_logic;
begin
	uut: BancoRegistros port map (clk=>clk, reset=>reset, reg1_rd=>reg1_rd, reg2_rd=>reg2_rd, wr=>wr, reg_wr=>reg_wr, data_wr=>data_wr, data1_rd=>data1_rd, data2_rd=>data2_rd);
    
    clk_proc: process
    begin
        clk <= '1';
        wait for 5 ns;
        wait;
    end process;
    
	

end BancoRbegistros_tb;