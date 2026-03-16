# WMacLib
![image](https://github.com/user-attachments/assets/991cd465-8a61-4753-9fa6-dfd590bc4322)
---
**WMacLib** is a fork of the original [MacLib](https://github.com/biggaboy212/Maclib) UI library with bug fixes.

**What's fixed compared to the original:**
 - Sliders work on mobile devices
 - Window dragging no longer cancels on mobile
 - Third window control button now correctly shows as green (like macOS)

---

## Quick Start 

```lua
local WMacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Wicikk/WMacLib/main/WMacLib.lua"))()

local Window = WMacLib:Window({
    Title = "My Script",
    Subtitle = "v1.0",
    Size = UDim2.fromOffset(868, 650),
    DragStyle = 1,
    Keybind = Enum.KeyCode.RightControl,
    AcrylicBlur = true,
    ShowUserInfo = true,
    DisabledWindowControls = {},
})
```

---

## Window Settings

| Parameter | Type | Default | Description |
|---|---|---|---|
| `Title` | string | required | Window title |
| `Subtitle` | string | `""` | Subtitle below title |
| `Size` | UDim2 | `868×650` | Window size |
| `DragStyle` | number | `1` | `1` = drag by title bar, `2` = drag anywhere |
| `Keybind` | Enum.KeyCode | — | Toggle window visibility |
| `AcrylicBlur` | boolean | `true` | Background blur effect |
| `ShowUserInfo` | boolean | `true` | Show player avatar/name in sidebar |
| `DisabledWindowControls` | table | `{}` | Disable buttons e.g. `{"Exit", "Minimize"}` |

---

## Creating Tabs

```lua
local TabGroup = Window:TabGroup()

local MainTab = TabGroup:Tab({
    Name = "Main",
    Image = "rbxassetid://18821914323"
})

local Section = MainTab:Section({})
```

---

## Elements

### Button
```lua
Section:Button({
    Name = "Click Me",
    Callback = function()
        print("Clicked!")
    end,
})
```

### Toggle
```lua
Section:Toggle({
    Name = "Toggle",
    Default = false,
    Callback = function(value)
        print("State:", value)
    end,
}, "MyToggleFlag")
```

### Slider
```lua
Section:Slider({
    Name = "Speed",
    Default = 50,
    Minimum = 0,
    Maximum = 100,
    Precision = 0,
    DisplayMethod = "Value",  -- "Value" | "Percent" | "Degrees" | "Round" | "Tenths" | "Hundredths"
    Prefix = "",
    Suffix = "",
    Callback = function(value)
        print("Value:", value)
    end,
    onInputComplete = function(value)
        print("Released at:", value)
    end,
}, "MySliderFlag")
```

### Input
```lua
Section:Input({
    Name = "Name",
    Placeholder = "Type here...",
    AcceptedCharacters = "All",  -- "All" | "Numbers" | "Letters"
    Callback = function(text)
        print("Submitted:", text)
    end,
    onChanged = function(text)
        print("Changed:", text)
    end,
}, "MyInputFlag")
```

### Keybind
```lua
Section:Keybind({
    Name = "Sprint",
    Blacklist = false,
    Callback = function(key)
        print("Pressed:", key.Name)
    end,
    onBinded = function(key)
        print("Bound to:", key.Name)
    end,
}, "MyKeybindFlag")
```

### Colorpicker
```lua
Section:Colorpicker({
    Name = "Color",
    Default = Color3.fromRGB(0, 255, 255),
    Callback = function(color)
        print("Color:", color)
    end,
}, "MyColorFlag")

-- With alpha (transparency)
Section:Colorpicker({
    Name = "Color + Alpha",
    Default = Color3.fromRGB(255, 0, 0),
    Alpha = 0,
    Callback = function(color, alpha)
        print("Color:", color, "Alpha:", alpha)
    end,
}, "MyAlphaColorFlag")
```

### Dropdown
```lua
Section:Dropdown({
    Name = "Fruit",
    Options = {"Apple", "Banana", "Orange"},
    Default = 1,
    Multi = false,
    Required = true,
    Callback = function(value)
        print("Selected:", value)
    end,
}, "MyDropdownFlag")

-- Multi-select with search
Section:Dropdown({
    Name = "Fruits",
    Options = {"Apple", "Banana", "Orange"},
    Default = {"Apple", "Banana"},
    Multi = true,
    Search = true,
    Required = false,
    Callback = function(values)
        for value, state in next, values do
            print(value, state)
        end
    end,
}, "MyMultiDropdownFlag")
```

### Header
```lua
Section:Header({ Name = "Section Title" })
```

### Paragraph
```lua
Section:Paragraph({
    Header = "Title",
    Body = "Some descriptive text here."
})
```

### Label
```lua
Section:Label({ Text = "Some text." })
```

### SubLabel
```lua
Section:SubLabel({ Text = "Smaller text." })
```

### Divider
```lua
Section:Divider()
```

---

## Global Settings

```lua
Window:GlobalSetting({
    Name = "UI Blur",
    Default = true,
    Callback = function(bool)
        Window:SetAcrylicBlurState(bool)
    end,
})
```

---

## Notifications

```lua
Window:Notify({
    Title = "My Script",
    Description = "Something happened!",
    Lifetime = 5,
})
```

---

## Dialog

```lua
Window:Dialog({
    Title = "Confirm",
    Description = "Are you sure?",
    Buttons = {
        {
            Name = "Yes",
            Callback = function()
                print("Confirmed")
            end,
        },
        { Name = "No" }
    }
})
```

---

## Window API

| Method | Description |
|---|---|
| `Window:Notify({...})` | Show a notification |
| `Window:Dialog({...})` | Show a dialog popup |
| `Window:SetState(bool)` | Show/hide the window |
| `Window:GetState()` | Returns `true` if visible |
| `Window:Unload()` | Destroy the UI |
| `Window.onUnloaded(fn)` | Callback when UI is destroyed |
| `Window:SetKeybind(KeyCode)` | Change the toggle keybind |
| `Window:SetScale(number)` | Set UI scale (e.g. `1.2`) |
| `Window:GetScale()` | Get current scale |
| `Window:SetSize(UDim2)` | Resize the window |
| `Window:GetSize()` | Get current size |
| `Window:SetAcrylicBlurState(bool)` | Toggle blur |
| `Window:GetAcrylicBlurState()` | Get blur state |
| `Window:SetUserInfoState(bool)` | Show/hide user info panel |
| `Window:GetUserInfoState()` | Get user info state |
| `Window:SetNotificationsState(bool)` | Enable/disable notifications |
| `Window:GetNotificationsState()` | Get notifications state |
| `Window:UpdateTitle(string)` | Update title text |
| `Window:UpdateSubtitle(string)` | Update subtitle text |

---

## Config System

```lua
WMacLib:SetFolder("MyScriptName")

-- In the settings tab:
tabs.Settings:InsertConfigSection()

-- Load saved config on start:
WMacLib:LoadAutoLoadConfig()
```

Configs are saved to `MyScriptName/` in the executor's file system. Each element with a `Flag` will be saved and restored automatically.

---

## Demo

```lua
local WMacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Wicikk/WMacLib/main/WMacLib.lua"))()
WMacLib:Demo()
```

Loads a full demo window showcasing all elements.
