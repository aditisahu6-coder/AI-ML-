n_queens(N, Queens) :-
    length(Queens, N),
    maplist(between(1, N), Queens),
    safe_queens(Queens).

safe_queens([]).

safe_queens([Q|Rest]) :-
    safe_from(Q, Rest, 1),
    safe_queens(Rest).

safe_from(_, [], _).

safe_from(Q, [Q2|Rest], D) :-
    Q =\= Q2,
    abs(Q-Q2) =\= D,
    D1 is D+1,
    safe_from(Q, Rest, D1).

solve_queens(N, Solutions) :-
    findall(Q, n_queens(N, Q), Solutions).
