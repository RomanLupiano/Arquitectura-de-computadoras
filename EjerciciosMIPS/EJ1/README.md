Siendo la siguiente instrucción escrita en alto nivel:  
f = (g + h) - (i + j);  
Las variables f, g, h, i y j se asignan a los registros $s0, $s1, $s2, $s3 y $s4, respectivamente, describa la secuencia de instrucciones MIPS equivalente a la sentencia.  


```
add $t0, $s1, $s2 #t0=g+h;
add $t1, $s3, $s4 #t1=i+j;
sub $s0, $t0, $t1 #s0=t0-t1 => f = (g+h) - (i+j) 
```