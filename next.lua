local ScreenGui = Instance.new("ScreenGui")
local NextButton = Instance.new("TextButton")

-- Tạo GUI
ScreenGui.Name = "NextPlayerGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tạo nút "Next Player"
NextButton.Name = "NextPlayerButton"
NextButton.Parent = ScreenGui
NextButton.Text = "Next Player"
NextButton.Size = UDim2.new(0, 200, 0, 50)
NextButton.Position = UDim2.new(0.5, -100, 0.5, -25)
NextButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
NextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NextButton.Font = Enum.Font.SourceSans
NextButton.TextSize = 24

-- Biến toàn cục
_G.AutoFarmBounty = true

-- Khi nhấp nút "Next Player", bật tắt NextplySelect
NextButton.MouseButton1Click:Connect(function()
    NextplySelect = true
    wait(0.2)
    NextplySelect = false
end)

-- Tự động farm bounty
spawn(function()
    while wait() do
        if _G.AutoFarmBounty then
            for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                if not v.Humanoid.Health == 0 or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or not v.Parent then
                    NextplySelect = true
                    wait(0.2)
                    NextplySelect = false
                end
            end
        end
    end
end)

-- Xử lý thông báo
spawn(function()
    while wait() do
        if _G.AutoFarmBounty then
            for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                if v.Name == "NotificationTemplate" then
                    if string.find(v.Text, "attack") or string.find(v.Text, "players") or string.find(v.Text, "Players") or string.find(v.Text, "Safe Zone!") then
                        NextplySelect = true
                        wait(0.0000000000000000000000000000000001)
                        NextplySelect = false
                    end
                end
            end
        end
    end
end)