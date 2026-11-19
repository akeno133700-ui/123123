-- Собственное базовое меню для Xeno (без внешних библиотек)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Удаляем старое меню, если оно было, чтобы не дублировалось
local oldGui = PlayerGui:FindFirstChild("XenoHelperMenu")
if oldGui then oldGui:Destroy() end

-- Создаём главный контейнер
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "XenoHelperMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Основное окно
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
Title.BorderSizePixel = 0
Title.Text = "  Urban Reload | Helper"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

-- Пример переключателя (Toggle) — просто кнопка, меняющая цвет
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleHighlight"
ToggleButton.Size = UDim2.new(0, 360, 0, 40)
ToggleButton.Position = UDim2.new(0, 20, 0, 60)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "Highlight ESP: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.TextSize = 14
ToggleButton.Parent = MainFrame

local isEnabled = false
ToggleButton.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled
    ToggleButton.Text = "Highlight ESP: " .. (isEnabled and "ON" or "OFF")
    ToggleButton.BackgroundColor3 = isEnabled and Color3.fromRGB(80, 200, 120) or Color3.fromRGB(50, 50, 60)
    -- Позже здесь можно вызывать функцию включения/выключения ESP
    print("Highlight ESP toggled to: " .. tostring(isEnabled))
end)

-- Кнопка закрытия меню
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 16
CloseButton.Parent = MainFrame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("✅ Меню Xeno Helper успешно создано.")
