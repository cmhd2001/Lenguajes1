suma(zero, Y, Y).
suma(next(X), Y, next(Z)) :-
    suma(X, Y, Z).

resta(X, zero, X).
resta(next(X), next(Y), Z) :-
    resta(X, Y, Z).

producto(zero, _, zero).
producto(next(X), Y, Z) :-
    producto(X, Y, W),
    suma(Y, W, Z).
