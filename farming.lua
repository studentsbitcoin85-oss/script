--[[
    ╔══════════════════════════════════════╗
    ║      SYAZWI HUB l PRIVITE            ║
    ║      Key System + Rebirth Routine    ║
    ║      Auto Rebirth (Fast Check)       ║
    ║      Version: 25.0                   ║
    ╚══════════════════════════════════════╝
--]]

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ============================================================
--  KEY SYSTEM
-- ============================================================
local VALID_KEY = "SYAZWIONTOP"

local function showKeyGui()
    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Name = "SYAZWIKeySystem"
    KeyGui.ResetOnSpawn = false
    KeyGui.DisplayOrder = 9999999
    KeyGui.Parent = PlayerGui

    local Blur = Instance.new("Frame")
    Blur.Size = UDim2.new(1, 0, 1, 0)
    Blur.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Blur.BackgroundTransparency = 0.5
    Blur.BorderSizePixel = 0
    Blur.Parent = KeyGui

    local Panel = Instance.new("Frame")
    Panel.Size = UDim2.new(0, 400, 0, 250)
    Panel.Position = UDim2.new(0.5, -200, 0.5, -125)
    Panel.BackgroundColor3 = Color3.fromRGB(18, 24, 38)
    Panel.BorderSizePixel = 0
    Panel.Parent = KeyGui
    Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, 10)
    local ps = Instance.new("UIStroke", Panel)
    ps.Color = Color3.fromRGB(60, 120, 220)
    ps.Thickness = 2

    local TB = Instance.new("Frame")
    TB.Size = UDim2.new(1, 0, 0, 45)
    TB.BackgroundColor3 = Color3.fromRGB(26, 34, 52)
    TB.BorderSizePixel = 0
    TB.Parent = Panel
    Instance.new("UICorner", TB).CornerRadius = UDim.new(0, 10)
    local fix = Instance.new("Frame")
    fix.Size = UDim2.new(1, 0, 0, 12)
    fix.Position = UDim2.new(0, 0, 1, -12)
    fix.BackgroundColor3 = Color3.fromRGB(26, 34, 52)
    fix.BorderSizePixel = 0
    fix.Parent = TB

    local Crown = Instance.new("TextLabel")
    Crown.Size = UDim2.new(0, 30, 1, 0)
    Crown.Position = UDim2.new(0, 12, 0, 0)
    Crown.BackgroundTransparency = 1
    Crown.Text = "👑"
    Crown.TextSize = 22
    Crown.Font = Enum.Font.SourceSansBold
    Crown.TextColor3 = Color3.fromRGB(255, 215, 0)
    Crown.Parent = TB

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -60, 1, 0)
    Title.Position = UDim2.new(0, 50, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "SYAZWI HUB l PRIVITE"
    Title.TextColor3 = Color3.fromRGB(230, 235, 245)
    Title.TextSize = 16
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TB

    local Sub = Instance.new("TextLabel")
    Sub.Size = UDim2.new(1, -40, 0, 25)
    Sub.Position = UDim2.new(0, 20, 0, 60)
    Sub.BackgroundTransparency = 1
    Sub.Text = "🔒 Enter Key to Continue"
    Sub.TextColor3 = Color3.fromRGB(150, 165, 190)
    Sub.TextSize = 14
    Sub.Font = Enum.Font.Gotham
    Sub.Parent = Panel

    local Input = Instance.new("TextBox")
    Input.Size = UDim2.new(1, -60, 0, 45)
    Input.Position = UDim2.new(0, 30, 0, 100)
    Input.BackgroundColor3 = Color3.fromRGB(32, 42, 62)
    Input.BorderSizePixel = 0
    Input.Text = ""
    Input.PlaceholderText = "Enter Key..."
    Input.PlaceholderColor3 = Color3.fromRGB(150, 165, 190)
    Input.TextColor3 = Color3.fromRGB(230, 235, 245)
    Input.TextSize = 16
    Input.Font = Enum.Font.Gotham
    Input.ClearTextOnFocus = false
    Input.Parent = Panel
    Instance.new("UICorner", Input).CornerRadius = UDim.new(0, 8)
    local is = Instance.new("UIStroke", Input)
    is.Color = Color3.fromRGB(60, 120, 220)
    is.Thickness = 1.5

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -60, 0, 45)
    Btn.Position = UDim2.new(0, 30, 0, 165)
    Btn.BackgroundColor3 = Color3.fromRGB(60, 120, 220)
    Btn.BorderSizePixel = 0
    Btn.Text = "🔓 Unlock Script"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 16
    Btn.Font = Enum.Font.GothamBold
    Btn.AutoButtonColor = false
    Btn.Parent = Panel
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

    local SL = Instance.new("TextLabel")
    SL.Size = UDim2.new(1, -40, 0, 20)
    SL.Position = UDim2.new(0, 20, 0, 218)
    SL.BackgroundTransparency = 1
    SL.Text = ""
    SL.TextColor3 = Color3.fromRGB(220, 70, 70)
    SL.TextSize = 13
    SL.Font = Enum.Font.Gotham
    SL.Parent = Panel

    local unlocked = false

    local function tryUnlock()
        if unlocked then return end
        if Input.Text == VALID_KEY then
            unlocked = true
            SL.Text = "✅ Key Valid! Loading..."
            SL.TextColor3 = Color3.fromRGB(80, 200, 120)
            Btn.Text = "✅ Success!"
            Btn.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
            task.wait(0.8)
            KeyGui:Destroy()
            loadMainScript()
        else
            SL.Text = "❌ Invalid Key! Try again."
            local orig = Panel.Position
            for i = 1, 3 do
                Panel.Position = orig + UDim2.new(0, 10, 0, 0)
                task.wait(0.05)
                Panel.Position = orig - UDim2.new(0, 10, 0, 0)
                task.wait(0.05)
            end
            Panel.Position = orig
        end
    end

    Btn.MouseButton1Click:Connect(tryUnlock)
    Input.FocusLost:Connect(tryUnlock)
