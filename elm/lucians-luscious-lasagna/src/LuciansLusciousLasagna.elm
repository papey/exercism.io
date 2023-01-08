module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)


expectedMinutesInOven =
    40


timePerLayer =
    2


preparationTimeInMinutes layers =
    timePerLayer * layers


elapsedTimeInMinutes layers timeInOven =
    preparationTimeInMinutes layers + timeInOven
