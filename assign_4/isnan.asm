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
;  Files in this program: assign_4.c, sort.c, manager.asm, input_array.asm, output_array.asm, normalize_array.asm, isnan.o, r.sh
;
;Purpose
;  Output 3 arrays, a random array, a normalized array, then a sorted normalized array
;
;This file
;   File name: isnan.asm
;   Language: X86 with Intel syntax
;   Max page width: 124 columns
;   Assemble: nasm -f elf64 -l isnan.lis -o isnan.o isnan.asm
;   Link: gcc -m64 -no-pie -o output.out assign_4.o manager.o sort.o input_array.o output_array.o normalize_array.o isnan.o -std=c17
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3



;===== Begin code area ================================================================================================


global isnan

segment .data                 ;Place initialized data here

segment .bss      ;Declare pointers to un-initialized space in this segment.

segment .text
isnan:

;backup GPRs
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

;move our number to a non volatile register to check it
movsd xmm15, xmm0

;check if number is a nan, if it is: jump to nan, if it is not: move a 1 to rax to return that it is not a nan them jump to exit the function
ucomisd xmm15, xmm15
jp nan
mov rax, 1
jmp exit

;mov a 0 to rax to return that the number is a nan
nan:
mov rax, 0  ;this is a nan

;exit the function
exit:
;Restore GPRs
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp   ;Restore rbp to previous state in stack
ret
;End of the function isnan ====================================================================