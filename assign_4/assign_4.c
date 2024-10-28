//***********************************************************************************************************************
//Program name: "Integer to Binary Conversion.  This program will accept an integer from the keyboard and then display  * 
//the binary representation of that integer using 64 bits.  Copyright (C) 2023 Floyd Holliday                           *
//                                                                                                                      *
//This file, binarymain.c, is part of the software program "Integer to Binary Conversion".                              *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public     *
//License version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will *
//be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR *
//PURPOSE.  See the GNU General Public License for more details.  A copy of the GNU General Public License v3 is        *
//available here:  <https:;www.gnu.org/licenses/>.                                                                      *
//***********************************************************************************************************************

//Comment: The message in the box of askterics is not the license.  The message is properly called the "Notice of License".
//The legal document called the "License" can be downloaded from the website given in the Notice of License. 

//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3
//
//Author information
//  Author name: Floyd Holliday
//  Author email: holliday@fullerton.edu
//
//Program information
//  Program name: Integer to Binary Conversion
//  Programming languages: The driver is in C and the converstion function is in X86.
//  Date program began: 2023 July 27
//  Date of last update: 2023 July 30
//  Files in this program: binarymain.c, itob.asm, r.sh
//  Status: Conversion to base 2 is finished.
//  Future: A straight forward extension is to convert an integer to an expression in any base n where 2<=n<=16.
//
//Purpose
//  Show how to how to make an array, implement iteration, and reject invalid inputs
//
//This file
//   File name: binarymain.c
//   Language: C
//   Max page width: 124 columns
//   Compile: gcc -c -Wall -m64 -no-pie -o binarymain.o binarymain.c -std=c17
//   Link: gcc -m64 -no-pie -o bin.out binarymain.o itob.o -std=c17
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//===== Begin code area ===========================================================================================================

#include <stdio.h>

extern void manager();

int main()
{
printf("Welcome to this program.\n");

manager();

 return 0;

}