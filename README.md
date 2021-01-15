
# Study Helper

**Team**: James Hooper (JAH171230),  Aru Gyani (AXG190108), Ivan Payne (IAP170000), Richard Gatchalian (RRG170002)

## Try it out.
Feel free to try it out! Running `study_helper.pl` in s(CASP) should allow you to run predicates such as `urgencyList(L).`, `gradeAvg(A).`, `gradeList(L).`, and more. 

## What inspired us.
Using [Blackboard Learn](https://www.blackboard.com/teaching-learning/learning-management/blackboard-learn), we all found one common issue. Blackboard offers a feature which displays the due date of any given assignment. While this alone is quite a useful feature to have, each class we take has its own set of assignments, quizzes, and exams we need to keep track of. **So**, we thought why not develop a tool to generate efficient study schedules for us based on all our assignments? Implementing common-sense reasoning and logical inferences into this tool resulted in a program that generates **urgency ratings** for each assignment based on due date, class grade, assignment type, etc. This allows a user to better conceptualize what assignments need to be done, and when.

## What you learned.
Using the *s(CASP)* system was relatively new to us. Through this experience, we learned more about how to employ *s(CASP)* and take advantage of the tools it provides us. 

Working in Prolog was a new experience for some of us. We learned better ways to implement syntax and how to employ Prolog in a useful manner.

## How you built your project.
The first step in building the project was figuring out a way to rank assignments for a schedule. To do this, we began with creating facts such as `class` and `coursework` to allow us to better handle our data. Next, we came up with factors that should contribute to the ranking system. From here, we built rules that factor time, grade, and assignment type into separate urgency calculations which then culminate in one final urgency rating for the assignment. 

## Challenges you faced.
Coming up with a feasible concept to create was the first challenge we experienced. From there, working with `lists` and `sublists` was one of our biggest challenges through this whole process. Along with this, coming up with logical inferences for the program to make proved quite difficult.




