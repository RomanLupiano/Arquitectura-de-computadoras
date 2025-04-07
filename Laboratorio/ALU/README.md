# ALU
ALU del procesador MIPS. Esta ALU opera con datos de 32 bits, dispone del flag zero para indicar si el resultado es igual a cero. Sus operaciones aritmético/lógicas básicas son suma, resta, and, or, “menor que” y desplazamiento a la izquierda. En el caso de introducir un código de operación (control) que no corresponda con los prefijados en la tabla, la señal de salida result se pondrá a 0. Los códigos de operación se corresponderán con:  

000 -> a and b  
001 -> a or b  
010 -> a + b  
100 -> b << 16 (lógico)  
110 -> a - b  
111 -> a > b  

La ALU debe ser completamente combinacional.  

El flag zero se pondrá a 1 cuando el resultado de la operación es igual a cero.  
En caso contrario debe permanecer siempre a 0.

Cuanto control es 111 se pondrá en la salida result un 1 si a es menor que b y
un 0 encaso contrario.  

Entidad: ALU.  
Entradas: a(31 downto 0), b(31 downto 0) y control(2 downto 0).  
Salidas: result(31 downto 0) y zero.  
