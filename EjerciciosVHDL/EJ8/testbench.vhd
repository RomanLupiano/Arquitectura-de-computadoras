library IEEE;
use IEEE.std_logic_1164.all;

entity fa8bit_tb is
end fa8bit_tb;

architecture tb_fa8bit of fa8bit_tb is

    component fa8bit is
        port(
            a: in std_logic_vector(7 downto 0);
            b: in std_logic_vector(7 downto 0);
            cin: in std_logic;
            s: out std_logic_vector(7 downto 0);
            cout: out std_logic
        );
    end component;

    signal a, b, s: std_logic_vector(7 downto 0);
    signal cin, cout: std_logic;

begin
    uut: fa8bit port map(a => a, b => b, cin => cin, s => s, cout => cout);

    process
    begin
        a <= "00010000";  -- 16
        b <= "00010000";  -- 16
        cin <= '0';
        wait for 10 ns;

        a <= "11111111";  -- 255
        b <= "00000001";  -- 1
        cin <= '0';
        wait for 10 ns;

        cin <= '1';
        wait for 10 ns;

        wait;
    end process;
end tb_fa8bit;
