-- New example script written by wally
-- You can suggest changes with a pull request or something

loadstring(game:HttpGet("https://raw.githubusercontent.com/Far8228/wonthelottery/refs/heads/main/risk.lua"))()

local repo = 'https://raw.githubusercontent.com/Far8228/InDayui/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'InDay recode',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

-- CALLBACK NOTE:
-- Passing in callback functions via the initial element parameters (i.e. Callback = function(Value)...) works
-- HOWEVER, using Toggles/Options.INDEX:OnChanged(function(Value) ... ) is the RECOMMENDED way to do this.
-- I strongly recommend decoupling UI code from logic code. i.e. Create your UI elements FIRST, and THEN setup :OnChanged functions later.

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('rage'),
    antiaim = Window:AddTab('anti aim'),
    Player = Window:AddTab('misc'),
    ['UI Settings'] = Window:AddTab('settings'),
}

-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('aimbot')
local LeftGroupBoxPlayer = Tabs.Player:AddLeftGroupbox('player')
local RightGroupBoxPlayer = Tabs.Player:AddRightGroupbox('humanoid')
local LeftGroupBoxantiaim = Tabs.antiaim:AddLeftGroupbox('prevent movement packets')
local RightGroupBoxantiaim = Tabs.antiaim:AddRightGroupbox('cframe packets')

-- We can also get our Main tab via the following code:
-- local LeftGroupBox = Window.Tabs.Main:AddLeftGroupbox('Groupbox')

-- Tabboxes are a tiny bit different, but here's a basic example:
--[[

local TabBox = Tabs.Main:AddLeftTabbox() -- Add Tabbox on left side

local Tab1 = TabBox:AddTab('Tab 1')
local Tab2 = TabBox:AddTab('Tab 2')

-- You can now call AddToggle, etc on the tabs you added to the Tabbox
]]

-- Groupbox:AddToggle
-- Arguments: Index, Options



Enabled = false
Players = game:GetService("Players")
Client = Players.LocalPlayer
KeybindActive = false -- Tracks whether the keybind is active

function PreventMovementPackets(state)
    Enabled = state

    if Enabled then
        setfpscap(9999)
        setfflag("S2PhysicsSenderRate", 1)
    game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "$",
    Text = "true", 
    Duration = 2 
    })
    else
    game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "$",
    Text = "false", 
    Duration = 2 
    })
        setfflag("S2PhysicsSenderRate", 700)
        setfpscap(120)
        if Client.Character and Client.Character:FindFirstChild("HumanoidRootPart") then
            sethiddenproperty(Client.Character.HumanoidRootPart, "NetworkIsSleeping", false)
        end
    end
end

MainThread = task.spawn(function()
    while true do
        if Enabled and Client.Character and Client.Character:FindFirstChild("HumanoidRootPart") then
            sethiddenproperty(Client.Character.HumanoidRootPart, "NetworkIsSleeping", true)
            task.wait()
            sethiddenproperty(Client.Character.HumanoidRootPart, "NetworkIsSleeping", false)
        end
        task.wait()
    end
end)

LeftGroupBoxantiaim:AddToggle('server position freezer', {
    Text = "server position freezer",
    Default = false,
    Callback = function(state)
        PreventMovementPackets(state)
    end
})

LeftGroupBoxantiaim:AddLabel('Keybind'):AddKeyPicker('server position freezer keybind', {
    Default = 'J',
    SyncToggleState = true,
    Mode = 'Toggle',
    Text = 'server position freezer keybind',
    NoUI = false, 
    Callback = function(Value)
        Enabled = not Enabled
        PreventMovementPackets(Enabled)
    end
})




Enabled = false

function TogglePhysicsSenderRate(state)
    Enabled = state
    
    if Enabled then
        setfflag("S2PhysicsSenderRate", 900)
    else
        setfflag("S2PhysicsSenderRate", 13)
    end
    
    print("S2PhysicsSenderRate set to:", Enabled and 700 or 13)
end

LeftGroupBoxantiaim:AddToggle('server position lagger', {
    Text = "server position lagger",
    Default = false, -- Default state (off)
    Callback = function(state)
        TogglePhysicsSenderRate(state)
    end
})


Enabled = false
Players = game:GetService("Players")
Client = Players.LocalPlayer


function MovementBooster(state)
    Enabled = state

    if Enabled then
        setfflag("S2PhysicsSenderRate", 7)
        setfpscap(999)
    else
        setfflag("S2PhysicsSenderRate", 13)
        setfpscap(120)
        if Client.Character and Client.Character:FindFirstChild("HumanoidRootPart") then
            sethiddenproperty(Client.Character.HumanoidRootPart, "NetworkIsSleeping", false)
        end
    end
end

MainThread = task.spawn(function()
    while true do
        if Enabled and Client.Character and Client.Character:FindFirstChild("HumanoidRootPart") then
            sethiddenproperty(Client.Character.HumanoidRootPart, "NetworkIsSleeping", true)
            task.wait()
            sethiddenproperty(Client.Character.HumanoidRootPart, "NetworkIsSleeping", false)
        end
        task.wait()
    end
end)

LeftGroupBoxantiaim:AddToggle('server position delayer', {
    Text = "server position delayer",
    Default = false, -- Default state (off)
    Callback = function(state)
        MovementBooster(state)
    end
})

Enabled = false

function TogglePhysicsSenderRate(state)
    Enabled = state
    
    if Enabled then
        setfflag("S2PhysicsSenderRate", 900)
    else
        setfflag("S2PhysicsSenderRate", 13)
    end
    
    print("S2PhysicsSenderRate set to:", Enabled and 700 or 13)
end

LeftGroupBoxantiaim:AddToggle('server position booster', {
    Text = "server position booster",
    Default = false, -- Default state (off)
    Callback = function(state)
        TogglePhysicsSenderRate(state)
    end
})

player = game.Players.LocalPlayer
character = player.Character or player.CharacterAdded:Wait()


function getPlayerCharacter()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    return character, humanoidRootPart
end

-- Function to handle speed boost logic (now with a speedMultiplier parameter)
function moveWithCFrame(speedMultiplier)
    local _, humanoidRootPart = getPlayerCharacter()
    while getSpeedBoostState() and getSpeedBoostKeybindState() and humanoidRootPart do
        local moveDirection = humanoidRootPart.Parent:FindFirstChild("Humanoid") and humanoidRootPart.Parent.Humanoid.MoveDirection
        if moveDirection and moveDirection.Magnitude > 0 then
            humanoidRootPart.CFrame = humanoidRootPart.CFrame + (moveDirection * speedMultiplier)
        end
        game:GetService("RunService").RenderStepped:Wait()
    end
