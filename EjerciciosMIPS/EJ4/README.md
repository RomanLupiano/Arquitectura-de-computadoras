Se desea añadir al conjunto de instrucciones soportado por el procesador MIPS visto en el curso, la instrucción JR. Esta instrucción permite realizar un salto incondicional a la instrucción cuya dirección se encuentra almacenada en el registro rs, y es utilizada para el retorno en llamadas a rutinas. El formato de la instrucción es el siguiente:  
| 31 - 26 | 25 - 21 | 20 - 16 | 15 - 11 | 10 - 6 | 5 - 0 |
|--------|----------|----------|----------|--------|--------|
| SPECIAL |   rs     | 00000    | 00000    | 00000 |  JR    |
| 000000 |          |          |          |        | 001001 |



Descripción: PC ← Reg[rs]  
a) Realizar un diagrama esquemático del procesador que contenga las modificaciones necesarias para que el procesador pueda soportar dicha instrucción.  
b) Determinar el valor para cada una de las señales de control (RegWrite, AluSrc, AluOp, RegDst, MemWrite, MemRead, MemtoReg). Si es necesario incorporar nuevas señales de control, detallar también sus valores.