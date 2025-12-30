-- PREMIUM BADGE-STYLE KEY PANEL (FINAL FIXED + 12H CACHE + LOADER)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- ================= KEY CACHE =================
local CACHE_FOLDER = "Garcia'sScripts"
local CACHE_FILE = CACHE_FOLDER .. "/keycache.txt"
local KEY_EXPIRE = 43200 -- 12 hours

if makefolder and not isfolder(CACHE_FOLDER) then
    makefolder(CACHE_FOLDER)
end

local function saveKey(key)
    if writefile then
        writefile(CACHE_FILE, key .. "|" .. os.time())
    end
end

local function loadKey()
    if isfile and isfile(CACHE_FILE) then
        local data = readfile(CACHE_FILE)
        local key, time = data:match("(.+)|(%d+)")
        if key and time and os.time() - tonumber(time) < KEY_EXPIRE then
            return key
        end
    end
end
-- =================================================

-- ================= UI SETTINGS =================
local UI = {
    Width = 380,
    Height = 300,
    Corner = 20,
    MainColor = Color3.fromRGB(0,0,0),
    BorderColor = Color3.fromRGB(178,132,255),
    AccentColor = Color3.fromRGB(178,132,255),
    TextColor = Color3.fromRGB(240,240,240),
    ButtonColor = Color3.fromRGB(40,40,45),
    ButtonHover = Color3.fromRGB(65,65,75),
    Font = Enum.Font.SourceSansBold,
    LogoSize = UDim2.new(0,50,0,50),
    LinkButtonSize = UDim2.new(0,90,0,25)
}

local devKey = "GarciaTorres"
local devUserId = 2612722358

local links = {
    Primary = "https://kielkeyhandler.github.io/Keysystempanel/",
    Backup  = "https://linkvertise.com/2561546/GRwyYFdIbDsZ?o=sharing",
    Discord = "Discord server is not available yet"
}

local LOADER_URL = "https://raw.githubusercontent.com/kielsvu/GarciasScripts/refs/heads/main/GarciasScriptsLoader.Lua"
local submitDelay = 1

-- ================= CACHE CHECK =================
local cachedKey = loadKey()
if cachedKey then
    pcall(function()
        loadstring(game:HttpGet(LOADER_URL))()
    end)
    return
end
-- =================================================

local function Tween(obj, props, t)
    TweenService:Create(obj, TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), props):Play()
end

-- ================= UI BUILD =================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Panel = Instance.new("Frame")
Panel.Size = UDim2.new(0, UI.Width, 0, UI.Height)
Panel.Position = UDim2.new(0.5, -UI.Width/2, 0.5, -UI.Height/2)
Panel.BackgroundColor3 = UI.MainColor
Panel.BorderSizePixel = 0
Panel.Parent = ScreenGui
Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, UI.Corner)

local Stroke = Instance.new("UIStroke", Panel)
Stroke.Color = UI.BorderColor
Stroke.Thickness = 2

-- LOGO
local Logo = Instance.new("ImageLabel")
Logo.Size = UI.LogoSize
Logo.Position = UDim2.new(0, 12, 0, 12)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://105339144949124"
Logo.Parent = Panel
Instance.new("UICorner", Logo).CornerRadius = UDim.new(0,15)

-- TITLE
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 0, 30)
Title.Position = UDim2.new(0,70,0,22)
Title.BackgroundTransparency = 1
Title.Text = "Garcia's Scripts"
Title.Font = UI.Font
Title.TextSize = 20
Title.TextColor3 = UI.TextColor
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextStrokeTransparency = 1
Title.Parent = Panel

-- KEY BOX
local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0, UI.Width - 40, 0, 30)
KeyBox.Position = UDim2.new(0,20,0,90)
KeyBox.BackgroundColor3 = UI.ButtonColor
KeyBox.TextColor3 = UI.TextColor
KeyBox.PlaceholderText = "Enter your key..."
KeyBox.Font = UI.Font
KeyBox.TextSize = 16
KeyBox.ClearTextOnFocus = false
KeyBox.TextStrokeTransparency = 1
KeyBox.BorderSizePixel = 0
KeyBox.Parent = Panel
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0,15)

