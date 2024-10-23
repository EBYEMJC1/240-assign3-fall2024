//stolen from Kaitlyn
#include <stdio.h>
#include <cstring>
#include <iostream>
using namespace std;

extern "C" void sorting( long* myArray, int arraysize);

void sorting( long* myArray, int arraysize)
{
  long hold;
  for (int i = 0; i < arraysize; i++)
    {
      for (int j=0; j<arraysize-i-1; j++){
        if (myArray[j] > myArray[j+1]){

          hold=myArray[j];
          myArray[j]=myArray[j+1];
          myArray[j+1]=hold;

        }
      }
      
    }
}