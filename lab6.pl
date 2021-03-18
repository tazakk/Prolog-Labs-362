% Zachary Dehaan
% Lab 6 - CS 362
% Finding the minimum hitting set for a collection of sets.

% subseq(X, L) :- X is a subsequence of the list L.
% Copied from setPacking.pl
subseq([], []).
subseq(X, [_ | RestY]) :- subseq(X, RestY).
subseq([Item | RestX], [Item | RestY]) :- subseq(RestX, RestY).

% unionCollection(C, U) :- U is the union of the collection of sets C.
% Uses the built-in predicate union()
unionCollection([], []).
unionCollection([H|T], FullUnion) :-
    unionCollection(T, PartUnion),
    union(H, PartUnion, FullUnion).

% hits(C, L) :- Each set in the collection C contains an element from the list L.
% Uses the built-in predicate intersection()
hits([], _).
hits([H|T], X) :-
    intersection(H, X, Intersection),
    Intersection \= [],
    hits(T,X).

% minLen(C, S) :- S is the set with the minimum length in the collection C.
% Uses the built-in predicate length(), adapted from maxLen in setPacking.pl
minLen([S], S).
minLen([H|T], MT) :-
    minLen(T, MT),
    length(MT, LT),
    length(H, LH),
    LT =< LH.
minLen([H|T], H) :-
    minLen(T, MT),
    length(MT, LT),
    length(H, LH),
    LT > LH.

% hittingSet(C, L) :- L is a hitting set for the collection of sets C.
hittingSet(C, L) :-
    unionCollection(C, Union),
    subseq(L, Union),
    hits(C, L).

% minHittingSet(C, L) :- L is the minimum hitting set of the collection of sets C.
minHittingSet(C, L) :-
    findall(CP, hittingSet(C, CP), HS),
    minLen(HS, L).