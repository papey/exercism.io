<?php



function toRna(string $dna): string
{
    return strtr($dna, "CGTA", "GCAU");
}
