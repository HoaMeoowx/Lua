-----getgen().config-----------
_G.ConfigUse = true
if _G.ConfigUse then
    if getgenv().config["Melee"] then
        Melee = true
    end
    if getgenv().config["Sword"] then
        Sword = true
    end
    if getgenv().config["Gun"] then
        Gun = true
    end
    if getgenv().config["Devil Fruit"] then
        DF = true
    end
end
-------Cusc----------
local osfunc = {}
local uihide = false
local abc = false
local currentpage = ""
local keybind = keybind or Enum.KeyCode.RightControl
local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")
-- Instances:

-- Generated using RoadToGlory's Converter v1.1 (RoadToGlory#9879)
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end       
-- Instances:

local Converted = {
	["_ScreenGui"] = Instance.new("ScreenGui");
	["_Next Ply1"] = Instance.new("TextButton");
	["_UICorner7"] = Instance.new("UICorner");
}

-- Properties:

Converted["_ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_ScreenGui"].Parent = game:GetService("CoreGui")

Converted["_Next Ply"].Font = Enum.Font.SourceSansBold
Converted["_Next Ply"].Text = "Next Players"
Converted["_Next Ply"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Next Ply"].TextSize = 14
Converted["_Next Ply"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Next Ply"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Next Ply"].BorderSizePixel = 0
Converted["_Next Ply"].Position = UDim2.new(0.046683047, 0, 0.740331471, 0)
Converted["_Next Ply"].Size = UDim2.new(0, 116, 0, 37)
Converted["_Next Ply"].Name = "Next Ply"
Converted["_Next Ply"].Parent = Converted["_Frame2"]
Converted["_Next Ply"].MouseButton1Down:Connect(function()
    NextplySelect = true
    wait(.2)
    NextplySelect = false
end)

Converted["_UICorner5"].Parent = Converted["_Next Ply"]

Converted["_Next Ply1"].Font = Enum.Font.SourceSansBold
Converted["_Next Ply1"].Text = "Hop Server"
Converted["_Next Ply1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Next Ply1"].TextSize = 14
Converted["_Next Ply1"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Next Ply1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Next Ply1"].BorderSizePixel = 0
Converted["_Next Ply1"].Position = UDim2.new(0.0222927183, 0, 0.0881573185, 0)
Converted["_Next Ply1"].Size = UDim2.new(0, 116, 0, 37)
Converted["_Next Ply1"].Name = "Next Ply"
Converted["_Next Ply1"].Parent = Converted["_Frame4"]
Converted["_Next Ply1"].MouseButton1Down:Connect(function()
    Hop()
    Hop()
    Hop()
    Hop()
    Hop()
    Hop()
    Hop()
    Hop()
    Hop()
end)

Converted["_UICorner7"].Parent = Converted["_Next Ply1"]



-- Scripts:

---Source Tween bên Night Hub tui Copy vô-----

function GetDistance(target)
    return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
end

function BTP(P)
repeat wait(1)
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
until (P.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500
end

function TelePPlayer(P)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
end

function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 25 then
        Speed = 6000
    elseif Distance < 50 then
        Speed = 3000
    elseif Distance < 150 then
        Speed = 800
    elseif Distance < 250 then
        Speed = 350
    elseif Distance < 500 then
        Speed = 300
    elseif Distance < 750 then
        Speed = 300
    elseif Distance >= 1000 then
        Speed = 300
    end
    game:GetService("TweenService"):Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
end

function TPB(CFgo)
local tween_s = game:service"TweenService"
local info = TweenInfo.new((game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
tween = tween_s:Create(game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat, info, {CFrame = CFgo})
tween:Play()

local tweenfunc = {}

function tweenfunc:Stop()
    tween:Cancel()
end

return tweenfunc
end

function TPP(CFgo)
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
local tween_s = game:service"TweenService"
local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/325, Enum.EasingStyle.Linear)
tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
tween:Play()

local tweenfunc = {}

function tweenfunc:Stop()
    tween:Cancel()
end

return tweenfunc
end

Type = 1
spawn(function()
while wait(.1) do
    if Type == 1 then
        Pos = CFrame.new(0,PosY,0)
    elseif Type == 2 then
        Pos = CFrame.new(0,PosY,-30)
    elseif Type == 3 then
        Pos = CFrame.new(30,PosY,0)
    elseif Type == 4 then
        Pos = CFrame.new(0,PosY,30)	
    elseif Type == 5 then
        Pos = CFrame.new(-30,PosY,0)
    elseif Type == 6 then
        Pos = CFrame.new(0,35,0)
    end
    end
end)

spawn(function()
while wait(.1) do
    Type = 1
    wait(0.5)
    Type = 2
    wait(0.5)
    Type = 3
    wait(0.5)
    Type = 4
    wait(0.5)
    Type = 5
    wait(0.5)
end
end)

spawn(function()
game:GetService("RunService").Heartbeat:Connect(function()
    if _G.AutoFarmBounty or _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.AutoKai or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or _G.Namfon or _G.AutoSwordMastery or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Farmfast or _G.AutoRace or _G.RaidPirate then
        if not game:GetService("Workspace"):FindFirstChild("LOL") then
            local LOL = Instance.new("Part")
            LOL.Name = "LOL"
            LOL.Parent = game.Workspace
            LOL.Anchored = true
            LOL.Transparency = 1
            LOL.Size = Vector3.new(30,-0.5,30)
        elseif game:GetService("Workspace"):FindFirstChild("LOL") then
            game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
        end
    else
        if game:GetService("Workspace"):FindFirstChild("LOL") then
            game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
        end
    end
end)
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoFarmBounty == true then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoFarmBounty == true then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end
end

spawn(function()
    pcall(function()
        while wait() do
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                if v:IsA("Tool") then
                    if v:FindFirstChild("RemoteFunctionShoot") then 
                        SelectWeaponGun = v.Name
                    end
                end
            end
        end
    end)
end)

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

function NameMelee()
    for r, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            return v.Name
        end
    end
    for r, v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            return v.Name
        end
    end
end
function NameSword()
    for r, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            return v.Name
        end
    end
    for r, v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            return v.Name
        end
    end
end
function CheckPriceAndBuyMelee(bt)
    if SaveMasteryMelee()[bt] > 0 then
        return BuyMelee(bt)
    end
    v = bt
    if
        pricemelee[v] and pricemelee[v].Beli and pricemelee[v].Beli <= LocalPlayerBeliValue and pricemelee[v].Fragment and
            pricemelee[v].Fragment <= LocalPlayerFragmentValue
     then
        BuyMelee(v)
    end
end
function GetAndCheckMeleeMastery(bu, bs)
    mm = bu
    usingmelee = browhat[NameMelee()]
    momo = browhat[mm]
    if type(momo) == "string" then
        momo = game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo, true) == 1
    else
        momo = momo()
    end
    if momo then
        if
            not game.Players.LocalPlayer.Character:FindFirstChild(mm) and
                not game.Players.LocalPlayer.Backpack:FindFirstChild(mm)
         then
            momo = browhat[mm]
            if type(momo) == "string" then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo, true)
                momo = game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo)
            else
                momo = momo()
            end
        end
        if game.Players.LocalPlayer.Character:FindFirstChild(mm) or game.Players.LocalPlayer.Backpack:FindFirstChild(mm) then
            kwekrwe = {game.Players.LocalPlayer.Character, game.Players.LocalPlayer.Backpack}
            for r, v in pairs(kwekrwe) do
                if v:FindFirstChild(mm) then
                    return v[mm].Level.Value
                end
            end
        end
    end
    return 0
end
tablemm = {"Black Leg", "Electro", "Fishman Karate", "Dragon Claw"}
function DetectMeleeSPHM()
    vanmeo = SaveMasteryMelee()
    for r, v in pairs(tablemm) do
        if vanmeo[v] < 300 then
            return v
        end
    end
end
function CheckPhouyeDoor()
    if game.Workspace.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") then
        return game.Workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.CanCollide
    end
end
WaterKey = false
function CheckWaterKey()
    if WaterKey then
        return WaterKey
    end
    local bv = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
    if bv == 3 or bv == 1 then
        WaterKey = true
        return true
    end
    local bw = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    if bw == 1 or bw == 0 or bw == 2 then
        WaterKey = true
        return true
    end
end
function CheckBackPack(bx)
    BackpackandCharacter = {game.Players.LocalPlayer.Backpack, game.Players.LocalPlayer.Character}
    for al, by in pairs(BackpackandCharacter) do
        for r, v in pairs(by:GetChildren()) do
            if v.Name == bx then
                return v
            end
        end
    end
end

function GetWeaponMastery(f)
    local u3 = game.Players.LocalPlayer.Backpack
    for r, v in pairs(u3:GetChildren()) do
        if v.Name == f and v:FindFirstChild("Level") then
            return v.Level.Value
        end
    end
    local u3 = game.Players.LocalPlayer.Character
    for r, v in pairs(u3:GetChildren()) do
        if v.Name == f and v:FindFirstChild("Level") then
            return v.Level.Value
        end
    end
    return nil
end
function u6(bX, bY)
    if bY == nil then
        bY = 0
    end
    game:service("VirtualInputManager"):SendKeyEvent(true, bX, false, game)
    wait(bY)
    game:service("VirtualInputManager"):SendKeyEvent(false, bX, false, game)
end

function EnableBuso()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        NoClip = true
        local args = {[1] = "Buso"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        NoClip = false
    end
    NoClip = false
end
function GetWeapon(bh)
    s = ""
    for r, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    for r, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    return s
end
function EquipWeapon(ToolSe)
    if gggggg then
        return
    end
    if lonmemayto == "" or lonmemayto == nil then
        lonmemayto = "Melee"
    end
    ToolSe = GetWeapon(lonmemayto)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        NoClip = true
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
        NoClip = false
    end
end

function u8(m)
    ToolSe = GetWeapon(m)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
    end
end
function EquipWeaponName(m)
    if not m then
        return
    end
    NoClip = true
    ToolSe = m
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
    end
end
function IsWpSKillLoaded(bW)
    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills:FindFirstChild(bW) then
        return true
    end
end
function EquipAllWeapon()
    u3 = {"Melee", "Blox Fruit", "Sword", "Gun"}
    u3_2 = {}
    for r, v in pairs(u3) do
        u3_3 = GetWeapon(v)
        table.insert(u3_2, u3_3)
    end
    for r, v in pairs(u3_2) do
        if not IsWpSKillLoaded(v) then
            print(v)
            EquipWeaponName(v)
        end
    end
end
function GetWeaponMastery(f)
    local u3 = game.Players.LocalPlayer.Backpack
    for r, v in pairs(u3:GetChildren()) do
        if v.Name == f and v:FindFirstChild("Level") then
            return v.Level.Value
        end
    end
    local u3 = game.Players.LocalPlayer.Character
    for r, v in pairs(u3:GetChildren()) do
        if v.Name == f and v:FindFirstChild("Level") then
            return v.Level.Value
        end
    end
    return nil
end
function u6(bX, bY)
    if bY == nil then
        bY = 0
    end
    game:service("VirtualInputManager"):SendKeyEvent(true, bX, false, game)
    wait(bY)
    game:service("VirtualInputManager"):SendKeyEvent(false, bX, false, game)
end

function equipweapon(aq)
    local c6 = tostring(aq)
    local c7 = game.Players.LocalPlayer.Backpack:FindFirstChild(c6)
    local c8 =
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    if c7 then
        c8:EquipTool(c7)
    end
end
function checkskillMelee()
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameMelee()) then
        equipweapon(NameMelee())
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameMelee()]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                    v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                    v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
             then
                return v.Name
            end
        end
    end
end
function checkskillDF()
    if
        not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(
            game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
        )
     then
        equipweapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[
        game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
    ]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                    v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                    v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
             then
                return v.Name
            end
        end
    end
end
function checkskillSword()
    if not NameSword() then
        return
    end
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameSword()) then
        equipweapon(NameSword())
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameSword()]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                    v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                    v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
             then
                return v.Name
            end
        end
    end
