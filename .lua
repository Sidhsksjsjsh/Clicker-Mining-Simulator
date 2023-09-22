local pemain = game.Players.LocalPlayer
local sensorJarak = 50
local workspace = game:GetService("Workspace")

function GetNearestBlockWithChild()
    local posisiPemain = pemain.Character.HumanoidRootPart.Position
    local jarakTerdekat = sensorJarak
    local blokTerdekat = nil
    local childDariBlokTerdekat = nil
    
    for _, block in pairs(workspace.Mine.Blocks:GetChildren()) do
        for _, selfreturn in pairs(block:GetChildren()) do
                local jarak = (posisiPemain - selfreturn.Position).magnitude
                if jarak < jarakTerdekat then
                jarakTerdekat = jarak
                blokTerdekat = block
                childDariBlokTerdekat = selfreturn
            end
        end
    end
    return blokTerdekat, childDariBlokTerdekat
end

local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Clicker Mining Simulator")

local Tab1 = Window_1:NewSection("Main")
local hint = Instance.new("Hint", workspace)

Tab1:CreateToggle("Auto Click Nearest Block", function(value)
_G.ClickDick = value
	while wait() do
	     if _G.ClickDick == false then break end
		local block, selfreturn = GetNearestBlockWithChild()

    if block and selfreturn then
        hint.Text = "Nearest block: " .. tostring(block.Name) .. " | Objects in blocks: " .. tostring(selfreturn.Name)
        game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("CalculatePlayerDamageChannel",workspace.Mine.Blocks[block.Name][selfreturn.Name])
    else
        hint.Text = "The block or object within the block was not found"
    end
	end
end)
