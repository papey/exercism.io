-module(isbn_verifier).

-export([is_valid/1]).


is_valid(Isbn) ->
    SanitizedIsbn = re:replace(Isbn, "-", "", [global, {return,list}]),
    valid_format(SanitizedIsbn) andalso valid_checksum(SanitizedIsbn).

valid_format(Isbn) -> nomatch =/= re:run(Isbn, "^[0-9]{9}[0-9X]$").

valid_checksum(Isbn) -> isbn_checksum(Isbn) rem 11 == 0.

isbn_checksum(Isbn) -> isbn_checksum(Isbn, 10, 0).

isbn_checksum([], _, Result) -> Result;
isbn_checksum([H | T], Length, Result) -> isbn_checksum(T, Length - 1, Result + Length * to_integer(H)).

to_integer($X) -> 10;
to_integer(N) ->
    {Digit, _} = string:to_integer([N]),
    Digit.
