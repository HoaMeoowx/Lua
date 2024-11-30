-- Chức năng chạy siêu nhanh với hiệu ứng "Agility"
local function InfAb()
    local character = plr.Character
    if not character then
        print("Nhân vật chưa tải xong!")
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if not humanoid then
        print("Không tìm thấy Humanoid!")
        return
    end

    if not rootPart then
        print("Không tìm thấy HumanoidRootPart!")
        return
    end

    -- Thiết lập tốc độ
    humanoid.WalkSpeed = InfAbility and WalkSpeedFast or WalkSpeedNormal

    -- Tạo hiệu ứng "Agility" nếu chưa tồn tại
    if not rootPart:FindFirstChild("Agility") then
        print("Đang tạo hiệu ứng 'Agility'...")
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
        print("Hiệu ứng 'Agility' đã được thêm!")
    else
        print("Hiệu ứng 'Agility' đã tồn tại.")
    end
end

-- Vòng lặp liên tục để duy trì chức năng
spawn(function()
    while wait() do
        InfAb()
    end
end)