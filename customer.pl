customer(tomas, boston, aaa).
customer(julio, nyc, bbb).

item(1, coke, 10).
item(2, rice, 5).

inventory(1, 30).
inventory(2, 14).

item_quantity(Name, Qtd) :-
    item(Num, Name, _),
    inventory(Num, Qtd).

inventory_report() :-
    item_quantity(Name, Qtd),
    write(Name), tab(2), write(Qtd), nl,
    fail.

inventory_report().

good_customer(C) :- customer(C, _, aaa).
