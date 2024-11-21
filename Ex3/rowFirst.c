//Recorrido por filas

#include <stdio.h>
#include <time.h>
#include <string.h>

int Values [] = {100, 1000, 10000, 100000, 1000000};

int main(int argc, char const *argv[])
{
    long long int N, M;
    int k;

    printf("Escoja un valor para N: (use el primer valor de la lista) \n");
    printf("\n 0 -> 10^2 \n 1 -> 100^3 \n 2 -> 10^4 \n 3 -> 10^5 \n 4 -> 10^6 \n");
    scanf("%d",&k);

    if (k>=0 && k<5 ){
        N = Values[k];
    } else {
        printf("Out of Bound Exception: El valor ingresado no corresponde a un valor valido. \n");
        return -1;
    }

    printf("Escoja un valor para M: (use el primer valor de la lista)");
    printf("\n 0 -> 10^2 \n 1 -> 100^3 \n 2 -> 10^4 \n 3 -> 10^5 \n 4 -> 10^6 \n");
    scanf("%d", &k);

    if (k>=0 && k<5 ){
        M = Values[k];
    } else {
        printf("Out of Bound Exception: El valor ingresado no corresponde a un valor valido. \n");
        return -1;
    }

    time_t begin = time(NULL);
    int A[N][M];
    memset( A, 1, sizeof(A) );
    
    int sum = 0;

    for (int i = 0; i < N; i++){
        for (int j = 0; j < M; j++){
            sum += A[i][j];
        }
    }
    
    time_t end = time(NULL);

    printf("El tiempo de ejecución para n = %Ld y m = %Ld es de %ld segundos. \n", N, M, (end - begin));
    return 0;
}