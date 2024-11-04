;***********************************************************************************************************************
;Program name: "Integer to Binary Conversion.  This program will accept an integer from the keyboard and then display  * 
;the binary representation of that integer using 64 bits.  Copyright (C) 2024 Damon Cawthon                            *
;                                                                                                                      *
;This file, itob.asm, is part of the software program "Integer to Binary Conversion".                                  *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public     *
;License version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will *
;be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR *
;PURPOSE.  See the GNU General Public License for more details.  A copy of the GNU General Public License v3 is        *
;available here:  <https:;www.gnu.org/licenses/>.                                                                      *
;***********************************************************************************************************************

;Comment: The message in the box of askterics is not the license.  The message is properly called the "Notice of License".
;The legal document called the "License" can be downloaded from the website given in the Notice of License. 

;=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3
;
;Author information
;  Author name: Damon Cawthon
;  Author email: dcawthon2242@csu.fullerton.edu
;
;Program information
;  Program name: Random Array Generator
;  Programming languages: The driver is in C and the converstion function is in X86.
;  Date program began: 2024 October 30
;  Date of last update: 2024 November 3
;  Files in this program: assign_4.c, sort.c, manager.asm, input_array.asm, output_array.asm, normalize_array.asm, isnan.asm, r.sh
;
;Purpose
;  Output 3 arrays, a random array, a normalized array, then a sorted normalized array
;
;This file
;   File name: manager.asm
;   Language: X86 with Intel syntax
;   Max page width: 124 columns
;   Assemble: nasm -f elf64 -l manager.lis -o manager.o manager.asm
;   Link: gcc -m64 -no-pie -o output.out assign_4.o manager.o sort.o input_array.o output_array.o normalize_array.o -std=c17
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3



;===== Begin code area ================================================================================================

;Declarations

extern printf
extern input_array
extern scanf
extern normalize_array
extern output_array
extern strlen
extern stdin
extern fgets
extern sort
global manager

max_array_size equ 100
max_name_size equ 30

segment .data

welcome_prompt db "Please enter your name: ", 0

title_prompt db "Please enter your title (Mr,Ms,Sargent,Chief,Project Leader,etc.): ", 0

greet_message db "Nice to meet you %s %s", 10, 0

program_message db "This program will generate 64-bit IEEE float numbers.", 10, 0

input_message db "How many numbers do you want? Today's limit is 100 per customer. ", 0

output_message db "Your numbers have been stored in an array. Here is that array.", 10, 0

normalized_array db "The array will now be normalized to the range 1.0 to 2.0. Here is the normalized array:", 10, 0

sort_array db "The array will now be sorted", 10, 0

error db "The number you input was not acceptable, please try again.", 10, 0

IEEE_header db "IEEE754             Scientific Decimal",10, 0

IEEE_header_2 db "IEEE754                 Scientific Decimal", 10, 0

goodbye_message db "Good bye %s. You are welcome any time.", 10, 0

float_form db "%lf", 0
hex_form db "0x%lx", 10, 0
int_form db "%ld", 0
newline db "", 10, 0

segment .bss
hex_array resq max_array_size
programmers_name resb max_name_size
programmers_title resb max_name_size

segment .text
manager:

;Prolog ===== Insurance for any caller of this assembly module ========================================================
;Any future program calling this module that the data in the caller's GPRs will not be modified.
push rbp
mov  rbp,rsp
push rdi
push rsi
push rdx
push rcx
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push rbx
pushf
; Newline
mov     rax, 0
mov     rdi, newline
call    printf

; Welcome message
mov     rax, 0
mov     rdi, welcome_prompt
call    printf

; Input programmers name 
mov     rax, 0
mov     rdi, programmers_name
mov     rdx, [stdin]
call    fgets

; Take away the newline character at the end
mov     rax, 0
mov     rdi, programmers_name
call    strlen
mov     [programmers_name + rax - 1], byte 0

; Call title prompt
mov     rax, 0
mov     rdi, title_prompt
call    printf

; Accept input
mov     rax, 0
mov     rdi, programmers_title
mov     rdx, [stdin]
call    fgets

; Remove newline character at the end of the string
mov     rax, 0
mov     rdi, programmers_title
call    strlen
mov     [programmers_title + rax - 1], byte 0

; Output greeting
mov     rax, 0
mov     rdi, greet_message
mov     rsi, programmers_title
mov     rdx, programmers_name
call    printf

; Newline
mov     rax, 0
mov     rdi, newline
call    printf

; Program message 
mov     rax, 0
mov     rdi, program_message
call    printf

input:

; Input message
mov     rax, 0
mov     rdi, input_message
call    printf

; Take max array size from user
push    qword 0
push    qword 0
mov     rax, 0
mov     rdi, int_form
mov     rsi, rsp
call    scanf
pop     r15
pop     rax

cmp r15, max_array_size
ja error_message

; Output message
mov     rax, 0
mov     rdi, output_message
call    printf

; Call input_array for set of random numbers in an array
mov     rax, 0
mov     rdi, r15
mov     rsi, hex_array
call    input_array

; Newline
mov     rax, 0
mov     rdi, newline
call    printf

; Print IEEE header
mov     rax, 0
mov     rdi, IEEE_header
call    printf

; Print out randomized array
mov     rax, 0
mov     rdi, r15
mov     rsi, hex_array
call    output_array

; Newline
mov     rax, 0
mov     rdi, newline
call    printf

; Normalized array message
mov     rax, 0
mov     rdi, normalized_array
call    printf

; Newline
mov     rax, 0
mov     rdi, newline
call    printf

; Create normalized array 
mov     rax, 0
mov     rdi, r15
mov     rsi, hex_array
call    normalize_array

; Print IEEE header
mov     rax, 0
mov     rdi, IEEE_header_2
call    printf

; Print normalized array
mov     rax, 0
mov     rdi, r15
mov     rsi, hex_array
call    output_array

; Newline
mov     rax, 0
mov     rdi, newline
call    printf

; Sort array message
mov     rax, 0
mov     rdi, sort_array
call    printf

; Newline
mov     rax, 0
mov     rdi, newline
call    printf

; Call to sort normalized array
mov     rax, 0
mov     rdi, r15
mov     rsi, hex_array
call    sort

; Print IEEE header
mov     rax, 0
mov     rdi, IEEE_header_2
call    printf

; Output normalized array
mov     rax, 0
mov     rdi, r15
mov     rsi, hex_array
call    output_array

; Print newline
mov     rax, 0
mov     rdi, newline
call    printf

; Print goodbye message
mov     rax, 0
mov     rdi, goodbye_message
mov     rsi, programmers_title
call    printf

; Print newline
mov     rax, 0
mov     rdi, newline
call    printf

; Return programmers name
mov     rax, 0
mov     rax, programmers_name

jmp end_code

error_message:
mov     rax, 0
mov     rdi, error
call    printf
jmp     input

end_code:

;===== Restore original values to integer registers ===================================================================
popf
pop rbx
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rcx
pop rdx
pop rsi
pop rdi
pop rbp

ret