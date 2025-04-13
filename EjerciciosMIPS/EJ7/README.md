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
    #Suma
    addi $sp, $sp, -4   # Se hace un lugar en la pila para el $ra
    sw $ra, 0($sp)      # Se guarda el $ra

    add $v0, $a0, $a1   # t0=a+b;
    add $v0, $s0, $zero # Guarda el resultado en el registro de retorno

    lw $ra, 0($sp)      # Se carga el $ra
    addi $sp, $sp, 4    # Se devuelve un lugar en la pila


    #Example
    addi $sp, $sp, -4   # Se hace un lugar en la pila para el $ra
    sw $ra, 0($sp)      # Se guarda el $ra

    addi $sp, $sp, -8   # Se hacen dos lugares en la pila para guardar los temporales
    sw $t0, 4($sp)      # Se guarda el $t0
    sw $t1, 0($sp)      # Se guarda el $t1

    add $t0, $a0, $a1   # t0=g+h;
    add $t1, $a2, $a3   # t1=i+j;
    sub $s0, $t0, $t1   # s0=t0-t1 => f = (g+h) - (i+j) 
    add $v0, $s0, $zero # Guarda el resultado en el registro de retorno

    lw $t0, 4($sp)      # Se carga el $t0
    lw $t1, 0($sp)      # Se carga el $t1
    addi $sp, $sp, 8    # Se devuelven dos lugaren en la pila

    lw $ra, 0($sp)      # Se carga el $ra
    addi $sp, $sp, 4    # Se devuelve un lugar en la pila
```