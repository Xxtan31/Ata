local AtaHubLib = {}
AtaHubLib.__index = AtaHubLib

local TweenService = game:GetService("TweenService")

function AtaHubLib:CreateWindow(title)
    local gui = Instance.new("ScreenGui")
    gui.Name = title
    gui.Parent = game.CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = gui
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.Position = UDim2.new(0, 202, 0, -10)
    MainFrame.Size = UDim2.new(0, 300, 0, 33)


    local TitleBar = Instance.new("TextLabel")
    TitleBar.Parent = MainFrame
    TitleBar.Size = UDim2.new(0, 180, 0, 20)
    TitleBar.Position = UDim2.new(0, 7, 0, 6)
    TitleBar.Font = Enum.Font.ArimoBold
    TitleBar.Text = title
    TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.TextSize = 13
    TitleBar.BackgroundTransparency = 1
    TitleBar.TextXAlignment = Enum.TextXAlignment.Left
    TitleBar.TextWrapped = true

    local Button = Instance.new("TextButton")
    Button.Position = UDim2.new(0, MainFrame.Size.X.Offset - 46, 0, 0)
    Button.Size = UDim2.new(0, 33, 0, 33)
    Button.Text = ""
    Button.Parent = MainFrame
    Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)

    local Button1 = Instance.new("TextButton")
    Button1.Position = UDim2.new(0, MainFrame.Size.X.Offset - 91, 0, 0)
    Button1.Size = UDim2.new(0, 33, 0, 33)
    Button1.Text = ""
    Button1.Parent = MainFrame
    Button1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Button1.TextColor3 = Color3.fromRGB(255, 255, 255)

    local text = Instance.new("TextLabel")
    text.Parent = Button
    text.Size = UDim2.new(0, 60, 0, 20)
    text.Position = UDim2.new(0, -9.5, 0, 10)
    text.Font = Enum.Font.ArimoBold
    text.Text = "x"
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.TextSize = 23
    text.BackgroundTransparency = 1
    
    local text1 = Instance.new("TextLabel")
    text1.Parent = Button1
    text1.Size = UDim2.new(0, 60, 0, 20)
    text1.Position = UDim2.new(0, -9.5, 0, 10)
    text1.Font = Enum.Font.ArimoBold
    text1.Text = "+"
    text1.TextColor3 = Color3.fromRGB(255, 255, 255)
    text1.TextSize = 23
    text1.BackgroundTransparency = 1
    
    
    local uic = Instance.new("UICorner")
    uic.Parent = MainFrame
    uic.CornerRadius = UDim.new(0, 13)

    local uic1 = Instance.new("UICorner")
    uic1.Parent = Button
    uic1.CornerRadius = UDim.new(0, 13)

    local uic2 = Instance.new("UICorner")
    uic2.Parent = Button1
    uic2.CornerRadius = UDim.new(0, 13)

    local function ButtonMouseEnter()
        Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end

    local function ButtonMouseLeave()
        Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    end

    Button.MouseEnter:Connect(ButtonMouseEnter)
    Button.MouseLeave:Connect(ButtonMouseLeave)

    local function Button1MouseEnter()
        Button1.BackgroundColor3 = Color3.fromRGB(51, 255, 255)
    end

    local function Button1MouseLeave()
        Button1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    end

    Button1.MouseEnter:Connect(Button1MouseEnter)
    Button1.MouseLeave:Connect(Button1MouseLeave)

    game:GetService("RunService").RenderStepped:Connect(function()
        Button.Position = UDim2.new(0, MainFrame.Size.X.Offset - 46, 0, 0)
        Button1.Position = UDim2.new(0, MainFrame.Size.X.Offset - 91, 0, 0)
    end)

    self.MainFrame = MainFrame
    self.Tabs = {}

    return self
end

return AtaHubLib
