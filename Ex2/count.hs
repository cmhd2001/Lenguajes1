-- Función f(n) que devuelve n/2 si n es par y 3n+1 si n es impar.
f :: Integer -> Integer
f n = if even n then n `div` 2 else (3 * n) + 1

{-
Función que cuenta el número de aplicaciones consecutivas de la función f(n)
sobre un n dado hasta obtener 1 como resultado.
-}
dist :: Integer -> Integer
dist 1 = 0
dist n = 1 + dist(f n)