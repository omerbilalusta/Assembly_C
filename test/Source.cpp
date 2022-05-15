#include "conio.h"
#include<stdio.h>
#include <intrin.h>
extern "C" { //indicate that we have an external function
	int move_array_1byte(int* var, int* varr, int arraysize);
	int move_array_2byte(int* var, int* varr, int arraysize);
	int move_array_4byte(int* var, int* varr, int arraysize);
	int move_array_8byte(int* var, int* varr, int arraysize);
	int move_array_16byte(int* var, int* varr, int arraysize);

}
int main(int argc, char* argv[])
{
	#define arraysize 200
	//__declspec(align(8))
	__declspec(align(16))
	int array1[arraysize];
	int array2[arraysize];
	unsigned __int64 initial_counter, final_counter;

	for (int i = 0; i < arraysize; i++)
	{
		array1[i] = i;
	}

	initial_counter = __rdtsc();
	move_array_1byte(array1, array2, (arraysize*4));
	final_counter = __rdtsc();
	printf("\nCode executed in %I64d CPU cycles\n", final_counter - initial_counter);


	for (int i = 0; i < arraysize; i++)
	{
		array2[i] = 0;
	}

	initial_counter = __rdtsc();
	move_array_2byte(array1, array2, (arraysize * 4));
	final_counter = __rdtsc();
	printf("\nCode executed in %I64d CPU cycles\n", final_counter - initial_counter);


	for (int i = 0; i < arraysize; i++)
	{
		array2[i] = 0;
	}

	initial_counter = __rdtsc();
	move_array_4byte(array1, array2, (arraysize * 4));
	final_counter = __rdtsc();
	printf("\nCode executed in %I64d CPU cycles\n", final_counter - initial_counter);


	for (int i = 0; i < arraysize; i++)
	{
		array2[i] = 0;
	}

	initial_counter = __rdtsc();
	move_array_8byte(array1, array2, (arraysize * 4));
	final_counter = __rdtsc();
	printf("\nCode executed in %I64d CPU cycles\n", final_counter - initial_counter);

	

	
	int array4[arraysize];
	initial_counter = __rdtsc();
	move_array_16byte(array1, array4, (arraysize * 4));
	final_counter = __rdtsc();
	printf("\nCode executed in %I64d CPU cycles\n", final_counter - initial_counter);



	
}