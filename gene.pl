male(murilo).
female(iana).
male(benjamim).
male(jose).
male(olavo).
female(julieta).
male(irvandro).
male(ivo).
female(edinalva).
female(iara).
male(dietwald).
female(arcenia).
male(ian).
female(monique).
male(igor).
female(ingrid).
male(beto).
female(vania).

spouse(murilo, iana).
spouse(irvandro, iana).
spouse(ivo, edinalva).
spouse(dietwald, arcenia).
spouse(beto, vania).

parent(arcenia, iara).
parent(dietwald, iara).
parent(arcenia, beto).
parent(dietwald, beto).

parent(iara, murilo).
parent(irvandro, murilo).
parent(iara, monique).
parent(irvandro, monique).

parent(murilo, benjamim).
parent(murilo, jose).
parent(murilo, julieta).
parent(murilo, olavo).
parent(iana, benjamim).
parent(iana, jose).
parent(iana, julieta).
parent(iana, olavo).

parent(edinalva, iana).
parent(ivo, iana).
parent(edinalva, ian).
parent(ivo, ian).

parent(beto, igor).
parent(vania, igor).
parent(beto, ingrid).
parent(vania, ingrid).

mother(M, C) :-
    female(M),
    parent(M, C).

father(F, C) :-
    male(F),
    parent(F, C).

grandchild(C, G) :-
    parent(P, C),
    parent(G, P).

grandparent(G, C) :-
    parent(G, P),
    parent(P, C).

grandmother(G, C) :-
    female(G),
    grandparent(G, C).

grandfather(G, C) :-
    male(G),
    grandparent(G, C).

sibling(S, C) :- % mesmo mae e pai só para não duplicar
    father(F, S),
    father(F, C),
    mother(M, S),
    mother(M, C),
    C \= S.

brother(B, C) :-
    male(B),
    sibling(B, C).

sister(S, C) :-
    female(S),
    sibling(S, C).

uncle(U, C) :-
    brother(U, F),
    parent(F, C).

uncle(U, C) :-
    married(U, A),
    sister(A, P),
    parent(P, C).

aunt(A, C) :-
    sister(A, F),
    parent(F, C).

aunt(A, C) :-
    married(A, U),
    brother(U, F),
    parent(F, C).

cousin(A, B) :-
    sibling(A0, B0),
    parent(A0, A),
    parent(B0, B).

married(A, B) :- spouse(A, B).
married(A, B) :- spouse(B, A).
