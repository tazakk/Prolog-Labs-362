% Lab 4 - CS 362
% Zachary Dehaan

% Predicate stating that X is the median of A, B, and C.
median(A,B,C,X) :- X=A, B>=A, A>=C.
median(A,B,C,X) :- X=A, C>=A, A>=B.
median(A,B,C,X) :- X=B, A>=B, B>=C.
median(A,B,C,X) :- X=B, C>=B, B>=A.
median(A,B,C,X) :- X=C, A>=C, C>=B.
median(A,B,C,X) :- X=C, B>=C, C>=A.

% Predicate stating that the list contains the element X.
contains([H|T],X) :- H=X; contains(T,X).

% Predicate stating that X is larger than or equal to every element in the list.
largerEqual([],_X).   
largerEqual([H|T],X) :- X>=H, largerEqual(T,X).

% Predicate stating that X is the maximum element in the list.
max(L,X) :- contains(L,X), largerEqual(L,X).
