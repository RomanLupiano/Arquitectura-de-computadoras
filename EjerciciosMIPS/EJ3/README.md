Siendo el siguiente bucle descrito en C:  

while (save[i] == k) i += 1;  

Suponiendo que i y k corresponden a los registros $s3 y $s5, y la base del arreglo save está en $s6. ¿Cuál es el código ensamblador MIPS correspondiente a este segmento de código?  

```
while: 
    sll $t0, $s3, 2     # t0 = i*4;
    add $t0, $t0, $s6   # t0 = Direccion de memoria de save[i]
    lw $t1, 0($t0)      # t1 = cargo el valor de save[i] desde la memoria
    bne $t1, $s5, done  # Si save[i] <> k entonces salir del while.
    addi $s3, $s3, 1    # i = i+1;
    j while             # vuelvo al while
done: ... 
```

