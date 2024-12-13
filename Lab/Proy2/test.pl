padre(juan, jose).
padre(juan, ana).
padre(jose, alberto).
padre(pedro, ricardo).
padre(alberto, maria).

abuelo(X,Y) :- padre(X,Z), padre(Z,Y).