end

-- State management for speed boost toggle and keybind
function setSpeedBoostState(state)
    _G.SpeedBoostEnabled = state -- Use global state for the toggle
end

function getSpeedBoostState()
    return _G.SpeedBoostEnabled or false -- Default to false if not set
end

function setSpeedBoostKeybindState(state)
    _G.SpeedBoostActive = state -- Use global state for the keybind
end

function getSpeedBoostKeybindState()
    return _G.SpeedBoostActive or false -- Default to false if not set
end

-- Function to handle speed multiplier change from the slider
function setSpeedMultiplier(value)
    _G.SpeedMultiplier = value
end

function getSpeedMultiplier()
    return _G.SpeedMultiplier or 1 -- Default to 1 if not set
end

-- UI Integration: Toggle, Keybind, and Slider
LeftGroupBoxPlayer:AddToggle('speed', {
    Text = 'speed',
    Default = false,
    Callback = function(Value)
        setSpeedBoostState(Value) -- Enable or disable speed boost based on toggle state
        if state then
        else
            setSpeedBoostKeybindState(false) -- Ensure keybind is deactivated when toggle is off
        end
    end
})

LeftGroupBoxPlayer:AddLabel('Keybind'):AddKeyPicker('speed keybind', {
    Default = 'C', -- Default keybind (Changeable)
    SyncToggleState = true,
    Mode = 'Toggle', -- Press once to enable, again to disable
    Text = 'CFrame Speed Keybind',
    NoUI = false, 
    Callback = function(Value)
        if getSpeedBoostState() then
            -- Only activate/deactivate if the toggle is ON
            local keybindState = not getSpeedBoostKeybindState()
            setSpeedBoostKeybindState(keybindState)
            if keybindState then
                
                coroutine.wrap(moveWithCFrame)(getSpeedMultiplier()) -- Start movement coroutine with multiplier from slider
            else
                
            end
        else
            
        end
    end
})

LeftGroupBoxPlayer:AddSlider('speedMultiplier', {
    Text = 'Speed Multiplier',
    Default = 1,
    Min = 0.1,
    Max = 10,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        setSpeedMultiplier(Value)
    end
})



local speedEnabled = false -- Variable to track toggle state
player = game.Players.LocalPlayer

LeftGroupBoxPlayer:AddToggle('MyToggle', {
    Text = 'speed v2',
    Default = false,
    Tooltip = 'doesnt work on da hood',
    Callback = function(Value)
        speedEnabled = Value -- Store toggle state
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            if speedEnabled then
                player.Character.Humanoid.WalkSpeed = 200 -- Default high speed
            else
                player.Character.Humanoid.WalkSpeed = 16 -- Reset to normal
            end
        end
    end
})

LeftGroupBoxPlayer:AddSlider('speed v2 amount', {
    Text = 'speed v2 amount',
    Default = 16,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        if speedEnabled and player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value -- Only change speed if toggle is on
        end
    end
})

movementEnabled = false
movementSpeed = 10

LeftGroupBoxPlayer:AddToggle('speed v3', {
    Text = 'speed v3',
    Default = false,
    Tooltip = 'overrides your walkspeed (bypasses da hood anti cheat)',
    Callback = function(Value)
        movementEnabled = Value
    end
})

LeftGroupBoxPlayer:AddSlider('SpeedSlider', {
    Text = 'speed v3 amount',
    Default = 16,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        movementSpeed = Value
    end
})

-- Global services
services = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    UserInputService = game:GetService("UserInputService"),
    Workspace = game.Workspace
}

-- Global variables
flying = false
flightSpeed = 50
defaultGravity = services.Workspace.Gravity
character = services.Players.LocalPlayer.Character or services.Players.LocalPlayer.CharacterAdded:Wait()
humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoid = character:WaitForChild("Humanoid")

-- Functions
function StartFlying()
    humanoid.PlatformStand = true
    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    services.Workspace.Gravity = -5 -- Disable gravity
end

function StopFlying()
    humanoid.PlatformStand = false
    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    services.Workspace.Gravity = defaultGravity -- Re-enable gravity
    humanoidRootPart.Velocity = Vector3.zero -- Ensure stopping of movement
end

function ToggleFly(state)
    if state then
        if not flying then
            flying = true
            StartFlying()
        end
    else
        if flying then
            flying = false
            StopFlying()
        end
    end
end

function ControlFlight()
    if flying then
        local camera = services.Workspace.CurrentCamera
        local moveDirection = Vector3.new()

        local forward = camera.CFrame.LookVector
        local right = camera.CFrame.RightVector
        local up = Vector3.new(0, 1, 0)

        if services.UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection += forward
        end
        if services.UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection -= forward
        end
        if services.UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection -= right
        end
        if services.UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection += right
        end
        if services.UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection += up
        end
        if services.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDirection -= up
        end

        if moveDirection.Magnitude > 0 then
            moveDirection = moveDirection.Unit * flightSpeed
        end

        humanoidRootPart.Velocity = Vector3.new(moveDirection.X, moveDirection.Y, moveDirection.Z)
    end
end

function SetupFlying()
    services.Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
        character = newCharacter
        humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        humanoid = character:WaitForChild("Humanoid")
        if flying then
            StartFlying()
        end
    end)
end

-- Initialize Flight Setup
SetupFlying()

-- Flight Control
services.RunService.Heartbeat:Connect(function()
    ControlFlight()
end)

-- UI Integration
LeftGroupBoxPlayer:AddToggle('fly hack', {
    Text = 'fly hack',
    Default = false,
    Tooltip = 'Toggle to enable flight',
    Callback = function(Value)
        ToggleFly(Value)
    end
})

LeftGroupBoxPlayer:AddLabel('Keybind'):AddKeyPicker('fly keybind', {
    Default = 'F',
    SyncToggleState = true,
    Mode = 'Toggle',
    Text = 'fly keybind',
    NoUI = false,
    Callback = function()
        ToggleFly(not flying)
    end
})

LeftGroupBoxPlayer:AddSlider('MySlider', {
    Text = 'fly speed',
    Default = 0,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        flightSpeed = Value
    end
})

