student(junono).

% classes
class(intro_to_logic).
class(os_prog).
class(javaII).
class(texas_gov).

% taking
% student is taking class with grade g
taking(junono,intro_to_logic,95).
taking(junono,os_prog,85).
taking(junono,javaII,90).
taking(junono,texas_gov,75).

% class gives coursework due in x days
coursework(intro_to_logic,logic_quiz,5).
quiz(logic_quiz).
coursework(os_prog,os_final,15).
final(os_final).
coursework(javaII,objectHW,8).
homework(objectHW).
coursework(texas_gov,unit1,6).
quiz(unit1).
coursework(texas_gov,unit2,12).
quiz(unit2).
