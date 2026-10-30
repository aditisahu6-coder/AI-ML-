edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(e, g).
edge(f, g).

heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 4).
heuristic(d, 5).
heuristic(e, 3).
heuristic(f, 2).
heuristic(g, 0).

greedy(Start, Goal, Path) :-
    greedy_search([[Start]], Goal, Rev),
    reverse(Rev, Path).

greedy_search(Frontier, Goal, Path) :-
    select_best(Frontier, Best, Rest),
    Best = [Node|_],
    (Node = Goal ->
        Path = Best
    ;
        findall([Next|Best],
            (edge(Node, Next),
             \+ member(Next, Best)),
            Children),
        append(Rest, Children, NewFrontier),
        greedy_search(NewFrontier, Goal, Path)
    ).

select_best(Frontier, Best, Rest) :-
    findall(H-P,
        (member(P, Frontier),
         P = [N|_],
         heuristic(N, H)),
        Pairs),
    keysort(Pairs, [_-Best|_]),
    select(Best, Frontier, Rest).
