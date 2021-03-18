% Zachary Dehaan
% CS 362 - Lab 7

% Adds each year as the first element
% of each sublist in X.
years([], []).
years([HY|TY],[HX|TX]) :-
    HX = [HY, _, _, _],
    years(TY, TX).

% Adds each claimed job as the second
% element of each sublist in X.
claimedJobs([], _).
claimedJobs([H|T], L) :-
    member([_, H, _, _], L),
    claimedJobs(T, L).

% Adds each region as the third element
% of each sublist in X.
regions([], _).
regions([H|T], L) :-
    member([_, _, H, _], L),
    regions(T, L).

% Adds each actual job as the fourth
% element of each sublist in X.
actualJobs([], _).
actualJobs([H|T], L) :-
    member([_, _, _, H], L),
    actualJobs(T, L).

% Hint 1:
%	Jean claims to have been a foreign
%	legionary in East Africa.
hint1(X) :-
    member([_, foreignLegionnaire, eastAfrica, _], X).

% Hint 2:
%	Three years after working as a mail
%	man, he worked as a server.
hint2(X) :-
    member([MailYear, _, _, mailMan], X),
    member([ServerYear, _, _, server], X),
    ServerYear is MailYear + 3.

% Hint 3:
%	He claims to have been in the Middle
%	East in 1976.
hint3(X) :-
    member([1976, _, middleEast, _], X).

% Hint 4:
%	During the time of his claim treasure
%	hunt, Jean actually worked as a hotel
%	page. Three years later, he claims to
%	have been in the Soviet Union.
hint4(X) :-
    member([HunterYear, treasureHunter, _, hotelPage], X),
    member([SovietYear, _, sovietUnion, _], X),
    SovietYear is HunterYear + 3.

% Hint 5:
%	In 1982, Jean worked as a taxi driver.
hint5(X) :-
    member([1982, _, _, taxiDriver], X).

% Hint 6:
%	During the time that Jean claimed to
%	work as a spy, he did not work as a
%	server.
hint6(X) :-
    member([SpyYear, spy, _, _], X),
    member([ServerYear, _, _, server], X),
    SpyYear \= ServerYear.

% Runs the puzzle to determine which year
% Jean claimed to have each job in which
% region of this world and what his actual
% job was.
% X is a list containing four sublists.
% Format:
% [year, claimed job, region, actual job]
puzzle(X) :-
    length(X, 4),
    years([1973,1976,1979,1982],X),
    claimedJobs([foreignLegionnaire, spy, bodyguard, treasureHunter], X),
    regions([middleEast, eastAfrica, sovietUnion, southAmerica], X),
    actualJobs([mailMan, hotelPage, server, taxiDriver], X),
    hint1(X),
    hint2(X),
    hint3(X),
    hint4(X),
    hint5(X),
    hint6(X).