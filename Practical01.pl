student(adi).
student(rohan).
student(sargam).
student(nikhil).

course(ai).
course(ml).
course(prolog).

enrolled(adi, ai).
enrolled(adi, prolog).
enrolled(rohan, ml).
enrolled(sargam, ai).
enrolled(nikhil, prolog).

teacher(rahul).
teacher(neha).

teaches(rahul, ai).
teaches(neha, prolog).

classmate(X, Y) :-
    enrolled(X, C),
    enrolled(Y, C),
    X \= Y.
