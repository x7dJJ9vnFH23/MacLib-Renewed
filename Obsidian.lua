-- Example

local WMacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Wicikk/WMacLib/refs/heads/main/Misc/WMacLib__7_%20(7).lua"))()

local Window = WMacLib:Window({
	Title = WMacLib:Gradient("Obsidian", Color3.fromRGB(73, 230, 133), Color3.fromRGB(100, 150, 255)),
	Subtitle = "v2.1.0",
	Size = UDim2.fromOffset(568, 420),
	DragStyle = 1,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
	ShowUserInfo = true,
	DisabledWindowControls = {},
})

local TabGroup = Window:TabGroup()

local Tabs = {
	Aimbot   = TabGroup:Tab({ Name = "Aimbot",   Image = "lucide/crosshair" }),
	Visuals  = TabGroup:Tab({ Name = "Visuals",  Image = "lucide/eye" }),
	Player   = TabGroup:Tab({ Name = "Player",   Image = "lucide/person-standing" }),
	Misc     = TabGroup:Tab({ Name = "Misc",     Image = "lucide/settings" }),
	Settings = TabGroup:Tab({ Name = "Settings", Image = "lucide/sliders-horizontal" }),
}

-- // Aimbot

local AimbotSection = Tabs.Aimbot:Section({})

AimbotSection:Toggle({
	Name = WMacLib:Gradient("Aimbot", Color3.fromRGB(73, 230, 133), Color3.fromRGB(100, 150, 255)),
	Default = false,
	Callback = function(value)
		-- aimbot logic
	end,
}, "Aimbot")

AimbotSection:Slider({
	Name = "FOV",
	Default = 120,
	Minimum = 10,
	Maximum = 360,
	Precision = 0,
	DisplayMethod = "Degrees",
	Callback = function(value)
		-- set fov circle size
	end,
}, "AimbotFOV")

AimbotSection:Slider({
	Name = "Smoothness",
	Default = 5,
	Minimum = 1,
	Maximum = 20,
	Precision = 1,
	DisplayMethod = "Tenths",
	Callback = function(value)
		-- set smooth factor
	end,
}, "AimbotSmooth")

AimbotSection:Dropdown({
	Name = "Target Part",
	Options = { "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso" },
	Default = 1,
	Multi = false,
	Required = true,
	Callback = function(value)
		-- set target hitbox
	end,
}, "AimbotPart")

AimbotSection:Dropdown({
	Name = "Target Team",
	Options = { "All", "Enemies Only", "Teammates Only" },
	Default = 2,
	Multi = false,
	Required = true,
	Callback = function(value)
		-- filter by team
	end,
}, "AimbotTeam")

AimbotSection:Toggle({
	Name = "Prediction",
	Default = true,
	Callback = function(value)
		-- toggle movement prediction
	end,
}, "AimbotPrediction")

AimbotSection:Slider({
	Name = "Prediction Strength",
	Default = 50,
	Minimum = 0,
	Maximum = 100,
	Precision = 0,
	DisplayMethod = "Percent",
	Callback = function(value)
		-- set prediction multiplier
	end,
}, "AimbotPredStrength")

AimbotSection:Toggle({
	Name = "Visible Check",
	Default = true,
	Callback = function(value)
		-- only target visible players
	end,
}, "AimbotVisCheck")

AimbotSection:Toggle({
	Name = "Show FOV Circle",
	Default = true,
	Callback = function(value)
		-- toggle fov circle drawing
	end,
}, "AimbotFOVCircle")

AimbotSection:Colorpicker({
	Name = "FOV Circle Color",
	Default = Color3.fromRGB(255, 255, 255),
	Alpha = 0.5,
	Callback = function(color, alpha)
		-- update fov circle color
	end,
}, "AimbotFOVColor")

AimbotSection:Keybind({
	Name = "Aimbot Key",
	Blacklist = false,
	Callback = function(key)
		-- hold to aim
	end,
	onBinded = function(key)
		Window:Notify({
			Title = "Obsidian",
			Description = "Aimbot key set to " .. key.Name,
			Lifetime = 3,
		})
	end,
}, "AimbotKey")

-- // Visuals

local VisualsSection = Tabs.Visuals:Section({})

VisualsSection:Toggle({
	Name = WMacLib:Gradient("ESP", Color3.fromRGB(73, 230, 133), Color3.fromRGB(100, 150, 255)),
	Default = false,
	Callback = function(value)
		-- toggle esp
	end,
}, "ESP")

VisualsSection:Toggle({
	Name = "Box ESP",
	Default = true,
	Callback = function(value)
		-- toggle box drawing
	end,
}, "ESPBox")

VisualsSection:Toggle({
	Name = "Name ESP",
	Default = true,
	Callback = function(value)
		-- toggle name tag
	end,
}, "ESPName")

