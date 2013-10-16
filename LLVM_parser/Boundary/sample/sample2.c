#include<stdio.h>

float func2(int a, int b)
{
    if (a > b)
        return a+b;
    else
       return a-b;
}
void func1(float* a, int m, int n)
{
    int i, j;
    for (i = 0; i < m; i++)
              for ( j = 0; j < n; j++)
                        a[i] = a[i] + func2(i, j);
}

int main()
{
    float A[1000];
    float B[1000];
    int k;
    //for (k = 10; k <= 1000; k=k+10)
    //{
        func1(A, k, k);
        func1(B, k, k);
    //}
    return A[0]+B[0];
}

