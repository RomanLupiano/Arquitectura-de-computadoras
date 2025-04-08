Considerando que las variables de sentencia condicional f, g, h, i y j se encuentran almacenadas en los registros comprendidos entre $s0 y $s4, describa la secuencia de instrucciones MIPS equivalente a las siguientes sentencias:  

if (i==j) f = g + h; else f = g-h  

En MIPS se evalúa el caso contrario (i<>j)


```
bne $s3, $s4, else
add $s0, $s1, $s2
j done
else: sub $s0, $s1, $s2 
done: ... 
```