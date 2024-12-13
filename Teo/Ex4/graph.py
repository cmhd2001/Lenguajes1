#Clase Grafo como lista de adyacencia. 
#Esta implementacion asume grafos no dirigidos.
class Grafo:
    def __init__(self):
        self.adyacencias = {}

    def agregar_arista(self, origen, destino):
        if origen not in self.adyacencias:
            self.adyacencias[origen] = []
        if destino not in self.adyacencias:
            self.adyacencias[destino] = []
        self.adyacencias[origen].append(destino)
        self.adyacencias[destino].append(origen) 

#Interfaz Busqueda.
class Busqueda:
    def __init__(self, grafo):
        self.grafo = grafo

    def buscar(self, D, H):
        raise NotImplementedError("Este método debe ser implementado por subclases.")

#Clase DFS que extiende Busqueda.
from collections import deque

class DFS(Busqueda):
    def __init__(self, grafo):
        super().__init__(grafo)

    def buscar(self, D, H):
        visitados = set()
        pila = deque([(D, 0)])
        nodos_explorados = 0

        while pila:
            nodo, profundidad = pila.pop()
            if nodo in visitados:
                continue
            visitados.add(nodo)
            nodos_explorados += 1
            if nodo == H:
                return nodos_explorados

            for vecino in self.grafo.adyacencias.get(nodo, []):
                if vecino not in visitados:
                    pila.append((vecino, profundidad + 1))

        return -1


#Clase BFS que extiende Busqueda.
class BFS(Busqueda):
    def __init__(self, grafo):
        super().__init__(grafo)

    def buscar(self, D, H):
        visitados = set()
        cola = deque([(D, 0)])
        nodos_explorados = 0

        while cola:
            nodo, profundidad = cola.popleft()
            if nodo in visitados:
                continue
            visitados.add(nodo)
            nodos_explorados += 1
            if nodo == H:
                return nodos_explorados

            for vecino in self.grafo.adyacencias.get(nodo, []):
                if vecino not in visitados:
                    cola.append((vecino, profundidad + 1))

        return -1

