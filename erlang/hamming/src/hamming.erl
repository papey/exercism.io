-module(hamming).

-export([distance/2]).

distance(S1, S2) when length(S1) =/= length(S2) ->
    {error,
     "left and right strands must be of equal "
     "length"};
distance(S1, S2) -> distance(S1, S2, 0).

distance([], [], Diff) -> Diff;
distance([H | R1], [H | R2], Diff) ->
    distance(R1, R2, Diff);
distance([_ | R1], [_ | R2], Diff) ->
    distance(R1, R2, Diff + 1).