game:GetService("RunService").RenderStepped:Connect(function()
    if not movementEnabled then return end
    if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

    SpeedNum = movementSpeed
    RootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    Camera = workspace.CurrentCamera
    Travel = Vector3.new(0, 0, 0)
    LookVector = Camera.CFrame.LookVector
    RightVector = Camera.CFrame.RightVector

    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
        Travel += LookVector
    end
    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
        Travel -= LookVector
    end
    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
        Travel += RightVector
    end
    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
        Travel -= RightVector
    end

    RootPart.Velocity = Vector3.new(Travel.X * SpeedNum, RootPart.Velocity.Y, Travel.Z * SpeedNum)
end)

--[[
local randomTeleportEnabled = false
local originalPosition = nil  -- Variable to store the original position of the player

-- Random teleport logic
function teleportLoop()
    while randomTeleportEnabled do
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            -- Generate random coordinates in the range you want
            local newX = math.random(-100, 999999)  -- Random X in the range of -100 to 100
            local newY = math.random(999999, 999999)   -- Random Y (height) between 50 and 150
            local newZ = math.random(-100, 999999)  -- Random Z in the range of -100 to 100

            -- Apply the random teleport
            player.Character.HumanoidRootPart.CFrame = CFrame.new(newX, newY, newZ)
        end
        task.wait(0)  -- Add a small delay to prevent crashing or overload
    end
end

LeftGroupBoxPlayer:AddToggle('desync', {
    Text = 'desync',
    Default = false,
    Tooltip = 'Toggle to enable CFrame movement',
    Callback = function(state)
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if state then
                -- Store the player's current position when teleportation starts
                originalPosition = player.Character.HumanoidRootPart.Position
                randomTeleportEnabled = true
                spawn(teleportLoop) -- Run teleport function in a separate thread
            else
                -- Teleport back to original position when turning off
                if originalPosition then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(originalPosition)
                end
                randomTeleportEnabled = false
            end
        end
    end
})]]





