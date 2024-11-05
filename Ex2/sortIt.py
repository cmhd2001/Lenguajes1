# Iterador que ordena una lista de menor a mayor
# En caso de querer hacer pruebas con otros arreglos, sólo debes cambiar 
# el valor de input por el arreglo de tu preferencia.

# Ten en cuenta que al ser un código experimental con fines académicos no 
# posee todas las verificaciones necesarias para atajar posibles errores.

def sortIt(A):
    if A != []:
        lowIdx = 0
        for i in range(1, len(A)):
            if A[i] < A[lowIdx]:
                lowIdx = i

        low = A.pop(lowIdx)
        
        yield low
        for x in sortIt(A):
            yield x

input = [11, 7, 40, 3, 2, -5, 0, 9, 7, 4, 8, -7, 13, 11, 3]
out=[]

for x in sortIt(input):
    out.append(x)
print(out)
