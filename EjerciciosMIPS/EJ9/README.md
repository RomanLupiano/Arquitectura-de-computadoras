Dada la siguiente instrucción de salto:  
```asm
beq $s0, $s1, L1
```
- a) Determine el rango de direcciones posibles de salto, asumiendo que la instrucción se
encuentra almacenada en la dirección 0x0004C000
- b) Reemplace la instrucción con un conjunto de instrucciones que permita extender el
rango de salto.
- c) Determine el rango de direcciones posibles de salto para el inciso b).  
---
### Respuestas:  
#### a) Destino del salto beq = PC + 4 + (offset * 4)  
offset de 16 bits -> 65536 (2^16) -> en complemento a 2 -> [-2^15, 2^15 - 1] = [-32768, 32767]  
PC en 0x0004C000 -> PC + 4 = 0x0004C004   
0x0004C004 + (−32768 * 4) -> 0x0004C004 – 0x00020000 -> 0x0002C004 = 180228  
0x0004C004 + (+32767 * 4) -> 0x0004C004 + 0x0001FFFC -> 0x0006C000 = 442368  
Rango de saltos si se encuentra en 0x0004C000 -> [0x0002C004, 0x0006C000]  
Rango de saltos se se encuentra en 311296 -> [180228, 442368]  


#### b) Utilizando bne y j
La instrucción: 
```asm
    beq $s0, $s1, L1
```
Puede reemplazarse por:
```asm
    bne $s0, $s1, L2    # Si no son iguales se salta hacia L2 
    j L1                # Si son iguales se salta hacia L1 usando la instrucción j que tiene mucho más rango
L2: ...
```

#### c) Rango de la instrucción j
Destino de salto de j = (PC+4)[31..28] & jump_address[25..0] & 00  
Jump address de 26 bits + un desplazamiento de 2 bits -> 2^28 direcciones  
Desplazamiento mínimo de 0 a (2^26 – 1) × 4 = 268 435 452 bytes  
PC en 0x0004C000 -> PC + 4 = 0x0004C004 -> (PC+4)[31..28] = 0x0 = 0000 (bin  
Rango de saltos si se encuentra en 0x0004C000 -> [0x00000000, 0x0FFFFFFC]  
Rango de saltos si se encuentra en 311296 -> [0, 268 435 452]  
