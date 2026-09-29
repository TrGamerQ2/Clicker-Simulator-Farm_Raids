local stop = false

game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F3 then
        stop = true
        print("СТОП")
    end
end)

while not stop do
local VIM = game:GetService("VirtualInputManager")
VIM:SendMouseButtonEvent(950, 667, 0, true, game, 0)
wait(0.3)
VIM:SendMouseButtonEvent(950, 667, 0, false, game, 0)
print("Кликнул (950, 667)")   
wait(0.4)
local VI = game:GetService("VirtualInputManager")
VI:SendMouseButtonEvent(639, 679, 0, true, game, 0)
wait(0.3)
VI:SendMouseButtonEvent(639, 679, 0, false, game, 0)
print("Кликнул (639, 679")  
wait(3)


local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local function getHrp()
    local char = player.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end

while not getHrp() do wait(0.1) end

local rooms = workspace._THINGS.Minigames.RaidLobby.Rooms

for i = 1, 6 do
    local gate = rooms[i].Gate[tostring(1)]
    if gate then
        local hrp = getHrp()
        hrp.CFrame = gate.CFrame + Vector3.new(0, 3, 0)
        camera.CFrame = CFrame.lookAt(hrp.Position + Vector3.new(0, 3, 0), gate.Position)
        print("ТП к Gate " .. i)
    end
    wait(1.2)
end

-- ТП к Door1
local door = workspace._THINGS.Minigames.RaidLobby.Interact:GetChildren()[4].Shadow
    if door then
        local hrp = getHrp()
        hrp.CFrame = door.CFrame
        camera.CFrame = CFrame.lookAt(hrp.Position + Vector3.new(0, 3, 0), door.Position)
        print("ТП к Door1")
    end

    print("Готово")
    wait(3)
end
