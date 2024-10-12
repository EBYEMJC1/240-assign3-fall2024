global manager
extern input_array                                              
extern printf
extern sorting

segment .data
max_array_size equ 832
int_64_bits db "%ld", 10, 0                               ;general 8-byte float format


segment .bss 
array_of_ints resq max_array_size     

segment .text
manager:                                          

push       rbp                                              
mov        rbp, rsp                                         
push       rbx                                              
push       rcx                                              
push       rdx                                              
push       rsi                                              
push       rdi                                              
push       r8                                               
push       r9                                               
push       r10                                              
push       r11                                              
push       r12                                              
push       r13                                              
push       r14                                              
push       r15                                              
pushf                                                       

mov rax, 0
mov rdi, array_of_ints
mov rsi, max_array_size
call input_array
mov r15, rax ;save array size

mov rax, 0
mov rdi, int_64_bits
mov rsi, [array_of_ints]
call printf

mov rax, 0
mov rdi, array_of_ints
mov rsi, r15
call sorting

mov rax, 0
mov rdi, int_64_bits
mov rsi, [array_of_ints]
call printf

popf                                                        
pop        r15                                              
pop        r14                                              
pop        r13                                              
pop        r12                                              
pop        r11                                              
pop        r10                                              
pop        r9                                               
pop        r8                                               
pop        rdi                                              
pop        rsi                                              
pop        rdx                                              
pop        rcx                                              
pop        rbx                                              
pop        rbp                                              


ret                                                         
                                                            