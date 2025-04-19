# Determine si existen errores para cada una de las arquitecturas de la entidad entity1

### Código VHDL:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity entity1 is
    port ( a: in std_logic_vector(3 downto 0);
           b: in std_logic_vector(3 downto 0);
           c: in std_logic;
           d: out std_logic_vector(3 downto 0));
end entity1;

architecture arquitectura1 of entity1 is
begin
    d <= (a and b) when (c = '1') else d;
end;

architecture arquitectura2 of entity1 is
    signal x: std_logic_vector(3 downto 0);
begin
    x <= (a and b) when (c = '1');
    x <= (a xor b) when (c = '0');
    d <= x;
end;

architecture arquitectura3 of entity1 is
    signal x: std_logic_vector(3 downto 0);
begin
    process (a, b)
    begin
        x <= (a and b);
        x <= (a xor b);
    end process;
    d <= x;
end;

architecture arquitectura4 of entity1 is
begin
    d(1 downto 0) <= a(1 downto 0) or b(1 downto 0);
    d(3 downto 2) <= a(1 downto 0) + b(1 downto 0);
end;
```

+ arquitectura1: no veo el error. Inferencia de memoria?
+ arquitectura2: se asigna de manera concurrente distintos valores a x.
+ arquitectura3: se asigna de manera secuencial distintos valores a x, queda con la última asignacion (a xor b)
+ arquitectura4: no veo el error. Asignación parcial conflictiva?