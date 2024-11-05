"""
Se desea que modele e implemente, en el lenguaje de su elección, un programa que maneje expresiones aritmáticas sobre enteros. Este programa debe cumplir con las siguientes ca-
racterísticas:

(a) Debe saber tratar expresiones escritas en orden pre–fijo y post–fijo, con los siguientes
operadores:

•suma: Representada por el símbolo +.
•resta: Representada por el símbolo -.
•multiplicación: Representada por el símbolo *.
•división entera: Representada por el símbolo /.

(b) Una vez iniciado el programa, pedirá repetidamente al usuario una acción para pro-
ceder. Tal acción puede ser:

i. EVAL <orden> <expr>
Representa una evaluación de la expresión en <expr>, que está escrita de acuerdo
a <orden>.
El <orden> solamente puede ser:
•PRE: Que representa expresiones escritas en orden pre–fijo.
•POST: Que representa expresiones escritas en orden post–fijo.
Por ejemplo:
•EVAL PRE + * + 3 4 5 7 deberá imprimir 42.
•EVAL POST 8 3 - 8 4 4 + * + deberá imprimir 69.

ii. MOSTRAR <orden> <expr>
Representa una impresión en orden in–fijo de la expresión en <expr>, que está
escrita de acuerdo a <orden>. El <orden> sigue el mismo patrón que en el punto anterior. 

Su programa debe tomar la precedencia y asociatividad estándar, donde:

•La suma y la resta tienen la misma precedencia.
•La multiplicación y la división entera tienen la misma precedencia.
•La multiplicación y la división entera tienen mayor precedencia que la suma y la resta.
•Todos los operadores asocian a izquierda.

La expresión resultante debe tener la menor cantidad posible de paréntesis, de tal forma que la expresión mostrada como resultado tenga la misma semántica que la expresión que fue pasada como argumento a la acción.
Por ejemplo:
•MOSTRAR PRE + * + 3 4 5 7 deberá imprimir (3 + 4) * 5 + 7.
•MOSTRAR POST 8 3 - 8 4 4 + * + deberá imprimir 8 - 3 + 8 * (4 + 4).

iii. SALIR
Debe salir del programa.
Al finalizar la ejecución de cada acción, el programa deberá pedir la siguiente acción al usuario
"""

def operations():
    while(True):
        print("¿Qué operación deseas realizar hoy? ")
        entrada = input()
        if entrada == "SALIR":
            break
        else:
            print("Servicio en mantenimiento. Vuelva  pronto :^) ")

operations()