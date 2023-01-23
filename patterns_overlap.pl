% -------------------------------------------------------------
%
% Pattern match all cases in the configured cases file.
% Check provided README.md for usage examples.
%
% Author: Aggelos Stamatiou, May 2017
%
% This source code is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This software is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this source code. If not, see <http://www.gnu.org/licenses/>.
% --------------------------------------------------------------------------

:- initialization(main).
:- ensure_loaded(test_cases).

% replace_star/2: replace * with up to 4 letters, using recursion.
replace_star([],[]).

replace_star([*|T],RList):-
	replace_star(T,RList).

replace_star([*|T],[_|RList]):-
	replace_star(T,RList).

replace_star([*|T],[_,_|RList]):-
	replace_star(T,RList).

replace_star([*|T],[_,_,_|RList]):-
	replace_star(T,RList).

replace_star([*|T],[_,_,_,_|RList]):-
	replace_star(T,RList).

replace_star([H|T],[H|RList]):-
	replace_star(T,RList).

% patterns/3: use replace_star to validate outputs for both inputs match,
% excluding empty solutions.
patterns(Pat1,Pat2,Title):-
	replace_star(Pat1,Title),
	replace_star(Pat2,Title),!.

% check_case/3: print provided patterns check outcome.
check_case(Index, Pat1, Pat2):-
    write("Case #"),
    write(Index),
    write(": "),
    (patterns(Pat1,Pat2,_) -> 
        write("TRUE");
        write("FALSE")),
    nl.
	
main:-
    % Execute the check for all cases in the .pl file
    forall(case(Index,Pat1,Pat2),check_case(Index,Pat1,Pat2)),
    halt.

main :-
    halt(1).
