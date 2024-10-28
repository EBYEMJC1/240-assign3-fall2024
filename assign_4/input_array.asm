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

extern isnan
extern scanf
extern printf
global input_array

segment .data

error db "The output number was a NaN", 10, 0
hex_form db "0x%x", 0

segment .bss

segment .text
input_array:

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

mov     r15, rdi  ;Max array size
mov     r14, rsi  ;Array
mov     r13, 0

input_loop:

mov     rax, 0
rdrand  r12

mov     rax, 0
mov     rdi, r12
call    isnan

cmp     rax, 0
je      error_message

;cvtsi2sd xmm12, r12

mov   [r14 + r13*8], r12

inc     r13

cmp     r13, r15
jge     out_of_loop
jmp     input_loop

error_message:
mov     rax, 0
mov     rdi, error
call    printf
jmp     input_loop

out_of_loop:


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