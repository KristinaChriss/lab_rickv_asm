.data

matrix:
.word 1, 2, 3, 4
.word 5, 6, 7, 8
.word 1, 2, 3, 4
.word 5, 6, 7, 8
sum:
.word 0

.text

main:
la a4, matrix  # 4*4
la a5, sum
call process
call print
call exit

print:

addi a0, x0, 1 # print_int ecall
lw a1, 0(a5)
ecall
addi a0, x0, 11 # print_char ecall
addi a1, x0, 32
ecall
ret

exit:
addi a0, x0, 10
ecall

process:
addi t5, x0, 0 # result to save

cycle:
addi a4, a4, 4 # increment array pointer 0+1
lw t6, 0(a4) # load value from array
add t5, t5, t6 # count sum 2

addi a4, a4, 8 # increment array pointer 0+3
lw t6, 0(a4) # load value from array
add t5, t5, t6 # count sum 6

addi a4, a4, 4 # increment array pointer 1+0
lw t6, 0(a4) # load value from array
add t5, t5, t6 # count sum 11

addi a4, a4, 8 # increment array pointer 1+2
lw t6, 0(a4) # load value from array
add t5, t5, t6 # count sum 18

addi a4, a4, 12 # increment array pointer 2+1
lw t6, 0(a4) # load value from array
add t5, t5, t6 # count sum 20

addi a4, a4, 8 # increment array pointer 2+3
lw t6, 0(a4) # load value from array
add t5, t5, t6 # count sum 24

addi a4, a4, 4 # increment array pointer 3+0
lw t6, 0(a4) # load value from array
add t5, t5, t6 # count sum 29

addi a4, a4, 8 # increment array pointer 3+2
lw t6, 0(a4) # load value from array
add t5, t5, t6 # count sum 36
sw t5, 0(a5) # save result 
ret