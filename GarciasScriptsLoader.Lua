local Games = {
    [7305309231] = "loadstring(game:HttpsGet("https://raw.githubusercontent.com/kielsvu/Scripts/refs/heads/main/TaxiBoss.Lua"))()",
}

local id = game.PlaceId
local url = Games[id] or Games["default"]

local function loadsrc(l)
    local s = game:HttpGet(l)
    local f = loadstring(s)
    return f()
end

loadsrc(url)
