% hanoi(Disks, Source, Target, Auxiliary)

% Base case: Moving 1 disk directly from Source to Target
hanoi(1, Source, Target, _) :-
    format('Move disk 1 from ~w to ~w~n', [Source, Target]).

% Recursive step:
% 1. Move N-1 disks from Source to Aux using Target
% 2. Move the Nth disk from Source to Target
% 3. Move N-1 disks from Aux to Target using Source
hanoi(N, Source, Target, Aux) :-
    N > 1,
    M is N - 1,
    hanoi(M, Source, Aux, Target),
    format('Move disk ~w from ~w to ~w~n', [N, Source, Target]),
    hanoi(M, Aux, Target, Source).