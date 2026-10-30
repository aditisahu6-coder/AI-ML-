value(X, V) :-
    V is 9-(X-3)*(X-3).

hill_climb(X, Best) :-
    value(X, V),
    findall(V1-N,
        ((N is X-1 ; N is X+1),
         N >= 0,
         N =< 6,
         value(N, V1),
         V1 > V),
        Candidates),
    (Candidates = [] ->
        Best = X
    ;
        keysort(Candidates, Sorted),
        last(Sorted, _-Next),
        hill_climb(Next, Best)
    ).

solve(Best, V) :-
    hill_climb(0, Best),
    value(Best, V).
