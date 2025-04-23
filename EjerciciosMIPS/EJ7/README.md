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
    jr $ra


example:
    addi $sp, $sp, -4   # Se hace un lugar en la pila para el $ra
    sw $ra, 0($sp)      # Se guarda el $ra

    addi $sp, $sp, -4   # Se hacen dos lugares en la pila para guardar los temporales
    sw $s0, 0($sp)      # Se guarda el $t1

    jal suma            # Se mandana sumar g+h

    add $s0, $v0, $zero # Se guarda en s0 el valor de g+h
    add $a0, $a2, $zero # Se carga el parámetro i para la suma
    add $a1, $a3, $zero # Se carga el parámetro j para la suma

    jal suma            # Se mandana sumar i+j

    sub $s0, $s0, $v0   # s0 = (g+h) - (i+j) 
    add $v0, $s0, $zero # Guarda el resultado en el registro de retorno

    lw $s0, 0($sp)      # Se carga el $t1
    addi $sp, $sp, 4    # Se devuelven dos lugaren en la pila

    lw $ra, 0($sp)      # Se carga el $ra
    addi $sp, $sp, 4    # Se devuelve un lugar en la pila

    jr $ra
```