--[[
local randomTeleportEnabled = false
local originalPosition = nil  -- Store the original position
local torsoPart = nil  -- Store the generated torso part
local camera = game.Workspace.CurrentCamera  -- Reference to the camera
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local moveDirection = Vector3.new(0, 0, 0)

-- Function to create a part at the humanoid's torso position
function createTorsoPart()
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        -- Remove previous part
        if torsoPart then
            torsoPart:Destroy()
        end
        
        -- Create new part and position it at the humanoid's torso location
        torsoPart = Instance.new("Part")
        torsoPart.Size = Vector3.new(2, 2, 2)
        torsoPart.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
        torsoPart.Material = Enum.Material.Neon
        torsoPart.Anchored = true  -- Anchor part so it stays in place
        torsoPart.CanCollide = false
        torsoPart.CFrame = player.Character.HumanoidRootPart.CFrame  -- Align with humanoid
        torsoPart.Parent = game.Workspace
        
        -- Make the camera view the part
        camera.CameraSubject = torsoPart
    end
end

-- Function to handle movement input
function onInputBegan(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W then
        moveDirection = Vector3.new(0, 0, -1)
    elseif input.KeyCode == Enum.KeyCode.S then
        moveDirection = Vector3.new(0, 0, 1)
    elseif input.KeyCode == Enum.KeyCode.A then
        moveDirection = Vector3.new(-1, 0, 0)
    elseif input.KeyCode == Enum.KeyCode.D then
        moveDirection = Vector3.new(1, 0, 0)
    end
end

function onInputEnded(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.S or input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D then
        moveDirection = Vector3.new(0, 0, 0)
    end
end

-- Update loop to move the torso part
runService.RenderStepped:Connect(function()
    if torsoPart then
        torsoPart.CFrame = torsoPart.CFrame * CFrame.new(moveDirection * 0.5)
    end
end)

userInputService.InputBegan:Connect(onInputBegan)
userInputService.InputEnded:Connect(onInputEnded)

-- Random teleport logic
function teleportLoop()
    while randomTeleportEnabled do
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            -- Generate random coordinates
            local newX = math.random(-100, 999999)
            local newY = math.random(999999, 999999)
            local newZ = math.random(-100, 999999)
            
            -- Store the original position
            if not torsoPart then
                createTorsoPart()
            end
            
            -- Move the real player but leave the part behind
            player.Character.HumanoidRootPart.CFrame = CFrame.new(newX, newY, newZ)
        end
        task.wait(0)  -- Delay to prevent overload
    end
end

LeftGroupBoxPlayer:AddToggle('spoof_mode', {
    Text = 'Spoof Mode',
    Default = false,
    Tooltip = 'Toggle to enable part visualization',
    Callback = function(state)
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if state then
                -- Store the original position before moving
                originalPosition = player.Character.HumanoidRootPart.Position
                
                -- Create a part at the player's torso position
                createTorsoPart()
                
                -- Start moving the real player elsewhere
                randomTeleportEnabled = true
                spawn(teleportLoop)
            else
                -- Restore the original position
                if originalPosition then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(originalPosition)
                end
                
                -- Remove the generated part
                if torsoPart then
                    torsoPart:Destroy()
                    torsoPart = nil
                end
                
                -- Reset camera back to the player
                camera.CameraSubject = player.Character:FindFirstChild("Humanoid")
                
                randomTeleportEnabled = false
            end
        end
    end
})]]


--[[
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local camera = game.Workspace.CurrentCamera

local spoofMode = false
local voidModeEnabled = false
local voidSpamEnabled = false
local randomTeleportEnabled = false
local originalPosition = nil
local torsoPart = nil
local moveDirection = Vector3.new(0, 0, 0)

-- Function to create the floating part
function createTorsoPart()
    if torsoPart then
        torsoPart:Destroy()
    end

    torsoPart = Instance.new("Part")
    torsoPart.Size = Vector3.new(2, 2, 2)
    torsoPart.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    torsoPart.Material = Enum.Material.Neon
    torsoPart.Anchored = true
    torsoPart.CanCollide = false
    torsoPart.CFrame = player.Character.HumanoidRootPart.CFrame
    torsoPart.Parent = game.Workspace

    camera.CameraSubject = torsoPart
end

-- Function to teleport real character
function teleportCharacter(x, y, z)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
    end
end

-- Random teleport loop
function teleportLoop()
    while randomTeleportEnabled do
        local newX = math.random(-100, 999999)
        local newY = math.random(999999, 999999)
        local newZ = math.random(-100, 999999)

        teleportCharacter(newX, newY, newZ)
        task.wait(0.1)
    end
end

-- Function to handle dropdown changes
function onDropdownChange(value)
    if value == "void spam" then
        voidSpamEnabled = true
        voidModeEnabled = false
        randomTeleportEnabled = false
        spawn(function()
            while voidSpamEnabled do
                teleportCharacter(999999999999, 999999999999, 999999999999)
                task.wait(0.09)
                teleportCharacter(originalPosition.X, originalPosition.Y, originalPosition.Z)
                task.wait(0.09)
            end
        end)
    elseif value == "void" then
        voidModeEnabled = true
        voidSpamEnabled = false
        randomTeleportEnabled = false
        teleportCharacter(999999999999, 999999999999, 999999999999)
    elseif value == "anti hit" then
        randomTeleportEnabled = true
        voidModeEnabled = false
        voidSpamEnabled = false
        spawn(teleportLoop)
    else
        voidModeEnabled = false
        voidSpamEnabled = false
        randomTeleportEnabled = false
        if originalPosition then
            teleportCharacter(originalPosition.X, originalPosition.Y, originalPosition.Z)
        end
    end
end

-- Movement controls for the part
function onInputBegan(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W then
        moveDirection = Vector3.new(0, 0, -1)
    elseif input.KeyCode == Enum.KeyCode.S then
        moveDirection = Vector3.new(0, 0, 1)
    elseif input.KeyCode == Enum.KeyCode.A then
        moveDirection = Vector3.new(-1, 0, 0)
    elseif input.KeyCode == Enum.KeyCode.D then
        moveDirection = Vector3.new(1, 0, 0)
    end
end

function onInputEnded(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.S or input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D then
        moveDirection = Vector3.new(0, 0, 0)
    end
end

-- Update loop to move the part
runService.RenderStepped:Connect(function()
    if spoofMode and torsoPart then
        torsoPart.CFrame = torsoPart.CFrame * CFrame.new(moveDirection * 0.5)
    end
end)

userInputService.InputBegan:Connect(onInputBegan)
userInputService.InputEnded:Connect(onInputEnded)

-- Spoof Mode Toggle
LeftGroupBoxantiaim:AddToggle('desync', {
    Text = 'desync',
    Default = false,
    Tooltip = 'Move and view the part instead of your character',
    Callback = function(state)
        spoofMode = state
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if state then
                originalPosition = player.Character.HumanoidRootPart.Position
                createTorsoPart()

                -- Hide the real character
                player.Character.HumanoidRootPart.Transparency = 1
                for _, v in pairs(player.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 1
                    end
                end
            else
                -- Restore character visibility
                for _, v in pairs(player.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 0
                    end
                end
                
                -- Restore original position
                if originalPosition then
                    teleportCharacter(originalPosition.X, originalPosition.Y, originalPosition.Z)
                end
                
                -- Destroy the part
                if torsoPart then
                    torsoPart:Destroy()
                    torsoPart = nil
                end
                
                -- Reset camera
                camera.CameraSubject = player.Character:FindFirstChild("Humanoid")
            end
        end
    end
})


-- Dropdown menu
LeftGroupBoxantiaim:AddDropdown('MyDropdown', {
    Values = { 'void spam', 'void', 'anti hit', 'off' },
    Default = 4,
    Multi = false,
    Text = 'method',
    Tooltip = 'Select teleportation mode',
    Callback = function(Value)
        onDropdownChange(Value)
    end
})]]


local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local camera = game.Workspace.CurrentCamera

local spoofMode = false
local voidModeEnabled = false
local voidSpamEnabled = false
local randomTeleportEnabled = false
local originalPosition = nil
local torsoPart = nil
local moveDirection = Vector3.new(0, 0, 0)
local selectedMode = "off"

-- Function to create the floating part
function createTorsoPart()
    if torsoPart then
        torsoPart:Destroy()
    end

    torsoPart = Instance.new("Part")
    torsoPart.Size = Vector3.new(2, 2, 2)
    torsoPart.Color = Color3.fromRGB(0, 85, 255)
    torsoPart.Material = Enum.Material.ForceField
    torsoPart.Anchored = true
    torsoPart.CanCollide = false
    torsoPart.CFrame = player.Character.HumanoidRootPart.CFrame
    torsoPart.Parent = game.Workspace

    camera.CameraSubject = torsoPart
end

-- Function to teleport real character
function teleportCharacter(x, y, z)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
    end
end

-- Random teleport loop
function teleportLoop()
    while randomTeleportEnabled do
        local newX = math.random(-100, 999999)
        local newY = math.random(999999, 999999)
        local newZ = math.random(-100, 999999)

        teleportCharacter(newX, newY, newZ)
        task.wait(0)
    end
end

-- Function to handle dropdown changes
function onDropdownChange(value)
    selectedMode = value
end

function applySelectedMode()
    if not spoofMode then return end
    
    if selectedMode == "void spam" then
        voidSpamEnabled = true
        voidModeEnabled = false
        randomTeleportEnabled = false
        spawn(function()
            while spoofMode and voidSpamEnabled do
                teleportCharacter(999999999999, 999999999999, 999999999999)
                task.wait(0.09)
                teleportCharacter(originalPosition.X, originalPosition.Y, originalPosition.Z)
                task.wait(0.09)
            end
        end)
    elseif selectedMode == "void" then
        voidModeEnabled = true
        voidSpamEnabled = false
        randomTeleportEnabled = false
        teleportCharacter(99999999999999999999, 99999999999999999999, 99999999999999999999999999999999)
    elseif selectedMode == "anti hit" then
        randomTeleportEnabled = true
        voidModeEnabled = false
        voidSpamEnabled = false
        spawn(teleportLoop)
    else
        voidModeEnabled = false
        voidSpamEnabled = false
        randomTeleportEnabled = false
        if originalPosition then
            teleportCharacter(originalPosition.X, originalPosition.Y, originalPosition.Z)
        end
    end
end



-- Spoof Mode Toggle with Keybind
function toggleDesync()
    spoofMode = not spoofMode
    if LeftGroupBoxPlayer.Toggles and LeftGroupBoxPlayer.Toggles['desync'] then
        LeftGroupBoxPlayer.Toggles['desync']:SetValue(spoofMode)
    end
    
    if spoofMode then
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            originalPosition = player.Character.HumanoidRootPart.Position
            createTorsoPart()

            -- Hide the real character
            player.Character.HumanoidRootPart.Transparency = 1
            for _, v in pairs(player.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Transparency = 1
                end
            end
        end
        applySelectedMode()
    else
        -- Restore character visibility
        if player and player.Character then
            for _, v in pairs(player.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Transparency = 0
                end
            end
        end
        
        -- Restore original position
        if originalPosition then
            teleportCharacter(originalPosition.X, originalPosition.Y, originalPosition.Z)
        end
        
            camera.CameraSubject = player.Character:FindFirstChild("Humanoid")

        -- Destroy the part
        if torsoPart then
            torsoPart:Destroy()
            torsoPart = nil
        end
        
       

        
        -- Disable all teleport modes
        voidModeEnabled = false
        voidSpamEnabled = false
        randomTeleportEnabled = false
    end
end

-- Movement controls for the floating part
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W then
        moveDirection = Vector3.new(0, 0, -1)
    elseif input.KeyCode == Enum.KeyCode.S then
        moveDirection = Vector3.new(0, 0, 1)
    elseif input.KeyCode == Enum.KeyCode.A then
        moveDirection = Vector3.new(-1, 0, 0)
    elseif input.KeyCode == Enum.KeyCode.D then
        moveDirection = Vector3.new(1, 0, 0)
    elseif input.KeyCode == Enum.KeyCode.E then
        moveDirection = Vector3.new(0, 1, 0)
    elseif input.KeyCode == Enum.KeyCode.Q then
        moveDirection = Vector3.new(0, -1, 0)
    end
end)

-- Reset the movement when the keys are released
userInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.S or
       input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D or
       input.KeyCode == Enum.KeyCode.E or input.KeyCode == Enum.KeyCode.Q then
        moveDirection = Vector3.new(0, 0, 0)
    end
end)


runService.RenderStepped:Connect(function()
    if spoofMode and torsoPart then
        torsoPart.CFrame = torsoPart.CFrame * CFrame.new(moveDirection * 0.5)
    end
end)

RightGroupBoxantiaim:AddToggle('desync', {
    Text = 'sync',
    Default = false,
    Tooltip = 'Move and view the part instead of your character',
    Callback = function(state)
        toggleDesync()
    end
})

RightGroupBoxantiaim:AddLabel('Keybind'):AddKeyPicker('sync keybind', {
    Default = 'X',
    SyncToggleState = true,
    Mode = 'Toggle',
    Text = 'sync keybind',
    NoUI = false, 
    Callback = function()
        toggleDesync()
    end
})

-- Dropdown menu for teleportation mode
RightGroupBoxantiaim:AddDropdown('method', {
    Values = { 'void spam', 'void', 'anti hit', 'teleport high', 'off' },
    Default = 4,
    Multi = false,
    Text = 'method',
    Tooltip = 'Select the teleportation mode',
    Callback = function(Value)
        onDropdownChange(Value)
    end
})



local Services = {
    RunService = game:GetService("RunService"),
    ReplicatedStorage = game:GetService("ReplicatedStorage")
}

local stompConnection -- Connection for the Heartbeat event

-- Auto Stomp Functions
function stompLoopFunction()
    Services.ReplicatedStorage.MainEvent:FireServer("Stomp")
end

function toggleAutoStomp(state)
    if state then
        stompConnection = Services.RunService.Heartbeat:Connect(stompLoopFunction)
    else
        if stompConnection then
            stompConnection:Disconnect()
            stompConnection = nil
        end
    end
end

    LeftGroupBoxPlayer:AddToggle('auto stomp', {
    Text = 'auto stomp (fixed ban)',
    Default = false,
    Tooltip = 'stomps automatically player (fixed ban)',
    Callback = function(Value)  -- 'Value' contains true/false when toggled
        toggleAutoStomp(Value)
    end
})

-- Services
Players = game:GetService("Players")
Workspace = game:GetService("Workspace")

-- Global Variables
Player = Players.LocalPlayer
Character = Player.Character or Player.CharacterAdded:Wait()
PERCENT_TO_BUY_ARMOR = 30  -- Buy armor when below this percentage
ArmorCost = 2513           -- Cost of the armor
buyingActive = false       -- Auto-buy toggle

-- Function to buy armor
function buyArmor()
    while buyingActive do
        Character = Player.Character or Player.CharacterAdded:Wait()

        -- Ensure DataFolder exists before checking currency
        if not Player:FindFirstChild("DataFolder") or not Player.DataFolder:FindFirstChild("Currency") then
            warn("DataFolder or Currency missing from player!")
            wait(1)
            continue
        end
        
        Armor = Character:FindFirstChild("BodyEffects") and Character.BodyEffects:FindFirstChild("Armor")
        ArmorShop = Workspace:FindFirstChild("Ignored") and Workspace.Ignored.Shop:FindFirstChild("[High-Medium Armor] - $2513")

        if Armor and Armor.Value <= PERCENT_TO_BUY_ARMOR and Player.DataFolder.Currency.Value >= ArmorCost then
            RootPart = Character:FindFirstChild("HumanoidRootPart")

            if RootPart and ArmorShop and ArmorShop:FindFirstChild("Head") then
                OriginalPosition = RootPart.CFrame -- Store original position

                -- Teleport to armor shop
                RootPart.CFrame = ArmorShop.Head.CFrame

                -- Simulate clicking purchase button
                ClickDetector = ArmorShop:FindFirstChild("ClickDetector")
                if ClickDetector then
                    for i = 1, 5 do
                        fireclickdetector(ClickDetector)
                        wait(0.1)
                    end
                end

                -- Wait until armor is refilled or money runs out
                repeat wait(0.1) until Armor.Value >= 100 or Player.DataFolder.Currency.Value < ArmorCost

                -- Teleport back
                RootPart.CFrame = OriginalPosition
            else
                warn("HumanoidRootPart or ArmorShop missing!")
            end
        end

        wait(0) -- Check every half second
    end
end

-- Function to toggle Auto Armor
function toggleAutoArmor(state)
    buyingActive = state

    if buyingActive then
        coroutine.wrap(buyArmor)()
    end
end

-- UI Toggle for Auto Armor
LeftGroupBoxPlayer:AddToggle('auto armor', {
    Text = 'auto armor',
    Default = false,
    Tooltip = 'Automatically buys armor when needed',
    Callback = function(Value)
        toggleAutoArmor(Value)
    end
})

LeftGroupBoxPlayer:AddSlider('MySlider', {
    Text = 'auto armor threshold',
    Default = 0,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        PERCENT_TO_BUY_ARMOR = Value
    end
})

reloadCooldown = 0 -- Time in seconds to prevent spamming reloads
autoShootEnabled = false -- Toggle state
lastReloadTime = 0 -- Track the last reload time globally

function getPlayer()
    return game:GetService("Players").LocalPlayer
end

function getReplicatedStorage()
    return game:GetService("ReplicatedStorage")
end

function checkAmmoAndReload()
    if not autoShootEnabled then return end -- Exit if toggle is disabled

    local player = getPlayer()
    local character = player and player.Character
    if character then
        local tool = character:FindFirstChildWhichIsA("Tool")
        if tool then
            local ammo = tool:FindFirstChild("Ammo")
            if ammo and ammo.Value <= 0 then -- Check if ammo is 0 or less
                local currentTime = tick()
                if currentTime - lastReloadTime >= reloadCooldown then
                    -- Reload the gun
                    getReplicatedStorage().MainEvent:FireServer("Reload", tool)
                    lastReloadTime = currentTime -- Update the last reload time globally
                end
            end
        end
    end
end

function onHeartbeat()
    checkAmmoAndReload()
end

game:GetService("RunService").Heartbeat:Connect(onHeartbeat)

-- Toggle setup
LeftGroupBoxPlayer:AddToggle('auto reload', {
    Text = 'auto reload',
    Default = false,
    Tooltip = 'Automatically reloads the current weapon when ammo is empty',
    Callback = function(Value)
        autoShootEnabled = Value
    end
})

LeftGroupBoxPlayer:AddButton({
    Text = 'force reset',
    Func = function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})

RightGroupBoxPlayer:AddButton({
    Text = 'remove animation',
    Func = function()
    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=0"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=0"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=0"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=0"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=0"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=0"
    game.Players.LocalPlayer.Character.Humanoid.Jump = false
    end,
    DoubleClick = false,
    Tooltip = 'reset to disable'
})

LeftGroupBoxPlayer:AddButton({
    Text = 'disable chairs',
    Func = function()
    for i, v in pairs(Workspace:GetDescendants()) do
    if v:IsA("Seat") then
        v:Destroy()  -- Destroy the seat to prevent players from sitting
    end
end
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})


LeftGroupBoxPlayer:AddButton({
    Text = 'anti void',
    Func = function()
        Workspace.FallenPartsDestroyHeight = -999999999999999999999999999999999999999  -- You can change this to your desired height for parts

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")

        -- Continuously ensure the player's health remains the same
        game:GetService("RunService").Heartbeat:Connect(function()
            humanoid.Health = humanoid.Health  -- Keeps health from decreasing
        end)
    end)
end)
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})



LeftGroupBoxPlayer:AddButton({
    Text = 'chat spy',
    Func = function()
        function getPlayer()
    return game:GetService("Players").LocalPlayer
end

-- Global function to get the chat GUI
function getChat()
    return getPlayer().PlayerGui:WaitForChild("Chat")
end

-- Global function to toggle chat visibility
function toggleChatVisibility()
    local chatFrame = getChat().Frame
    chatFrame.ChatChannelParentFrame.Visible = true
    chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), chatFrame.ChatChannelParentFrame.Size.Y)
end

-- Global function to handle chatting logic
function onChatted(p, msg, saymsg, getmsg)
    if _G.chatSpyInstance == instance then
        if p == getPlayer() and msg:lower():sub(1, 4) == "/spy" then
            enabled = not enabled
            wait(0.3)
            privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", privateProperties)
        elseif enabled and (spyOnMyself == true or p ~= getPlayer()) then
            msg = msg:gsub("[\n\r]", ''):gsub("\t", ' '):gsub("[ ]+", ' ')
            local hidden = true
            local conn = getmsg.OnClientEvent:Connect(function(packet, channel)
                if packet.SpeakerUserId == p.UserId and packet.Message == msg:sub(#msg - #packet.Message + 1) and (channel == "All" or (channel == "Team" and public == false and game:GetService("Players")[packet.FromSpeaker].Team == getPlayer().Team)) then
                    hidden = false
                end
            end)
            wait(1)
            conn:Disconnect()
            if hidden and enabled then
                if public then
                    saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg, "All")
                else
                    privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
                    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", privateProperties)
                end
            end
        end
    end
end

-- Global function to initialize the chat spy system
function initializeChatSpy()
    local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
    local instance = (_G.chatSpyInstance or 0) + 1
    _G.chatSpyInstance = instance

    -- Setup the chat visibility
    toggleChatVisibility()

    -- Listen for all players' messages
    for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
        p.Chatted:Connect(function(msg) onChatted(p, msg, saymsg, getmsg) end)
    end

    -- Listen for new players joining the game
    game:GetService("Players").PlayerAdded:Connect(function(p)
        p.Chatted:Connect(function(msg) onChatted(p, msg, saymsg, getmsg) end)
    end)

    -- Initial system message showing Spy status
    privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", privateProperties)
end

-- Initialize chat spy system
initializeChatSpy()
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})



LeftGroupBoxPlayer:AddButton({
    Text = 'redeem codes',
    Func = function()
            function redeemCode(code)
    local args = {
        [1] = "EnterPromoCode",
        [2] = code
    }

    game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer(unpack(args))
end

-- Redeem multiple codes with a delay
redeemCode("pumpkins2023")
print("1")
wait(6)
redeemCode("DAUP")
print("2")
wait(6)
redeemCode("TRADEME!")
print("3")
wait(6)
redeemCode("HALLOWEEN2024")
print("4")
wait(6)
redeemCode("DACARNIVAL")
print("5")
wait(6)
redeemCode("VIP")
print("6")
wait(6)
redeemCode("SHRIMP")
print("7")
wait(6)
redeemCode("2025")
print("8")
wait(6)
redeemCode("ShortCake")
print("9")
wait(6)
redeemCode("RUBY")
print("10")
wait(6)
redeemCode("Beary")
print("11")
wait(6)
redeemCode("THANKSGIVING24")
print("12")
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})


LeftGroupBoxPlayer:AddButton({
    Text = 'headless and korblox',
    Func = function()
            _G.Character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
_G.Head = _G.Character:WaitForChild("Head")

-- Make the head invisible
_G.Head.Transparency = 1

-- Optional: Remove the face decal
_G.Face = _G.Head:FindFirstChild("face")
if _G.Face then _G.Face:Destroy() end

-- Wait for the character to load
_G.Character:WaitForChild("Humanoid")

-- Replace the right leg with a Korblox leg
function ReplaceRightLeg()
    _G.RightUpperLeg = _G.Character:FindFirstChild("RightUpperLeg")
    _G.RightLowerLeg = _G.Character:FindFirstChild("RightLowerLeg")
    
    if _G.RightLowerLeg then
        _G.RightUpperLeg.Transparency = 1
        _G.RightLowerLeg:Destroy()
    end

    -- Create and configure the new Korblox leg
    _G.NewLeg = Instance.new("Part")
    _G.NewLeg.Name, _G.NewLeg.Size, _G.NewLeg.Parent = "KorbloxLeg", Vector3.new(1, 3, 1), _G.Character
    _G.NewLeg.Anchored, _G.NewLeg.CanCollide, _G.NewLeg.Position = false, false, _G.RightUpperLeg.Position

    _G.Mesh = Instance.new("SpecialMesh", _G.NewLeg)
    _G.Mesh.MeshId, _G.Mesh.TextureId, _G.Mesh.Scale = "http://www.roblox.com/asset/?id=902942093", "http://www.roblox.com/asset/?id=902843398", Vector3.new(1, 1.1, 1)

    _G.Weld = Instance.new("Motor6D")
    _G.Weld.Part0, _G.Weld.Part1, _G.Weld.C0, _G.Weld.Parent = _G.RightUpperLeg, _G.NewLeg, CFrame.new(0, 0.2, 0), _G.RightUpperLeg
end

ReplaceRightLeg()

    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})




local previousPosition = nil -- Store original position
local teleportEnabled = false -- Toggle state

RightGroupBoxantiaim:AddToggle('destroy stand', {
    Text = 'destroy stand',
    Default = false,
    Tooltip = 'Toggle to enable CFrame movement',
    Callback = function(Value)
        teleportEnabled = Value
    end
})

RightGroupBoxantiaim:AddLabel('Keybind'):AddKeyPicker('destroy stand keybind', {
    Default = 'C', -- Default keybind (Changeable)
    SyncToggleState = true,
    Mode = 'Toggle', -- Press once to enable, again to disable
    Text = 'CFrame Speed Keybind',
    NoUI = false, 
    Callback = function()
        if teleportEnabled then
            local player = game.Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character.HumanoidRootPart
                
                if not previousPosition then
                    -- Store the previous position before teleporting
                    previousPosition = hrp.CFrame
                    -- Move to absurd coordinates
                    hrp.CFrame = CFrame.new(-9e50, 0, 0) 
                else
                    -- Return to the previous position
                    hrp.CFrame = previousPosition
                    previousPosition = nil
                end
            end
        end
    end
})


isOrbiting, isEnabled, targetPlayer, teleportConnection, cameraFocus = false, false, nil, nil, nil
teleportInterval = 1
predictionEnabled, predictionFactor, teleportHeight, randomFactor = false, 0.5, 5, 10  
character, camera, player, Players = game:GetService("Players").LocalPlayer.Character, game.Workspace.CurrentCamera, game:GetService("Players").LocalPlayer, game:GetService("Players")
RunService = game:GetService("RunService")

function onCharacterAdded(newCharacter)
    character = newCharacter
    task.wait(1)  -- Wait for the character to fully load
    if isEnabled then
        startOrbitAroundTargetPlayer()  -- Restart orbiting after respawn
    end
end

-- Connect the event to handle respawn
player.CharacterAdded:Connect(onCharacterAdded)

function getPredictedPosition(targetCharacter)
    if not predictionEnabled then
        return targetCharacter.HumanoidRootPart.Position
    end

    local rootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if rootPart and rootPart.Velocity then
        return rootPart.Position + rootPart.Velocity * predictionFactor
    else
        return rootPart.Position
    end
end

function startOrbitAroundTargetPlayer()
    if isOrbiting then return end

    if not targetPlayer then
        targetPlayer = getClosestPlayerToMouse()  -- Get a target only if none exists
    end

    if not targetPlayer then return end 

    isOrbiting = true
    cameraFocus = camera.CameraSubject
    camera.CameraSubject = targetPlayer.Character.HumanoidRootPart

    -- Listen for the target respawning
    targetPlayer.CharacterAdded:Connect(function(newCharacter)
        task.wait(1)  -- Wait for the character to fully load
        if targetPlayer then
            targetPlayer.Character = newCharacter
            startOrbitAroundTargetPlayer()  -- Re-orbit the same player
        end
    end)

    teleportConnection = RunService.RenderStepped:Connect(function()
        if isOrbiting and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = getPredictedPosition(targetPlayer.Character)
            local targetHeight = targetPosition.Y + teleportHeight 

            local randomDirection = Vector3.new(
                math.random(-randomFactor, randomFactor), 
                0, 
                math.random(-randomFactor, randomFactor) 
            )

            local newPosition = Vector3.new(targetPosition.X + randomDirection.X, targetHeight, targetPosition.Z + randomDirection.Z)

            if character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(newPosition)
            end
        end

        checkIfTargetKnocked()
    end)
end

function stopOrbiting(manualUnlock)
    if isOrbiting then
        -- If target is knocked, continuously teleport to them for 2 seconds
        if targetPlayer and targetPlayer.Character then
            local bodyEffects = targetPlayer.Character:FindFirstChild("BodyEffects")
            if bodyEffects and bodyEffects:FindFirstChild("K.O") and bodyEffects["K.O"].Value then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                local targetTorso = targetPlayer.Character:FindFirstChild("UpperTorso") or targetPlayer.Character:FindFirstChild("HumanoidRootPart")

                if hrp and targetTorso then
                    local lastpos = hrp.CFrame
                    local startTime = tick()

                    -- Continuously teleport for 2 seconds
                    while tick() - startTime < 2 do
                        -- Check if target is still K.O'd
                        if not bodyEffects:FindFirstChild("K.O") or not bodyEffects["K.O"].Value then
                            break
                        end

                        -- Teleport to the K.O'd position
                        hrp.CFrame = CFrame.new(targetTorso.Position) * CFrame.new(0, 2, 0) -- Slightly above the torso
                        task.wait(0.1) -- Wait a bit before teleporting again
                    end

                    -- Return to the original position
                    hrp.CFrame = lastpos
                    task.wait(0.2)
                end
            end
        end

        isOrbiting = false

        if teleportConnection then
            teleportConnection:Disconnect()
            teleportConnection = nil
        end

        if cameraFocus then
            camera.CameraSubject = cameraFocus
        else
            camera.CameraSubject = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Humanoid")
        end

        -- Only reset targetPlayer if manually unlocking
        if manualUnlock then
            targetPlayer = nil
        end
    end
end


function getClosestPlayerToMouse()
    local mouse = player:GetMouse()
    local closestPlayer, closestDistance = nil, math.huge

    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            local screenPosition, onScreen = camera:WorldToViewportPoint(humanoidRootPart.Position)

            if onScreen then
                local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPosition.X, screenPosition.Y)).Magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end
    end

    return closestPlayer