-- VERIFY BUTTON
local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0,120,0,30)
VerifyBtn.Position = UDim2.new(0.5,-60,0,130)
VerifyBtn.BackgroundColor3 = UI.ButtonColor
VerifyBtn.Text = "Verify"
VerifyBtn.Font = UI.Font
VerifyBtn.TextSize = 16
VerifyBtn.TextColor3 = UI.TextColor
VerifyBtn.TextStrokeTransparency = 1
VerifyBtn.BorderSizePixel = 0
VerifyBtn.Parent = Panel
Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0,15)
VerifyBtn.MouseEnter:Connect(function() Tween(VerifyBtn,{BackgroundColor3=UI.ButtonHover},0.2) end)
VerifyBtn.MouseLeave:Connect(function() Tween(VerifyBtn,{BackgroundColor3=UI.ButtonColor},0.2) end)

-- ACCENT LINE
local Line = Instance.new("Frame")
Line.Size = UDim2.new(0.9,0,0,3)
Line.Position = UDim2.new(0.05,0,0,175)
Line.BackgroundColor3 = UI.AccentColor
Line.BorderSizePixel = 0
Line.Parent = Panel
Instance.new("UICorner", Line).CornerRadius = UDim.new(0,2)

-- LINK BUTTONS
local spacing = 10
local btnY = 190
local total = UI.LinkButtonSize.X.Offset * 2 + spacing
local startX = (UI.Width - total) / 2

local function LinkButton(text, x, link)
    local b = Instance.new("TextButton")
    b.Size = UI.LinkButtonSize
    b.Position = UDim2.new(0,x,0,btnY)
    b.BackgroundColor3 = UI.ButtonColor
    b.Text = text
    b.Font = UI.Font
    b.TextSize = 14
    b.TextColor3 = UI.TextColor
    b.TextStrokeTransparency = 1
    b.BorderSizePixel = 0
    b.Parent = Panel
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,12)
    b.MouseEnter:Connect(function() Tween(b,{BackgroundColor3=UI.ButtonHover},0.2) end)
    b.MouseLeave:Connect(function() Tween(b,{BackgroundColor3=UI.ButtonColor},0.2) end)
    b.MouseButton1Click:Connect(function()
        if setclipboard then setclipboard(link) end
    end)
end

LinkButton("Primary Key", startX, links.Primary)
LinkButton("Backup Key", startX + UI.LinkButtonSize.X.Offset + spacing, links.Backup)

-- DISCORD BUTTON
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(0,160,0,25)
DiscordBtn.Position = UDim2.new(0.5,-80,0,230)
DiscordBtn.BackgroundColor3 = UI.ButtonColor
DiscordBtn.Text = "Discord"
DiscordBtn.Font = UI.Font
DiscordBtn.TextSize = 14
DiscordBtn.TextColor3 = UI.TextColor
DiscordBtn.TextStrokeTransparency = 1
DiscordBtn.BorderSizePixel = 0
DiscordBtn.Parent = Panel
Instance.new("UICorner", DiscordBtn).CornerRadius = UDim.new(0,12)
DiscordBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(links.Discord)
    end
end)

-- ================= KEY VALIDATION (FIXED) =================
VerifyBtn.MouseButton1Click:Connect(function()
    local key = KeyBox.Text:match("^%s*(.-)%s*$") -- trim spaces
    local valid = false

    local success, data = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/kielsvu/Utility/refs/heads/Lua/Utility/Major/Main.txt")
    end)

    if success and data then
        local keys = {}
        for k in data:gmatch("[^\r\n]+") do
            keys[k:match("^%s*(.-)%s*$")] = true
        end

        if key == devKey and LocalPlayer.UserId == devUserId then
            valid = true
        elseif keys[key] then
            valid = true
        end
    end

    if valid then
        saveKey(key)
        VerifyBtn.Text = "Access Granted"
        task.delay(0.5,function()
            loadstring(game:HttpGet(LOADER_URL))()
            ScreenGui:Destroy()
        end)
    else
        VerifyBtn.Text = "Invalid Key"
        task.delay(1,function()
            VerifyBtn.Text = "Verify"
        end)
    end
end)

-- ================= DRAG =================
local dragging, dragInput, mousePos, framePos
Panel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = Panel.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
Panel.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - mousePos
        Panel.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X,
                                   framePos.Y.Scale, framePos.Y.Offset + delta.Y)
    end
end)
