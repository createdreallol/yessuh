local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create the GUI container
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TradeFreezerGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create loading frame
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0.4, 0, 0.2, 0)
loadingFrame.Position = UDim2.new(0.3, 0, 0.4, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = screenGui

-- Create loading text
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 1, 0)
loadingText.Position = UDim2.new(0, 0, 0, 0)
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.GothamBold
loadingText.TextScaled = true
loadingText.Parent = loadingFrame

-- Animate the loading text
local baseText = "🔄 Loading Bongrip's MM2 Menu (This could take up to a few minute)."
local dotCount = 0
local isLoading = true

task.spawn(function()
	while isLoading do
		loadingText.Text = baseText .. string.rep(".", dotCount)
		dotCount = (dotCount + 1) % 4
		task.wait(0.5)
	end
end)
