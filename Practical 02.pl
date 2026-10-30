arithmetic(A, B) :-
    Sum is A+B,
    Diff is A-B,
    Prod is A*B,
    Div is A/B,
    Mod is A mod B,
    write('Sum = '), writeln(Sum),
    write('Difference = '), writeln(Diff),
    write('Product = '), writeln(Prod),
    write('Division = '), writeln(Div),
    write('Modulus = '), writeln(Mod).

factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N-1,
    factorial(N1, F1),
    F is N*F1.

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :-
    N > 1,
    N1 is N-1,
    N2 is N-2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1+F2.

fib_series(N, L) :-
    findall(F,
        (between(0, N, I), fibonacci(I, F)),
        L).
