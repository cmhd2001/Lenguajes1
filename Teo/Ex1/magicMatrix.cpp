/*
Carlo Miguel Herrera Di Giacinto
Carnet 18-10451

Ejercicio 1.b.ii) del Examen 1 de Lenguajes de Programación I Sep-Dic 2024.
Asignatura dictada por el Prof. Ricardo Monascal.

Dada una matriz cuadrada A (cuya dimensión es N ×N ), decidir si A corresponde
a una Matriz Mágica.
*/

#include <iostream>
#include <vector>

using namespace std;

/*
Funcion magicMatrix()

@param:
    A: vector de dos dimensiones que contiene a la matriz A a evaluar.
return:
    Si la matriz es mágica o no usando las constantes booleanas.
*/
bool magicMatrix(vector <vector<int>> A){
    
    //Creamos un alias conveniente para el tamaño de la matriz cuadrada.
    int N = A[0].size();

    //Inicializamos las variables para calcular la suma de las diagonales.
    int mainDiag = 0, secondDiag = 0;
    
    for (int i = 0; i < N; i++){
        mainDiag += A[i][i];
        secondDiag += A[i][N-1-i];
    }

    //Si la suma de las diagonales no coinciden concluimos directamente que la matriz no era mágica.
    //Retornamos falso.
    if (mainDiag != secondDiag){
        return false;
    } else{

        //Si no, iteramos sobre las filas (y columnas) de A para calcular las sumas de sus elementos.
        for(int i = 0; i < N; i++){
        
            //Usamos variables frescas para calcular estos valores.
            int rowSum = 0, colSum = 0;

            for(int j = 0; j < N; j++){
                rowSum += A[i][j];
                colSum += A[j][i];
            }

            //Comparamos las sumas de las filas y columnas con alguna de las diagonales (en este caso la principal).
            //Si alguna de las dos no coincide retornamos falso.
            if (rowSum != mainDiag || colSum != mainDiag){
                return false;
            }
        }

        //Si llegamos a esta parte es porque no entramos en las validaciones que nos llevaban a concluir que era falso.
        //Por lo tanto retornamos true.
        return true;
    }
}

int main(int argc, char* argv[]){

    //Declaramos N, el tamaño de la matriz cuadrada.
    int N;
    //Recibimos por entrada del usuario el valor de N.
    cin >> N;

    //Declaramos A, el vector de dos dimensiones que almacenará a la matriz.
    vector<vector <int> > A (N, vector<int> (N));

    //Recibimos por entrada del usuario los datos de la matriz ordenados por filas.
    for (int i = 0; i < N; i++){
        for (int j = 0; j < N; j++){
            cin >> A[i][j];
        }
    }

    //Llamamos a la función magicMatrix() con A como parametro.
    if (magicMatrix(A)){
        //Si retorna true, imprimimos un mensaje confirmando que era una matriz mágica.
        cout << "Es una matriz mágica. =D" << endl;
    } else {
        //En caso contrario, imprimimos un mensaje notificando que no lo era.
        cout << "La matriz no era magica (es muggle)." << endl;
    }

    return 0;
}