room(kitchen).
room(office).
room(hall).
room('dining room').
room(cellar).

:- dynamic location/2.
location(desk, office).
location(apple, kitchen).
location(flashlight, desk).
location('washing machine', cellar).
location(nani, 'washing machine').
location(broccoli, kitchen).
location(crackers, kitchen).
location(computer, office).
location(envelope, desk).
location(stamp, envelope).
location(key, envelope).

:- dynamic door/3.
door(office, hall, open).
door(kitchen, office, open).
door(hall, 'dining room', open).
door(kitchen, cellar, closed).
door('dining room', kitchen, closed).

edible(apple).
edible(crackers).

tastes_yuchy(broccoli).

:- dynamic turned_off/1.
turned_off(flashlight).

:- dynamic here/1.
here(kitchen).

where_food(X,Y) :-
    location(X,Y),
    edible(X).

where_food(X,Y) :-
    location(X,Y),
    tastes_yuchy(X).

connect(X,Y) :- door(X,Y,_Z).
connect(X,Y) :- door(Y,X,_Z).

list_things(Place) :-
    location(X,Place),
    tab(2),
    write(X),
    nl,
    fail.
list_things(_). % so it succeeds in the end

list_connections(Place) :-
    connect(X, Place),
    tab(2),
    write(X),
    nl,
    fail.
list_connections(_).

look :-
    here(Place),
    write('You are in the '), write(Place), nl,
    write('You can see:'), nl,
    list_things(Place),
    write('You can go to:'), nl,
    list_connections(Place).

look_in(Place) :-
    location(Thing, Place),
    tab(2),
    write(Thing),
    nl,
    fail.

goto(Place) :-
    can_go(Place),
    move(Place),
    look.

is_open(X, Y) :-
    door(X, Y, open).
is_open(X, Y) :-
    door(Y, X, open).

is_closed(X, Y) :-
    door(X, Y, closed).
is_closed(X, Y) :-
    door(Y, X, closed).

can_go(Place) :-
    here(X),
    is_open(X, Place).
can_go(Place) :-
    here(X),
    is_closed(X, Place),
    write('Such door is closed.'), nl,
    fail.
can_go(_Place) :-
    write('You can''t get there from here.'), nl,
    fail.

move(Place) :-
    retract(here(_X)),
    asserta(here(Place)).

take(X) :-
    can_take(X),
    take_object(X).

can_take(X) :-
    here(Y),
    location(X, Y).
can_take(X) :-
    write('There is no '), write(X),
    write(' here'),
    nl, fail.

take_object(X) :-
    retract(location(X, _)),
    asserta(have(X)),
    write('taken'),
    nl.

drop(Thing) :-
    have(Thing),
    here(Location),
    retract(have(Thing)),
    asserta(location(Thing, Location)).

drop(Thing) :-
    write('You don''t have '), write(Thing),nl,fail.

inventory() :-
    write('You have:'),nl,
    have(Thing),
    tab(2), write(Thing),nl,
    fail.

turn_on(Thing) :-
    turned_off(Thing),
    retract(turned_off(Thing)),
    asserta(turned_on(Thing)),
    write(Thing), write(' is now on'), nl.

turn_on(Thing) :-
    write(Thing), write(' is not turned off!'), nl, fail.

turn_off(Thing) :-
    turned_on(Thing),
    retract(turned_on(Thing)),
    asserta(turned_off(Thing)),
    write(Thing), write(' is now off'), nl.

turn_off(Thing) :-
    write(Thing), write(' is not turned on!'), nl, fail.

open_door(Location) :-
    here(Here),
    door(Location, Here, Status),
    retract(door(Location, Here, Status)),
    asserta(door(Location, Here, open)),
    write('Door opened'), nl.
open_door(Location) :-
    here(Here),
    door(Here, Location, Status),
    retract(door(Here, Location, Status)),
    asserta(door(Here, Location, open)),
    write('Door opened'), nl.
open_door(_X, _Y) :-
    write('You are not seeing such door'),
    fail.

close_door(Location) :-
    here(Here),
    door(Location, Here, Status),
    retract(door(Location, Here, Status)),
    asserta(door(Location, Here, closed)),
    write('Door closed'), nl.
close_door(Location) :-
    here(Here),
    door(Here, Location, Status),
    retract(door(Here, Location, Status)),
    asserta(door(Here, Location, closed)),
    write('Door closed'), nl.
close_door(_X, _Y) :-
    write('You are not seeing such door'),
    fail.

is_contained_in(Thing, Place) :-
    location(Thing, Place).
is_contained_in(Thing, Place) :-
    location(OtherPlace, Place),
    is_contained_in(Thing, OtherPlace).
















