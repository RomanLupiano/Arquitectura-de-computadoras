# Banco de registros. 
En el procesador MIPS existe un banco de registros de 32 registros de propósito general de 32 bits cada uno, de los cuales el primero (r0) está siempre a 0. Este banco permite el acceso simultáneo a tres registros, cuyas direcciones son: reg1_rd, reg2_rd y reg_wr. El acceso a los registros direccionados por reg1_rd y reg2_rd será de lectura, mientras que el asociado a reg_wr será de escritura. La escritura será síncrona, en flanco de bajada y habilitada con la señal wr a 1, mientras que la lectura será siempre combinacional. El reset del circuito es asíncrono y activo a nivel alto.  

Entidad: Registers.  
Entradas: clk, reset, wr, reg1_rd (4 downto0), reg2_rd (4 downto 0), reg_wr(4 downto 0) y data_wr(31 downto0).  
Salidas: data1_rd (31 downto 0) y data2_rd (31 downto 0).  

Empleando pseudocódigo, su funcionalidad se puede describir como:  
If reg1_rd!= 0 thendata1_rd<= Regs(reg1_rd) elsedata1_rd<= x”00000000”  
Ifreg2_rd!= 0 thendata2_rd<= Regs(reg2_rd) elsedata2_rd<= x”00000000”  
If falling_edge(clk) and wr=’1’ then Regs(reg_wr) <= data_wr;  