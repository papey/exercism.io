<?php

function from(DateTimeImmutable $inputDate) : DateTimeImmutable {
    return $inputDate->add(new DateInterval(sprintf('PT%dS', 1e9)));
}
