#stolen from https://sites.google.com/a/fullerton.edu/activeprofessor/4-subjects/x86-programming/x86-examples/floating-io?authuser=0
#Delete some un-needed files
rm *.o
rm *.out

echo "Assemble manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "Assemble input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

echo "Assemble is_integer.asm"
nasm -f elf64 -l is_integer.lis -o is_integer.o is_integer.asm

g++ -c -m64 -Wall -o sorting.o sorting.cpp -fno-pie -no-pie -std=c++2a

echo "Compile main.c using the gcc compiler standard 20"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c2x

echo "Link the object files using the gcc linker standard 2011"
g++ -m64 -no-pie -o linked.out manager.o input_array.o is_integer.o sorting.o  main.o -std=c2x

echo "Run the program Floating IO:"
./linked.out

echo "The script file will terminate"
