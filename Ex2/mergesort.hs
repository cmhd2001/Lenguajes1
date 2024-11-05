{-
MergeSort en Haskell

La idea para implementar este algoritmo en este lenguaje consiste en definir 
una funcion auxiliar join que se encarga de recibir dos arreglos y unirlos en
orden creciente. Aprovechandonos del pattern matching de haskell, optimizamos 
que el join de un arreglo x con el arreglo vacío es el arreglo x, no importa 
el orden en el que se recibe el argumento.Applicative

Finalmente, definimos ms como el método recursivo que aplica el algoritmo.
De nuevo, aprovechamos el pattern matching y atajamos los casos base cuando es
la lista vacía y cuando es el arreglo con un solo elemento (en cuyos casos se 
retornan a sí mismos, respectivamente). La definicion de ms es aplicar join de
dos arreglos, left y right, construidos al picar a la mitad el arreglo original.
-}

join :: Ord a => [a] -> [a]-> [a]
join [] y = y
join x [] = x
join x y
    | head x < head y = head x : join (tail x) y
    | otherwise = head y : join x (tail y)

ms :: Ord a => [a] -> [a]
ms [] = []
ms [x] = [x]
ms x = join left right where 
    mid = length x `div` 2
    left = ms (take mid x)
    right = ms (drop mid x) 