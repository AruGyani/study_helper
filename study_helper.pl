/* Instantiations */
% classes
class(intro_to_logic).
class(os_prog).
class(javaII).
class(texas_gov).

% class gives coursework due in x days
coursework(intro_to_logic,logic_quiz,5).
quiz(logic_quiz).
coursework(os_prog,os_final,15).
final(os_final).

/* Time Urgency */
% past 3 weeks we assume an urgency of 2
time_urgency(X,2) :- coursework(_,X,Z), Z >= 21.
time_urgency(X,4) :- coursework(_,X,Z), Z >= 14, Z < 21.
time_urgency(X,6) :- coursework(_,X,Z), Z >= 7, Z < 14.
time_urgency(X,12) :- coursework(_,X,Z), Z >= 4, Z < 7.
time_urgency(X,24) :- coursework(_,X_,Z), Z >= 0, Z < 4.

/* Assignments */
assignment(X) :- homework(X).
assignment(X) :- quiz(X).
assignment(X) :- project(X).

/* Assignment Urgency */
a_urgency(X,5) :- homework(X).
a_urgency(X,10) :- quiz(X).
a_urgency(X,15) :- project(X).

/* Exams */
exam(X) :- midterm(X).
exam(X) :- final(X).

/* Exam Urgency */
% this means to work on / study for
% actions can be different such as with quizzes (studying for or completing)
% the functional difference doesn't really matter as long as assume this is study overall
e_urgency(X,20) :- midterm(X).
e_urgency(X,30) :- final(X).

/* Urgency Total */
urgency(X,Y) :- time_urgency(X,B), a_urgency(X,D), assignment(X), Y is B+D.
urgency(X,Y) :- time_urgency(X,B), e_urgency(X,D), exam(X), Y is B+D.

/* Urgency List */
urgencyList(L) :- findall(Y, urgency(X,Y), L).
