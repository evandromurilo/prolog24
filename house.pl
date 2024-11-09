casa(rato) :-
    tamanho(pequeno),
    animal(rato),
    come(graos).

casa(cachorro) :-
    tamanho(medio),
    animal(cachorro),
    come(carne).

casa(gato) :-
    tamanho(medio),
    animal(gato),
    come(racao).

animal(rato).
animal(gato).
animal(cachorro).


tamanho(X) :- ask(tamanho, X).
come(X) :- ask(come, X).

:- dynamic known/3.

ask(Attr, Val) :-
    known(Attr, Val, sim).
ask(Attr, Val) :-
    known(Attr, Val, nao),
    fail.
ask(Attr, Val) :-
    not(known(Attr, Val, _X)),
    write(Attr),tab(1),write(Val),
    tab(1),write('(sim/nao)'),write(?),tab(1),
    read(X),
    asserta(known(Attr, Val, X)),
    X = sim.






















