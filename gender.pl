% --- Gender Facts ---
female(pam).
female(liz).
female(ann).
female(pat).

male(tom).
male(bob).
male(jim).

% --- Parent Relations: parent(Parent, Child) ---
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% --- Rules ---

% Mother: X is female and parent of Y
mother(X, Y) :- female(X), parent(X, Y).

% Father: X is male and parent of Y
father(X, Y) :- male(X), parent(X, Y).

% Grandfather: X is male, parent of Z, and Z is parent of Y
grandfather(X, Y) :- male(X), parent(X, Z), parent(Z, Y).

% Grandmother: X is female, parent of Z, and Z is parent of Y
grandmother(X, Y) :- female(X), parent(X, Z), parent(Z, Y).

% Sister: X is female, shares a parent Z with Y, and X is not Y
sister(X, Y) :- female(X), parent(Z, X), parent(Z, Y), X \= Y.

% Brother: X is male, shares a parent Z with Y, and X is not Y
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y), X \= Y.