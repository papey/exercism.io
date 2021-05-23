-module(accumulate).

-export([accumulate/2]).

accumulate(Fn, Ls) -> accumulate(Fn, Ls, []).

accumulate(_Fn, [], Out) -> lists:reverse(Out);
accumulate(Fn, [Current | Rest], Out) ->
    accumulate(Fn, Rest, [Fn(Current) | Out]).
