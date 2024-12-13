import GHC.Unit.Database (GenericUnitInfo(unitLibraryDirs))
import Control.Monad (void)
subs:: (a -> b -> c) -> (a -> b) -> a -> c
subs x y z = x z (y z)

sumish:: a -> [a]
sumish x = [x]

idplus::  Num a => a -> a 
idplus x = x + x

----------------------------------------

type Conjunto a = a -> Bool

miembro :: Conjunto a -> a -> Bool
miembro f = f 

vacio :: Conjunto a
vacio _ = False

singleton :: (Eq a) => a -> Conjunto a
singleton x = (\y -> y == x)

desdeLista :: (Eq a) => [a] -> Conjunto a
desdeLista x = (\y -> y `elem` x) 

complemento :: Conjunto a -> Conjunto a
complemento f = (\x -> miembro f x == False)

union:: Conjunto a -> Conjunto a -> Conjunto a
union f g = (\x -> miembro f x || miembro g x)

interseccion:: Conjunto a -> Conjunto a -> Conjunto a
interseccion f g = (\x -> miembro f x && miembro g x)

diferencia :: Conjunto a -> Conjunto a -> Conjunto a
diferencia f g = (\x -> miembro f x && miembro g x == False)

transformar :: (b->a) -> Conjunto a -> Conjunto b
transformar t f = (\x -> f (t x))