end

-- ============================================================
--  MAIN SCRIPT
-- ============================================================
function loadMainScript()
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lkjhg969/ffdsf/refs/heads/main/hgfhj", true))()

    local window = library:AddWindow("SYAZWI HUB l PRIVITE", {
        main_color = Color3.fromRGB(20, 40, 100),
        min_size = Vector2.new(600, 630),
        can_resize = false,
    })

    -- MINIMIZE ICON
    local FloatGui = Instance.new("ScreenGui")
    FloatGui.Name = "SYAZWIFloatIcon"
    FloatGui.ResetOnSpawn = false
    FloatGui.DisplayOrder = 999999
    FloatGui.Parent = PlayerGui

    local FloatBtn = Instance.new("TextButton")
    FloatBtn.Size = UDim2.new(0, 50, 0, 50)
    FloatBtn.Position = UDim2.new(0, 14, 0.5, -25)
    FloatBtn.BackgroundColor3 = Color3.fromRGB(20, 40, 100)
    FloatBtn.Text = "👑"
    FloatBtn.TextSize = 26
    FloatBtn.Font = Enum.Font.SourceSansBold
    FloatBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
    FloatBtn.AutoButtonColor = false
    FloatBtn.Draggable = true
    FloatBtn.Visible = false
    FloatBtn.Parent = FloatGui
    Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)

    local mainWindow = nil

    task.spawn(function()
        task.wait(2)
        local imgui = CoreGui:FindFirstChild("imgui")
        if not imgui then return end
        local windows = imgui:FindFirstChild("Windows")
        if not windows then return end
        for _, win in pairs(windows:GetChildren()) do
            local bar = win:FindFirstChild("Bar")
            if bar then
                mainWindow = win
                for _, obj in pairs(bar:GetDescendants()) do
                    if obj:IsA("ImageButton") then obj.Visible = false end
                end
                local old = bar:FindFirstChild("SYAZWIToggle")
                if old then old:Destroy() end
                local emoji = Instance.new("TextButton")
                emoji.Name = "SYAZWIToggle"
                emoji.Size = UDim2.new(0, 28, 0, 28)
                emoji.Position = UDim2.new(0, 8, 0.5, -14)
                emoji.BackgroundTransparency = 1
                emoji.Font = Enum.Font.SourceSansBold
                emoji.TextSize = 22
                emoji.TextColor3 = Color3.fromRGB(255, 215, 0)
                emoji.Text = "👑"
                emoji.ZIndex = 999
                emoji.AutoButtonColor = false
                emoji.Parent = bar
                emoji.MouseButton1Click:Connect(function()
                    if mainWindow then
                        mainWindow.Visible = false
                        FloatBtn.Visible = true
                    end
                end)
                break
            end
        end
    end)

    FloatBtn.MouseButton1Click:Connect(function()
        if mainWindow then
            mainWindow.Visible = true
            FloatBtn.Visible = false
        end
    end)

    -- HELPERS
    local function getStat(player, statName)
        if not player then return 0 end
        local s = player:FindFirstChild(statName)
        if s and s:IsA("ValueBase") then return s.Value end
        local ls = player:FindFirstChild("leaderstats")
        if ls then
            local s2 = ls:FindFirstChild(statName)
            if s2 and s2:IsA("ValueBase") then return s2.Value end
        end
        return 0
    end

    local function formatNumber(n)
        n = tonumber(n) or 0
        if n >= 1e15 then return string.format("%.2fQa", n/1e15)
        elseif n >= 1e12 then return string.format("%.2fT", n/1e12)
        elseif n >= 1e9 then return string.format("%.2fB", n/1e9)
        elseif n >= 1e6 then return string.format("%.2fM", n/1e6)
        elseif n >= 1e3 then return string.format("%.2fK", n/1e3)
        else return tostring(math.floor(n)) end
    end

    local function doRebirth()
        local remote = ReplicatedStorage:FindFirstChild("rEvents")
        if not remote then return false end
        remote = remote:FindFirstChild("rebirthRemote")
        if not remote then return false end
        return pcall(function() remote:InvokeServer("rebirthRequest") end)
    end

    local function isAlive(player)
        if not player then return false end
        local char = player.Character
        if not char then return false end
        local hum = char:FindFirstChildWhichIsA("Humanoid")
        if not hum then return false end
        return hum.Health > 0
    end

    -- TELEPORT HELPER
    local function findIslandPosition(keywords)
        for _, obj in pairs(workspace:GetDescendants()) do
            local objName = string.lower(obj.Name)
            for _, kw in pairs(keywords) do
                if string.find(objName, string.lower(kw), 1, true) then
                    if not obj:IsDescendantOf(LocalPlayer) then
                        local pos = nil
                        if obj:IsA("BasePart") then pos = obj.Position
                        elseif obj:IsA("Model") then
                            local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                            pos = primary and primary.Position or nil
                        end
                        if pos then return pos, obj.Name end
                    end
                end
            end
        end
        return nil, nil
    end

    local function doTeleport(keywordList, displayName)
        task.spawn(function()
            local pos = findIslandPosition(keywordList)
            if pos then
                local char = LocalPlayer.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 5, 0))
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "📍 Teleported", Text = displayName, Duration = 3
                        })
                    end
                end
            else
                game.StarterGui:SetCore("SendNotification", {
                    Title = "❌ Not Found", Text = displayName, Duration = 4
                })
            end
        end)
    end

    -- ============================================================
    --  TAB 1: FAST STRENGTH
    -- ============================================================
    local StrengthTab = window:AddTab("Fast Strength")
    StrengthTab:Show()

    StrengthTab:AddLabel("💪 Fast Rep").TextSize = 22

    local repCount = 0
    local statusLabel = StrengthTab:AddLabel("Status: OFF | Rep: 0")
    statusLabel.TextSize = 16
    statusLabel.TextColor3 = Color3.fromRGB(150, 165, 190)

    local modeLabel = StrengthTab:AddLabel("Mode: -")
    modeLabel.TextSize = 14
    modeLabel.TextColor3 = Color3.fromRGB(100, 200, 255)

    local fastRepOn = false
    local repSpeed = 50

    StrengthTab:AddSwitch("Fast Rep (Auto Train)", function(state)
        fastRepOn = state
        if state then
            statusLabel.Text = "Status: ON | Rep: " .. tostring(repCount)
            statusLabel.TextColor3 = Color3.fromRGB(80, 200, 120)
        else
            statusLabel.Text = "Status: OFF | Rep: " .. tostring(repCount)
            statusLabel.TextColor3 = Color3.fromRGB(150, 165, 190)
        end
    end)

    StrengthTab:AddTextBox("Rep Speed (20-140)", function(text)
        local num = tonumber(text)
        if num and num >= 20 and num <= 140 then repSpeed = num end
    end, {placeholder = "Contoh: 50"})

    local function getRepDelay()
        local ms = 200 - ((repSpeed - 20) / 120) * 198
        return math.max(2, ms) / 1000
    end

    local function hasToolEquipped()
        local char = LocalPlayer.Character
        if char then
            for _, t in pairs(char:GetChildren()) do
                if t:IsA("Tool") then return true, t.Name end
            end
        end
        return false, nil
    end

    local function nearGymMachine()
        local char = LocalPlayer.Character
        if not char then return false end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return false end
        local folder = workspace:FindFirstChild("machinesFolder")
        if not folder then return false end
        for _, m in pairs(folder:GetChildren()) do
            local pos = nil
            if m:IsA("BasePart") then pos = m.Position
            else
                local p = m.PrimaryPart or m:FindFirstChildWhichIsA("BasePart")
                pos = p and p.Position or nil
            end
            if pos and (hrp.Position - pos).Magnitude < 15 then
                return true, m.Name
            end
        end
        return false
    end

    local function autoClick()
        local hasTool, toolName = hasToolEquipped()
        local nearGym, gymName = nearGymMachine()
        
        if hasTool then
            pcall(function()
                LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
            end)
            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    for _, t in pairs(char:GetChildren()) do
                        if t:IsA("Tool") then t:Activate(); break end
                    end
                end
            end)
            pcall(function() modeLabel.Text = "Mode: Dumbbell (" .. (toolName or "?") .. ")" end)
        elseif nearGym then
            pcall(function()
                local remote = ReplicatedStorage:FindFirstChild("rEvents")
                if remote then
                    remote = remote:FindFirstChild("machineInteractRemote")
                    if remote then remote:InvokeServer("useMachine", "interactSeat") end
                end
            end)
            pcall(function()
                LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
            end)
            pcall(function() modeLabel.Text = "Mode: Gym (" .. (gymName or "?") .. ")" end)
        else
            pcall(function()
                LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
            end)
            pcall(function() modeLabel.Text = "Mode: Auto" end)
        end
    end

    local repLoopRunning = false
    local function startRepLoop()
        if repLoopRunning then return end
        repLoopRunning = true
        spawn(function()
            while fastRepOn do
                autoClick()
                repCount = repCount + 1
                if repCount % 10 == 0 then
                    pcall(function()
                        statusLabel.Text = "Status: ON | Rep: " .. tostring(repCount)
                    end)
                end
                task.wait(getRepDelay())
            end
            repLoopRunning = false
        end)
    end

    task.spawn(function()
        task.wait(0.5)
        while task.wait(0.05) do
            if fastRepOn and not repLoopRunning then startRepLoop() end
        end
    end)

    -- STRENGTH ROUTINE
    StrengthTab:AddLabel("").TextSize = 10
    StrengthTab:AddLabel("📈 Strength Routine & Calculator").TextSize = 22

    local targetStrength = 1e12

    StrengthTab:AddTextBox("Target Strength", function(text)
        local num = tonumber(text)
        if num and num > 0 then
            if num < 1000 then targetStrength = num * 1e12
            elseif num < 1000000 then targetStrength = num * 1e9
            else targetStrength = num end
        end
    end, {placeholder = "Contoh: 2 (untuk 2T)"})

    local routineTimeLabel = StrengthTab:AddLabel("⏱️ Routine Time: Waiting...")
    routineTimeLabel.TextSize = 15
    routineTimeLabel.TextColor3 = Color3.fromRGB(255, 200, 100)

    local strengthRateLabel = StrengthTab:AddLabel("⚡ Strength / Hour: +0 | / Day: +0")
    strengthRateLabel.TextSize = 14
    strengthRateLabel.TextColor3 = Color3.fromRGB(100, 220, 150)

    local durabilityRateLabel = StrengthTab:AddLabel("🛡️ Durability / Hour: +0 | / Day: +0")
    durabilityRateLabel.TextSize = 14
    durabilityRateLabel.TextColor3 = Color3.fromRGB(100, 220, 150)

    local lastStrength = getStat(LocalPlayer, "Strength")
    local lastDurability = getStat(LocalPlayer, "Durability")
    local lastRateTime = tick()
    local strengthPerSec = 0
    local durabilityPerSec = 0

    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                local now = tick()
                local currentStrength = getStat(LocalPlayer, "Strength")
                local currentDurability = getStat(LocalPlayer, "Durability")
                
                if now - lastRateTime >= 3 then
                    local timeDelta = now - lastRateTime
                    strengthPerSec = (currentStrength - lastStrength) / timeDelta
                    durabilityPerSec = (currentDurability - lastDurability) / timeDelta
                    lastStrength = currentStrength
                    lastDurability = currentDurability
                    lastRateTime = now
                end
                
                local strPerHour = strengthPerSec * 3600
                local strPerDay = strPerHour * 24
                local durPerHour = durabilityPerSec * 3600
                local durPerDay = durPerHour * 24
                
                pcall(function()
                    strengthRateLabel.Text = "⚡ Strength / Hour: +" .. formatNumber(strPerHour) .. " | / Day: +" .. formatNumber(strPerDay)
                    durabilityRateLabel.Text = "🛡️ Durability / Hour: +" .. formatNumber(durPerHour) .. " | / Day: +" .. formatNumber(durPerDay)
                end)
                
                if strPerHour > 0 and currentStrength < targetStrength then
                    local needed = targetStrength - currentStrength
                    local hoursNeeded = needed / strPerHour
                    local timeStr
                    if hoursNeeded >= 24 then
                        timeStr = math.floor(hoursNeeded/24) .. "d " .. math.floor(hoursNeeded%24) .. "h"
                    elseif hoursNeeded >= 1 then
                        timeStr = math.floor(hoursNeeded) .. "h " .. math.floor((hoursNeeded-math.floor(hoursNeeded))*60) .. "m"
                    elseif hoursNeeded >= (
