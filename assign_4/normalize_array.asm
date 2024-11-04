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
;   File name: normalize_array.asm
;   Language: X86 with Intel syntax
;   Max page width: 124 columns
;   Assemble: nasm -f elf64 -l normalize_array.lis -o normalize_array.o normalize_array.asm
;   Link: gcc -m64 -no-pie -o output.out assign_4.o manager.o sort.o input_array.o output_array.o normalize_array.o isnan.o -std=c17
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3



;===== Begin code area ================================================================================================

;Declarations

extern printf
global normalize_array

segment .data

hex_form db "0x%lx", 10, 0

segment .bss

segment .text

;Prolog ===== Insurance for any caller of this assembly module ========================================================
;Any future program calling this module that the data in the caller's GPRs will not be modified.

normalize_array:

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

; Set max array size, array, counter, and normalized number to compare
mov     r15, rdi  ;Max array size
mov     r14, rsi  ;Array
mov     r13, 0
mov     r12, 0x3FF0000000000000

; Begin loop
array_loop:

; Normalize array using shift left, shift right, then or
mov     rax, 0
mov     r11, [r14 + r13*8]
shl     r11, 12
shr     r11, 12
or      r11, r12

; Move number into array
mov     [r14 + r13 * 8], r11

; Increment
inc     r13

; If array size is same as max array size, exit loop
cmp     r13, r15
jge     out_of_loop
jmp     array_loop

; Loop exit
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