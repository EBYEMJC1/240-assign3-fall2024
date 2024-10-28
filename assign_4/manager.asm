;***********************************************************************************************************************
;Program name: "Integer to Binary Conversion.  This program will accept an integer from the keyboard and then display  * 
;the binary representation of that integer using 64 bits.  Copyright (C) 2023 Floyd Holliday                           *
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
;  Author name: Floyd Holliday
;  Author email: holliday@fullerton.edu
;
;Program information
;  Program name: Integer to Binary Conversion
;  Programming languages: The driver is in C and the converstion function is in X86.
;  Date program began: 2023 July 27
;  Date of last update: 2023 July 30
;  Files in this program: binarymain.c, itob.asm, r.sh
;  Status: Conversion to base 2 is finished.
;  Future: A straight forward extension is to convert an integer to an expression in any base n where 2<=n<=16.
;
;Purpose
;  Show how to how to make an array, implement iteration, and reject invalid inputs
;
;This file
;   File name: itob.asm (integer to binary)
;   Language: X86 with Intel syntax
;   Max page width: 124 columns
;   Assemble: nasm -f elf64 -l itob.lis -o itob.o itob.asm
;   Link: gcc -m64 -no-pie -o bin.out binarymain.o itob.o -std=c17
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3



;===== Begin code area ================================================================================================

;Declarations

extern printf
extern input_array
extern scanf
global manager

max_array_size equ 100

segment .data

input_message db "How many numbers do you want? Today's limit is 100 per customer. ", 0

float_form db "%lf", 0
hex_form db "0x%x", 0
int_form db "%ld", 0

segment .bss
float_array resq max_array_size

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

mov     rax, 0
mov     rdi, input_message
call    printf

push    qword 0
push    qword 0
mov     rax, 0
mov     rdi, int_form
mov     rsi, rsp
call    scanf
pop     r15
pop     rax

mov     rax, 0
mov     rdi, int_form
mov     rsi, r15
call    printf

mov     rdi, r15
mov     rsi, float_array
call    input_array



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