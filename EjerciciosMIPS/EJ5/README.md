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