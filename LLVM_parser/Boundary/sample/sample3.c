#include<stdio.h>

float func2(int a, int b)
{
    if (a > b)
        return a+b;
    else
       return a-b;
}
void func1(float* a, int m, int n, int p)
{
    int i, j, k;
    for (i = 0; i < m; i++)
              for ( j = 0; j < n; j++)
                  for ( k = 0; k < p; k++)
                        a[i] = a[i] + func2(i, j+k);
}

int main()
{
    float A[10];
    float B[100];
    int k;
    func1(A, 10, 10, 10);
    func1(B, 100, 100, 100);
    return A[0]+B[0];
}

