-module(nucleotide_count).

-export([count/2, nucleotide_counts/1]).

-define(COUNTER, #{"A" => 0, "C" => 0, "G" => 0, "T" => 0}).

count(_, [Nucleotide]) when Nucleotide /= $A, Nucleotide /= $C, Nucleotide /= $G, Nucleotide /= $T -> error(badarg);
count(Strand, [Nucleotide]) -> count(Strand, Nucleotide, 0).

count([], _, Counter) -> Counter;
count([Nucleotide | _], _, _) when Nucleotide /= $A, Nucleotide /= $C, Nucleotide /= $G, Nucleotide /= $T -> error(badarg);
count([Nucleotide | Strand], Nucleotide, Counter) -> count(Strand, Nucleotide, Counter + 1);
count([_ | Strand], Nucleotide, Counter) -> count(Strand, Nucleotide, Counter).

nucleotide_counts(Strand) -> lists:sort(maps:to_list(frequencies(Strand))).

frequencies(Strand) -> frequencies(Strand, ?COUNTER).

frequencies([], Freqs) -> Freqs;
frequencies([Nucleotide | _], _) when Nucleotide /= $A, Nucleotide /= $C, Nucleotide /= $G, Nucleotide /= $T -> error(badarg);
frequencies([Nucleotide | Strand], Freqs) -> frequencies(Strand, maps:update_with([Nucleotide], fun(Count) -> Count + 1 end, 1, Freqs)).
