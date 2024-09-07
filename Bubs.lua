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
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)

    local Button1 = Instance.new("TextButton")
    Button1.Position = UDim2.new(0, MainFrame.Size.X.Offset - 91, 0, 0)
    Button1.Size = UDim2.new(0, 33, 0, 33)
    Button1.Text = ""
    Button1.Parent = MainFrame
    Button1.TextColor3 = Color3.fromRGB(255, 255, 255)


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


function AtaHubLib:CreateNotification(title, text, duration)
    local Notification = Instance.new("TextLabel")
    Notification.Parent = self.MainFrame
    Notification.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Notification.Size = UDim2.new(0, 300, 0, 100)
    Notification.Position = UDim2.new(0.5, -150, 1, -110)
    Notification.AnchorPoint = Vector2.new(0.5, 1)
    Notification.Font = Enum.Font.SourceSansBold
    Notification.Text = title .. "\n" .. text
    Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notification.TextSize = 18
    Notification.TextWrapped = true

    local tween = TweenService:Create(Notification, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 1, -210)})
local tweenOut = TweenService:Create(Notification, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 1, -110)})

tween.Completed:Connect(function()
    print("Tween completed!")
end)

tweenOut.Completed:Connect(function()
    print("Tween out completed!")
end)
    
    tween:Play()
    spawn(function()
        wait(duration)
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            Notification:Destroy()
        end)
    end)
end

return AtaHubLib