end
--[[
healthTriggered = {}
healthCheckEnabled = false

function SendMessage(msg)
    local player = game.Players.LocalPlayer
    if player then
        player:Chat(msg)
    end
end

function checkIfTargetKnocked()
    if targetPlayer and targetPlayer.Character then
        local bodyEffects = targetPlayer.Character:FindFirstChild("BodyEffects")
        if bodyEffects and bodyEffects:FindFirstChild("K.O") and bodyEffects["K.O"].Value and not healthTriggered[targetPlayer.UserId] then
            SendMessage("Anti trashmode services") -- Sends the message in chat
            healthTriggered[targetPlayer.UserId] = true

            task.wait(0.1)
            SendMessage("no comp") -- Another message

            task.delay(5, function() 
                healthTriggered[targetPlayer.UserId] = nil
            end)
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(checkIfTargetKnocked)

]]


function checkIfTargetKnocked()
    if targetPlayer and targetPlayer.Character then
        local bodyEffects = targetPlayer.Character:FindFirstChild("BodyEffects")
        if bodyEffects and bodyEffects:FindFirstChild("K.O") and bodyEffects["K.O"].Value then
            stopOrbiting()
            startOrbitAroundTargetPlayer()
        end
    end
end



LeftGroupBox:AddToggle('aimbot', {
    Text = 'enable',
    Default = false,
    Tooltip = 'aimbot',
    Callback = function(Value)  -- 'Value' contains true/false when toggled
        isEnabled = Value  -- Use 'Value' instead of 'state'
        
        if not isEnabled then
            stopOrbiting(true) -- Unlock manually
        else
            startOrbitAroundTargetPlayer()
        end
    end
})
LeftGroupBox:AddLabel('Keybind'):AddKeyPicker('autokill', {
    Default = 'C', -- Default keybind (Changeable)
    SyncToggleState = false,
    Mode = 'Toggle', -- Press once to enable, again to disable
    Text = 'aimbot keybind',
    NoUI = false, 
 Callback = function(Value)
        if isEnabled then
            if isOrbiting then
                stopOrbiting(true) -- Unlock manually when pressing keybind
            else
                startOrbitAroundTargetPlayer()
            end
        end
    end
})

    LeftGroupBox:AddToggle('predict velocity', {
    Text = 'predict velocity',
    Default = false,
    Tooltip = 'Toggle to enable CFrame movement',
    Callback = function(Value)  -- 'Value' contains true/false when toggled
        predictionEnabled = Value
     end
})

