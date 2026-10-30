color(red).
color(green).
color(blue).

different(A, B) :-
    A \= B.

map_coloring(Colors) :-
    Colors = [wa-WA, nt-NT, sa-SA,
              q-Q, nsw-NSW, v-V, t-T],

    color(WA),
    color(NT),
    color(SA),
    color(Q),
    color(NSW),
    color(V),
    color(T),

    different(WA, NT),
    different(WA, SA),
    different(NT, SA),
    different(NT, Q),
    different(SA, Q),
    different(SA, NSW),
    different(SA, V),
    different(Q, NSW),
    different(NSW, V).
