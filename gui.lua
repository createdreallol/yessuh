local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Clean up old GUI if it exists
local oldGui = playerGui:FindFirstChild("BongripSplashGui")
if oldGui then
	oldGui:Destroy()
end

-- Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BongripSplashGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- Background overlay
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
bg.BackgroundTransparency = 0.2
bg.Parent = screenGui

-- Main panel
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 500, 0, 220)
panel.Position = UDim2.new(0.5, -250, 0.5, -110)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BorderSizePixel = 0
panel.Parent = bg

local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 14)
panelCorner.Parent = panel

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(70, 70, 70)
stroke.Parent = panel

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 70)
title.Position = UDim2.new(0, 20, 0, 20)
title.BackgroundTransparency = 1
title.Text = "we love you bongrip"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.TextTransparency = 1
title.Parent = panel

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -40, 0, 30)
subtitle.Position = UDim2.new(0, 20, 0, 90)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Loading..."
subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.TextTransparency = 1
subtitle.Parent = panel

-- Loading bar background
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(1, -40, 0, 20)
barBg.Position = UDim2.new(0, 20, 0, 140)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBg.BorderSizePixel = 0
barBg.Parent = panel

local barBgCorner = Instance.new("UICorner")
barBgCorner.CornerRadius = UDim.new(0, 8)
barBgCorner.Parent = barBg

-- Loading bar fill
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

local barFillCorner = Instance.new("UICorner")
barFillCorner.CornerRadius = UDim.new(0, 8)
barFillCorner.Parent = barFill

-- Community button
local communityButton = Instance.new("TextButton")
communityButton.Size = UDim2.new(0, 220, 0, 38)
communityButton.Position = UDim2.new(0.5, -110, 1, -55)
communityButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
communityButton.Text = "Join our community"
communityButton.TextColor3 = Color3.fromRGB(255, 255, 255)
communityButton.Font = Enum.Font.GothamBold
communityButton.TextScaled = true
communityButton.AutoButtonColor = true
communityButton.Visible = false
communityButton.Parent = panel

local communityCorner = Instance.new("UICorner")
communityCorner.CornerRadius = UDim.new(0, 10)
communityCorner.Parent = communityButton

-- Small status text
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, -40, 0, 20)
statusText.Position = UDim2.new(0, 20, 1, -85)
statusText.BackgroundTransparency = 1
statusText.Text = ""
statusText.TextColor3 = Color3.fromRGB(160, 160, 160)
statusText.TextScaled = true
statusText.Font = Enum.Font.Gotham
statusText.Parent = panel

-- Panel intro animation
panel.Size = UDim2.new(0, 0, 0, 0)
panel.Position = UDim2.new(0.5, 0, 0.5, 0)

TweenService:Create(
	panel,
	TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
	{
		Size = UDim2.new(0, 500, 0, 220),
		Position = UDim2.new(0.5, -250, 0.5, -110)
	}
):Play()

task.wait(0.2)

TweenService:Create(
	title,
	TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
	{TextTransparency = 0}
):Play()

TweenService:Create(
	subtitle,
	TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
	{TextTransparency = 0}
):Play()

-- Title pulse animation
task.spawn(function()
	while screenGui.Parent do
		local grow = TweenService:Create(
			title,
			TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			{Rotation = 1}
		)
		local shrink = TweenService:Create(
			title,
			TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
			{Rotation = -1}
		)

		grow:Play()
		grow.Completed:Wait()
		shrink:Play()
		shrink.Completed:Wait()
	end
end)

-- Dots loading animation
local loading = true
task.spawn(function()
	local dots = 0
	while loading do
		subtitle.Text = "Loading" .. string.rep(".", dots)
		dots = (dots + 1) % 4
		task.wait(0.4)
	end
end)

-- Fill loading bar over 4 seconds
local fillTween = TweenService:Create(
	barFill,
	TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
	{Size = UDim2.new(1, 0, 1, 0)}
)
fillTween:Play()
fillTween.Completed:Wait()

loading = false
subtitle.Text = "Loaded"

-- Show community button
communityButton.Visible = true
statusText.Text = ".............."

communityButton.MouseButton1Click:Connect(function()
	-- Roblox does not support directly opening Discord links from a normal game script.
	-- Replace this with your own safe in-game community flow if needed.
	statusText.Text = "discord.gg/GMu5n26G58"
end)

task.wait(2)

-- Fade out GUI
for _, obj in ipairs(panel:GetDescendants()) do
	if obj:IsA("TextLabel") or obj:IsA("TextButton") then
		TweenService:Create(obj, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
	elseif obj:IsA("Frame") then
		TweenService:Create(obj, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
	elseif obj:IsA("UIStroke") then
		TweenService:Create(obj, TweenInfo.new(0.4), {Transparency = 1}):Play()
	end
end

TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
task.wait(0.6)

screenGui:Destroy()
