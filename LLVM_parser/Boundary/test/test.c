#include <stdio.h>

int A[200];
int B[100];
int func(int val)
{
    int i;
    for(i = 1; i < val; i++)
    {
        B[i] = B[i-1] + 1;
    }
    return B[i];
}

int main()
{
    int i, j, val;
    A[0] = 1;
    B[0] = 1;
    for (i = 0; i < 100; i++)
        for (j = 0; j < 100; j++)
        {
            B[j+1] = func(A[i] + 1);            
            A[i+1] = A[i] + 1;
        }

    printf("The value of A[99] : %d\n", A[99]);
    printf("The value of B[99] : %d\n", B[99]);
    return A[100];
}

