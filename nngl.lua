-- Khởi tạo biến toàn cục
_G.InfAbility = true

-- Tạo công cụ teleport
local tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Aura"

-- Hàm kiểm tra và tạo hiệu ứng "Agility"
function InfAbility()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    if _G.InfAbility then
        if not rootPart:FindFirstChild("Agility") then
            local fW = Instance.new("ParticleEmitter")
            fW.Acceleration = Vector3.new(0, 0, 0)
            fW.Archivable = true
            fW.Drag = 20
            fW.EmissionDirection = Enum.NormalId.Top
            fW.Enabled = true
            fW.Lifetime = NumberRange.new(0.2, 0.2)
            fW.LightInfluence = 0
            fW.LockedToPart = true
            fW.Name = "Agility"
            fW.Rate = 500
            local fX = {
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 4)
            }
            fW.Size = NumberSequence.new(fX)
            fW.RotSpeed = NumberRange.new(999, 9999)
            fW.Rotation = NumberRange.new(0, 0)
            fW.Speed = NumberRange.new(30, 30)
            fW.SpreadAngle = Vector2.new(360, 360)
            fW.Texture = "rbxassetid://243098098"
            fW.VelocityInheritance = 0
            fW.ZOffset = 2
            fW.Transparency = NumberSequence.new(0)
            fW.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255), Color3.fromRGB(0, 255, 255))
            fW.Parent = rootPart
        end
    else
        if rootPart:FindFirstChild("Agility") then
            rootPart:FindFirstChild("Agility"):Destroy()
        end
    end
end

-- Kết nối công cụ với logic bật/tắt hiệu ứng
tool.Activated:Connect(function()
    _G.InfAbility = not _G.InfAbility -- Đảo trạng thái
    InfAbility() -- Kích hoạt logic
end)

-- Thêm công cụ vào nhân vật
local player = game.Players.LocalPlayer
tool.Parent = player:WaitForChild("Backpack")