VisualsSection:Toggle({
	Name = "Health Bar",
	Default = true,
	Callback = function(value)
		-- toggle health bar
	end,
}, "ESPHealth")

VisualsSection:Toggle({
	Name = "Distance",
	Default = false,
	Callback = function(value)
		-- toggle distance label
	end,
}, "ESPDistance")

VisualsSection:Slider({
	Name = "Max Distance",
	Default = 500,
	Minimum = 50,
	Maximum = 2000,
	Precision = 0,
	DisplayMethod = "Value",
	Suffix = " studs",
	Callback = function(value)
		-- set max render distance
	end,
}, "ESPMaxDist")

VisualsSection:Colorpicker({
	Name = "ESP Color",
	Default = Color3.fromRGB(255, 50, 50),
	Callback = function(color)
		-- update esp color
	end,
}, "ESPColor")

VisualsSection:Toggle({
	Name = "Chams",
	Default = false,
	Callback = function(value)
		-- toggle chams
	end,
}, "Chams")

VisualsSection:Colorpicker({
	Name = "Chams Color",
	Default = Color3.fromRGB(255, 100, 0),
	Alpha = 0.3,
	Callback = function(color, alpha)
		-- update chams material color + transparency
	end,
}, "ChamsColor")

-- // Player

local PlayerSection = Tabs.Player:Section({})

PlayerSection:Toggle({
	Name = WMacLib:Gradient("Speed", Color3.fromRGB(73, 230, 133), Color3.fromRGB(100, 150, 255)),
	Default = false,
	Callback = function(value)
		-- toggle speed
	end,
}, "Speed")

PlayerSection:Slider({
	Name = "Walk Speed",
	Default = 16,
	Minimum = 1,
	Maximum = 200,
	Precision = 0,
	DisplayMethod = "Value",
	Callback = function(value)
		-- set walkspeed
	end,
}, "WalkSpeed")

PlayerSection:Toggle({
	Name = "Infinite Jump",
	Default = false,
	Callback = function(value)
		-- toggle infinite jump
	end,
}, "InfJump")

PlayerSection:Slider({
	Name = "Jump Power",
	Default = 50,
	Minimum = 1,
	Maximum = 500,
	Precision = 0,
	DisplayMethod = "Value",
	Callback = function(value)
		-- set jump power
	end,
}, "JumpPower")

PlayerSection:Toggle({
	Name = "Noclip",
	Default = false,
	Callback = function(value)
		-- toggle noclip
	end,
}, "Noclip")

PlayerSection:Toggle({
	Name = "Anti-AFK",
	Default = true,
	Callback = function(value)
		-- toggle anti afk
	end,
}, "AntiAFK")

PlayerSection:Toggle({
	Name = "Full Bright",
	Default = false,
	Callback = function(value)
		-- toggle fullbright
	end,
}, "FullBright")

-- // Misc

local MiscSection = Tabs.Misc:Section({})

MiscSection:Dropdown({
	Name = "Theme",
	Options = WMacLib:GetThemes(),
	Default = 1,
	Multi = false,
	Required = true,
	Callback = function(value)
		WMacLib:SetTheme(value)
	end,
}, "Theme")

MiscSection:Toggle({
	Name = "User Info",
	Default = true,
	Callback = function(value)
		Window:SetUserInfoState(value)
	end,
})

MiscSection:Button({
	Name = "Rejoin",
	Callback = function()
		Window:Dialog({
			Title = "Obsidian",
			Description = "Are you sure you want to rejoin?",
			Buttons = {
				{
					Name = "Rejoin",
					Callback = function()
						-- rejoin logic
					end,
				},
				{ Name = "Cancel" }
			}
		})
	end,
})

MiscSection:Button({
	Name = "Unload",
	Callback = function()
		Window:Unload()
	end,
})

-- // Settings

Tabs.Settings:InsertConfigSection()

-- // Init

WMacLib:SetFolder("Obsidian")

local watermark = WMacLib:Watermark({ Name = "Obsidian", Version = "v2.1.0" })

local RunService = game:GetService("RunService")
local fpsCount, elapsed = 0, 0
RunService.RenderStepped:Connect(function(dt)
	fpsCount += 1
	elapsed += dt
	if elapsed >= 0.5 then
		watermark:Set("FPS", math.round(fpsCount / elapsed) .. " fps")
		fpsCount = 0
		elapsed = 0
	end
end)

Window.onUnloaded(function()
	watermark:Destroy()
end)

WMacLib:LoadAutoLoadConfig()
Tabs.Aimbot:Select()

Window:Notify({
	Title = "Obsidian",
	Description = "Loaded successfully! Press RightCtrl to toggle.",
	Lifetime = 5,
})
