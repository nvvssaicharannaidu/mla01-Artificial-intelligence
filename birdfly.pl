% Fact database: Birds
bird(eagle).
bird(sparrow).
bird(pigeon).
bird(penguin).
bird(ostrich).

% Exception facts: Birds that cannot fly
cannot_fly(penguin).
cannot_fly(ostrich).

% Rule: An animal can fly if it IS a bird AND it CANNOT be proven that it cannot fly
can_fly(X) :-
    bird(X),
    \+ cannot_fly(X).