-module(bob).

-export([response/1]).

response(Sentence) ->
    Trimed = string:trim(Sentence),
    case {is_shouting(Trimed), is_question(Trimed), Trimed}
        of
        {_, _, []} -> "Fine. Be that way!";
        {true, true, _} -> "Calm down, I know what I'm doing!";
        {true, false, _} -> "Whoa, chill out!";
        {false, true, _} -> "Sure.";
        {_, _, _} -> "Whatever."
    end.

is_question([]) -> false;
is_question(Sentence) -> lists:last(Sentence) =:= $?.

is_shouting([]) -> false;
is_shouting(Sentence) ->
    Letters = re:replace(Sentence,
                         "[^A-Za-z]",
                         "",
                         [global, {return, list}]),
    case Letters of
        [] -> false;
        _ -> Letters == string:to_upper(Letters)
    end.
