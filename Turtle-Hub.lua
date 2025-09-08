local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Turtle Hub",
    Icon = "door-open",
    Author = "Rasmus, discord: tl266",
    Folder = "MySuperHub",
    Size = UDim2.fromOffset(290, 230),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 165,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    AutoShow = true,
})

Window:Tag({
    Title = "Turtle v1",
    Color = Color3.fromHex("#30ff6a")
})

-- Tabs
local HomeTab = Window:Tab({ Title = "Home", Icon = "home", Locked = false })
local MainTab = Window:Tab({ Title = "Main", Icon = "house", Locked = false })
local PetsTab = Window:Tab({ Title = "Pets", Icon = "paw", Locked = false })
local ShopTab = Window:Tab({ Title = "Shop", Icon = "shopping-bag", Locked = false })
local TeleportTab = Window:Tab({ Title = "Teleport", Icon = "location", Locked = false })
local UiSettingsTab = Window:Tab({ Title = "UI Settings", Icon = "cog", Locked = false })

-- Example groupboxes for other tabs (you can customize as needed)
local HomeGroup = HomeTab:AddLeftGroupbox("Welcome", "smile")
HomeGroup:AddLabel("Welcome to Turtle Hub!")

local MainGroup = MainTab:AddLeftGroupbox("Settings", "wrench")
MainGroup:AddToggle("Enable Feature", {
    Default = false,
    Callback = function(value)
        print("Feature enabled:", value)
    end
})

local PetsGroup = PetsTab:AddLeftGroupbox("Pets Info", "paw")
PetsGroup:AddLabel("Manage your pets here.")

local ShopGroup = ShopTab:AddLeftGroupbox("Shop", "shopping-bag")
ShopGroup:AddLabel("Shop items coming soon!")

-- Teleport groupbox and buttons
local TeleportGroup = TeleportTab:AddLeftGroupbox("Locations", "map-marker-alt")

TeleportGroup:AddButton("Teleport to Middle Button", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-93.04, 4.96, -16.54)
    end
end)

TeleportGroup:AddButton("Teleport to Gear Shop", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-284.44, 3.00, -13.44)
    end
end)

-- UI Settings tab example
local UiSettingsGroup = UiSettingsTab:AddLeftGroupbox("UI Options", "cog")
UiSettingsGroup:AddToggle("Toggle Window Visibility", {
    Default = true,
    Callback = function(value)
        Window:SetVisible(value)
    end
})

