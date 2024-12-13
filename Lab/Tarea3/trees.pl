arco(z,a).
arco(a,b).
arco(a,c).
arco(a,d).
arco(c,e).
arco(c,f).
arco(d,g).
arco(g,h).
arco(g,i).
arco(g,j).

hermano(A,B) :- arco(A,C), arco(C,B).

alcanzable(A,A).
alcanzable(A,B) :- arco(A,C), alcanzable(C,B).

lca(A,A,A) :- !.
lca(A,B,C) :- arco(C,A), arco(C,B), !.
lca(A,B,C) :-
    alcanzable(C,A),
    alcanzable(C,B), 
    not(alcanzable(C,Z)), C \= Z, alcanzable(Z,A), alcanzable(Z,B).