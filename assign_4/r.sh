#/bin/bash

#Program name "Random Array Generator"
#Author: Damon Cawthon
#Author Email: dcawthon2242@csu.fullerton.edu
#CWID: 885403741
#Class: 240-09 Section 09
#This file is the script file that accompanies the "Random Array Generator" program.

#Delete some un-needed files
rm *.o
rm *.out

echo "Assemble the source file manager.asm"
nasm -f elf64 -o manager.o manager.asm

echo "Assemble the source file input_array.asm"
nasm -f elf64 -o input_array.o input_array.asm

echo "Assemble the source file isnan.asm"
nasm -f elf64 -o isnan.o isnan.asm 

echo "Assemble the source file normalize_array.asm"
nasm -f elf64 -o normalize_array.o normalize_array.asm 

echo "Assemble the source file output_array.asm"
nasm -f elf64 -o output_array.o output_array.asm

echo "Compile the source file sort.c"
gcc -c -m64 -Wall -o sort.o sort.c -fno-pie -no-pie -std=c2x

echo "Compile the source file assign_4.c"
gcc -c -m64 -Wall -o assign_4.o assign_4.c -fno-pie -no-pie -std=c2x

echo "Link the object modules to create an executable file"
g++ -m64 -o output.out manager.o assign_4.o input_array.o isnan.o normalize_array.o output_array.o sort.o -fno-pie -no-pie -std=c2x

echo "Execute the program"
chmod +x output.out
./output.out

echo "This bash script will now terminate."