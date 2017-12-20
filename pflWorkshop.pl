%Workshop Attributes problem
:- use_module(library(pfl)).          %loading the PFL library
:- set_solver(lve).                   %lve - stands for lifted variable elimination by GC-FOVE. Many other techniques like ve,em, 
                                      %parfactors,logarithmic regression which are very useful exist as part of the Bayesian solvers of PFL.
:- yap_flag(unknown,fail).
:- set_pfl_flag(use_logarithms,false).%Some times, the probabilities being less than 1, may get rounded off to 0 because of floating point,
                                      %after geting multiplies so many times.So, we use logarithms to make sure, the value doesnot get rounded off to 0.


%%%%%Load Workshop Examples as input below.(input1,input2,..)
person(rakshith).
person(dinesh).
person(proffodor).
person(prashanth).

attr(weather).
attr(timeofW).
attr(topic).
attr(host).
%%%%%%Input ends here.

het series1,ch1(P);[1.0, 0.0, 0.0, 1.0];[person(P)].                        %series1 is the contribution factor from ch1, i.e, workshop becoming
                                                                            %becoming a series on its own.
deputy series,series1;[].                                                   %series is the deputy variable for series1.
bayes	ch1(P),attends(P),sa(P);[1.0,1.0,1.0,0.0,0.0,0.0,0.0,1.0];[person(P)].
bayes 	sa(P);[0.499,0.501];[person(P)].                                      
het		attends1(P),at(P,A);[1.0, 0.0, 0.0, 1.0];[person(P),attr(A)].          % attends1(P) is the contribution factor from preson P attending the
                                                                             %workshop because of attribute A.
deputy	attends(P),attends1(P);[person(P)].                                  %attends1 is deputy variable for attends 
bayes	at(P,A);[0.7,0.3];[person(P),attr(A)].












