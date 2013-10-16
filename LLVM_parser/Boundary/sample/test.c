int func1( int m, int n )
{
    int a = 0;
    int k, j;
    for (k = 0; k < m; k++)
       for (j = 0; j < n; j++)
                   a = a + k - j;
           return a;
}
int main ()
{
    int x, y;
    x = func1 (10, 10);
    y = func1 (100, 100);
    return x+y;
}

