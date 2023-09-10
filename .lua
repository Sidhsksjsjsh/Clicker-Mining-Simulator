local ReturningBlocksName = nil
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall
local workspace = game:GetService("Workspace")

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'InvokeServer' and self.Name == 'DataPullFunc' and Args[2] == workspace:find("Mine") or workspace:FindFirstChild("Mine") then
        ReturningBlocksName = Args[2]
end
	return namecall(self, ...) 
end)

local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Clicker Mining Simulator")

local Tab1 = Window_1:NewSection("Main")


Tab1:CreateToggle("Auto Click Block", function(value)
_G.ClickDick = value
	while wait() do
	     if _G.ClickDick == false then break end
		game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("CalculatePlayerDamageChannel",ReturningBlocksName)
	end
end)
