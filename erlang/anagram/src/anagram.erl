-module(anagram).

-export([find_anagrams/2]).

find_anagrams(Subject, Candidates) ->
    Word = string:casefold(Subject),
    Letters = lists:sort(Word),
    lists:filter(fun(Candidate) -> string:casefold(Candidate) =/= Word andalso Letters == lists:sort(string:casefold(Candidate)) end, Candidates).
