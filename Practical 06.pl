edge(a, b).
edge(a, c).
edge(b, d).
edge(c, e).
edge(d, f).
edge(e, f).

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, Rev),
    reverse(Rev, Path).

bfs_queue([[Goal|T]|_], Goal, [Goal|T]) :- !.

bfs_queue([Path|Queue], Goal, Result) :-
    Path = [Node|_],
    findall([Next|Path],
        (connected(Node, Next),
         \+ member(Next, Path)),
        NewPaths),
    append(Queue, NewPaths, NewQueue),
    bfs_queue(NewQueue, Goal, Result).
