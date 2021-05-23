-module(collatz_conjecture).

-export([steps/1]).

steps(N) when N =< 0 -> erlang:error(badarg);
steps(N) -> steps(N, 0).

steps(1, Rounds) -> Rounds;
steps(N, Rounds) when N rem 2 == 0 ->
    steps(N div 2, Rounds + 1);
steps(N, Rounds) -> steps(3 * N + 1, Rounds + 1).
