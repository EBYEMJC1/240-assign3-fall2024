;stolen from https://sites.google.com/a/fullerton.edu/activeprofessor/4-subjects/x86-programming/x86-examples/control-d-example?authuser=0 
global input_array
extern scanf
extern isInteger ;these are function names not file names
extern printf
extern atol

segment .data
int_64_bits db "%ld", 0                               ;general 8-byte float format you will not use this
string_format db "%s", 0                              ;string format
invalid_input db "An error was detected.  Re-enter the number", 10, 0

segment .bss 

segment .text
input_array:                                          

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

;save parameters 
mov r15, rdi ;address of array
mov r14, rsi ;max arrray size
xor r13, r13 ;counter

;===== Loop to input floating point numbers until Control+D =======================================================================
begin_loop:

push qword 0 ;make room on stack for one 64 bit number but not 16 bit aligned so push again
push qword 0 ;16 bit aligned and make room on stack

mov qword  rax, 0                                           ;SSE is not involved in this scanf operation
mov        rdi, string_format                               ;"%s"
mov        rsi, rsp                                         ;Give scanf a pointer to the reserved storage
call       scanf                                            ;Call a library function to do the input work

cdqe                                                        ;Sign extend the integer in eax to all of rax     |
cmp        rax, -1                                          ;Compare rax with -1
je         loop_finished                                    ;if rax == -1 then exit from the loop

mov rdi, rsp                                                ; current input if not ctrl d belongs to where rsp is pointing
call isInteger                                             ; is_integer is derived from isfloat
cmp rax, 0                                                  ;is_integer makes it so if the input is not an iteger then it will return 0 and returns are in rax if not a float derived from profs isfloat and stolen from Jukey on discord
je try_again

mov rax, 0
mov rdi, rsp
call atol
mov [r15+r13*8], rax

inc r13

cmp r13, r14
jg loop_finished

pop rax ; re-adjust stack
pop rax ; re-adjust stack

jmp        begin_loop                                       ;Repeat the loop one more time.

;if input is invalid then reset stack by poping rax and printing invalid input then jumping to loop to try to get new input
try_again:
pop rax ; your je try_again is above your pop rax pop rax in your loop so the stack still has the two pushes from the start and ever push needs a pop so re-adjust stack 
pop rax ; re-adjust stack same reason as above for this pop never got to pops in loop so pop here
mov rax, 0
mov rdi, string_format
mov rsi, invalid_input
call printf
jmp begin_loop

loop_finished:
pop rax ; your je loop_finished is above your pop rax pop rax in your loop so the stack still has the two pushes from the start and ever push needs a pop so re-adjust stack 
pop rax ; re-adjust stack same reason as above for this pop never got to pops in loop so pop here

;mov rax, 0
;mov rdi, int_64_bits
;mov rsi, [r15]
;call printf
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
                                                            