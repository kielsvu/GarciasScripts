-- PREMIUM BADGE-STYLE KEY PANEL (LOGO ROUNDED + 12-HOUR KEYS)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- UI SETTINGS
local UI = {
    Width = 380,
    Height = 280,
    Corner = 20,
    MainColor = Color3.fromRGB(0,0,0), -- Vanta black
    BorderColor = Color3.fromRGB(178,132,255), -- purple pastel
    AccentColor = Color3.fromRGB(178,132,255),
    TextColor = Color3.fromRGB(240,240,240),
    ButtonColor = Color3.fromRGB(40,40,45),
    ButtonHover = Color3.fromRGB(65,65,75),
    Font = Enum.Font.SourceSansBold, -- LemonBold
    LogoSize = UDim2.new(0,50,0,50),
    LinkButtonSize = UDim2.new(0,90,0,25)
}

local devKey = "GarciaTorres"
local devUserId = 2612722358
local links = {
    Primary = "linkvertise.link",
    Backup = "lootlabs.link",
    Discord = "discord.link"
}
local submitDelay = 1
local usedKeys = {}

-- TWEEN FUNCTION
local function Tween(obj, props, t)
    TweenService:Create(obj, TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), props):Play()
end

-- SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- PANEL
local Panel = Instance.new("Frame")
Panel.Size = UDim2.new(0, UI.Width, 0, UI.Height)
Panel.Position = UDim2.new(0.5, -UI.Width/2, 0.5, -UI.Height/2)
Panel.BackgroundColor3 = UI.MainColor
Panel.BorderSizePixel = 0
Panel.Parent = ScreenGui
Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, UI.Corner)
local PanelStroke = Instance.new("UIStroke", Panel)
PanelStroke.Color = UI.BorderColor
PanelStroke.Thickness = 2

-- LOGO INSIDE PANEL (LEFT) WITH ROUND CORNERS
local Logo = Instance.new("ImageLabel")
Logo.Size = UI.LogoSize
Logo.Position = UDim2.new(0, 10, 0, 10)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://105339144949124" -- your decal ID
Logo.Parent = Panel
local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0,15) -- rounded corners
LogoCorner.Parent = Logo

-- TITLE NEXT TO LOGO
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 0, 30)
Title.Position = UDim2.new(0,70,0,20)
Title.BackgroundTransparency = 1
Title.Text = "Garcia's Scripts"
Title.Font = UI.Font
Title.TextSize = 20
Title.TextColor3 = UI.TextColor
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextStrokeTransparency = 1
Title.TextScaled = false
Title.Parent = Panel

-- KEYBOX
local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0, UI.Width - 40, 0, 30)
KeyBox.Position = UDim2.new(0,20,0,80)
KeyBox.BackgroundColor3 = UI.ButtonColor
KeyBox.TextColor3 = UI.TextColor
KeyBox.PlaceholderText = "Enter your key..."
KeyBox.Font = UI.Font
KeyBox.TextSize = 16
KeyBox.ClearTextOnFocus = false
KeyBox.Text = ""
KeyBox.TextStrokeTransparency = 1
KeyBox.Parent = Panel
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0,15)

-- VERIFY BUTTON
local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0,120,0,30)
VerifyBtn.Position = UDim2.new(0.5, -60, 0, 120)
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
local GoldLine = Instance.new("Frame")
GoldLine.Size = UDim2.new(0.9,0,0,3)
GoldLine.Position = UDim2.new(0.05,0,0, VerifyBtn.Position.Y.Offset + VerifyBtn.Size.Y.Offset + 10)
GoldLine.BackgroundColor3 = UI.AccentColor
GoldLine.BorderSizePixel = 0
GoldLine.Parent = Panel
Instance.new("UICorner", GoldLine).CornerRadius = UDim.new(0,2)

-- LINK BUTTONS
local spacingX = 10
local btnY = GoldLine.Position.Y.Offset + GoldLine.Size.Y.Offset + 10
local numButtons = 2
local totalWidth = numButtons * UI.LinkButtonSize.X.Offset + (numButtons-1)*spacingX
local startX = (UI.Width - totalWidth)/2

local function CreateLinkBtn(name,x,y,link)
    local btn = Instance.new("TextButton")
    btn.Size = UI.LinkButtonSize
    btn.Position = UDim2.new(0,x,0,y)
    btn.BackgroundColor3 = UI.ButtonColor
    btn.Text = name
    btn.Font = UI.Font
    btn.TextSize = 14
    btn.TextColor3 = UI.TextColor
    btn.TextStrokeTransparency = 1
    btn.BorderSizePixel = 0
    btn.Parent = Panel
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,12)
    btn.MouseEnter:Connect(function() Tween(btn,{BackgroundColor3=UI.ButtonHover},0.2) end)
    btn.MouseLeave:Connect(function() Tween(btn,{BackgroundColor3=UI.ButtonColor},0.2) end)
    btn.MouseButton1Click:Connect(function() if setclipboard then setclipboard(link) end end)
end

CreateLinkBtn("Primary Key", startX, btnY, links.Primary)
CreateLinkBtn("Backup Key", startX + UI.LinkButtonSize.X.Offset + spacingX, btnY, links.Backup)

-- DISCORD BUTTON
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(0,90,0,25)
DiscordBtn.Position = UDim2.new(0.5,-45,0, btnY + 40)
DiscordBtn.BackgroundColor3 = UI.ButtonColor
DiscordBtn.Text = "Discord"
DiscordBtn.Font = UI.Font
DiscordBtn.TextSize = 14
DiscordBtn.TextColor3 = UI.TextColor
DiscordBtn.TextStrokeTransparency = 1
DiscordBtn.BorderSizePixel = 0
DiscordBtn.Parent = Panel
Instance.new("UICorner", DiscordBtn).CornerRadius = UDim.new(0,12)
DiscordBtn.MouseEnter:Connect(function() Tween(DiscordBtn,{BackgroundColor3=UI.ButtonHover},0.2) end)
DiscordBtn.MouseLeave:Connect(function() Tween(DiscordBtn,{BackgroundColor3=UI.ButtonColor},0.2) end)
DiscordBtn.MouseButton1Click:Connect(function() if setclipboard then setclipboard(links.Discord) end end)

-- KEY VALIDATION (12-HOUR EXPIRATION)
VerifyBtn.MouseButton1Click:Connect(function()
    local key = KeyBox.Text
    local currentTime = os.time()
    local success, data = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/kielsvu/Utility/refs/heads/Lua/Utility/Major/Main.txt")
    end)

    local valid = false
    if success and data then
        local keys = {}
        for k in data:gmatch("%S+") do keys[k] = true end

        if key == devKey and LocalPlayer.UserId == devUserId then
            valid = true
        elseif keys[key] then
            local lastUsed = usedKeys[key]
            if not lastUsed or currentTime - lastUsed > 43200 then -- 12 hours
                valid = true
                usedKeys[key] = currentTime
            end
        end
    end

    if valid then
        VerifyBtn.Text = "Access Granted"
        -- loadstring(game:HttpGet("YOUR_SCRIPT_LINK"))() -- replace with your script
        task.delay(submitDelay,function() ScreenGui:Destroy() end)
    else
        VerifyBtn.Text = "Invalid/Expired Key"
        task.delay(submitDelay,function()
            VerifyBtn.Text = "Verify"
        end)
    end
end)

-- DRAGGING
local dragging, dragInput, mousePos, framePos = false,nil,nil,nil
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
