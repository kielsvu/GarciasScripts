local Scripts = {
    [136599248168660] = "https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/BloxFruit.lua",
    [75992362647444] = "https://raw.githubusercontent.com/KielKeyHandler/Util/refs/heads/main/TapTapSimulator.Lua"
}

local url = Scripts[game.GameId]
if url then
    loadstring(game:HttpGet(url))()
end
