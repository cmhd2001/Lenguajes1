# Constantes según el número de carnet (18-10451)
X, Y, Z = 4, 5, 1

# Definimos los valores de alpha y beta (a y b por practicidad) para la función F 
a = ((X + Y ) % 5) + 3
b = ((Y + Z) % 5) + 3

# Definimos F tal y como se decribió en el enunciado la función a trozos.
def f(a, b, n):
    if 0 <= n and n < a*b:
        return n
    elif n>= a*b:
        sum = 0
        for i in range(1, a+1):
            sum += f(a,b, n - (b*i))
        return sum
        
print("Normal: " + str(f(a,b,30)))

# Convertimos la recursión original en una recursión de cola.
def fTail(a,b, n, acc=0, i=-1):
    if i == -1:
        i=a

    if 0 <= n and n < a*b:
        return n + acc
    elif n >= a*b:
        if i == 0:
            return acc
        else:
            return fTail(a,b,n, acc + fTail(a,b,n - (b*i)), i-1)
    
print ("De cola: " + str(fTail(2,1,10)))

# Convertimos ahora la recursión de cola en su forma iterativa

def fIter(a,b,n):
    acc = 0
    if 0 <= n and n < a*b:
        return n
    elif n >= a*b:
        aux = [0]
        base = n % a
        recurTimes = (n - a*b) // b
        
        for k in range(0, recurTimes):
            sum = 0
            for i in range(1, a+1):
                sum += base + (b*k) 
            #sum+= aux[k]
            aux.append(sum)

        for i in range(1,a+1):
            if n - (b*i) >= a*b:
                acc+= aux[recurTimes-i+1]
            else:
                acc+= n - (b*i)

        return acc

print ("Iterativo: " + str(fIter(2,1,10)))