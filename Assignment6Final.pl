%Makayla Zacarias
%Assignment 6

:- use_module(library(lambda)). %import library 
 
jump(S,2,E) :-
	member([S,E], [[1,4], [4,1]]).
jump(S,3,E) :-
	member([S,E], [[1,6], [6,1]]).
jump(S,4,E):-
	member([S,E], [[2,7], [7,2]]).
jump(S,5,E):-
	member([S,E], [[2,9], [9,2]]).
jump(S,5,E):-
	member([S,E], [[3,8], [8,3]]).
jump(S,6,E):-
	member([S,E], [[3,10], [10,3]]).
jump(S,5,E):-
	member([S,E], [[4,6], [6,4]]).
jump(S,7,E):-
	member([S,E], [[4,11], [11,4]]).
jump(S,8,E):-
	member([S,E], [[4,13], [13,4]]).
jump(S,8,E):-
	member([S,E], [[5,12], [12,5]]).
jump(S,9,E):-
	member([S,E], [[5,14], [14,5]]).
jump(S,9,E):-
	member([S,E], [[6,13], [13,6]]).
jump(S,10,E):-
	member([S,E], [[6,15], [15,6]]).
jump(S,8,E):-
	member([S,E], [[9,7], [7,9]]).
jump(S,9,E):-
	member([S,E], [[10,8], [8,10]]).
jump(S,12,E):-
	member([S,E], [[11,13], [13,11]]).
jump(S,13,E):-
	member([S,E], [[12,14], [14,12]]).
jump(S,14,E):-
	member([S,E], [[15,13], [13,15]]).  %allowed jumps, like Python code
 
 
pegJump :-
	pegJump(Jumps).
	 
 
pegJump(Jumps) :-

	play([1], [2,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Jumps), %peg 1 empty 
	writeln("Position 1 open Solution"),
	
	printBoard(Jumps, [1]),
	play([2], [1,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Jumps2), %peg 2 empty 
	writeln("Position 2 open Solution"),
	printBoard(Jumps2, [2]),
	
	play([3], [1,2,4,5,6,7,8,9,10,11,12,13,14,15], [], Jumps3), %peg 3 empty 
	writeln("Position 3 open Solution"),
	printBoard(Jumps3, [3]),
	
	play([4], [1,2,3,5,6,7,8,9,10,11,12,13,14,15], [], Jumps4), %peg 4 empty 
	writeln("Position 4 open Solution"),
	printBoard(Jumps4, [4]).
	
play(_, [_], Lst, Jumps) :-
	reverse(Lst, Jumps). %if empty
 
play(Empty, Full, Lst, Jumps) :-
	select(S, Full, Oc1),
	select(O, Oc1, Oc2),
	select(E, Empty, F1),
	jump(S, O, E),
	play([S, O | F1], [E | Oc2], [jump(S,O,E) | Lst], Jumps). 
 
 


printBoard(Sol) :-
	printBoard(Sol, [1]).
 
printBoard([], Empty) :-
	numlist(1,15, Lst),
	maplist(\X^I^(member(X, Empty) -> I = .; I = x),
		Lst,
		[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('    ~w        ~n', [I1]),
	format('   ~w ~w      ~n', [I2,I3]),
	format('  ~w ~w ~w    ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w  ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),  %Finished board with 1 peg left
	format('=============================== ~n').
 
printBoard([jump(Start, Middle, End) | Tail], Empty) :-
	numlist(1,15, Lst),
	maplist(\X^I^(member(X, Empty) -> I = .; I = x),
		Lst,
		[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('    ~w        ~n', [I1]),
	format('   ~w ~w      ~n', [I2,I3]),
	format('  ~w ~w ~w    ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w  ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),
	format('               ~n'),
	select(End, Empty, F1),
	printBoard(Tail,  [Start, Middle | F1]). %game in progress