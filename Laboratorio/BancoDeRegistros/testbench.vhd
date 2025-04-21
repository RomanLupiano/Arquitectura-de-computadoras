-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity registers_tb is
end entity;

architecture tb of registers_tb is

component BancoRegistros is
	port (
    	clk : in std_logic;
        reset : in std_logic;
        wr : in std_logic;
        reg1_rd : in std_logic_vector(4 downto 0); 
        reg2_rd : in std_logic_vector(4 downto 0); 
        reg_wr : in std_logic_vector(4 downto 0); 
        data_wr : in std_logic_vector(31 downto 0);
        data1_rd : out std_logic_vector(31 downto 0);
        data2_rd: out std_logic_vector(31 downto 0)
    );
end component;

signal clk : std_logic;
signal reset : std_logic;
signal wr : std_logic;
signal reg1_rd : std_logic_vector(4 downto 0); 
signal reg2_rd : std_logic_vector(4 downto 0); 
signal reg_wr : std_logic_vector(4 downto 0); 
signal data_wr : std_logic_vector(31 downto 0);
signal data1_rd : std_logic_vector(31 downto 0);
signal data2_rd	: std_logic_vector(31 downto 0);

begin
	uut: BancoRegistros
    	port map (
        	clk => clk,
            reset => reset,
            wr => wr,
            reg1_rd => reg1_rd,
            reg2_rd => reg2_rd,
            reg_wr => reg_wr,
            data_wr => data_wr,
            data1_rd => data1_rd,
            data2_rd => data2_rd
        );
        
    process
    begin
    	clk <= '0';
      	wait for 1 ns;
      	clk <= '1';
    	wait for 1 ns;
    end process;

    int_main : process
    begin
      	reg1_rd <= "00000";
      	reg2_rd <= "00000";
        reg_wr <= "00000";
        reset <= '0';
        wr <= '0';
        data_wr <= x"00000000";            
    	wait for 1 ns;
		
		wr <= '1';
        data_wr <= x"0000FFFF";            
		reg_wr <= "00011";
        wait for 4 ns;
        
        reg1_rd <= "00011";
        data_wr <= x"FFFF0000";            
		reg_wr <= "11000";
        wait for 4 ns;

        reg2_rd <= "11000";
        wait for 4 ns;

		wr <= '0';
        reset <= '1';

      wait;
    end process;

end tb;