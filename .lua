local ReturningBlocksName
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'InvokeServer' and self.Name == 'purchaseEgg' then
        DeleteFuckingPet = Args[2]
end
	return namecall(self, ...) 
end)

local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Clicker Mining Simulator")

local Tab1 = Window_1:NewSection("Main")


Tab1:CreateToggle("Auto Click Block", function(value)