LeftGroupBox:AddSlider('MySlider', {
    Text = 'Prediction amount',
    Default = 0,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        predictionFactor = Value
    end
})

LeftGroupBox:AddSlider('MySlider', {
    Text = 'Teleport height',
    Default = 0,
    Min = -40,
    Max = 40,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        teleportHeight = Value
    end
})

LeftGroupBox:AddSlider('MySlider', {
    Text = 'Random Teleport distance',
    Default = 10,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        randomFactor = Value
    end
})

LeftGroupBox:AddToggle('XD113', {
    Text = 'auto equip rifle',
    Default = false,
    Tooltip = 'Toggle to enable CFrame movement',
    Callback = function(Value)  -- 'Value' contains true/false when toggled
        equipEnabled = Value
        task.spawn(function()
            while equipEnabled do
                if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    local rifle = game.Players.LocalPlayer.Backpack:FindFirstChild("[Rifle]")
                    if rifle then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(rifle)
                    end
                end
                task.wait(0.05) -- Adjust delay as needed
            end
        end)
    end
})

Players = game:GetService("Players")
Client = Players.LocalPlayer
autoResetEnabled = false

-- Function to monitor player's K.O state
function startMonitoring()
    task.spawn(function()
        while autoResetEnabled and task.wait(0) do
            if Client.Character then
                local BodyEffects = Client.Character:FindFirstChild("BodyEffects")
                if BodyEffects then
                    local KO = BodyEffects:FindFirstChild("K.O")
                    if KO and KO:IsA("BoolValue") and KO.Value == true then
                        local humanoid = Client.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid.Health = 0
                        end
                    end
                end
            end
        end
    end)
