local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local plr = Players.LocalPlayer

local function moveFishingUI()
    local fishingUI = plr.PlayerGui:FindFirstChild("HUD") and plr.PlayerGui.HUD:FindFirstChild("Fishing")
    if fishingUI then
        fishingUI.Position = UDim2.new(0.5, 0, 0.5, 0)
    end
end

RunService.RenderStepped:Connect(function()
    moveFishingUI()
end)


getgenv().Enabled = true

local FishButton = nil
local isFishing = false
local player = game:GetService("Players").LocalPlayer
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager")

player.PlayerGui.HUD.DescendantAdded:Connect(function(v)
    if v.Name == "Button" and v.Parent.Name == "Fishing" then
        FishButton = v

        game:GetService("Players").LocalPlayer.PlayerGui.Modules.Clients.Enabled = getgenv().Enabled

        if getgenv().Enabled then
            if not FishButton then return end
            if isFishing then return end

            isFishing = true
            GuiService.SelectedObject = FishButton

            for i = 1, 15 do
                if not getgenv().Enabled then break end

                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end

            isFishing = false
        end
    end
end)
