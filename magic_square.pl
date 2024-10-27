:- use_module(library(clpfd)).

magic_square(A0, B0, C0, A1, B1, C1, A2, B2, C2) :-
    Vars = [A0, B0, C0, A1, B1, C1, A2, B2, C2],
    Vars ins 1..9,
    all_different(Vars),
    A0 + B0 + C0 #= S,
    A1 + B1 + C1 #= S,
    A2 + B2 + C2 #= S,
    A0 + B1 + C2 #= S,
    A2 + B1 + C0 #= S,
    A0 + A1 + A2 #= S,
    B0 + B1 + B2 #= S,
    C0 + C1 + C2 #= S,
    labeling([], Vars).



