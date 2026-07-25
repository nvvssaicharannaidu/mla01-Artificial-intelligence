% State Representation: state(MonkeyPos, BoxPos, MonkeyOn, HasBanana)
% Actions: walk, push, climb, grasp

% 1. Grasp the banana (if on the box under the banana and doesn't have it yet)
move(state(middle, onbox, middle, hasnot), grasp, state(middle, onbox, middle, has)).

% 2. Climb onto the box (if monkey and box are at the same position on the floor)
move(state(P, onfloor, P, hasnot), climb, state(P, onbox, P, hasnot)).

% 3. Push the box from position P1 to position P2
move(state(P1, onfloor, P1, hasnot), push(P1, P2), state(P2, onfloor, P2, hasnot)).

% 4. Walk from position P1 to position P2
move(state(P1, onfloor, P2, hasnot), walk(P1, P2), state(P2, onfloor, P2, hasnot)).


% --- Goal Check & State Search ---

% Base Case: Goal reached when the monkey has the banana
canget(state(_, _, _, has)).

% Recursive Step: Find a move to reach the next state and try to get the banana
canget(State1) :-
    move(State1, _Action, State2),
    canget(State2).