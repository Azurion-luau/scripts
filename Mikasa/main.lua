local Mikasafield = loadstring(game:HttpGet("https://raw.githubusercontent.com/Azurion-luau/scripts/refs/heads/main/interface/gui.lua"))()
local HttpService = game:GetService("HttpService")
local placeId = game.PlaceId
local Players = game:GetService("Players")

local success, placeName = pcall(function()
    local universeData = HttpService:JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/" .. placeId .. "/universe"))
    local universeId = universeData.universeId
    local gameData = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games?universeIds=" .. universeId))
    return gameData.data[1].name
end)

if not success then
    placeName = "Unknown Place"
    Mikasafield:Notify({
        Title = "Error",
        Content = "Not possible to get place name!",
        Duration = 6.5,
        Image = "circle-x"
    })
end

-- Carrega o GUI e insere o nome correto da place
local Window = Mikasafield:CreateWindow({
    Name = "Mikasa | " .. placeName .. "0.9",
    Icon = "github",
    LoadingTitle = "Remade of Realms Hub",
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

-- Créditos
local Credits = Window:CreateTab("Credits", "scroll")
Credits:CreateSection("Developers and credits")
Credits:CreateParagraph({
    Title = "🧾 Credits",
    Content = "• UI Base: Rayfield Interface Suite\n• Modified by: AzurionDev\n• Troll version by: David"
})
Credits:CreateSection("Changelog")
Credits:CreateParagraph({
    Title = "About of UI",
    Content = "MikasaFiel is a modified version of Rayfield UI by Azurion."
})

-- Aba de Blox Fruits
local BF = Window:CreateTab("Blox Fruit", "gamepad-2")

BF:CreateButton({
    Name = "Hoho hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
    end,
})

BF:CreateButton({
    Name = "Maru Hub Bypassed!",
    Callback = function()
        local player = Players.LocalPlayer
        player:Kick("You were detected bypassing.")
    end,
})
BF:CreateButton({
    Name = "Maru Hub Bypassed!",
    Callback = function()
        local player = Players.LocalPlayer
        player:Kick("You were detected bypassing.")
    end,
})
BF:CreateButton({
    Name = "W-Azure",
    Callback = function()
        --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
getgenv().Team = "Pirates"
getgenv().FixCrash = false -- Turn it On For Hopping Server, Improve Performance But Silent Aim On Mob And Player
getgenv().FixCrash2 = false -- Turn it On For Hopping Server, Improve Performance But Will Remove Speed Changer
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
    end,
})
