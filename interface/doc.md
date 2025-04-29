Here's a cleaner, more professional, and well-structured English rewrite of your Markdown documentation for **MikasaFiel**, improving grammar, formatting, and clarity:

---

# MikasaFiel — A Custom Version of Rayfield UI

## 📦 Loading MikasaFiel
```lua
local Mikasafield = loadstring(game:HttpGet("https://raw.githubusercontent.com/Azurion-luau/scripts/refs/heads/main/interface/gui.lua"))()
```

---

## 🪟 Creating a Window
```lua
local Window = Mikasafield:CreateWindow({
   Name = "Mikasa | [Your Script Name] V0.1",
   Icon = "github", -- Uses a Lucide icon
   LoadingTitle = "I love you :D",
   LoadingSubtitle = "by Azurion",
   Theme = "Ocean",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided.",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})
```

---

## 🗂️ Creating Tabs

### Basic Tab
```lua
local Tab = Window:CreateTab("Tab Example", 4483362458)
```

### Tab with Lucide Icon
You can use Lucide Icons instead of image IDs:
```lua
local Tab = Window:CreateTab("Tab Example", "rewind")
```

> This sets the icon to the "rewind" symbol from Lucide.  
> See the full list of supported Lucide Icons for more options.

---

## 📑 Creating Sections and Elements

### Create Section
```lua
local Section = Tab:CreateSection("Section Example")
```

### Update Section
```lua
Section:Set("Updated Section Title")
```

### Create Divider
```lua
local Divider = Tab:CreateDivider()
```

### Update Divider
```lua
Divider:Set(false) -- true to show, false to hide
```

---

## 🧼 Destroying the Interface
```lua
Mikasafield:Destroy()
```

---

## 🎨 Themes
Available themes:

```
Theme Name      - Identifier
-----------------------------
Default         - Default
Amber Glow      - AmberGlow
Amethyst        - Amethyst
Bloom           - Bloom
Dark Blue       - DarkBlue
Green           - Green
Light           - Light
Ocean           - Ocean
Serenity        - Serenity
```

---

## 🔔 Notifications

### Basic Notification
```lua
Rayfield:Notify({
   Title = "Notification Title",
   Content = "This is the notification message.",
   Duration = 6.5,
   Image = 4483362458
})
```

### With Lucide Icon
```lua
Rayfield:Notify({
   Title = "Notification Title",
   Content = "Using a Lucide icon!",
   Duration = 6.5,
   Image = "rewind"
})
```

---

## 🔘 Creating Buttons & Toggles

### Button
```lua
local Button = Tab:CreateButton({
   Name = "Click Me",
   Callback = function()
      -- Action when button is clicked
   end,
})
```

#### Update Button
```lua
Button:Set("New Button Name")
```

### Toggle
```lua
local Toggle = Tab:CreateToggle({
   Name = "Enable Feature",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      -- true or false
   end,
})
```

#### Update Toggle
```lua
Toggle:Set(true)
```

---

## 🎨 Color Picker
```lua
local ColorPicker = Tab:CreateColorPicker({
    Name = "Pick a Color",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorPicker1",
    Callback = function(Value)
        -- Value is a Color3
    end
})
```

#### Update Color
```lua
ColorPicker:Set(Color3.fromRGB(255,255,255))
```

---

## 🎚️ Slider
```lua
local Slider = Tab:CreateSlider({
   Name = "Volume",
   Range = {0, 100},
   Increment = 10,
   Suffix = "%",
   CurrentValue = 50,
   Flag = "Slider1",
   Callback = function(Value)
      -- Value is a number
   end,
})
```

#### Update Slider
```lua
Slider:Set(75)
```

---

## ⌨️ TextBox
```lua
local Input = Tab:CreateInput({
   Name = "Enter Name",
   CurrentValue = "",
   PlaceholderText = "Type here...",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      -- Text is a string
   end,
})
```

#### Update Input
```lua
Input:Set("New Value")
```

---

## 🧾 Dropdown Menu
```lua
local Dropdown = Tab:CreateDropdown({
   Name = "Select Option",
   Options = {"Option A", "Option B"},
   CurrentOption = {"Option A"},
   MultipleOptions = false,
   Flag = "Dropdown1",
   Callback = function(Options)
      -- Options is a table
   end,
})
```

### Update Dropdown
```lua
Dropdown:Set({"Option B"})
```

### Refresh Dropdown Options
```lua
Dropdown:Refresh({"New 1", "New 2", "New 3"})
```

---

## 🕹️ Keybinds
```lua
local Keybind = Tab:CreateKeybind({
   Name = "Quick Action",
   CurrentKeybind = "Q",
   HoldToInteract = false,
   Flag = "Keybind1",
   Callback = function(Keybind)
      -- Triggered when key is pressed
   end,
})
```

### Update Keybind
```lua
Keybind:Set("RightCtrl")
```

---

## 📝 Labels & Paragraphs

### Label with Icon
```lua
local Label = Tab:CreateLabel("Status: Active", "github") -- Title, Icon
```

### Update Label
```lua
Label:Set("Updated Status", "rewind")
```

### Paragraph
```lua
local Paragraph = Tab:CreateParagraph({
   Title = "About This Script",
   Content = "MikasaFiel is a modified version of Rayfield UI by Azurion."
})
```

### Update Paragraph
```lua
Paragraph:Set({
   Title = "New Title",
   Content = "Updated content goes here."
})
```

---

## 🧾 Credits

- **UI Base:** [Rayfield Interface Suite](https://docs.sirius.menu/rayfield)
- **Icons:** [Lucide Icons](https://lucide.dev/)
- **Modified by:** AzurionDev
