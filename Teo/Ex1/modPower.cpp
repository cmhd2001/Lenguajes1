/*
Carlo Miguel Herrera Di Giacinto
Carnet 18-10451

Ejercicio 1.b.i) del Examen 1 de Lenguajes de Programación I Sep-Dic 2024.
Asignatura dictada por el Prof. Ricardo Monascal.

Dados tres enteros no–negativos a, b y c , tal que c >= 2, calcular la poten-
ciación modulada (a^b) mod c.
*/

#include <iostream>
#include <fstream>
#include <string>
#include <cmath>

using namespace std;

/*
Funcion recursiva modPower()

@param:
    a: entero no negativo. Base de la potenciación.
    b: entero no negativo. Exponente de la potenciación.
    c: entero no negativo. Valor del que se desea apolicar el modulo.
return:
    El resultado de la potencia modulada(a^b) mod c.
*/
int modPower(int a, int b, int c){

    if (b == 0){
        return 1;
    } else{
        return ((a % c) * modPower(a, b-1, c)) % c;
    }

};

int main (int argc, char const *argv[]){

    int a, b, c;

    cin >> a;
    cin >> b;
    cin >> c;

    if (a < 0 || b < 0 || c < 2){
        cout << "No se pueden realizar el calculo con los datos ingresados. \n" << endl;
        cout << "Intente nuevamente. \n" << endl;
    } else{
        cout << modPower(a,b,c) << endl;
    }

    return 0;
}