
% EXPERIMENT 05: 8-PUZZLE USING GREEDY BEST FIRST SEARCH

% Goal State
goal_state([1,2,3,4,5,6,7,8,0]).

% Main Predicate
run_8puzzle :-
    writeln('8-PUZZLE USING GREEDY BEST FIRST SEARCH'),

    Initial = [1,2,3,4,0,6,7,5,8],
    goal_state(Goal),

    writeln('Initial Board:'),
    print_board(Initial),

    writeln('Goal Board:'),
    print_board(Goal),

    manhattan_distance(Initial, H0),

    solve_puzzle(
        [node(H0, Initial, [])],
        [],
        Goal,
        SolutionMoves,
        PathStates
    ),

    writeln('Solution Discovered!'),
    writeln('Moves:'),
    writeln(SolutionMoves),

    length(SolutionMoves, Steps),
    format('Total Moves: ~w~n', [Steps]),

    writeln('Solution Path:'),
    print_solution_path(PathStates),

    writeln('Goal Reached!').

% Base Case: Goal Reached
solve_puzzle(
    [node(_, Goal, RevMoves)|_],
    _,
    Goal,
    SolutionMoves,
    [Goal|[]]
) :-
    reverse(RevMoves, SolutionMoves).

% Failure Case
solve_puzzle([], _, _, _, _) :-
    fail.

% Recursive Search
solve_puzzle(
    [node(_, Current, Moves)|RestOpen],
    Closed,
    Goal,
    SolutionMoves,
    [Current|RestPath]
) :-
    \+ member(Current, Closed),

    findall(
        node(H, NextState, [Move|Moves]),
        (
            valid_move(Current, Move, NextState),
            \+ member(NextState, Closed),
            \+ member(node(_, NextState, _), RestOpen),
            manhattan_distance(NextState, H)
        ),
        Successors
    ),

    append(RestOpen, Successors, NewOpen),
    keysort_open(NewOpen, SortedOpen),

    solve_puzzle(
        SortedOpen,
        [Current|Closed],
        Goal,
        SolutionMoves,
        RestPath
    ).

% Sort OPEN List by Heuristic
keysort_open(List, Sorted) :-
    findall(H-node(H, S, M),
        member(node(H, S, M), List),
        Keyed),
    keysort(Keyed, SortedKeyed),
    remove_keys(SortedKeyed, Sorted).

remove_keys([], []).
remove_keys([_-Node|Rest], [Node|Nodes]) :-
    remove_keys(Rest, Nodes).

% Valid Moves
valid_move(State, up, Next) :-
    nth0(Idx, State, 0),
    Idx >= 3,
    SwapIdx is Idx - 3,
    swap(State, Idx, SwapIdx, Next).

valid_move(State, down, Next) :-
    nth0(Idx, State, 0),
    Idx =< 5,
    SwapIdx is Idx + 3,
    swap(State, Idx, SwapIdx, Next).

valid_move(State, left, Next) :-
    nth0(Idx, State, 0),
    Idx mod 3 > 0,
    SwapIdx is Idx - 1,
    swap(State, Idx, SwapIdx, Next).

valid_move(State, right, Next) :-
    nth0(Idx, State, 0),
    Idx mod 3 < 2,
    SwapIdx is Idx + 1,
    swap(State, Idx, SwapIdx, Next).

% Swap Elements
swap(List, I, J, Result) :-
    nth0(I, List, ValI),
    nth0(J, List, ValJ),
    replace_nth0(List, I, ValJ, Temp),
    replace_nth0(Temp, J, ValI, Result).

replace_nth0([_|T], 0, X, [X|T]) :- !.

replace_nth0([H|T], I, X, [H|R]) :-
    I > 0,
    I1 is I - 1,
    replace_nth0(T, I1, X, R).

% Manhattan Distance
manhattan_distance(State, TotalDist) :-
    findall(
        D,
        (
            nth0(Idx, State, Tile),
            Tile > 0,
            tile_distance(Tile, Idx, D)
        ),
        Distances
    ),
    sum_list(Distances, TotalDist).

tile_distance(Tile, CurrentIdx, Dist) :-
    GoalIdx is Tile - 1,

    CurrentRow is CurrentIdx // 3,
    CurrentCol is CurrentIdx mod 3,

    GoalRow is GoalIdx // 3,
    GoalCol is GoalIdx mod 3,

    Dist is abs(CurrentRow - GoalRow) +
            abs(CurrentCol - GoalCol).

% Print Board
print_board([A,B,C,D,E,F,G,H,I]) :-
    format('[ ~w ~w ~w ]~n', [A,B,C]),
    format('[ ~w ~w ~w ]~n', [D,E,F]),
    format('[ ~w ~w ~w ]~n~n', [G,H,I]).

% Print Solution Path
print_solution_path([]).

print_solution_path([State|Rest]) :-
    print_board(State),
    print_solution_path(Rest).
