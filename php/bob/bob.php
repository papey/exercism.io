<?php

class Bob
{
    function respondTo(string $input): string
    {
        $trimed = trim($input);

        if (empty($trimed)) {
            return "Fine. Be that way!";
        }

        $alpha = self::isAlpha($trimed);
        $shouting = self::isShouting($trimed);
        $question = self::isQuestion($trimed);

        if ($alpha && $shouting && $question) {
            return "Calm down, I know what I'm doing!";
        }

        if ($alpha && $shouting) {
            return "Whoa, chill out!";
        }

        if ($question) {
            return "Sure.";
        }

        return "Whatever.";
    }

    static function isAlpha(string $input): bool
    {
        return preg_match("/[a-zA-Z]/", $input) == 1;
    }

    static function isShouting(string $input): bool
    {
        return $input === strtoupper($input);
    }

    static function isQuestion(string $input): bool
    {
        return substr($input, -1) === "?";
    }
}
