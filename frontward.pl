% Allow facts to be added dynamically at runtime
:- dynamic fact/1.

% Initial facts (Knowledge Base)
fact(croaks).
fact(eats_flies).

% Production Rules
% Rule 1: If an animal croaks and eats flies, it is a frog.
rule :- 
    fact(croaks), 
    fact(eats_flies), 
    \+ fact(frog), 
    asserta(fact(frog)), 
    write('Inferred: frog'), nl.

% Rule 2: If an animal is a frog, it is green.
rule :- 
    fact(frog), 
    \+ fact(green), 
    asserta(fact(green)), 
    write('Inferred: green color'), nl.

% Forward Chaining Loop: Runs continuously until no new rules can trigger
forward :-
    rule,
    !,
    forward.
forward :-
    write('Forward chaining completed.'), nl.