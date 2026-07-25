% --- Facts Database: Fruit and Color ---
fruit_color(apple, red).
fruit_color(apple, green).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(grape, green).
fruit_color(mango, yellow).

% --- Rule: Print all fruits of a given color using Backtracking ---
find_fruits(Color) :-
    fruit_color(Fruit, Color),
    format('Fruit: ~w is ~w~n', [Fruit, Color]),
    fail. % Forces Prolog to fail on purpose and backtrack to find the next fruit!

% Base case to gracefully succeed after all matches are found
find_fruits(_).