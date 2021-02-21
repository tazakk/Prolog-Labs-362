% Zachary Dehaan
% CS 362 - Lab 5

% Returns the max of two numbers
max(A,B,A) :- A >= B.
max(A,B,B) :- A < B.

% Amount of time it takes for each person to cross the bridge
time(adam,1).			% adam = 1 minute
time(brianna,2).		% brianna = 2 minutes
time(me,5).				% me = 5 minutes
time(charlotte,10).		% charlotte = 10 minutes
time(nobody,0).			% nobody = 0 minutes (for travelling alone)
% Choose the max time between two people:
time([P1,P2],T) :- time(P1,T1), time(P2,T2), max(T1,T2,T).

% The different changes available
% nc = not crossed; c = crossed
change(nc,c).	% cross the bridge
change(c,nc).	% go back

% The different moves
% move(C1,S,C2) stating that configuration C1 leads to C2 if the S students cross the bridge
% Configuration: [Adam, Brianna, Me, Charlotte, the light]

% Adam and Brianna move
move([X,X,M,C,X],[adam,brianna],[Y,Y,M,C,Y]) :- change(X,Y).
% Adam and I move
move([X,B,X,C,X],[adam,me],[Y,B,Y,C,Y]) :- change(X,Y).
% Adam and Charlotte move
move([X,B,M,X,X],[adam,charlotte],[Y,B,M,Y,Y]) :- change(X,Y).
% Adam moves alone
move([X,B,M,C,X],[adam,nobody],[Y,B,M,C,Y]) :- change(X,Y).
% Brianna and I move
move([A,X,X,C,X],[brianna,me],[A,Y,Y,C,Y]) :- change(X,Y).
% Brianna and Charlotte move
move([A,X,M,X,X],[brianna,charlotte],[A,Y,M,Y,Y]) :- change(X,Y).
% Brianna moves alone
move([A,X,M,C,X],[brianna,nobody],[A,Y,M,C,Y]) :- change(X,Y).
% Charlotte and I move
move([A,B,X,X,X],[me,charlotte],[A,B,Y,Y,Y]) :- change(X,Y).
% I move alone
move([A,B,X,C,X],[me,nobody],[A,B,Y,C,Y]) :- change(X,Y).
% Charlotte moves alone
move([A,B,M,X,X],[charlotte,nobody],[A,B,M,Y,Y]) :- change(X,Y).

% Get the solution
% The goal is to have everyone crossed: [c,c,c,c,c]
% Starting from everyone not crossed: [nc,nc,nc,nc,nc]
solution([c,c,c,c,c], [], _).	% base case: once everyone has crossed the bridge
solution(CurrentCon, [Move|NextMove], Time) :-
    move(CurrentCon, Move, NextCon),
    time(Move, NewTime),
    FullTime is Time - NewTime,
    FullTime >= 0,
    solution(NextCon, NextMove, FullTime).

% Generates numbers
num(1).
num(X) :- num(Y), X is Y + 1.

% Gets all the solutions
getSolutions(Moves, T) :- 
    num(T),
    solution([nc,nc,nc,nc,nc], Moves, T).
