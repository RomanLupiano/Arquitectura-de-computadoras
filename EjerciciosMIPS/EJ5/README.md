Considerando el siguiente código de una función:

```c
int example (int g, int h, int i, int j)
{
    int f;
    f = (g+h) – (i+j);
    return f;
}
```  

En donde los parámetros g, h, i y j se corresponden con los registros comprendidos entre $a0 y $a3, que la variable de retorno f se encuentra asociada a $s0, y la dirección de retorno se encuentra almacenada en $ra, describa la secuencia necesarias de instrucciones MIPS para la ejecución de la función, considerando que el único registro que puede ser sobrescrito es el registro $s0. Nota: los registros auxiliares necesarios para el cálculo dentro de la subrutina deben ser almacenados y restaurados utilizando la pila de programa, apuntada por el registro $sp.

```asm
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