edge(a, b, 1).
edge(a, c, 4).
edge(b, d, 2).
edge(c, d, 1).
edge(d, e, 3).
edge(b, e, 7).

heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 4).
heuristic(d, 2).
heuristic(e, 0).

astar(Start, Goal, Path, Cost) :-
    heuristic(Start, H),
    F is H,
    astar_search([F-(0-[Start])], Goal, [], Rev, Cost),
    reverse(Rev, Path).

astar_search(Open, Goal, Closed, Path, Cost) :-
    keysort(Open, [_-(G-[Goal|Rest])|_]),
    !,
    Path = [Goal|Rest],
    Cost = G.

astar_search(Open, Goal, Closed, Path, Cost) :-
    keysort(Open, [_-(G-[Node|Nodes])|Rest]),
    (member(Node, Closed) ->
        astar_search(Rest, Goal, Closed, Path, Cost)
    ;
        findall(FNew-(GNew-[Next,Node|Nodes]),
            (edge(Node, Next, Step),
             \+ member(Next, Closed),
             GNew is G+Step,
             heuristic(Next, H),
             FNew is GNew+H),
            Children),
        append(Rest, Children, NewOpen),
        astar_search(NewOpen, Goal, [Node|Closed], Path, Cost)
    ).
