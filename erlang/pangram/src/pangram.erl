-module(pangram).

-export([is_pangram/1]).

-define(ALPHABET, "abcdefghijklmnopqrstuvwxyz").

is_pangram(Sentence) ->
  Sanitized = string:lowercase(Sentence),
  length(?ALPHABET -- Sanitized) == 0.
