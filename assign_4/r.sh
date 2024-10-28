#/bin/bash

#Program name "Non-deterministic random numbers"
#Author: Kaitlyn Lee
#Author Email: kaitlynlee@csu.fullerton.edu
#CWID: 886374479
#Class: 240-03 Section 03
#This file is the script file that accompanies the "Non-deterministic random numbers" program.
#Prepare for execution in normal mode (not gdb mode).

#Delete some un-needed files
rm *.o
rm *.out

echo "Assemble the source file manager.asm"
nasm -f elf64 -o manager.o manager.asm -gdwarf

echo "Assemble the source file input_array.asm"
nasm -f elf64 -o input_array.o input_array.asm -gdwarf

echo "Assemble the source file isnan.asm"
nasm -f elf64 -o isnan.o isnan.asm -gdwarf

echo "Compile the source file assign_4.c"
gcc -c -m64 -Wall -o assign_4.o assign_4.c -fno-pie -no-pie -std=c2x -g

echo "Link the object modules to create an executable file"
g++ -m64 -o output.out manager.o assign_4.o input_array.o isnan.o -fno-pie -no-pie -std=c++2a -g

echo "Execute the program"
chmod +x output.out
gdb ./output.out

echo "This bash script will now terminate."