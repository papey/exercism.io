-module(pangram).

-export([is_pangram/1]).

-define(ALPHABET, "abcdefghijklmnopqrstuvwxyz").

is_pangram(Sentence) ->
  [] == ?ALPHABET -- string:lowercase(Sentence).
