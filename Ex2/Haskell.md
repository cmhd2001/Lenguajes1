###### El lenguaje escogido para este exámen es:
---

# Haskell (ツ)


Haskell es un lenguaje de alto nivel puramente funcional y fuertemente tipado. Recibe su nombre del matemático y lógico estadounidense **Haskell B. Curry**, cuyo trabajo sirve como fundamento para los lenguajes funcionales, en particular el _cálculo lambda_ sobre el cual está basado Haskell y el porqué tiene el símbolo lambda en su logo.

---
## Control de Flujo 

#### 1. If-then-else

Esta es la estructura principal del condicional en haskell. La sintaxis es la siguiente:

``` Haskell
if condición then instrucciónA else instrucciónB
```

También podemos reescribir esto para una mejor legibilidad de la forma:

``` Haskell
if condición
    then instrucciónA
    else instrucciónB
```

#### 2. Guardias

Cuando estamos ante condicionales con varias posibilidades en vez de vernos obligados a utilizar if anidados podemos aprovechar la estructura de guardias condicionales. 

De esta forma obtenemos un código más legible en el que se aprecian claramente cada una de las ramas del condicional. Para ello, utilizamos esta sintaxis:

``` Haskell
functionName argumentos
  | condición1 = instrucciónA
  | condición2 = instrucciónB
  | otherwise  = instrucciónDefault

```

#### 3. Case-of

Cuando en los condicionales la condición de la guardia consiste en que el argumento sea igual a un valor o que cumpla un cierto patrón podemos utilizar la estructura de control case-of.


``` Haskell
case expresión of
  patrón1 -> resultado1
  patrón2 -> resultado2
```

#### 4. Recursión

En haskell no contamos con las estructuras comunes de ciclos `while` y `for`. En su lugar, los bucles los podemos realizar convirtiéndolos en funciones recursivas. Ejemplos sencillos de recursión son la función factorial y la función fibonacci:

- __Factorial__
``` Haskell
factorial 0 = 1
factorial n = n * factorial(n-1) 
```
- __Fibonacci__
``` Haskell
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)
```

#### 5. Pattern matching

Una estructura particular común entre lenguajes funcionales es el pattern matching. En esta misma lista ya hemos visto ejemplos de su uso en la definición de las recursiones y una idea similar aplicada dentro de los case-of.

La diferencia principal entre esta ultima y el pattern matching es que el case-of permite hacer el pareo dentro del cuerpo de una función sobre variables que no son el argumento de la función.

``` Haskell
isEmpty [] = True
isEmpty _  = False
```

#### 6. Let-in y Where

Estas dos estructuras podemos agruparlas en una misma sección pues cumplen propósitos similares: incluir variables locales en algún punto del código.

Esto puede ser justo antes de la expresión que la utiliza (let-in)

``` Haskell
let vinculación in expresión
```

O justo después de la definición del cuerpo de la función (where)
``` Haskell
expresión where vinculación
```

#### 7. Cortocircuito lógico

En Haskell, como en la mayoría de lenguajes modernos, los operadores lógicos `&& (AND)` y `|| (OR)` realizan cortocircuitos.

Un cortocircuito lógico consiste en la parada de la evaluación de expresiones lógicas tan pronto como se alcanza un estado definitivo en la cadena, esto es cuando se evalua el valor absorbente del operador.

En el caso del `AND`, deja de evaluar en el momento que se encuentra con un `FALSE`. Por ejemplo,

> En la expresión `a && b`, si `a` es `FALSE`,    Haskell no evalúa `b`, porque el resultado final de la expresión siempre será `FALSE`

Para la cadena de `OR`, se deja de evalaur en el momento que algún valor es `TRUE`

> En la expresión `a || b`, si `a` es `TRUE`,    Haskell no evalúa `b`, porque el resultado final de la expresión siempre será `TRUE`
---
## Orden de evaluación expresiones y funciones.

La evaluación de variables de Haskell corresponde al paradigma de evaluación normal, más específicamente, hace uso de la **evaluación perezosa** que consiste en sólo evaluar las expresiones cuando es estrictamente necesario y el valor se requiere para retornar.

Uno de los principales beneficios de un tipo de evaluación como la perezosa es que no se evaluan expresiones innecesarias o que no son utilizadas, y no sólo esto, una variable se evalua una sola vez,el valor que se obtiene queda asociado a la variable, por lo que cualquier otra llamada desde algun otro punto mas avanzado del código no volverá a calcularlo.

Los argumentos en haskell, sin embargo no siguen un orden fijo y bien delimitado de izquierda a derecha o de derecha a izquierda.

En muchos de los metodos incluidos en el preludio y los operadores básicos el orden de evaluación es de izquierda a derecha, sin embargo, esta misma evaluación perezosa nos deja con la posibilidad de ya hayan variables evaluadas almacenadas de otras operaciones.