# Determine si el código VHDL describe el comportamiento de la función
`s = OR(a(2), a(1), a(0))`.    
Modifique el contenido del proceso `PrOR` para que describa la función requerida en el caso que el código no sea el deseado.

### Código VHDL:

```vhdl
entity nombre_entidad is
    port (
        a : in std_logic_vector(2 downto 0);
        s : out std_logic
    );
end nombre_entidad;

architecture nombre_arquitectura of nombre_entidad is
    signal i : std_logic_vector(3 downto 0);
begin

    PrOR : process (a)
    begin
        i(0) <= '0';
        for j in 1 to 3 loop
            i(j) <= i(j-1) or a(j-1);
        end loop;
        s <= i(3);
    end process;

end nombre_arquitectura;
