local ReturningBlocksName = nil
local NominalBlocks = nil
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall
local workspace = game:GetService("Workspace")

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'InvokeServer' and self.Name == 'DataPullFunc' and Args[2] == workspace.Mine.Blocks then
                ReturningBlocksName = Args[2]
	--elseif Method == 'InvokeServer' and self.Name == 'DataPullFunc' and Args[2] == workspace.Mine.Blocks:find("1_") then
		--NominalBlocks = workspace.Mine.Blocks["1_10"]
end
	return namecall(self, ...) 
end)

local player = game.Players.LocalPlayer
local character = player.Character
local workspace = game:GetService("Workspace")

local function findNearestPart()
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    local nearestDistance = math.huge
    local nearestPart = nil

    for _, part in pairs(workspace:FindPartsInRegion3(workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart.Position), nil, 50)) do
        if part.Parent and part.Parent ~= character then
            local distance = (humanoidRootPart.Position - part.Position).Magnitude
            if distance < nearestDistance then
                nearestDistance = distance
                nearestPart = part
            end
        end
    end

    return nearestPart and nearestPart.Name or nil
end

local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

local function findPartBelowFeet()
    local ray = Ray.new(humanoidRootPart.Position, Vector3.new(0, -1, 0))
    local hitPart, hitPosition = workspace:FindPartOnRay(ray, character)
    return hitPart and hitPart.Name or nil
end

local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Clicker Mining Simulator")

local Tab1 = Window_1:NewSection("Main")


Tab1:CreateToggle("Auto Click Block V1", function(value)
_G.ClickDick = value
	while wait() do
	     if _G.ClickDick == false then break end
		game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("CalculatePlayerDamageChannel",ReturningBlocksName)
	end
end)

Tab1:CreateToggle("Auto Click Block V2", function(value)
_G.V2 = value
	while wait() do
		if _G.V2 == false then break end
			game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("CalculatePlayerDamageChannel",workspace.Mine.Blocks["1_10"][findNearestPart()])
		end
	end)

Tab1:CreateToggle("Auto Click Block V3", function(value)
_G.V3 = value
	while wait() do
		if _G.V3 == false then break end
			game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("CalculatePlayerDamageChannel",workspace.Mine.Blocks["1_10"][findPartBelowFeet()])
		end
	end)
