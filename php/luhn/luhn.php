<?php

function isValid(string $sequence = ""): bool
{
    $sanitized = preg_replace("/\s+/", "", $sequence);
    if (strlen($sanitized) <= 1) {
        return false;
    }

    preg_match("/\D/", $sanitized, $matches);
    if (count($matches) > 0) {
        return false;
    }

    $numbers = array_reverse(
        array_map(function ($number) {
            return intval($number);
        }, str_split($sanitized))
    );

    $res = 0;
    foreach ($numbers as $index => $number) {
        if (($index + 1) % 2 == 0) {
            $res += doubling($number);
            continue;
        }
        $res += $number;
    }

    return $res % 10 == 0;
}

function doubling(int $number): int
{
    $double = $number * 2;
    return $double < 9 ? $double : $double - 9;
}
