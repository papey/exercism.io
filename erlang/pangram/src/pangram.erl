-module(pangram).

-export([is_pangram/1]).

-define(Alphabet, "abcdefghijklmnopqrstuvwxyz").

is_pangram(Sentence) ->
  Sanitized = string:lowercase(Sentence),
  lists:all(fun(Letter) -> string:chr(Sanitized, Letter) =/= 0 end, ?Alphabet).
