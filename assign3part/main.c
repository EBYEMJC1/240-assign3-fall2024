//===== Begin code area ===========================================================================================================

#include <stdio.h>
#include <stdint.h> //For C99 compatibility
//At the time of this writing C99 is the newest available standard for C language.  Most modern C compilers conform to the C99 
//standard.  The GNU compiler, known as gcc, is C99 compliant.  If both languages, C and X86, are C99 compliant then object code 
//files from both compilers may be linked to form a single executable. 
//
//The standard prototypes for any functions that may be called later.  This main function calls exactly one function.
//stolen from https://sites.google.com/a/fullerton.edu/activeprofessor/4-subjects/x86-programming/x86-examples/floating-io?authuser=0
extern void manager();
//
int main(int argc, char* argv[]){
    printf("Welcome to Marvelous Arrayss\n");
    printf("Bought to you by Jessica Ward\n");
    manager();
    //printf("The function floatio has returned this value %8.5lf.  Have a nice day\n",answer);
    return 0;
}
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**