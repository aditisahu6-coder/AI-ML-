marks(vibhu, 90).
marks(Zuri, 65).
marks(sarah, 35).
marks(dev, 82).
marks(kunal, 48).

performance(X, topper) :-
    marks(X, M),
    M >= 80.

performance(X, average) :-
    marks(X, M),
    M >= 40,
    M < 80.

performance(X, fail) :-
    marks(X, M),
    M < 40.
