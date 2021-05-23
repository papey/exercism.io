-module(space_age).

-export([age/2]).

to_years(Seconds) -> Seconds / 31557600.

age(Planet, Seconds) ->
    Ratios = #{earth => 1,
               mercury => 2.40846699999999996900e-1,
               jupiter => 1.18626149999999999096e+1,
               venus => 6.15197259999999968016e-1,
               saturn => 2.94474979999999995073e+1,
               mars => 1.88081579999999992658, uranus => 8.4016846e+1,
               neptune => 1.6479132e+2},
    to_years(Seconds) / maps:get(Planet, Ratios).
