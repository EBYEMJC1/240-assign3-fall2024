//***********************************************************************************************************************
//Program name: "Integer to Binary Conversion.  This program will accept an integer from the keyboard and then display  * 
//the binary representation of that integer using 64 bits.  Copyright (C) 2024 Damon Cawthon                            *
//                                                                                                                      *
//This file, itob.asm, is part of the software program "Integer to Binary Conversion".                                  *
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
// Author name: Damon Cawthon
// Author email: dcawthon2242@csu.fullerton.edu
//
//Program information
// Program name: Random Array Generator
// Programming languages: The driver is in C and the converstion function is in X86.
// Date program began: 2024 October 30
// Date of last update: 2024 November 3
// Files in this program: assign_4.c, sort.c, manager.asm, input_array.asm, output_array.asm, normalize_array.asm, isnan.asm, r.sh
//
//Purpose
// Output 3 arrays, a random array, a normalized array, then a sorted normalized array
//
//This file
//  File name: sort.c
//  Language: C with Intel syntax
//  Max page width: 124 columns
//  Assemble: gcc -c -m64 -Wall -o sort.o sort.c -fno-pie -no-pie -std=c2x
//  Link: gcc -m64 -no-pie -o output.out assign_4.o manager.o sort.o input_array.o output_array.o normalize_array.o isnan.o -std=c17
//
// ========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3



// ===== Begin code area ================================================================================================

// The C sort function to be used in conjunction with your assembly code
#include <stdio.h>

void sort(int array_size, double *my_array) {
    double temp;
    // Implementing Bubble Sort to arrange the array in ascending order
    for (int i = 0; i < array_size - 1; i++) {
        for (int j = 0; j < array_size - i - 1; j++) {
            // Compare adjacent elements and swap if needed
            if (my_array[j] > my_array[j + 1]) {
                // Swap the elements
                temp = my_array[j];
                my_array[j] = my_array[j + 1];
                my_array[j + 1] = temp;
            }
        }
    }
}
