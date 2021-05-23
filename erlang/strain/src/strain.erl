-module(strain).

-export([discard/2, keep/2]).

keep(Fn, List) -> strain(Fn, List, [], keep).

discard(Fn, List) -> strain(Fn, List, [], disc).

strain(_Fn, [], Acc, _Kind) -> Acc;
strain(Fn, [Head | Tail], Acc, Kind) ->
    case {Kind, Fn(Head)} of
        {keep, true} -> strain(Fn, Tail, Acc ++ [Head], Kind);
        {disc, false} -> strain(Fn, Tail, Acc ++ [Head], Kind);
        _ -> strain(Fn, Tail, Acc, Kind)
    end.
