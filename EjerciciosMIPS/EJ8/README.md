Considerando la siguiente función que realiza el cálculo del valor factorial de un número n, el cual se encuentra almacenado en el registro $a0.  

```c
int factorial (int n)
{
    if (n < 1)
        return 1;
    else
        return (n*factorial(n-1));
}
```

Describa la secuencia de instrucciones MIPS equivalentes al código presentado.

```asm
fact:
    addi $sp, $sp, -8   # Se hacen dos lugares en la pila
    sw $ra, 4($sp)      # Se guarda la dirección de retorno
    sw $a0, 0($sp)      # Se guarda el argumento (n)

    slti $t0, $a0, 1    # $t0 = n < 1
    beq $t0, $zero, rec # Si n >= 1 ($t0 == $zero) se salta hacia rec y sigue buscando la solución

    addi $v0, $zero, 1  # Si no salto significa que n < 1 y el factorial debe devolver 1
    addi $sp, $sp, 8    # Se devuelven dos lugares de la pila
    jr $ra              # Se vuelve hacia donde fue llamada

rec: 
    addi $a0, $a0, -1   # Se hace n - 1
    jal fact            # Se ejecuta la funcion con n - 1

    lw $a0, 0($sp)      # restauro el valor de n
    lw $ra, 4($sp)      # restauro el valor inicial de $ra
    addi $sp, $sp, 8    # Devuelvo los 2 lugares de la pila

    mul $v0, $a0, $v0   # retorno n * fact(n - 1)

    jr $ra              # Se vuelve hacia donde fue llamada
```