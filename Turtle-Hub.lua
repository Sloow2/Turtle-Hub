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

Window:Tag({ Title = "Turtle v1", Color = Color3.fromHex("#30ff6a") })

-- Tabs
local HomeTab = Window:Tab({ Title = "Home", Icon = "home", Locked = false })
local MainTab = Window:Tab({ Title = "Main", Icon = "house", Locked = false })
local PetsTab = Window:Tab({ Title = "Pets", Icon = "paw", Locked = false })
local ShopTab = Window:Tab({ Title = "Shop", Icon = "shopping-bag", Locked = false })
local TeleportTab = Window:Tab({ Title = "Teleport", Icon = "location", Locked = false })
local UiSettingsTab = Window:Tab({ Title = "UI Settings", Icon = "cog", Locked = false })

-- Home Tab
local HomeGroup = HomeTab:AddLeftGroupbox("Welcome", "smile")
HomeGroup:AddLabel("Welcome to Turtle Hub!")

-- Main Tab
local MainGroup = MainTab:AddLeftGroupbox("Settings", "wrench")
MainGroup:AddToggle("Enable Feature", {
    Default = false,
    Callback = function(value)
        print("Feature enabled:", value)
    end
})

-- Pets Tab
local PetsGroup = PetsTab:AddLeftGroupbox("Pets Control", "paw")

PetsGroup:AddLabel("Filter: Weight (KG)")
PetsGroup:AddTextBox("Only Sell Below This KG", {
    Default = "5",
    Numeric = true,
    Placeholder = "Enter weight",
    Callback = function(value)
        print("Weight filter set to:", value)
        -- Store this value for your auto-sell logic
        _G.PetWeightFilter = tonumber(value)
    end
})

PetsGroup:AddToggle("Auto Sell Pet", {
    Default = false,
    Tooltip = "Automatically sell pets below weight filter",
    Callback = function(enabled)
        print("Auto Sell Pet toggled:", enabled)
        _G.AutoSellPets = enabled
        -- Add your auto-sell functionality here or start a loop
    end
})

-- Shop Tab
local ShopGroup = ShopTab:AddLeftGroupbox("Shop", "shopping-bag")
ShopGroup:AddLabel("Shop items coming soon!")

-- Teleport Tab
local TeleportGroup = TeleportTab:AddLeftGroupbox("Locations", "map-marker-alt")

local function teleportTo(position)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

TeleportGroup:AddButton("Teleport to Middle Button", function()
    teleportTo(Vector3.new(-93.04, 4.96, -16.54))
end)

TeleportGroup:AddButton("Teleport to Gear Shop", function()
    teleportTo(Vector3.new(-284.44, 3.00, -13.44))
end)

TeleportGroup:AddButton("Teleport to Seed Shop", function()
    teleportTo(Vector3.new(150, 5, -50)) -- Replace with actual coords
end)

TeleportGroup:AddButton("Teleport to Pet Area", function()
    teleportTo(Vector3.new(200, 5, 100)) -- Replace with actual coords
end)

-- UI Settings Tab
local UiSettingsGroup = UiSettingsTab:AddLeftGroupbox("UI Options", "cog")
UiSettingsGroup:AddToggle("Toggle Window Visibility", {
    Default = true,
    Callback = function(value)
        Window:SetVisible(value)
    end
})

-- Example: Auto Sell Pets logic (basic, call this function repeatedly or hook into game events)
spawn(function()
    while true do
        wait(5) -- check every 5 seconds
        if _G.AutoSellPets and _G.PetWeightFilter then
            local player = game.Players.LocalPlayer
            if player and player.Backpack then
                for _, item in pairs(player.Backpack:GetChildren()) do
                    if item:IsA("Tool") and item:FindFirstChild("Weight") then
                        local weightValue = item.Weight.Value
                        if weightValue < _G.PetWeightFilter then
                            print("Selling pet:", item.Name, "Weight:", weightValue)
                            -- Add your sell logic here, e.g. fire remote event
                        end
                    end
                end
            end
        end
    end
end)
