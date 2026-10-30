value(X, V) :-
    V is 49-(X-7)*(X-7).

accept(New, Old, T) :-
    value(New, V1),
    value(Old, V2),
    D is V1-V2,
    (D >= 0 ->
        true
    ;
        P is exp(D/T),
        random(R),
        R < P
    ).

anneal(0, _, X, X) :- !.

anneal(N, T, X, Best) :-
    random_between(-1, 1, Step),
    Candidate is max(0, min(10, X+Step)),
    (accept(Candidate, X, T) ->
        Next = Candidate
    ;
        Next = X
    ),
    value(Next, V1),
    value(Best, V2),
    (V1 > V2 -> Best1 = Next ; Best1 = Best),
    N1 is N-1,
    T1 is T*0.95,
    anneal(N1, T1, Next, Best1).

solve(Best, V) :-
    anneal(100, 10, 0, Best),
    value(Best, V).
