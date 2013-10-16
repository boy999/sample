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
    float A[10];
    float B[100];

    func1(A, 10, 10);
    func1(B, 100, 100);

    return A[0]+B[0];
}

