#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define SQR(x) (x)*(x)
#include <stdbool.h>

#define CENTER   (m+M*(n+N*p))
#define RIGHT    (m+M*(n+N*p)+M)
#define LEFT     (m+M*(n+N*p)-M)
#define DOWN     (m+M*(n+N*p)+1)
#define UP       (m+M*(n+N*p)-1)
#define ZOUT     (m+M*(n+N*p+N))
#define ZIN      (m+M*(n+N*p-N))        

#define DIM_SIZE 16
#define P_SIZE 16

void denoise_CPU_stage1(float *T0, float* g, float* u)
{

	float EPSILON=5e-5f;
	int M,N;
//	M=N=P=DIM_SIZE;
	M=N=DIM_SIZE;
    int P = DIM_SIZE;
	int n,m; 
	/* Initializations */
       /*** Main gradient descent loop ***/

	/* Macros for referring to pixel neighbors */

	/* Approximate g = 1/|grad u| */

    int p;
	for(p = 1; p < P-1; p++)
	for(n = 1; n < N-1; n++)
		for(m = 1; m < M-1; m++)
        {
			g[CENTER] = 1.0f/sqrtf( EPSILON
					+ SQR(u[CENTER] - u[RIGHT])
					+ SQR(u[CENTER] - u[LEFT])
					+ SQR(u[CENTER] - u[DOWN])
					+ SQR(u[CENTER] - u[UP])
					+ SQR(u[CENTER] - u[ZOUT])
					+ SQR(u[CENTER] - u[ZIN]));        
            printf("m = %d; n = %d; p = %d\n", m, n, p);
        }

    
} 


void denoise_CPU_stage2(float *T0, float* g, float* u)
{ 
	/* Update u by a sem-implict step */
	int M,N, P;
	M=N=P=DIM_SIZE;
	//M=N=DIM_SIZE;
	float sigma=0.05f ; 
	float DT=5.0f;
	float lambda=0.065f;
	//float Tol=2e-2f;
	//int MAXITER=100;
	float *f=T0;

	float sigma2 = SQR(sigma);
	float gamma = lambda/sigma2;
	float r;
	int n,m;

    int p;
	for(p = 1; p < P-1; p++)
	for(n = 1; n < N-1; n++)
		for(m = 1; m < M-1; m++)
		{
			/* Evaluate r = I1(u*f/sigma^2) / I0(u*f/sigma^2) with
			   a cubic rational approximation. */
			r = u[CENTER]*f[CENTER]/sigma2;
			r = ( r*(2.38944f + r*(0.950037f + r)) )
				/ ( 4.65314f + r*(2.57541f + r*(1.48937f + r)) );
			/* Update u */
			u[CENTER] = ( u[CENTER] + DT*(u[RIGHT]*g[RIGHT]
						+ u[LEFT]*g[LEFT] + u[DOWN]*g[DOWN] + u[UP]*g[UP]
						+ u[ZOUT]*g[ZOUT] + u[ZIN]*g[ZIN] 
						+ gamma*f[CENTER]*r) ) /
				(1.0f + DT*(g[RIGHT] + g[LEFT] 
					    + g[DOWN] + g[UP] 
					    + g[ZOUT] + g[ZIN] + gamma));

            printf("m = %d; n = %d; p = %d\n", m, n, p);
		}
}


void denoise( float * T0 ){
	printf("Now at denoise \r\n");
	int p,M,N,P;
	int iter;
//	M=N=P=DIM_SIZE;
	M=N=DIM_SIZE;
    P=P_SIZE;

	float* u = calloc(M*N*P, sizeof(float)); /* Allocate temporary work array */        
	memcpy(u, T0, sizeof(float)*M*N*P);  /* Initialize u = f */
	float* g = calloc(M*N*P, sizeof(float)); /* Allocate temporary work array */        

    for(iter=0;iter<3;iter++)
    {
        denoise_CPU_stage1(T0,g,u);

        denoise_CPU_stage2(T0,g,u);

        printf("iter = %d\n", iter);
    }

	memcpy(T0, u, sizeof(float)*M*N*P);  
	free(u);
	free(g);

}


int main(int argc, char** argv)
{

	int m,n,p;

//	m=n=p=DIM_SIZE;
	m=n=DIM_SIZE;
    p=P_SIZE;

	int i,j,k;
	int iterNum;
	iterNum = 200;
	float *T_original=calloc(m*n*p,sizeof(float));


	float *T =calloc(m*n*p,sizeof(float));
	FILE* T_ptr;

	float Tmax = 8180.0;
	unsigned short num;

    T_ptr = fopen("data/T.img", "rb");
	if(T_ptr == NULL)
	{
		printf("reading error\n");
		exit(1);
	}

	float t;

	for(k = 0; k < p; k++)
		for( j = 0; j < n; j++)
			for( i = 0; i < m; i++)
			{
				fread(&num, 2, 1, T_ptr);
				t = (float)num/Tmax*255.0f;
				T_original[(i*n+j)*p+k] = t;
			}
	fclose(T_ptr);

	memcpy(T,T_original,m*n*p*sizeof(float));

	denoise(T);

	return 0;
}
