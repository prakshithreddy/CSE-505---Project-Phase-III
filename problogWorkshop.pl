%%%%Load data from the example input files below this(input1.pl,input2.pl,..)
person(rakshith).
person(dinesh).
person(proffodor).
person(prashanth).

attr(weather).
attr(timeofWorkshop).
attr(topic).
attr(host).
%%%%%%%%

series:- person(P),attends(P),sa(P).
0.501::sa(P):-person(P).
attends(P):- person(P),attr(A),at(P,A).
0.3::at(P,A):-person(P),attr(A).

query(series).
