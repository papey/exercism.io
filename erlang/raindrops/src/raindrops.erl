-module(raindrops).

-export([convert/1]).

convert(Number) ->
    Factors = [Value
               || {Key, Value}
                      <- [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}],
                  Number rem Key == 0],
    case Factors of
        [] -> integer_to_list(Number);
        Some -> lists:concat(Some)
    end.
