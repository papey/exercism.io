local house = {}

local pairs = {
    { "house", "Jack built." },
    { "malt", "lay in" },
    { "rat", "ate" },
    { "cat", "killed" },
    { "dog", "worried" },
    { "cow with the crumpled horn", "tossed" },
    { "maiden all forlorn", "milked" },
    { "man all tattered and torn", "kissed" },
    { "priest all shaven and shorn", "married" },
    { "rooster that crowed in the morn", "woke" },
    { "farmer sowing his corn", "kept" },
    { "horse and the hound and the horn", "belonged to" },
}

house.verse = function(which)
    local v = ""

    for i = which, 1, -1 do
        local noun, verb = unpack(pairs[i])
        local s = i == 1 and " " or "\n"
        v = v .. " the " .. noun .. s .. "that " .. verb
    end

    return "This is" .. v
end

house.recite = function()
    local song = {}

    for i = 1, #pairs do
        song[i] = house.verse(i)
    end

    return table.concat(song, "\n")

end

return house
