<?php

function isIsogram(String $sentence): bool
{
    $sanitized = str_replace(array("-", " "), "", mb_strtolower($sentence));
    $letters = [];

    foreach (mb_str_split($sanitized) as $letter) {
        if (in_array($letter, $letters)) {
            return false;
        }
        array_push($letters, $letter);
    }

    return true;
}
