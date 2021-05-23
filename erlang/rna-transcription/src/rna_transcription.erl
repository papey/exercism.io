-module(rna_transcription).

-export([to_rna/1]).

to_rna(Strand) when is_list(Strand) ->
    lists:map(fun to_rna/1, Strand);
to_rna($C) -> $G;
to_rna($G) -> $C;
to_rna($T) -> $A;
to_rna($A) -> $U.
