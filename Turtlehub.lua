local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TurtleHub"
screenGui.Parent = game.CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 150)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
mainFrame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🐢 Turtle Hub"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 28
titleLabel.Parent = mainFrame

local loadButton = Instance.new("TextButton")
loadButton.Size = UDim2.new(0.8, 0, 0, 50)
loadButton.Position = UDim2.new(0.1, 0, 0, 70)
loadButton.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
loadButton.TextColor3 = Color3.new(1, 1, 1)
loadButton.Font = Enum.Font.Gotham
loadButton.TextSize = 22
loadButton.Text = "Load External Script"
loadButton.Parent = mainFrame

loadButton.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua", true))()
    end)
end)
