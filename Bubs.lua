local MyHubLib = {}
MyHubLib.__index = MyHubLib

local TweenService = game:GetService("TweenService")

function MyHubLib:CreateWindow(title)
    local gui = Instance.new("ScreenGui")
    gui.Name = title
    gui.Parent = game.CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = gui
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.Position = UDim2.new(0, 202, 0, -10)
    MainFrame.Size = UDim2.new(0, 300, 0, 43)
    MainFrame.ClipsDescendants = true

    local TitleBar = Instance.new("TextLabel")
    TitleBar.Parent = MainFrame
    TitleBar.Size = UDim2.new(0, 120, 0, 20)
    TitleBar.Position = UDim2.new(0, 5, 0, 10)
    TitleBar.Font = Enum.Font.ArimoBold
    TitleBar.Text = title
    TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.TextSize = 24

    self.MainFrame = MainFrame
    self.Tabs = {}

    return self
end

function MyHubLib:CreateTab(name)
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = self.MainFrame
    TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabButton.Size = UDim2.new(0, 100, 0, 35)
    TabButton.Font = Enum.Font.SourceSans
    TabButton.Text = name
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.TextSize = 20

    local TabFrame = Instance.new("Frame")
    TabFrame.Parent = self.MainFrame
    TabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TabFrame.Size = UDim2.new(1, 0, 1, -45)
    TabFrame.Position = UDim2.new(0, 0, 0, 45)
    TabFrame.Visible = false

    self.Tabs[name] = TabFrame
    TabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(self.Tabs) do
            tab.Visible = false
        end
        TabFrame.Visible = true
    end)

    return TabFrame
end

function MyHubLib:CreateLabel(tab, text)
    local Label = Instance.new("TextLabel")
    Label.Parent = tab
    Label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Label.Size = UDim2.new(0, 300, 0, 50)
    Label.Font = Enum.Font.SourceSans
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 24

    return Label
end

function MyHubLib:CreateButton(tab, text, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = tab
    Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Button.Size = UDim2.new(0, 200, 0, 50)
    Button.Font = Enum.Font.SourceSans
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 24

    Button.MouseButton1Click:Connect(callback)
    return Button
end

function MyHubLib:CreateToggle(tab, text, default, callback)
    local Toggle = Instance.new("TextButton")
    Toggle.Parent = tab
    Toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Toggle.Size = UDim2.new(0, 200, 0, 50)
    Toggle.Font = Enum.Font.SourceSans
    Toggle.Text = text .. (default and ": ON" or ": OFF")
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.TextSize = 24

    local toggled = default
    Toggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        Toggle.Text = text .. (toggled and ": ON" or ": OFF")
        callback(toggled)
    end)

    return Toggle
end

function MyHubLib:CreateNotification(title, text, duration)
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
    
    tween:Play()
    spawn(function()
        wait(duration)
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            Notification:Destroy()
        end)
    end)
end

return MyHubLib
