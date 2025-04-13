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