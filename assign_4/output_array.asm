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
;   File name: output_array.asm
;   Language: X86 with Intel syntax
;   Max page width: 124 columns
;   Assemble: nasm -f elf64 -l output_array.lis -o output_array.o output_array.asm
;   Link: gcc -m64 -no-pie -o output.out assign_4.o manager.o sort.o input_array.o output_array.o normalize_array.o isnan.o -std=c17
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3



;===== Begin code area ================================================================================================

;Declarations

extern printf
global output_array

section .data
    sci_form db "0x%016lx  %18.13g", 10, 0  ; Format for hexadecimal and scientific notation

section .text
output_array:
    ; Prolog: Save caller's registers
    push rbp
    mov  rbp, rsp
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

    mov r15, rdi   ; Max array size
    mov r14, rsi   ; Array pointer
    mov r13, 0     ; Counter index

;Begin loop
print_loop:
    ; Set r12 to point to the current 64-bit element in the array
    mov r12, r14
    mov r11, 8        ; Size of double (64 bits)
    imul r11, r13     ; Offset calculation
    add r12, r11      ; Update r12 to point to the current element

    ; Load the 64-bit double from memory into an xmm register for printf
    movq xmm0, [r12]  ; Move the double-precision float into xmm0

    ; Print the value using printf with the sci_form format
    mov rax, 1        ; Number of floating-point arguments in xmm registers
    mov rdi, sci_form ; Pointer to the format string
    mov rsi, [r12]    ; Print the value in hex format (as an integer)
    call printf

    ; Increment the counter and check if we've reached the end of the array
    inc r13
    cmp r13, r15
    je  out_of_loop   ; Exit loop if done

    jmp print_loop

out_of_loop:
    ; Epilog: Restore caller's registers
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