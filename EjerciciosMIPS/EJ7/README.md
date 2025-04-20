Considerando las siguientes funciones:  
```c
int suma (int a, int b)
{
    Int c;
    c = a+b;
    return c;
}

int example (int g, int h, int i, int j)
{
    int f;
    f = suma(g,h) – suma(i,j);
    return f;
}
```

Describa el conjunto de instrucciones MIPS equivalente al código presentado,
considerando que los parámetros de la función se encuentran comprendidos entre $a0 y
$a3, y que la variable f está asociada a $s0. Se debe considerar los llamados a funciones
y además que ningún registro puede ser sobrescrito.


```asm
suma: 
    add $v0, $a0, $a1   
    add $v1, $a2, $a3   
    jr $ra


example:
    addi $sp, $sp, -4   # Se hace un lugar en la pila para el $ra
    sw $ra, 0($sp)      # Se guarda el $ra

    addi $sp, $sp, -4   # Se hacen dos lugares en la pila para guardar los temporales
    sw $s0, 0($sp)      # Se guarda el $t1

    jal suma

    sub $s0, $v0, $v1   # s0 = f = (g+h) - (i+j) 
    add $v0, $s0, $zero # Guarda el resultado en el registro de retorno

    lw $s0, 0($sp)      # Se carga el $t1
    addi $sp, $sp, 4    # Se devuelven dos lugaren en la pila

    lw $ra, 0($sp)      # Se carga el $ra
    addi $sp, $sp, 4    # Se devuelve un lugar en la pila

    jr $ra
```
CONSULTAR
```asm
suma: 
    add $v0, $a0, $a1   
    add $v1, $a2, $a3   
    jr $ra


example:
    addi $sp, $sp, -4   # Se hace un lugar en la pila para el $ra
    sw $ra, 0($sp)      # Se guarda el $ra

    addi $sp, $sp, -12   # Se hacen dos lugares en la pila para guardar los temporales
    sw $t0, 8($sp)      # Se guarda el $t0
    sw $t1, 4($sp)      # Se guarda el $t1
    sw $s0, 0($sp)      # Se guarda el $t1

    jal suma

    sub $s0, $v0, $v1   # s0 = f = (g+h) - (i+j) 
    add $v0, $s0, $zero # Guarda el resultado en el registro de retorno

    lw $t0, 8($sp)      # Se carga el $t0
    lw $t1, 4($sp)      # Se carga el $t1
    lw $s0, 0($sp)      # Se carga el $t1
    addi $sp, $sp, 12    # Se devuelven dos lugaren en la pila

    lw $ra, 0($sp)      # Se carga el $ra
    addi $sp, $sp, 4    # Se devuelve un lugar en la pila

    jr $ra


    #Cargo los valores en $aX y llamo a j example
    56 llamo a example con g,h,i,j valiendo 4,3,2,1 respectivamente
```