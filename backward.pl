% --- Rules (Goal-driven) ---
% Goal: X is green if X is a frog
color(green, X) :- is_a(frog, X).

% Sub-goal: X is a frog if X croaks and eats flies
is_a(frog, X) :- croaks(X), eats_flies(X).

% --- Base Facts ---
croaks(fritz).
eats_flies(fritz).