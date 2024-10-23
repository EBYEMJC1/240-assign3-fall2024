#stolen from https://sites.google.com/a/fullerton.edu/activeprofessor/4-subjects/x86-programming/x86-examples/floating-io?authuser=0
#Delete some un-needed files
#sudo apt update sudo apt install nasm sudo apt install gdb chmod u+x r.sh -gdwarf -g
rm *.o
rm *.out

echo "Assemble manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm -gdwarf

echo "Assemble input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm -gdwarf

echo "Assemble is_integer.asm"
nasm -f elf64 -l is_integer.lis -o is_integer.o is_integer.asm -gdwarf

g++ -c -m64 -Wall -g -o sorting.o sorting.cpp -fno-pie -no-pie -std=c++2a

echo "Compile main.c using the gcc compiler standard 20"
gcc -c -Wall -m64 -no-pie -g -o main.o main.c -std=c2x

echo "Link the object files using the gcc linker standard 2011"
g++ -m64 -no-pie -o linked.out manager.o input_array.o is_integer.o sorting.o  main.o -std=c2x -g

echo "Run the program Floating IO:"
chmod u+x linked.out
gdb ./linked.out

echo "The script file will terminate"
