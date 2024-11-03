customer(tomas, boston, aaa).
customer(julio, nyc, bbb).

item(1, coke, 10).
item(2, rice, 5).

:- dynamic inventory/2.
inventory(1, 30).
inventory(2, 2).

item_quantity(Name, Qtd) :-
    item(Num, Name, _),
    inventory(Num, Qtd).

inventory_report() :-
    item_quantity(Name, Qtd),
    write(Name), tab(2), write(Qtd), nl,
    fail.

inventory_report().

good_customer(C) :- customer(C, _, aaa).

reorder(Item) :-
    item(Code, Item, Reorder),
    inventory(Code, InStock),
    Reorder >= InStock,
    write('Time to reorder').

valid_order(Customer, Item, Quantity) :-
    good_customer(Customer),
    item_quantity(Item, InStock),
    Quantity =< InStock.

update_inventory(Item, Quantity) :-
    item(Code, Item, _X),
    retract(inventory(Code, OldQ)),
    NewQ is OldQ + Quantity,
    asserta(inventory(Code, NewQ)).

order() :-
    write('Enter customer name: '), read(C),
    write('Enter item name: '), read(I),
    write('Enter quantity: '), read(Q),
    valid_order(C, I, Q),
    asserta(order(C, I, Q)),
    QuantityUpdate is -Q,
    update_inventory(Item, QuantityUpdate),
    write('Order placed.'), nl,
    check_reorder(Item).

check_reorder(Item) :-
    reorder(Item).
check_reorder(_X) :-
    true.
