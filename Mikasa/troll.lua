local RayfieldMod = loadstring(game:HttpGet('https://raw.githubusercontent.com/Azurion-luau/scripts/refs/heads/main/interface/gui.lua'))()
local Window = RayfieldMod:CreateWindow({
    Name = "Realms Hub | Troll version",
    Icon = 0,
    LoadingTitle = "Rayfield modded Azurion Interface Suite",
    LoadingSubtitle = "by Azur",
    Theme = "Default",
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
    KeySystem = true,
    KeySettings = {
        Title = "Realms Hub",
        Subtitle = "Key System",
        Note = "key: realms",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"realms"}
    }
})

local test = Window:CreateTab("Test", "github")
local Tab = Window:CreateTab("Troll sussy", "app-window-mac")

local Players  = game:GetService("Players")
local player     = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root      = character:WaitForChild("HumanoidRootPart")

-- Tornar visível em 1ª pessoa
for _, desc in pairs(character:GetDescendants()) do
    if desc:IsA("BasePart") then
        desc.LocalTransparencyModifier = 0
    end
end

-- Criar partes quadradas
local function createPart(size, color)
    local p = Instance.new("Part")
    p.Size = size
    p.Material = Enum.Material.SmoothPlastic
    p.Color = color
    p.Anchored = false
    p.CanCollide = false
    p.Massless = true
    p.Parent = workspace
    return p
end

-- Função para criar o macarrão quadrado e as bolas quadradas
local function createMacarron()
    -- Criar macarrão (agora quadrado)
    local macaroon = createPart(Vector3.new(1, 7.5, 1), Color3.fromRGB(150, 150, 150))  -- Tamanho no eixo X alterado para 1
    local ball1    = createPart(Vector3.new(1.6, 1.6, 1.6), Color3.fromRGB(150, 150, 150))  -- Agora a bola é quadrada
    local ball2    = createPart(Vector3.new(1.6, 1.6, 1.6), Color3.fromRGB(150, 150, 150))  -- Agora a bola é quadrada

    -- Attachment do torso (4 studs para frente)
    local rootAttachment = Instance.new("Attachment", root)
    rootAttachment.Position = Vector3.new(0, -0.6, -4)  -- Posição ajustada para o macarrão ficar mais à frente
    rootAttachment.Rotation = Vector3.new(-90, 0, 0)

    -- Attachment do macarrão (invertido)
    local macAtt = Instance.new("Attachment", macaroon)
    macAtt.Position = Vector3.new(0, 3, 0)
    macAtt.Rotation = Vector3.new(0, 0, 180)

    -- Attachments das bolas (em cima, pois macarrão está de cabeça para baixo)
    local ballAtt1 = Instance.new("Attachment", macaroon)
    ballAtt1.Position = Vector3.new(-1.2, -2.3, 0)

    local ballAtt2 = Instance.new("Attachment", macaroon)
    ballAtt2.Position = Vector3.new( 1.2, -2.3, 0)

    -- Função de fixação
    local function attach(p, att0)
        local att1 = Instance.new("Attachment", p)
        att1.Position = Vector3.new(0, 0, 0)
        local ap = Instance.new("AlignPosition", p)
        ap.Attachment0 = att1
        ap.Attachment1 = att0
        ap.RigidityEnabled = false
        ap.MaxForce = 9000
        ap.Responsiveness = 50
        local ao = Instance.new("AlignOrientation", p)
        ao.Attachment0 = att1
        ao.Attachment1 = att0
        ao.RigidityEnabled = false
        ao.MaxTorque = 9000
        ao.Responsiveness = 50
        p.CustomPhysicalProperties = PhysicalProperties.new(0.1, 0.3, 0.5)
    end

    -- Aplicar fixações
    attach(macaroon, rootAttachment)
    attach(ball1, ballAtt1)
    attach(ball2, ballAtt2)

    return macaroon, rootAttachment -- Retorna o macarrão e o attachment
end

-- Variável para armazenar o macarrão e seu attachment
local macaroonInstance = nil
local rootAttachmentInstance = nil
local isMoving = false
local moveDirection = 1
local moveSpeed = 0.2  -- Velocidade de movimento ajustável
local moveDistance = 2    -- Distância total que ele se move.
local moveConnection

-- Criar o botão UI para criar/destruir o macarrão
local createDestroyButton = Tab:CreateButton({
    Name = "Criar/Destruir Macarrão",
    Callback = function()
        -- Quando o botão for pressionado, essa função será chamada
        if macaroonInstance == nil then
            -- Se o macarrão não existir, cria ele
            macaroonInstance, rootAttachmentInstance = createMacarron() -- Guarda a instancia do attachment
        else
            -- Se o macarrão existir, deleta ele
            macaroonInstance:Destroy()
            macaroonInstance = nil
            isMoving = false
            if moveConnection then
                moveConnection:Disconnect()
                moveConnection = nil
            end
        end
    end,
})

-- Criar o botão UI para mover o macarrão
local moveButton = Tab:CreateButton({
    Name = "Mover Macarrão",
    Callback = function()
        if macaroonInstance then
            if not isMoving then
                isMoving = true
                moveDirection = 1
                moveConnection = game:GetService("RunService").Heartbeat:Connect(moveMacaroon)
            else
                isMoving = false
                if moveConnection then
                    moveConnection:Disconnect()
                    moveConnection = nil
                end
            end
        end
    end
})
