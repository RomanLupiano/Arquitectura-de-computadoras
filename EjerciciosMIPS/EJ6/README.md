Se desea añadir al conjunto de instrucciones soportado por el procesador MIPS visto en
el curso, la instrucción JAL. El formato de la instrucción es el siguiente:  

| 31 - 26 | 25 - 0                      |
|---------|-----------------------------|
| SPECIAL |        Jump_address         |
| 000011  |                             |

Descripción:  
- Reg[$ra] ← PC + 4  
- PC ← PC(31:28) & Jump_address & 00  

La actualización de PC durante la ejecution de una instrucción JALR se realiza en la etapa de
WB.

- Realizar un diagrama esquemático del procesador que contenga las modificaciones
necesarias para que el procesador pueda soportar dicha instrucción.
- Determinar el valor para cada una de las señales de control (RegWrite, AluSrc,
AluOp, RegDst, MemWrite, MemRead, MemtoReg). Si es necesario incorporar
nuevas señales de control, detallar también sus valores.