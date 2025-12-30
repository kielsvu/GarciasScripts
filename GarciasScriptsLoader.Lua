-- GAME PLACE LOAD MAP
local Games = {
    [7305309231] = "loadstring(game:HttpsGet("https://raw.githubusercontent.com/kielsvu/Scripts/refs/heads/main/TaxiBoss.Lua"))()",
    [15893203988] = "loadstring(game:HttpsGet("https://raw.githubusercontent.com/kielsvu/Scripts/refs/heads/main/TaxiBoss.Lua"))()",

    default = "https://raw.githubusercontent.com/kielsvu/Scripts/refs/heads/main/Main.lua"
}

-- GET CURRENT PLACE ID
local placeId = game.PlaceId

-- PICK URL (PLACE OR DEFAULT)
local scriptUrl = Games[placeId] or Games.default

-- LOAD FUNCTION
local function loadsrc(url)
    local source = game:HttpGet(url)
    local func = loadstring(source)
    return func()
end

-- EXECUTE
loadsrc(scriptUrl)
