<?php

declare(strict_types=1);

const COLORS = array("black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white");

function colorCode(string $color): int
{
    return array_search($color, COLORS);
}
