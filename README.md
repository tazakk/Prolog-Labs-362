# Prolog-Labs
Repository for my CS 362 Prolog labs.

# Lab 4
Lab required four predicates:
* `median(A,B,C,X)` which states that X is the median of A,B,C.
* `contains(L,X)` which states that the list L contains X.
* `largerEqual(L,X)` which states that X is larger than every element in the list L.
* `max(L,X)` which states that X is the maximum of the numbers in the list L. Must use previous predicates `contains` and `largerEqual`.

Source code can be found in `/Lab 4/lab4.pl`.

# Lab 5
This lab required us to solve the following riddle:\
You and three friends need to cross a bridge. It is dark out, therefore you must be carrying the light source to cross the bridge. However, the bridge is not very strong and won't allow for more than two people to cross at a time. This means that somebody will need to run the light source back across the bridge to allow more people to cross.\
Adam takes a minute to cross the bridge, Brianna takes two minutes, Charlotte takes 10 minutes, and you take 5 minutes. What is the quickest way to get everyone across the bridge safely?

I implemented the following predicates:
* `max(A,B,C)` which states that C is the max of A and B.
* `time(P,T)` which states that T is the amount of time taken for P to cross the bridge.
* `change(X,Y)` which states that the position X changes to position Y (cross or not crossed).
* `move(C1,S,C2)` which states that configuration C1 leads to C2 if the students S cross the bridge.
* `solution(C,L,T)` which states that applying the list of moves L to the configuration C leads to a solution in T minutes.
* `num(X)` which returns numbers 1 through infinity.
* `getSolutions(M,T)` which states that all moves M lead to a solution in T minutes.

To run the riddle and see the possible solutions, import the file and enter `getSolutions(Moves,Time).`\
Each solution will be printed individually, which includes the moves taken and the total time.

Source code can be found in `/Lab 5/lab5.pl`.

# Lab 6
TODO
