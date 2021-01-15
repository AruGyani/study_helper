/* Instantiations */
#include 'header.pl'.
#include 'mentor-sort.pl'.

/* Time Urgency */
% past 3 weeks we assume an urgency of 2
time_urgency(X,2) :- coursework(_,X,Z), Z >= 21.
time_urgency(X,4) :- coursework(_,X,Z), Z >= 14, Z < 21.
time_urgency(X,6) :- coursework(_,X,Z), Z >= 7, Z < 14.
time_urgency(X,8) :- coursework(_,X,Z), Z >= 4, Z < 7.
time_urgency(X,10) :- coursework(_,X,Z), Z >= 0, Z < 4.

/* Grade Urgency */
grade_urgency(X,0) :- taking(_,X,Z), Z >= 93.
grade_urgency(X,3) :- taking(_,X,Z), Z >= 90, Z < 93.
grade_urgency(X,6) :- taking(_,X,Z), Z >= 85, Z < 90.
grade_urgency(X,9) :- taking(_,X,Z), Z >= 80, Z < 85.
grade_urgency(X,18) :- taking(_,X,Z), Z >= 75, Z < 80.
grade_urgency(X,27) :- taking(_,X,Z), Z >= 70, Z < 75.
grade_urgency(X,36) :- taking(_,X,Z), Z < 70.

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
% the functional difference doesnt really matter as long as assume this is study overall
e_urgency(X,20) :- midterm(X).
e_urgency(X,30) :- final(X).

/* Urgency Total */
% Assignment X from Class Z with Due Date A, has an Urgency Rating of Y
hasUrgency(X,Z,A,Y) :- time_urgency(X,B), a_urgency(X,C), taking(_,Z,_), grade_urgency(Z,D), coursework(Z,X,A), assignment(X), Y is B+C+D.
hasUrgency(X,Z,A,Y) :- time_urgency(X,B), e_urgency(X,C), taking(_,Z,_), grade_urgency(Z,D), coursework(Z,X,A), exam(X), Y is B+C+D.

/* Urgency List */
% X = Assignment Name
% Z = Class Name
% A = Due Date
% Y = Urgency Rating
urgencyList(L) :- findall([X,Z,A,Y], hasUrgency(X,Z,A,Y), L). 
mostUrgent(H) :- urgencyList(L), sort_by_index(L,3,[H|T]), write('[Assignment, Class, Days till Due, Urgency Score]').

/* Inferences Based on Assignments, Classes, and Grades */
% announcement of work due
% class X has something (Y) due
hasDue(X,Y) :- coursework(X,Y,_), write('You have assignment '), write(Y), 
write(' due for class '), write(X), write('.').
% Student S needs to do task X for class Y that they are failing.
needTask(S,X,Y) :- failing(S,Y), coursework(Y,X,_).
% Infers that you are a failing a class
failing(S,X) :- student(S), taking(S,X,_), grade_urgency(X,36).
% Student Grades
gradeList(L) :- findall(G,taking(S,X,G),L).
% Returns the sum and length of a list
sum_len_list([],0,0).
sum_len_list([H|T],Sum,Len) :- sum_len_list(T, R, L), Sum is H + R, Len is L + 1.
% Returns grade average
gradeAvg(A) :- gradeList(L), sum_len_list(L,S,Len), A is S/Len.
% Student Grade Average Association 
studentGradeAvg(S,A) :- student(S), gradeAvg(A).
% Students Performance for Semester
% Student is inherent to system
doingGreat(S) :- studentGradeAvg(S,A), A >= 90.
doingWell(S) :- studentGradeAvg(S,A), A >= 80.
doingFair(S) :- studentGradeAvg(S,A), A >= 70.
doingPoor(S) :- studentGradeAvg(S,A), A < 70.
% Student should see the counsler if their grade average is failing (doing poor)
seeCounselor(S) :- doingPoor(S).
% Should the student S drop the class X
% dropClass(S,X) :- seeCounselor(S), failing(S,X), not hasDue(X,Y).
