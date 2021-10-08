-module(queen_attack).

-export([can_attack/2]).

can_attack({QX, _WhiteQY}, {QX, _BlackQY}) -> true;
can_attack({_WhiteQX, QY}, {_BlackQX, QY}) -> true;
can_attack({WhiteQX, WhiteQY}, {BlackQX, BlackQY}) -> abs(WhiteQX - BlackQX) == abs(WhiteQY - BlackQY).
