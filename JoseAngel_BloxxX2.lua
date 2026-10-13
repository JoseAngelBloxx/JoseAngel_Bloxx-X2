local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local networkPath = ReplicatedStorage:WaitForChild("Shared", 5) 
    and ReplicatedStorage.Shared:WaitForChild("Packages", 5) 
    and ReplicatedStorage.Shared.Packages:WaitForChild("Network", 5)
local remoteEvent = networkPath and networkPath:WaitForChild("rev_TaviMishkal", 5)

local gui = Instance.new("ScreenGui")
gui.Name = "JoseAngel_Blox_UI"
gui.Parent = CoreGui
gui.ResetOnSpawn = false

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 220, 0, 150)
main.Position = UDim2.new(0.5, -110, 0.4, -75)
main.BackgroundColor3 = Color3.fromRGB(12, 20, 38)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(0, 140, 255)
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "JoseAngel_Blox x2"
title.TextColor3 = Color3.fromRGB(0, 185, 255)
title.TextSize = 17
title.Font = Enum.Font.GothamBold
title.Parent = main

local btn = Instance.new("TextButton")
btn.Name = "Toggle"
btn.Size = UDim2.new(0.85, 0, 0, 45)
btn.Position = UDim2.new(0.075, 0, 0.5, 0)
btn.BackgroundColor3 = Color3.fromRGB(0, 80, 240)
btn.Text = "Multiplicar x2 [DESACTIVADO]"
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 12
btn.Font = Enum.Font.GothamBold
btn.Parent = main

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = btn

local enabled = false

btn.MouseButton1Click:Connect(function()
    enabled = not enabled
    
    if enabled then
        btn.Text = "Multiplicar x2 [ACTIVADO]"
        btn.BackgroundColor3 = Color3.fromRGB(0, 180, 90)
        
        task.spawn(function()
            while enabled do
                if remoteEvent then
                    remoteEvent:FireServer()
                end
                task.wait(0.01) -- Velocidad ultra rápida
            end
        end)
    else
        btn.Text = "Multiplicar x2 [DESACTIVADO]"
        btn.BackgroundColor3 = Color3.fromRGB(0, 80, 240)
    end
end)
