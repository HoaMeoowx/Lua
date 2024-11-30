-- Biến đếm số lần biến hình
local transformationCount = 0

-- Khởi tạo biến toàn cục cho Aura
_G.InfAbility = false

-- Tạo công cụ "Biến Hình"
local tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Biến Hình"
tool.Parent = game.Players.LocalPlayer.Backpack

-- Hàm chạy animation
local function playTransformationAnimation()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    -- Kiểm tra Humanoid và Animator
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

        -- Tạo animation
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://658832070" -- ID của animation Goku biến hình
        local track = animator:LoadAnimation(animation)

        -- Phát animation
        track:Play()
        print("Animation Goku biến hình đã được kích hoạt!")
    else
        warn("Không tìm thấy Humanoid trong nhân vật!")
    end
end

-- Tạo và phát nhạc khi biến hình
local function playTransformationMusic(character)
    -- Kiểm tra xem đã có nhạc phát trong nhân vật chưa
    if character:FindFirstChild("TransformationMusic") then
        character.TransformationMusic:Stop()
    end

    -- Tạo nhạc
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6427919074" -- ID nhạc
    sound.Name = "TransformationMusic"
    sound.Parent = character:FindFirstChild("HumanoidRootPart") -- Gắn nhạc vào HumanoidRootPart
    sound:Play() -- Phát nhạc
end

-- Tạo hiệu ứng ánh sáng khi biến hình (tuỳ chọn)
local function createGlowEffect(character)
    -- Xóa hiệu ứng cũ nếu có
    if character:FindFirstChild("FakeGlow") then
        character.FakeGlow:Destroy()
    end

    -- Tạo ánh sáng tập trung
    local light = Instance.new("SurfaceLight")
    light.Name = "FakeGlow"
    light.Color = Color3.new(1, 0.5, 0) -- Màu cam vàng (Super Saiyan)
    light.Brightness = 10 -- Độ sáng mạnh
    light.Angle = 90 -- Giới hạn góc sáng để không lan ra ngoài
    light.Range = 15 -- Phạm vi ánh sáng
    light.Face = Enum.NormalId.Top -- Chỉ chiếu sáng lên trên
    light.Parent = character:FindFirstChild("HumanoidRootPart")
end

-- Hàm Aura từ mã trước
local function InfAbility()
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
            print("Hiệu ứng Aura đã được kích hoạt!")
        end
    end
end

-- Kết nối sự kiện khi công cụ "Biến Hình" được sử dụng
tool.Activated:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    if character and character:FindFirstChild("HumanoidRootPart") then
        transformationCount += 1 -- Tăng số lần biến hình
        print("Số lần biến hình: " .. transformationCount)

        createGlowEffect(character) -- Kích hoạt ánh sáng
        playTransformationMusic(character) -- Phát nhạc khi biến hình
    end

    playTransformationAnimation() -- Chạy animation

    -- Kích hoạt Aura sau 5 lần biến hình
    if transformationCount >= 5 then
        _G.InfAbility = true
        InfAbility()
    end
end)