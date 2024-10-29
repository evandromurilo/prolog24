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

ask(Attr, Val) :-
    write(Attr),tab(1),write(Val),
    tab(1),write('(sim/nao)'),write(?),tab(1),
    read(X),
    X = sim.
