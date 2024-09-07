local AtaHubLib = {}
AtaHubLib.__index = AtaHubLib

local TweenService = game:GetService("TweenService")

local function createFrame(name, parent, pos, size, visible, trans)
    local frame = Instance.new("Frame")
    frame.Name = name
    frame.Size = size
    frame.Position = pos
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = trans
    frame.Visible = visible
    frame.Parent = parent
    return frame
end

local function createScrollingFrame(name, parent, pos, size, visible, trans, canvasSize, scrollBarThickness)
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Name = name
    scrollingFrame.Size = size
    scrollingFrame.Position = pos
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    scrollingFrame.BackgroundTransparency = trans
    scrollingFrame.Visible = visible
    scrollingFrame.Parent = parent
    
    scrollingFrame.CanvasSize = canvasSize or UDim2.new(0, 0, 2, 0)
    scrollingFrame.ScrollBarThickness = scrollBarThickness or 5
    scrollingFrame.ScrollBarImageColor3 = Color3.new(1, 1, 1)

    return scrollingFrame
end

local function createImageLabel(name, parent, pos, size, image, visible, transparency, color)
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = name
    imageLabel.Size = size
    imageLabel.Position = pos
    imageLabel.Image = image or ""
    imageLabel.Visible = visible
    imageLabel.BackgroundTransparency = transparency
    imageLabel.ImageColor3 = color or Color3.new(1, 1, 1)
    imageLabel.Parent = parent
    return imageLabel
end

local function createText(name, parent, pos, size, text, vis, rot)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Size = size
    label.Position = pos
    label.BackgroundTransparency = 1
    label.Text = text
    label.Visible = vis
    label.TextColor3 = Color3.fromRGB(255, 255, 255)    
    label.TextScaled = true
    label.Font = Enum.Font.PatrickHand
    label.Parent = parent
    label.Rotation = rot
    return label
end

local function createButton(name, parent, pos, size, visible, text, trans)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = size
    button.Position = pos
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    button.BackgroundTransparency = trans
    button.Parent = parent
    button.Visible = visible
    return button
end

local function createTextBox(name, parent, pos, size, visible, text, trans)
    local textBox = Instance.new("TextBox")
    textBox.Name = name
    textBox.Size = size
    textBox.Position = pos
    textBox.Text = text
    textBox.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.BackgroundTransparency = trans
    textBox.Parent = parent
    textBox.Visible = visible
    return textBox
end

local function createuiCorner(name, parent, radius)
    local uiCorner = Instance.new("UICorner")
    uiCorner.Name = name
    uiCorner.Parent = parent
    uiCorner.CornerRadius = radius
    return uiCorner
end

local function createUIStroke(name, parent, thickness, color)
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Name = name
    uiStroke.Thickness = thickness or 1
    uiStroke.Color = color or Color3.fromRGB(0, 0, 0)
    uiStroke.Parent = parent
    return uiStroke
end

local function createTween(parent, time, size)
    local tweenInfo = TweenInfo.new(
        time,
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out, 
        0,
        false, 
        0 
    )

    local tween = TweenService:Create(parent, tweenInfo, {Size = size})
    return tween
end

local function createTweenPos(parent, time, pos)
    local twninfo = TweenInfo.new(
        time,
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out, 
        0,
        false, 
        0 
    )

    local twn = TweenService:Create(parent, twninfo, {Position = pos})
    return twn
end

function AtaHubLib:CreateWindow(title)
    local gui = Instance.new("ScreenGui")
    gui.Name = title
    gui.Parent = game.CoreGui

    local mainFrame = createFrame("mainFrame", gui, UDim2.new(0, 202, 0, -10), UDim2.new(0, 300, 0, 33), true, 0)


    local TitleBar = Instance.new("TextLabel")
    TitleBar.Parent = mainFrame
    TitleBar.Size = UDim2.new(0, 180, 0, 20)
    TitleBar.Position = UDim2.new(0, 7, 0, 6)
    TitleBar.Font = Enum.Font.ArimoBold
    TitleBar.Text = title
    TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.TextSize = 13
    TitleBar.BackgroundTransparency = 1
    TitleBar.TextXAlignment = Enum.TextXAlignment.Left
    TitleBar.TextWrapped = true

    local Button = createButton("Button", mainFrame, UDim2.new(0, mainFrame.Size.X.Offset - 33, 0, 0), UDim2.new(0, 33, 0, 33), true, "", 0)
Button.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    local Button1 = createButton("Button1", mainFrame, UDim2.new(0, mainFrame.Size.X.Offset - 67, 0, 0), UDim2.new(0, 33, 0, 33), true, "", 0)
Button1.BackgroundColor3 = Color3.fromRGB(36, 36, 36)

    local text = createText("Text", Button, UDim2.new(0, -14, 0, 5), UDim2.new(0, 60, 0, 20), "x", true, 180)
    text.Font = Enum.Font.ArimoBold
    text.TextSize = 23

    local text2 = createText("Text2", Button1, UDim2.new(0, -14, 0, 5), UDim2.new(0, 60, 0, 20), "+", true, 0)
    text2.Font = Enum.Font.ArimoBold
    text2.TextSize = 23
    
local uic = createuiCorner("uic", mainFrame, UDim.new(0, 13))
local uic1 = createuiCorner("uic1", Button, UDim.new(0, 13))
local uic2 = createuiCorner("uic2", Button1, UDim.new(0, 13))

local function one()
    local mainFrameTween = createTween(mainFrame, 1, UDim2.new(0, 350, 0, 300))
    mainFrameTween:Play()
end

local function two()
    local mainFramebackTween = createTween(mainFrame, 1, UDim2.new(0, 300, 0, 43))
    mainFramebackTween:Play()
end 

local button1Active = false
Button1.MouseButton1Click:Connect(function()
    if button1Active then
    button1Active = true
    one()
 else
    button1Active = false
    two()
  end
end)

    local function ButtonMouseEnter()
        Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
    local function ButtonMouseLeave()
        Button.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    end
    local function Button1MouseEnter()
        Button1.BackgroundColor3 = Color3.fromRGB(51, 255, 255)
    end

    local function Button1MouseLeave()
        Button1.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    end
    
    Button.MouseEnter:Connect(ButtonMouseEnter)
    Button.MouseLeave:Connect(ButtonMouseLeave)
    Button1.MouseEnter:Connect(Button1MouseEnter)
    Button1.MouseLeave:Connect(Button1MouseLeave)

    game:GetService("RunService").RenderStepped:Connect(function()
        Button.Position = UDim2.new(0, mainFrame.Size.X.Offset - 33, 0, 0)
        Button1.Position = UDim2.new(0, mainFrame.Size.X.Offset - 67, 0, 0)
    end)

    self.mainFrame = mainFrame
    self.Tabs = {}

    return self
end

return AtaHubLib
