faculty(shreya).
faculty(yuvi).
faculty(khushi).

subject(prolog).
subject(dsa).
subject(ai).

classroom(room101).
classroom(room102).
classroom(room103).

timetable(shreya, prolog, room101, monday).
timetable(yuvi, dsa, room102, tuesday).
timetable(khushi, ai, room103, wednesday).

faculty_subject(F, S) :-
    timetable(F, S, _, _).

subject_room(S, R) :-
    timetable(_, S, R, _).

faculty_day(F, D) :-
    timetable(F, _, _, D).
