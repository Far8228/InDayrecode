local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local Frame_3 = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel_3 = Instance.new("TextLabel")
local LaunchButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Workspace
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.396163464, 0, 0.245370373, 0)
Frame.Size = UDim2.new(0, 316, 0, 345)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 316, 0, 37)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "InDay.win"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 23.000

TextLabel_2.Parent = TextLabel
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.945945919, 0)
TextLabel_2.Size = UDim2.new(0, 316, 0, 2)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = ""
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextSize = 14.000

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = TextLabel

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.0793661773, 0, 0.145849779, 0)
Frame_2.Size = UDim2.new(0, 265, 0, 243)

Frame_3.Parent = Frame_2
Frame_3.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.0641509444, 0, 0.0658436194, 0)
Frame_3.Size = UDim2.new(0, 229, 0, 211)

TextButton.Parent = Frame_3
TextButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(0, 229, 0, 51)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

TextLabel_3.Parent = TextButton
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.270742357, 0, 0, 0)
TextLabel_3.Size = UDim2.new(0, 159, 0, 25)
TextLabel_3.Font = Enum.Font.SourceSansSemibold
TextLabel_3.Text = "Stable on any executor"
TextLabel_3.TextColor3 = Color3.fromRGB(5, 255, 22)
TextLabel_3.TextSize = 19.000

LaunchButton.Name = "LaunchButton"
LaunchButton.Parent = Frame
LaunchButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LaunchButton.BorderColor3 = Color3.fromRGB(25, 25, 25)
LaunchButton.Position = UDim2.new(0.09450946, 0, 0.884057999, 0)
LaunchButton.Size = UDim2.new(0, 250, 0, 24)
LaunchButton.Font = Enum.Font.SourceSansBold
LaunchButton.Text = "Launch"
LaunchButton.TextColor3 = Color3.fromRGB(200, 200, 200)
LaunchButton.TextSize = 18.000

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.BackgroundTransparency = 1.000
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.883000016, 0, 0.0130000003, 0)
TextButton_2.Size = UDim2.new(0, 32, 0, 25)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "X"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextSize = 30.000

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = Frame

-- Scripts:

local function DXSWV_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	--[[local textButton = script.Parent
	local launchButton = script.Parent.Parent.Parent.Parent.LaunchButton
	
	local isSelected = false
	
	textButton.MouseButton1Click:Connect(function()
		isSelected = not isSelected
		if isSelected then
			textButton.BackgroundColor3 = Color3.fromRGB(8, 8, 8) -- Green when selected
		else
			textButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Red when deselected
		end
	end)
	
	launchButton.MouseButton1Click:Connect(function()
		if isSelected then
			print("hello")
		end
	end)]]
	
end
coroutine.wrap(DXSWV_fake_script)()
local function PFRSM_fake_script() -- LaunchButton.LocalScript 
	local script = Instance.new('LocalScript', LaunchButton)

	script.Parent.MouseButton1Click:Connect(function()
		_G.Key = "2gqsk075oelzamrfettqso9tkzdmu46i"
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Far8228/InDayrecode/refs/heads/main/InDay.lua"))()
	end)
end
coroutine.wrap(PFRSM_fake_script)()
local function TOQYJ_fake_script() -- TextButton_2.LocalScript 
	local script = Instance.new('LocalScript', TextButton_2)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent.Frame.Visible = false
		script.Parent.Parent.Parent.Frame.Active = false
		script.Parent.Parent.Parent.Frame.BackgroundTransparency = 1
	end)
end
coroutine.wrap(TOQYJ_fake_script)()
local function IYTA_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	script.Parent.Active = true
	script.Parent.Draggable = true
end
coroutine.wrap(IYTA_fake_script)()
