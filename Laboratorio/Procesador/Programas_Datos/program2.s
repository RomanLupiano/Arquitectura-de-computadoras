.data 
num0: .word 1 # posic 0
num1: .word 2 # posic 4
num2: .word 4 # posic 8 
num3: .word 8 # posic 12 
num4: .word 16 # posic 16 
num5: .word 32 # posic 20
num6: .word 0 # posic 24
num7: .word 0 # posic 28
num8: .word 0 # posic 32
num9: .word 0 # posic 36
num10: .word 0 # posic 40
num11: .word 0 # posic 44
.text 
main:
  lw $t1, 0($zero) 
  lw $t2, 20($zero)
  add $t3, $zero, $zero
init_loop:
  beq $t3,$t2,end_loop
  add $t3,$t3,$t1
  j init_loop
end_loop:
  sw $t3, 24($zero)
end_program:
  j end_program