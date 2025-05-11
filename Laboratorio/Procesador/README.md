# Procesador Uniciclo

### En la memoria de datos están los valores: 
En hexadecimal
```
00000001
00000002
00000004
00000008
00000010
00000020
00000000
00000000
00000000
00000000
00000000
00000000
```
### ¿Qué hace el program1?
```asm
main:
  lw $t1, 0($zero)  # Carga en $t1 ($9) = Memoria[0+0] = 1
  lw $t2, 4($zero)  # Carga en $t2 ($10) = Memoria[4+0] = 2
  lw $t3, 8($zero)  # Carga en $t3 ($11) = Memoria[8+0] = 4
  lw $t4, 12($zero) # Carga en $t4 ($12) = Memoria[12+0] = 8
  lw $t5, 16($zero) # Carga en $t5 ($13) = Memoria[16+0] = 16
  lw $t6, 20($zero) # Carga en $t6 ($14) = Memoria[20+0] = 32
                    # Carga en los registros $t1-$t6 los valores de la memoria de datos desde (0 - 20)


  sw $t1, 24($zero) # Memoria[24+0] = $t1 = 1
  sw $t2, 28($zero) # Memoria[28+0] = $t2 = 2
  sw $t3, 32($zero) # Memoria[32+0] = $t3 = 4
  sw $t4, 36($zero) # Memoria[36+0] = $t4 = 8
  sw $t5, 40($zero) # Memoria[40+0] = $t5 = 16
  sw $t6, 44($zero) # Memoria[44+0] = $t6 = 32
                    # Guarda en los lugares de memoria (24-44) los valores de $t1-$t6 que cargó desde (0 - 20)
                    # De esta manera los valores que estaban de (0 - 20) los copió en (24 - 44)


  lw $t1, 24($zero) 
  lw $t2, 28($zero) 
  lw $t3, 32($zero) 
  lw $t4, 36($zero) 
  lw $t5, 40($zero) 
  lw $t6, 44($zero) # Carga en los registros $t1-$t6 los valores de la memoria de datos desde (24 - 44)


  add $t7, $t1, $t2     # $t7 ($15) toma el valor 1+2 = 3
  add $s0, $t3, $t4     # $s0 ($16) toma el valor 4+8 = 12
  sub $s1, $t5, $t1     # $s1 ($17) toma el valor 16-1 = 15
  sub $s2, $t6, $t2     # $s2 ($18) toma el valor 32-2 = 30
  and $s3, $t1, $t2     # $s3 ($19) toma el valor 1and2 = 0 
  and $s4, $t7, $t2     # $s4 ($20) toma el valor 3and2 = 2
  or $s5, $t1, $t2      # $s5 ($21) toma el valor 1or2 = 3
  or $s6, $s0, $t2      # $s6 ($22) toma el valor 12or2 = 14
  slt $s7, $t1, $t2     # $s7 ($23) toma el valor 1<2 = 1
  slt $t8, $s0, $t2     # $t8 ($24) toma el valor 12<2 = 0
end_program:
  j end_program
```

### Los registros quedan con los valores:
```bash 
$t1 = 1  
$t2 = 2  
$t3 = 4  
$t4 = 8  
$t5 = 16  
$t6 = 32  
$t7 = 3  

$s0 = 12  
$s1 = 15  
$s2 = 30  
$s3 = 0  
$s4 = 2  
$s5 = 3  
$s6 = 14  
$s7 = 1  
$s8 = 0  
```


### ¿Qué hace el program2?
```asm
main:
  lw $t1, 0($zero)          # Carga en $t1 ($9) = Memoria[0+0] = 1
  lw $t2, 20($zero)         # Carga en $t2 ($10) = Memoria[20+0] = 32
  add $t3, $zero, $zero     # $t3 ($11) toma el valor 0+0 = 0

init_loop:
  beq $t3,$t2,end_loop      # Si $t3 = $t2 se salta a end_loop, como 0 != 32 entonces no se salta
  add $t3,$t3,$t1           # $t3 ($11) toma el valor 0+1 = 1
  j init_loop               # Este bucle se va a repetir 32 veces hasta que $t3 = $t2, $t3 = 32

end_loop:
  sw $t3, 24($zero)         # Memoria[24+0] = $t3 = 32

end_program:
  j end_program
```
### Los registros quedan con los valores:
```bash 
$t1 = 1  
$t2 = 32  
$t3 = 32   
```