end
function NameGun()
    dick = game.Players.LocalPlayer.Backpack or game.Players.LocalPlayer.Character
    for r, v in pairs(dick:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == "Gun" then
            return v.Name
        end
    end
end
function checkskillGun()
    if not NameGun() then
        return nil
    end
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameGun()) then
        equipweapon(NameGun())
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameGun()]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                    v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                    v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
             then
                return v.Name
            end
        end
    end
end
function SendKey(c9, ca)
    if c9 then
        if not ca then
            game:service("VirtualInputManager"):SendKeyEvent(true, c9, false, game)
            task.wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, c9, false, game)
        elseif ca then
            game:service("VirtualInputManager"):SendKeyEvent(true, c9, false, game)
            task.wait(ca)
            game:service("VirtualInputManager"):SendKeyEvent(false, c9, false, game)
        end
    end
end

function Y()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
end

function Z()
game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
end

function X()
game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
end

function C()
game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
end

function V()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
    end

function autoskill()
    EnableBuso()
    sword = checkskillSword()
    meele = checkskillMelee()
    df = checkskillDF()
    gun = checkskillGun()
    if
        df and DF and not string.find(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value, "Portal") and
            df ~= "F"
     then
        EquipWeaponName(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
        local condimebeo = checkskillDF()
        if condimebeo then
            Z()
            Z()
            Z()
            Z()
            Z()
            X()
            X()
            X()
            X()
            X()
            C()
            C()
            C()
            C()
            C()
            V()
            V()
            V()
            V()
            V()
            V()
        end
    elseif checkskillMelee() and Melee then
        EquipWeaponName(NameMelee())
        local condimebeo = checkskillMelee()
        if condimebeo then
            Z()
            Z()
            Z()
            Z()
            Z()
            X()
            X()
            X()
            X()
            X()
            C()
            C()
            C()
            C()
            C()
        end
    elseif checkskillSword() and Sword then
        EquipWeaponName(NameSword())
        local condimebeo = checkskillSword()
        if condimebeo then
            Z()
            Z()
            Z()
            Z()
            Z()
            X()
            X()
            X()
            X()
            X()
        end
    elseif checkskillGun() and Gun then
        EquipWeaponName(NameGun())
        if condimebeo then
            Z()
            Z()
            Z()
            Z()
            Z()
            X()
            X()
            X()
            X()
            X()
        end
    else
        EquipAllWeapon()
    end
end

_G.AutoFarmBounty = true

    spawn(function()
        while wait() do
            if _G.AutoFarmBounty then
                for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if not v.Humanoid.Health == 0 or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or not v.Parent then
                        NextplySelect = true
                        wait(.2)
                    end
                end
            end
        end
    end)

   
spawn(function()
while wait() do
    if _G.AutoFarmBounty then
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
        if v.Name == "NotificationTemplate" then
            if string.find(v.Text,"attack") or string.find(v.Text,"players") or string.find(v.Text,"Players") or string.find(v.Text,"Safe Zone!") then
                NextplySelect = true
                wait(0.0000000000000000000000000000000001)
                NextplySelect = false
                    end
                end
            end
        end
    end
end)


local Catsle = CFrame.new(-5071.82324, 314.858734, -3150.69922)
local Mainsion = CFrame.new(-12471.169921875, 374.94024658203, -7551.677734375)
spawn(function()
    while wait() do
    pcall(function()
    if _G.AutoFarmBounty then
    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
    if v:WaitForChild("Humanoid").Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 10000 then
    plyselecthunthelpold = v.Humanoid.Health
    repeat task.wait()
    NameTarget = v.Name
    Converted["_Target Name"].Text = "Target Name : "..v.Name..""
    if tostring(game.Players.LocalPlayer.Team) == "Pirates" then
    topos(v.HumanoidRootPart.CFrame * CFrame.new(0,4,2))
    elseif tostring(game.Players.LocalPlayer.Team) == "Marines" then
    if game.Players[NameTarget].Team ~= game.Players.LocalPlayer.Team then
    topos(v.HumanoidRootPart.CFrame * CFrame.new(0,4,2))
    end
    end
spawn(function()
if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
    spawn(function()
    autoskill()
    Click()
    Aimbot = true
    end)
end
end)
v.HumanoidRootPart.CanCollide = false
TargetSelectHunt = v.Humanoid
until _G.AutoFarmBounty == false or v.Humanoid.Health == 0 or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or not v.Parent or NextplySelect == true
NextplySelect = false
StartCheckTarget = false
end
end
end
end
end)
end
end)

spawn(function()
pcall(function()
while wait() do
if _G.AutoFarmBounty then
if TargetSelectHunt ~= nil then
if StartCheckTarget then
wait(.1)
if TargetSelectHunt.Health == TargetSelectHunt.MaxHealth or TargetSelectHunt.Health >= plyselecthunthelpold then
NextplySelect = true
TargetSelectHunt = nil
end
end
end
end
end
end)
end)

spawn(function()
    pcall(function()
    if _G.AutoFarmBounty then
    while wait() do
    if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
    end
    end
    end
    end)
    end)

spawn(function()
    while wait() do
    pcall(function()
    if _G.AutoFarmBounty then
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    end)
    end
    end)

spawn(function()
    while wait() do
        pcall(function()
            if Ken then
                repeat task.wait()
                    if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                        game:GetService('VirtualUser'):CaptureController()
                        game:GetService('VirtualUser'):SetKeyDown('0x65')
                        wait(2)
                        game:GetService('VirtualUser'):SetKeyUp('0x65')
                    end
                until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not ken
            end
        end)
    end
end)

spawn(function()
pcall(function()
while wait(.1) do
if _G.AutoFarmBounty then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
end
end
end
end)
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").RenderStepped:connect(function()
            if Aimbot and TargetPlayerAim ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
                local args = {
                    [1] = game:GetService("Players"):FindFirstChild(TargetPlayerAim).Character.HumanoidRootPart.Position
                }
                game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
            end
        end)
    end)
end)