end

LeftGroupBox:AddToggle('anti stomp', {
    Text = 'anti stomp',
    Default = false,
    Tooltip = 'Toggle to enable CFrame movement',
    Callback = function(Value)  -- 'Value' contains true/false when toggled
        autoResetEnabled = Value -- Update toggle state
        if autoResetEnabled then
            startMonitoring()
        end
    end,
})











-- Options is a table added to getgenv() by the library
-- You index Options with the specified index, in this case it is 'MySlider'
-- To get the value of the slider you do slider.Value

local Number = Options.MySlider.Value
Options.MySlider:OnChanged(function()
    print('MySlider was changed! New value:', Options.MySlider.Value)
end)

-- This should print to the console: "MySlider was changed! New value: 3"
Options.MySlider:SetValue(3)




LeftGroupBox:AddDropdown('MyPlayerDropdown', {
    SpecialType = 'Player',
    Text = 'A player dropdown',
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the dropdown

    Callback = function(Value)
        print('[cb] Player dropdown got changed:', Value)
    end
})








-- Library functions
-- Sets the watermark visibility
Library:SetWatermarkVisibility(true)

-- Example of dynamically-updating watermark with common traits (fps and ping)
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('InDay recode | status: private | uid: 1 | ' .. player.Name .. ' | v1.0.0 | early beta release | velocity version | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library.KeybindFrame.Visible = true; -- todo: add a function for this

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightControl', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
