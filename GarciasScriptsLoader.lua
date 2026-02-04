if _G.GarciaLoader then return end
_G.GarciaLoader = true

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId

local GameScripts = {
    [136599248168660] = "https://raw.githubusercontent.com/KielKeyHandler/Util/refs/heads/main/SoloHunter.lua",
    [75992362647444]  = "https://raw.githubusercontent.com/KielKeyHandler/Util/refs/heads/main/TapTapSimulator.lua",
    [74260430392611]  = "https://raw.githubusercontent.com/KielKeyHandler/Util/refs/heads/main/RebirthChampionUlti.lua",
}

local function HttpGet(url)
    if game and game.HttpGet then
        return game:HttpGet(url)
    end
    if syn and syn.request then
        return syn.request({Url = url, Method = "GET"}).Body
    end
    if http_request then
        return http_request({Url = url, Method = "GET"}).Body
    end
    if request then
        return request({Url = url, Method = "GET"}).Body
    end
    error("HTTP not supported")
end

local url = GameScripts[PlaceId]

if not url then
    LocalPlayer:Kick("Garcia's Scripts\nGame Is Not Supported")
    return
end

loadstring(HttpGet(url))()
