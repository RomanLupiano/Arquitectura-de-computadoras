library IEEE;
use IEEE.std_logic_1164.all;

entity fa8bit is
	port(
        a: in std_logic_vector(7 downto 0);
        b: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(7 downto 0);
        cout: out std_logic
    );
end fa8bit;

architecture fa8bit_archi of fa8bit is
    signal carry: std_logic_vector(8 downto 0);
begin
    carry(0) <= cin;

    FA0: entity work.fa1bit port map(a(0), b(0), carry(0), s(0), carry(1));
    FA1: entity work.fa1bit port map(a(1), b(1), carry(1), s(1), carry(2));
    FA2: entity work.fa1bit port map(a(2), b(2), carry(2), s(2), carry(3));
    FA3: entity work.fa1bit port map(a(3), b(3), carry(3), s(3), carry(4));
    FA4: entity work.fa1bit port map(a(4), b(4), carry(4), s(4), carry(5));
    FA5: entity work.fa1bit port map(a(5), b(5), carry(5), s(5), carry(6));
    FA6: entity work.fa1bit port map(a(6), b(6), carry(6), s(6), carry(7));
    FA7: entity work.fa1bit port map(a(7), b(7), carry(7), s(7), carry(8));

    cout <= carry(8);
end fa8bit_archi;
