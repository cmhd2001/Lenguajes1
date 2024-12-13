#Interfaz Secuencia
class Secuencia:
    def agregar(self, elemento):
        raise NotImplementedError("Este método debe ser implementado por subclases.")

    def remover(self):
        raise NotImplementedError("Este método debe ser implementado por subclases.")

    def vacio(self):
        raise NotImplementedError("Este método debe ser implementado por subclases.")

#Subclase Pila que extiende a Secuencia
class Pila(Secuencia):
    def __init__(self):
        self.elementos = []

    def agregar(self, elemento):
        self.elementos.append(elemento)

    def remover(self):
        if self.vacio():
            raise IndexError("La pila está vacía")
        return self.elementos.pop()

    def vacio(self):
        return len(self.elementos) == 0

#Subclase Cola que extiende a Secuencia
class Cola(Secuencia):
    def __init__(self):
        self.elementos = []

    def agregar(self, elemento):
        self.elementos.append(elemento)

    def remover(self):
        if self.vacio():
            raise IndexError("La cola está vacía")
        return self.elementos.pop(0)

    def vacio(self):
        return len(self.elementos) == 0

