local Scripts = {
    [136599248168660] = "https://raw.githubusercontent.com/KielKeyHandler/Util/refs/heads/main/SoloHunter.lua",
    [75992362647444] = "https://raw.githubusercontent.com/KielKeyHandler/Util/refs/heads/main/TapTapSimulator.lua",
}

local url = Scripts[game.GameId]
if url then
    loadstring(game:HttpGet(url))()
end
