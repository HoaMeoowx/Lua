local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/TurboLite/UI/main/Ui.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Turbo Lite",
    SubTitle = "Premium",
    TabWidth = 110,
    Size = UDim2.fromOffset(480, 320),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    M = Window:AddTab({ Title = "Trang Chủ", Icon = "" }),
    Main = Window:AddTab({ Title = "Auto Farm", Icon = "" }),
    Home = Window:AddTab({ Title = "Trạng Thái", Icon = "" }),
    item = Window:AddTab({ Title = "Auto Item", Icon = "" }),
    C = Window:AddTab({ Title = "Kill Player", Icon = "" }),
    tele = Window:AddTab({ Title = "Dịch Chuyển", Icon = "" }),
    an = Window:AddTab({ Title = "Config Misc", Icon = "" }),
    meo = Window:AddTab({ Title = "Đảo Bí Ẩn", Icon = "" }),
    Race = Window:AddTab({ Title = "Trial Tộc V4", Icon = "" }),
    Raid = Window:AddTab({ Title = "Raid Fruit", Icon = "" }),
    Melee = Window:AddTab({ Title = "Cửa Hàng", Icon = "" })
}

local Options = Fluent.Options

--//ScreenGui
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=18919385586"

UICorner.CornerRadius = UDim.new(0, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local function playSound()
    local sound = Instance.new("Sound", game:GetService("CoreGui"))
    sound.SoundId = "rbxassetid://"
    sound.Volume = 10
    sound:Play()
end

playSound()

repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Energy")
wait(0.5)
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
if game.PlaceId == 2753915549 then
        AnDepZai1 = true
    elseif game.PlaceId == 4442272183 then
        AnDepZai2 = true
    elseif game.PlaceId == 7449423635 then
        AnDepZai3 = true
    else
    game:GetService("Players").LocalPlayer:Kick(" Con Đĩ Mẹ Mày")
  end
      
         hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death), function()end)
        hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Respawn), function()end)
    
 local Toggle = Tabs.M:AddToggle("Turn V4", { Title = "Auto Click", Default = true })
Toggle:OnChanged(function(Value)
        _G.AutoClick = Value
    end    
})

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoClick or Fastattack then
             pcall(function()
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
   end)
              