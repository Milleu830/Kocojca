repeat wait() until game:IsLoaded() 
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil
do  local ui =  game:GetService("CoreGui"):FindFirstChild("redui")  if ui then ui:Destroy() end end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local tween = game:GetService("TweenService")
local Red = {RainbowColorValue = 0, HueSelectionPosition = 0}
local PresetColor = Color3.fromRGB(66, 134, 255)


coroutine.wrap(
    function()
        while wait() do
            Red.RainbowColorValue = Red.RainbowColorValue + 1 / 255
            Red.HueSelectionPosition = Red.HueSelectionPosition + 1

            if Red.RainbowColorValue >= 1 then
                Red.RainbowColorValue = 0
            

            if Red.HueSelectionPosition == 160 then
                Red.HueSelectionPosition = 0
            end
        end
    end
)()

local Reduisceen = Instance.new("ScreenGui")
Reduisceen.Parent = game:GetService("CoreGui")
Reduisceen.Name = "redui"
Reduisceen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
game.Players.LocalPlayer.Chatted:Connect(function(msg)
	if msg == "n" then
		game.CoreGui["redui"].Enabled =  not game.CoreGui["redui"].Enabled
	end
end)



local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
        local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local function Tween(instance, properties,style,wa)
    if style == nil or "" then
        return Back
    end
    tween:Create(instance,TweenInfo.new(wa,Enum.EasingStyle[style]),{properties}):Play()
end

local create = {}
function create:Win(text)
    local fs = false

    local MainSceen = Instance.new("Frame")
    MainSceen.Name = "MainSceen"
    MainSceen.Parent = Reduisceen
    MainSceen.AnchorPoint = Vector2.new(0.5, 0.5)
    MainSceen.BackgroundColor3 = Color3.fromRGB(15,15,15)
    MainSceen.BorderSizePixel = 0
    MainSceen.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainSceen.Size = UDim2.new(0, 0, 0, 0)
    MainSceen.ClipsDescendants = true

    local Main_UiConner  = Instance.new("UICorner")

    Main_UiConner.CornerRadius = UDim.new(0, 4)
    Main_UiConner.Name = "Main_UiConner"
    Main_UiConner.Parent = MainSceen

    local ClickFrame = Instance.new("Frame")
    ClickFrame.Name = "ClickFrame"
    ClickFrame.Parent = MainSceen
    ClickFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    ClickFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ClickFrame.BorderSizePixel = 0
    ClickFrame.Position = UDim2.new(0.5, 0, 0.036, 0)
    ClickFrame.Size = UDim2.new(0, 534-20, 0, 30)
    ClickFrame.ClipsDescendants = true
    ClickFrame.BackgroundTransparency = 1

    MakeDraggable(ClickFrame,MainSceen)
    tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 550, 0, 474)}):Play()

    local library = {toggledui = false;}
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        pcall(function()
            if input.KeyCode == Enum.KeyCode.RightControl then
                if library.toggledui == false then
                    library.toggledui = true
                    tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0, 0, 0, 0)}):Play()
                    wait(.3)
                    Reduisceen.Enabled = false
                else
                    library.toggledui = false
                    tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 534, 0, 474)}):Play()
                    Reduisceen.Enabled = true
                end
            end
        end)
    end)

    local NameReal = Instance.new("TextLabel")

    NameReal.Parent = MainSceen
    NameReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameReal.BackgroundTransparency = 1
    NameReal.BorderSizePixel = 0
    NameReal.Position = UDim2.new(0.5, 0, 0.05, 0)
    NameReal.AnchorPoint = Vector2.new(0.5, 0.5)
    NameReal.Size = UDim2.new(0, 136, 0, 34)
    NameReal.Font = Enum.Font.GothamBold
    NameReal.Text = tostring(text)
    NameReal.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameReal.TextSize = 14.000


    local MainSceen2 = Instance.new("Frame")
    MainSceen2.Name = "MainSceen2"
    MainSceen2.Parent = MainSceen
    MainSceen2.AnchorPoint = Vector2.new(0.5, 0.5)
    MainSceen2.BackgroundColor3 = Color3.fromRGB(18,18,18)
    MainSceen2.BorderSizePixel = 0
    MainSceen2.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainSceen2.Size = UDim2.new(0, 0, 0, 0)
    MainSceen2.ClipsDescendants = true

    local Main_UiConner2  = Instance.new("UICorner")

    Main_UiConner2.CornerRadius = UDim.new(0, 4)
    Main_UiConner2.Name = "Main_UiConner"
    Main_UiConner2.Parent = MainSceen

    MainSceen2:TweenSizeAndPosition(UDim2.new(0, 550-20, 0, 474-50), UDim2.new(0.5, 0, 0.53, 0), "Out", "Back", 0.5, true)


    local ScolTapBarFrame = Instance.new("Frame")
    ScolTapBarFrame.Name = "MainSceen2"
    ScolTapBarFrame.Parent = MainSceen2
    ScolTapBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    ScolTapBarFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ScolTapBarFrame.BorderSizePixel = 0
    ScolTapBarFrame.BackgroundTransparency = 1
    ScolTapBarFrame.Position = UDim2.new(0.5, 0, 0.07, 0)
    ScolTapBarFrame.Size = UDim2.new(0, 500, 0, 35)
    ScolTapBarFrame.ClipsDescendants = true

    local ScrollingFrame_Menubar = Instance.new("ScrollingFrame")

    ScrollingFrame_Menubar.Parent = ScolTapBarFrame
    ScrollingFrame_Menubar.Active = true
    ScrollingFrame_Menubar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingFrame_Menubar.BackgroundTransparency = 1
    ScrollingFrame_Menubar.BorderSizePixel = 0
    ScrollingFrame_Menubar.Size = UDim2.new(0, 500, 0, 35)
    ScrollingFrame_Menubar.CanvasSize = UDim2.new(2, 0, 0, 0)
    ScrollingFrame_Menubar.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingFrame_Menubar.ScrollBarThickness = 3


    local UIListLayout_Menubar = Instance.new("UIListLayout")

    UIListLayout_Menubar.Parent = ScrollingFrame_Menubar
    UIListLayout_Menubar.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout_Menubar.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_Menubar.Padding = UDim.new(0, 10)

    local UIPadding_Menubar = Instance.new("UIPadding")

    UIPadding_Menubar.Parent = ScrollingFrame_Menubar
    UIPadding_Menubar.PaddingTop = UDim.new(0, 2)


    local PageOrders = -1

    local Container_Page = Instance.new('Frame',MainSceen2)
    Container_Page.Size = UDim2.new(0, 518, 0, 268)
    Container_Page.Position = UDim2.new(0.5, 0, 0.45, 0)
    Container_Page.BackgroundTransparency = 1
    Container_Page.Name = "Page "
    Container_Page.AnchorPoint = Vector2.new(0.5, 0.5)

    local pagesFolder = Instance.new("Folder")

    pagesFolder.Name = "pagesFolder"
    pagesFolder.Parent = Container_Page


    local UIPage = Instance.new('UIPageLayout',pagesFolder)
    UIPage.SortOrder = Enum.SortOrder.LayoutOrder
    UIPage.EasingDirection = Enum.EasingDirection.InOut
    UIPage.EasingStyle = Enum.EasingStyle.Quad
    UIPage.Padding = UDim.new(0, 10)
    UIPage.TweenTime = 0.500

    local top = {}

    local NotiFrame = Instance.new("Frame")
    NotiFrame.Name = "NotiFrame"
    NotiFrame.Parent = Reduisceen
    NotiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    NotiFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
    NotiFrame.BorderSizePixel = 0
    NotiFrame.Position =  UDim2.new(1, -210, 1, -500)
    NotiFrame.Size = UDim2.new(0, 400, 0, 500)
    NotiFrame.ClipsDescendants = true
    NotiFrame.BackgroundTransparency = 1


    local Notilistlayout = Instance.new("UIListLayout")
    Notilistlayout.Parent = NotiFrame
    Notilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
    Notilistlayout.Padding = UDim.new(0, 5)


    function create:Notifile(titel,text,delays)
        local TitleFrame = Instance.new("Frame")
        TitleFrame.Name = "TitleFrame"
        TitleFrame.Parent = NotiFrame
        TitleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        TitleFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
        TitleFrame.BorderSizePixel = 0
        TitleFrame.Position =  UDim2.new(0.5, 0, 0.5,0)
        TitleFrame.Size = UDim2.new(0, 0, 0, 0)
        TitleFrame.ClipsDescendants = true
        TitleFrame.BackgroundTransparency = 0

        local ConnerTitile = Instance.new("UICorner")

        ConnerTitile.CornerRadius = UDim.new(0, 4)
        ConnerTitile.Name = ""
        ConnerTitile.Parent = TitleFrame

        TitleFrame:TweenSizeAndPosition(UDim2.new(0, 400-10, 0, 70),  UDim2.new(0.5, 0, 0.5,0), "Out", "Quad", 0.3, true)

        local imagenoti = Instance.new("ImageLabel")

        imagenoti.Parent = TitleFrame
        imagenoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        imagenoti.BackgroundTransparency = 1.000
        imagenoti.AnchorPoint = Vector2.new(0.5, 0.5)
        imagenoti.Position = UDim2.new(0.9, 0, 0.5, 0)
        imagenoti.Size = UDim2.new(0, 50, 0, 50)
    --  imagenoti.Image = "https://www.roblox.com/asset-thumbnail/image?assetId=7578496318&width=0&height=0&format=png"

        local txdlid = Instance.new("TextLabel")

        txdlid.Parent = TitleFrame
        txdlid.Name = "TextLabel_Tap"
        txdlid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        txdlid.Size =UDim2.new(0, 160, 0,25 )
        txdlid.Font = Enum.Font.GothamBold
        txdlid.Text = titel
        txdlid.TextColor3 = Color3.fromRGB(255, 255, 255)
        txdlid.TextSize = 13.000
        txdlid.AnchorPoint = Vector2.new(0.5, 0.5)
        txdlid.Position = UDim2.new(0.23, 0, 0.3, 0)
        -- txdlid.TextYAlignment = Enum.TextYAlignment.Top
        txdlid.TextXAlignment = Enum.TextXAlignment.Left
        txdlid.BackgroundTransparency = 1

        local LableFrame = Instance.new("Frame")
        LableFrame.Name = "LableFrame"
        LableFrame.Parent = TitleFrame
        LableFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        LableFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LableFrame.BorderSizePixel = 0
        LableFrame.Position =  UDim2.new(0.36, 0, 0.67,0)
        LableFrame.Size = UDim2.new(0, 260, 0,25 )
        LableFrame.ClipsDescendants = true
        LableFrame.BackgroundTransparency = 1

        local TextNoti = Instance.new("TextLabel")

        TextNoti.Parent = LableFrame
        TextNoti.Name = "TextLabel_Tap"
        TextNoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextNoti.Size =UDim2.new(0, 260, 0,25 )
        TextNoti.Font = Enum.Font.GothamBold
        TextNoti.Text = text
        TextNoti.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextNoti.TextSize = 13.000
        TextNoti.AnchorPoint = Vector2.new(0.5, 0.5)
        TextNoti.Position = UDim2.new(0.5, 0, 0.5, 0)
        -- TextNoti.TextYAlignment = Enum.TextYAlignment.Top
        TextNoti.TextXAlignment = Enum.TextXAlignment.Left
        TextNoti.BackgroundTransparency = 1

        repeat wait() until TitleFrame.Size == UDim2.new(0, 400-10, 0, 70)

        local Time = Instance.new("Frame")
        Time.Name = "Time"
        Time.Parent = TitleFrame
--Time.AnchorPoint = Vector2.new(0.5, 0.5)
        Time.BackgroundColor3 =  Color3.fromRGB(255, 255, 255)
        Time.BorderSizePixel = 0
        Time.Position =  UDim2.new(0, 0, 0.,0)
        Time.Size = UDim2.new(0, 0,0,0)
        Time.ClipsDescendants = false
        Time.BackgroundTransparency = 0

        local ConnerTitile_Time = Instance.new("UICorner")

        ConnerTitile_Time.CornerRadius = UDim.new(0, 4)
        ConnerTitile_Time.Name = ""
        ConnerTitile_Time.Parent = Time


        Time:TweenSizeAndPosition(UDim2.new(0, 400-10, 0, 3),  UDim2.new(0., 0, 0.,0), "Out", "Quad", 0.3, true)
        repeat wait() until Time.Size == UDim2.new(0, 400-10, 0, 3)

        TweenService:Create(
            Time,
            TweenInfo.new(tonumber(delays), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 0, 0, 3)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        delay(tonumber(delays),function()
            TweenService:Create(
                TitleFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            wait(0.3)
            TitleFrame:Destroy()
        end
    )
    end


    function top:Taps(text)
        PageOrders = PageOrders + 1
        local name = tostring(text) or tostring(math.random(1,5000))

        local Frame_Tap = Instance.new("Frame")
        Frame_Tap.Parent = ScrollingFrame_Menubar
        Frame_Tap.Name = text.."Server"
        Frame_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame_Tap.BackgroundTransparency = 1
        Frame_Tap.Position = UDim2.new(0.0, 0, 0.0, 0)
        Frame_Tap.Size = UDim2.new(0, 100, 0, 25)
        Frame_Tap.Visible = true

        local TextLabel_Tap = Instance.new("TextLabel")

        TextLabel_Tap.Parent = Frame_Tap
        TextLabel_Tap.Name = "TextLabel_Tap"
        TextLabel_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_Tap.Position = UDim2.new(0.5, 0, 0.8, 0)
        TextLabel_Tap.Size = UDim2.new(0, 0, 0, 0)
        TextLabel_Tap.Font = Enum.Font.SourceSans
        TextLabel_Tap.Text = " "
        TextLabel_Tap.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel_Tap.TextSize = 14.000
        TextLabel_Tap.AnchorPoint = Vector2.new(0.5, 0.5)

        local TextButton_Tap = Instance.new("TextButton")

        TextButton_Tap.Parent = Frame_Tap
        TextButton_Tap.Name = "TextButton_Tap"
        TextButton_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_Tap.BackgroundTransparency = 1.000
        TextButton_Tap.Position = UDim2.new(0.114491031, 0, -0.0216345787, 0)
        TextButton_Tap.Size = UDim2.new(0, 80, 0, 20)
        TextButton_Tap.Font = Enum.Font.GothamSemibold
        TextButton_Tap.TextColor3 = Color3.fromRGB(155, 155, 155)
        TextButton_Tap.TextSize = 13.000
        TextButton_Tap.Text = tostring(text)

        local MainPage = Instance.new("Frame")

        MainPage.Name = name.."_MainPage"
        MainPage.Parent = pagesFolder
        MainPage.BackgroundColor3 = Color3.fromRGB(255,255, 255)
        MainPage.BorderSizePixel = 0
        MainPage.Position = UDim2.new(0.5, 0, 0.5, 0) -- UDim2.new(0.0149812736, 0, 0.13, 0)
        MainPage.Size = UDim2.new(0, 518, 0, 375)
        MainPage.BackgroundTransparency = 1
        MainPage.ClipsDescendants = true
        MainPage.Visible = true
        MainPage.LayoutOrder = PageOrders




        TextButton_Tap.MouseButton1Click:connect(function()
            if MainPage.Name == text.."_MainPage" then
                UIPage:JumpToIndex(MainPage.LayoutOrder)

            end
            for i ,v in next , ScrollingFrame_Menubar:GetChildren() do
                if v:IsA("Frame") then
                    TweenService:Create(
                        v.TextButton_Tap,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155, 155, 155)}
                    ):Play()
                end

                TweenService:Create(
                    TextButton_Tap,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)}
                ):Play()
            end
        end)

        if fs == false then
            -- TweenService:Create(
            --     TextLabel_Tap,
            --     TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            --     {Size = UDim2.new(0, 70, 0, 2)}
            -- ):Play()
            TweenService:Create(
                TextButton_Tap,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)}
            ):Play()

            MainPage.Visible = true
            Frame_Tap.Name  = text .. "Server"
            fs  = true
        end
        local ScrollingFrame_Pagefrist = Instance.new("ScrollingFrame")

        ScrollingFrame_Pagefrist.Parent = MainPage
        ScrollingFrame_Pagefrist.Active = true
        ScrollingFrame_Pagefrist.BackgroundColor3 = Color3.fromRGB(23, 23, 23) -- 255, 255, 255
        ScrollingFrame_Pagefrist.BorderSizePixel = 0
        ScrollingFrame_Pagefrist.Size = UDim2.new(0, 518, 0, 375)
        ScrollingFrame_Pagefrist.ScrollBarThickness = 4
        ScrollingFrame_Pagefrist.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255) -- 255, 255, 255

        local UIGridLayout_Pagefrist = Instance.new("UIGridLayout")
        local UIPadding_Pagefrist = Instance.new("UIPadding")

        UIGridLayout_Pagefrist.Archivable = false
        UIGridLayout_Pagefrist.Parent = ScrollingFrame_Pagefrist
        UIGridLayout_Pagefrist.SortOrder = Enum.SortOrder.LayoutOrder
        UIGridLayout_Pagefrist.CellPadding = UDim2.new(0, 13, 0, 15)
        UIGridLayout_Pagefrist.CellSize = UDim2.new(0, 240, 0, 370)

        UIPadding_Pagefrist.Parent = ScrollingFrame_Pagefrist
        UIPadding_Pagefrist.PaddingLeft = UDim.new(0, 10)
        UIPadding_Pagefrist.PaddingTop = UDim.new(0, 20)

        local page = {}

        function page:newpage()

            local Pageframe = Instance.new("Frame")


            Pageframe.Parent = ScrollingFrame_Pagefrist
            Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Pageframe.BorderSizePixel = 0
            Pageframe.Position = UDim2.new(0.028957529, 0, 0.0496277921, 0)
            Pageframe.Size = UDim2.new(0, 240, 0, 379)


            local ScrollingFrame_Pageframe = Instance.new("ScrollingFrame")


            ScrollingFrame_Pageframe.Parent = Pageframe
            ScrollingFrame_Pageframe.Active = true
            ScrollingFrame_Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            ScrollingFrame_Pageframe.BorderSizePixel = 0
            ScrollingFrame_Pageframe.Position = UDim2.new(0, 0, -0.0101253344, 0)
            ScrollingFrame_Pageframe.Size = UDim2.new(0, 240, 0, 379)
            ScrollingFrame_Pageframe.ScrollBarThickness = 4
            ScrollingFrame_Pageframe.ScrollBarImageColor3 = Color3.fromRGB(222, 222, 222)



            local UIPadding_Pageframe = Instance.new("UIPadding")
            local UIListLayout_Pageframe = Instance.new("UIListLayout")


            UIPadding_Pageframe.Parent = ScrollingFrame_Pageframe
            UIPadding_Pageframe.PaddingLeft = UDim.new(0, 15)
            UIPadding_Pageframe.PaddingTop = UDim.new(0, 10)


            UIListLayout_Pageframe.Parent = ScrollingFrame_Pageframe
            UIListLayout_Pageframe.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_Pageframe.Padding = UDim.new(0, 7)

            UIListLayout_Pageframe:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y + 120 )
            end)

            UIGridLayout_Pagefrist:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 50 )
            end)

            game:GetService("RunService").Stepped:Connect(function ()
                pcall(function ()
                    ScrollingFrame_Menubar.CanvasSize = UDim2.new(0,  UIListLayout_Menubar.AbsoluteContentSize.X, 0,0)
                    ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y +20 )
                    ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 40)
                end)
            end)
        local items = {}

        function items:Toggle(text,config,callback)
            local Toggle = Instance.new("Frame")

            Toggle.Parent = ScrollingFrame_Pageframe
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.BorderSizePixel = 0
            Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
            Toggle.Size = UDim2.new(0, 213, 0, 35)
            Toggle.BackgroundTransparency = 1
            Toggle.AnchorPoint = Vector2.new(0.5, 0.5)

            local TextButton_Toggle = Instance.new("TextButton")

            TextButton_Toggle.Parent = Toggle
            TextButton_Toggle.BackgroundTransparency =1
            TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            TextButton_Toggle.BorderSizePixel = 0
            TextButton_Toggle.Size = UDim2.new(0, 213, 0, 35)
            TextButton_Toggle.AutoButtonColor = false
            TextButton_Toggle.Font = Enum.Font.SourceSans
            TextButton_Toggle.Text = " "
            TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_Toggle.TextSize = 12.000

            local TextButton_2_Toggle = Instance.new("TextButton")

            TextButton_2_Toggle.Parent = TextButton_Toggle
            TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
    --        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_2_Toggle.BorderSizePixel = 0
            TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_2_Toggle.Position = UDim2.new(0.9, 0, 0.5, 0)
            TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
            TextButton_2_Toggle.Font = Enum.Font.SourceSans
            TextButton_2_Toggle.Text = " "
            TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_2_Toggle.TextSize = 12.000
            TextButton_2_Toggle.AutoButtonColor = false

            local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner.Name = ""
            TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

            local TextButton_3_Toggle = Instance.new("TextButton")

            TextButton_3_Toggle.Parent = TextButton_2_Toggle
            TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255,255)
    --        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_3_Toggle.BorderSizePixel = 0
            TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
            TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
            TextButton_3_Toggle.Font = Enum.Font.SourceSans
            TextButton_3_Toggle.Text = " "
            TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_3_Toggle.TextSize = 12.000
            TextButton_3_Toggle.AutoButtonColor = false

            local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner2.Name = ""
            TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

            local TextButton_4_Toggle = Instance.new("TextButton")

            TextButton_4_Toggle.Parent = TextButton_3_Toggle
            TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
    --        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_4_Toggle.BorderSizePixel = 0
            TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
            TextButton_4_Toggle.Font = Enum.Font.SourceSans
            TextButton_4_Toggle.Text = " "
            TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_4_Toggle.TextSize = 12.000
            TextButton_4_Toggle.AutoButtonColor = false
            TextButton_4_Toggle.BackgroundTransparency = 1
            TextButton_4_Toggle.Visible = true

            local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner4.Name = ""
            TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle

            local TextLabel_Toggle = Instance.new("TextLabel")

            TextLabel_Toggle.Parent = Toggle
            TextLabel_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_Toggle.BackgroundTransparency = 1
            TextLabel_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_Toggle.Position = UDim2.new(0.4, 0, 0.5, 0)
            TextLabel_Toggle.BorderSizePixel = 0
            TextLabel_Toggle.Size = UDim2.new(0, 130, 0, 25)
            TextLabel_Toggle.Font = Enum.Font.GothamSemibold
            TextLabel_Toggle.Text = text
            TextLabel_Toggle.TextColor3 = Color3.fromRGB(200, 200, 200)
            TextLabel_Toggle.TextSize = 13.000
            TextLabel_Toggle.ClipsDescendants = true
            TextLabel_Toggle.TextWrapped = true
            TextLabel_Toggle.TextXAlignment = Enum.TextXAlignment.Left

            local TextButton_Toggle2 = Instance.new("TextButton")

            TextButton_Toggle2.Parent = TextButton_Toggle
            TextButton_Toggle2.BackgroundTransparency =1
            TextButton_Toggle2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            TextButton_Toggle2.BorderSizePixel = 0
            TextButton_Toggle2.Size = UDim2.new(0, 213, 0, 35)
            TextButton_Toggle2.AutoButtonColor = false
            TextButton_Toggle2.Font = Enum.Font.SourceSans
            TextButton_Toggle2.Text = " "
            TextButton_Toggle2.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_Toggle2.TextSize = 12.000

            TextButton_Toggle2.MouseEnter:Connect(function()
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextLabel_Toggle,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        TextButton_Toggle2.MouseLeave:Connect(function()
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextLabel_Toggle,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(200, 200, 200)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        local check = {toogle = false ; loacker = true ; togfunction = {

        };
    }
    TextButton_Toggle2.MouseButton1Click:Connect(function()
            if check.toogle == false and check.loacker == true  then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            elseif  check.loacker ==  true then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            end
            if  check.loacker == true  then
            check.toogle = not check.toogle
            callback(check.toogle)
            end
        end
    )

        if config == true then
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            check.toogle = true
            callback(check.toogle)
        end
        local lockerframe = Instance.new("Frame")

        lockerframe.Name = "lockerframe"
        lockerframe.Parent = Toggle
        lockerframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        lockerframe.BackgroundTransparency = 1
        lockerframe.Size = UDim2.new(0, 320, 0, 35)
        lockerframe.Position = UDim2.new(0.5, 0, 0.5, 0)
        lockerframe.AnchorPoint = Vector2.new(0.5, 0.5)

        local LockerImageLabel = Instance.new("ImageLabel")
        LockerImageLabel.Parent = lockerframe
        LockerImageLabel.BackgroundTransparency = 1.000
        LockerImageLabel.BorderSizePixel = 0
        LockerImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        LockerImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        LockerImageLabel.Size = UDim2.new(0, 0, 0, 0)
        LockerImageLabel.Image = "http://www.roblox.com/asset/?id=6031082533"


        function check.togfunction:lock()
            TweenService:Create(
                lockerframe,
                TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                {BackgroundTransparency = 0.7}
            ):Play()
            TweenService:Create(
                LockerImageLabel,
                TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                {Size = UDim2.new(0, 30, 0, 30)}
            ):Play()

            check.loacker  = false
        --    pcall(callback,locker)
        end
        function check.togfunction:unlock()
            TweenService:Create(
                lockerframe,
                TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                {BackgroundTransparency = 1}
            ):Play()
            TweenService:Create(
                LockerImageLabel,
                TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                {Size = UDim2.new(0, 0, 0, 0)}
            ):Play()
            check.loacker  = true
        --   pcall(callback,locker)
        end

            return  check.togfunction
        end

        function items:Button(text,callback)

            local ButtonFrame = Instance.new("Frame")

            ButtonFrame.Name = "ButtonFrame"
            ButtonFrame.Parent = ScrollingFrame_Pageframe
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonFrame.BorderSizePixel = 0
            ButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            ButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonFrame.Size = UDim2.new(0, 213, 0, 25) -- UDim2.new(0, 213, 0, 35)
            ButtonFrame.BackgroundTransparency  = 1
            ButtonFrame.ClipsDescendants = true



            local MheeFrameStroke = Instance.new("UIStroke")

            MheeFrameStroke.Thickness = 0
            MheeFrameStroke.Name = ""
            MheeFrameStroke.Parent = ButtonFrame
            MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            MheeFrameStroke.Color = Color3.fromRGB(255, 255, 255)
            MheeFrameStroke.Transparency = 0.7

            local Button = Instance.new("TextButton")

            Button.Parent = ButtonFrame
            Button.Name = "Button"
            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Button.Size = UDim2.new(0,150, 0, 25)
            Button.Font = Enum.Font.SourceSansSemibold
            Button.Text = tostring(text)
            Button.TextColor3 = Color3.fromRGB(155, 155, 155)
            Button.TextSize = 13.000
            Button.AnchorPoint = Vector2.new(0.5, 0.5)
            Button.Position = UDim2.new(0.5, 0, 0.5, 0)
            Button.TextXAlignment = Enum.TextXAlignment.Center
            Button.BackgroundTransparency = 0.6
            Button.TextWrapped = true
            Button.AutoButtonColor = false
            Button.ClipsDescendants = true

            local ConnerPageMhee = Instance.new("UICorner")

            ConnerPageMhee.CornerRadius = UDim.new(0, 4)
            ConnerPageMhee.Name = ""
            ConnerPageMhee.Parent = Button

            Button.MouseEnter:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size =  UDim2.new(0, 213, 0, 25)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )
            Button.MouseLeave:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size =  UDim2.new(0, 150, 0, 25)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        Button.MouseButton1Click:Connect(function()
        --    Ripple(Button)
            callback()
            TweenService:Create(
                Button,
                TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                {TextSize =  16} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            wait(0.1)
            TweenService:Create(
                Button,
                TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                {TextSize =  13} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

        end

        function items:Slider(text,check,floor,min,max,de,lol,tog,callback)

        if check then

            local SliderFrame = Instance.new("Frame")

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = ScrollingFrame_Pageframe
            SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- Color3.fromRGB(255, 255, 255)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            SliderFrame.Size = UDim2.new(0, 213, 0, 75) -- UDim2.new(0, 213, 0, 35)
            SliderFrame.BackgroundTransparency  = 0
            SliderFrame.ClipsDescendants = true

            local SliderFrameConner = Instance.new("UICorner")

            SliderFrameConner.CornerRadius = UDim.new(0, 4)
            SliderFrameConner.Name = ""
            SliderFrameConner.Parent = SliderFrame

            local SliderFrameStroke = Instance.new("UIStroke")

            SliderFrameStroke.Thickness = 1
            SliderFrameStroke.Name = ""
            SliderFrameStroke.Parent = SliderFrame
            SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            SliderFrameStroke.Color = Color3.fromRGB(255, 255, 255)
            SliderFrameStroke.Transparency = 0.7


            SliderFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    SliderFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

            SliderFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    SliderFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )


            local LabelNameSliderxd = Instance.new("TextLabel")

            LabelNameSliderxd.Parent = SliderFrame
            LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelNameSliderxd.BackgroundTransparency = 1
            LabelNameSliderxd.BorderSizePixel = 0
            LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
            LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelNameSliderxd.Size = UDim2.new(0, 120, 0, 20)
            LabelNameSliderxd.Font = Enum.Font.GothamBold
            LabelNameSliderxd.Text = tostring(text)
            LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
            LabelNameSliderxd.TextSize = 11.000
            LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left


            local ShowValueFarm = Instance.new("Frame")

            ShowValueFarm.Name = "ShowValueFarm"
            ShowValueFarm.Parent = SliderFrame
            ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ShowValueFarm.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
            ShowValueFarm.BackgroundTransparency = 0
            ShowValueFarm.BorderSizePixel = 0
            ShowValueFarm.AnchorPoint = Vector2.new(0.5, 0.5)
            ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
            ShowValueFarm.ClipsDescendants = false

            local CustomValue = Instance.new("TextBox")

            CustomValue.Parent = ShowValueFarm
            CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
            CustomValue.BorderSizePixel = 0
            CustomValue.ClipsDescendants = true
            CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
            CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
            CustomValue.Size = UDim2.new(0, 158, 0, 26)
            CustomValue.Font = Enum.Font.GothamSemibold
            CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
            CustomValue.PlaceholderText =  ""
            if floor == true then
                CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
            else
                CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
            end
            CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            CustomValue.TextSize = 8.000
            CustomValue.BackgroundTransparency = 1

            local ValueFrame = Instance.new("Frame")

            ValueFrame.Name = "ValueFrame"
            ValueFrame.Parent = SliderFrame
            ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ValueFrame.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            ValueFrame.Size = UDim2.new(0, 140, 0, 5)
            ValueFrame.BackgroundTransparency = 0
            ValueFrame.BorderSizePixel = 0
            ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            ValueFrame.Position = UDim2.new(0.4, 0, 0.8, 0)
            ValueFrame.ClipsDescendants = false


            local PartValue = Instance.new("Frame")

            PartValue.Name = "PartValue"
            PartValue.Parent = ValueFrame
            PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
            PartValue.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            PartValue.Size = UDim2.new(0, 140, 0, 5)
            PartValue.BackgroundTransparency = 1
            PartValue.BorderSizePixel = 0
            PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
            PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
            PartValue.ClipsDescendants = false

            local MainValue = Instance.new("Frame")

            MainValue.Name = "MainValue"
            MainValue.Parent = PartValue
            MainValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
            MainValue.BackgroundTransparency = 0
            MainValue.BorderSizePixel = 0
            -- MainValue.AnchorPoint = Vector2.new(0.5, 0.5)
            MainValue.Position = UDim2.new(0., 0, 0.0, 0)
            MainValue.ClipsDescendants = false

            local Conner_S1 = Instance.new("UICorner")

            Conner_S1.CornerRadius = UDim.new(0, 8)
            Conner_S1.Name = ""
            Conner_S1.Parent = MainValue

            local Conner_S2 = Instance.new("UICorner")

            Conner_S2.CornerRadius = UDim.new(0, 8)
            Conner_S2.Name = ""
            Conner_S2.Parent = ValueFrame

            local ConneValue = Instance.new("Frame")

            ConneValue.Name = "ConneValue"
            ConneValue.Parent = PartValue
            ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ConneValue.Size = UDim2.new(0, 13, 0,13)
            ConneValue.BackgroundTransparency = 0
            ConneValue.BorderSizePixel = 0
            ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
            ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.3,0.5, 0)
            ConneValue.ClipsDescendants = false


            local Conner_Conne = Instance.new("UICorner")

            Conner_Conne.CornerRadius = UDim.new(0, 300)
            Conner_Conne.Name = ""
            Conner_Conne.Parent = ConneValue

            local Addvalue = Instance.new("ImageButton")

            Addvalue.Name = "Imatog"
            Addvalue.Parent = SliderFrame
            Addvalue.BackgroundTransparency = 1.000
            Addvalue.BorderSizePixel = 0
            Addvalue.Position = UDim2.new(0.85, 0, 0.35, 0)
            Addvalue.Size = UDim2.new(0, 15, 0, 15)
            Addvalue.Image = "http://www.roblox.com/asset/?id=6035067836"
            Addvalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)

            local Deletevalue = Instance.new("ImageButton")

            Deletevalue.Name = "Imatog"
            Deletevalue.Parent = SliderFrame
            Deletevalue.BackgroundTransparency = 1.000
            Deletevalue.BorderSizePixel = 0
            Deletevalue.Position = UDim2.new(0.7, 0, 0.35, 0)
            Deletevalue.Size = UDim2.new(0, 15, 0, 15)
            Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
            Deletevalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)


            local TextButton_2_Toggle = Instance.new("TextButton")

            TextButton_2_Toggle.Parent = ValueFrame
            TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
    --        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_2_Toggle.BorderSizePixel = 0
            TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_2_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)
            TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
            TextButton_2_Toggle.Font = Enum.Font.SourceSans
            TextButton_2_Toggle.Text = " "
            TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_2_Toggle.TextSize = 12.000
            TextButton_2_Toggle.AutoButtonColor = false

            local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner.Name = ""
            TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

            local TextButton_3_Toggle = Instance.new("TextButton")

            TextButton_3_Toggle.Parent = TextButton_2_Toggle
            TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255,255)
    --        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_3_Toggle.BorderSizePixel = 0
            TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
            TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
            TextButton_3_Toggle.Font = Enum.Font.SourceSans
            TextButton_3_Toggle.Text = " "
            TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_3_Toggle.TextSize = 12.000
            TextButton_3_Toggle.AutoButtonColor = false

            local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner2.Name = ""
            TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

            local TextButton_4_Toggle = Instance.new("TextButton")

            TextButton_4_Toggle.Parent = TextButton_3_Toggle
            TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
    --        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_4_Toggle.BorderSizePixel = 0
            TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
            TextButton_4_Toggle.Font = Enum.Font.SourceSans
            TextButton_4_Toggle.Text = " "
            TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_4_Toggle.TextSize = 12.000
            TextButton_4_Toggle.AutoButtonColor = false
            TextButton_4_Toggle.BackgroundTransparency = 1
            TextButton_4_Toggle.Visible = true

            local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner4.Name = ""
            TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


            local TextButton_Toggle = Instance.new("TextButton")

            TextButton_Toggle.Parent = ValueFrame
            TextButton_Toggle.BackgroundTransparency =1
            TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_Toggle.BorderSizePixel = 0
            TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
            TextButton_Toggle.AutoButtonColor = false
            TextButton_Toggle.Font = Enum.Font.SourceSans
            TextButton_Toggle.Text = " "
            TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_Toggle.TextSize = 12.000
            TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)



        -- local value = de
        local check2 = {toogle2 = false;}
            local function move(input)
                local pos =
                    UDim2.new(
                        math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                        0,
                        0.3,
                        0
                    )
                local pos1 =
                    UDim2.new(
                        math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                        0,
                        0,
                        5
                    )

                    MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

                    ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                    if floor == true then
                        local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                        CustomValue.Text = tostring(value)
                    --   callback[2] = value
                    callback({
                        ["s"] = value;
                        ["t"] = check2.toogle2
                    })
                    --callback({value,check2.toogle2})
                        --callback(value)
                    else
                        local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                        CustomValue.Text = tostring(value)
                        callback({
                            ["s"] = value;
                            ["t"] = check2.toogle2
                        })
                --       callback({value,check2.toogle2})

                    end



                end

                local dragging = false
                ConneValue.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                ConneValue.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )
                SliderFrame.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                SliderFrame.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )


                ValueFrame.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                ValueFrame.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )

                game:GetService("UserInputService").InputChanged:Connect(
                    function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            move(input)
                        end
                    end
                    )

                    CustomValue.FocusLost:Connect(function()
                        if CustomValue.Text == "" then
                            CustomValue.Text  = de
                        end
                        if  tonumber(CustomValue.Text) > max then
                            CustomValue.Text  = max
                        end
                        if  tonumber(CustomValue.Text) <= min then
                            CustomValue.Text  = min
                        end
                        MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                        ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0, 0) , "Out", "Sine", 0.2, true)
                        if floor == true then
                            CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                        else
                            CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                        end
                        callback({
                            ["s"] =  CustomValue.Text;
                            ["t"] = check2.toogle2;
                        })
                --       callback({ tonumber(CustomValue.Text),check2.toogle2})
                --  pcall(callback, CustomValue.Text)
                    end)


                    Addvalue.MouseButton1Click:Connect(function ()
                        if CustomValue.Text == "" then
                            CustomValue.Text  = de
                        end
                        pcall(function()
                            CustomValue.Text  = CustomValue.Text  - tonumber(lol)
                        end)
                        if  tonumber(CustomValue.Text) > max then
                            CustomValue.Text  = max
                        end
                        if  tonumber(CustomValue.Text) < min then
                            CustomValue.Text  = min
                        end
                        MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                        ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                        if floor == true then
                            CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                        else
                            CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                        end
                        callback({
                            ["s"] =  CustomValue.Text;
                            ["t"] = check2.toogle2
                        })
                    --   callback({ tonumber(CustomValue.Text),check2.toogle2})
                    --  pcall(callback, CustomValue.Text)
                    end)

                    Deletevalue.MouseButton1Click:Connect(function ()
                        if CustomValue.Text == "" then
                            CustomValue.Text  = de
                        end
                        pcall(function()
                            CustomValue.Text  = CustomValue.Text  + tonumber(lol)
                        end)
                        if  tonumber(CustomValue.Text) > max then
                            CustomValue.Text  = max
                        end
                        if  tonumber(CustomValue.Text) < min then
                            CustomValue.Text  = min
                        end
                        MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                        ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                        if floor == true then
                            CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                        else
                            CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                        end
                        callback({
                            ["s"] =  CustomValue.Text;
                            ["t"] = check2.toogle2;
                        })
            --callback({ tonumber(CustomValue.Text),check2.toogle2})
                    --  pcall(callback, CustomValue.Text)
                    end)




            ---
                    TextButton_Toggle.MouseEnter:Connect(function()
                        TweenService:Create(
                            TextButton_4_Toggle,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                    end
                )

                TextButton_Toggle.MouseLeave:Connect(function()
                        TweenService:Create(
                            TextButton_4_Toggle,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                    end
                )



            TextButton_Toggle.MouseButton1Click:Connect(function()
                if check2.toogle2 == false   then
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                else
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                end
                    check2.toogle2 = not check2.toogle2
                    callback({
                        ["t"] = check2.toogle2;

                    })
                --   callback({value,check2.toogle2})
                    --callback(check2.toogle2)
            end
        )

            if tog == true then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                check2.toogle2 = true
                callback({
                    ["t"] = check2.toogle2;
                })
        --        callback({value,check2.toogle2})
            --  callback(check2.toogle2)
            end


        else
            tog = nil
            local SliderFrame = Instance.new("Frame")

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = ScrollingFrame_Pageframe
            SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- Color3.fromRGB(255, 255, 255)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            SliderFrame.Size = UDim2.new(0, 213, 0, 75) -- UDim2.new(0, 213, 0, 35)
            SliderFrame.BackgroundTransparency  = 0
            SliderFrame.ClipsDescendants = true

            local SliderFrameConner = Instance.new("UICorner")

            SliderFrameConner.CornerRadius = UDim.new(0, 4)
            SliderFrameConner.Name = ""
            SliderFrameConner.Parent = SliderFrame

            local SliderFrameStroke = Instance.new("UIStroke")

            SliderFrameStroke.Thickness = 1
            SliderFrameStroke.Name = ""
            SliderFrameStroke.Parent = SliderFrame
            SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            SliderFrameStroke.Color = Color3.fromRGB(255, 255, 255)
            SliderFrameStroke.Transparency = 0.7



            SliderFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    SliderFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

            SliderFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    SliderFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

            local LabelNameSliderxd = Instance.new("TextLabel")

            LabelNameSliderxd.Parent = SliderFrame
            LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelNameSliderxd.BackgroundTransparency = 1
            LabelNameSliderxd.BorderSizePixel = 0
            LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
            LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelNameSliderxd.Size = UDim2.new(0, 120, 0, 20)
            LabelNameSliderxd.Font = Enum.Font.GothamBold
            LabelNameSliderxd.Text = tostring(text)
            LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
            LabelNameSliderxd.TextSize = 11.000
            LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left


            local ShowValueFarm = Instance.new("Frame")

            ShowValueFarm.Name = "ShowValueFarm"
            ShowValueFarm.Parent = SliderFrame
            ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ShowValueFarm.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
            ShowValueFarm.BackgroundTransparency = 0
            ShowValueFarm.BorderSizePixel = 0
            ShowValueFarm.AnchorPoint = Vector2.new(0.5, 0.5)
            ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
            ShowValueFarm.ClipsDescendants = false

            local CustomValue = Instance.new("TextBox")

            CustomValue.Parent = ShowValueFarm
            CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
            CustomValue.BorderSizePixel = 0
            CustomValue.ClipsDescendants = true
            CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
            CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
            CustomValue.Size = UDim2.new(0, 158, 0, 26)
            CustomValue.Font = Enum.Font.GothamSemibold
            CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
            CustomValue.PlaceholderText =  ""
            if floor == true then
                CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
            else
                CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
            end
            CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            CustomValue.TextSize = 8.000
            CustomValue.BackgroundTransparency = 1

            local ValueFrame = Instance.new("Frame")

            ValueFrame.Name = "ValueFrame"
            ValueFrame.Parent = SliderFrame
            ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ValueFrame.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            ValueFrame.Size = UDim2.new(0, 190, 0, 5)
            ValueFrame.BackgroundTransparency = 0
            ValueFrame.BorderSizePixel = 0
            ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            ValueFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
            ValueFrame.ClipsDescendants = false


            local PartValue = Instance.new("Frame")

            PartValue.Name = "PartValue"
            PartValue.Parent = ValueFrame
            PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
            PartValue.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            PartValue.Size = UDim2.new(0, 190, 0, 5)
            PartValue.BackgroundTransparency = 1
            PartValue.BorderSizePixel = 0
            PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
            PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
            PartValue.ClipsDescendants = false

            local MainValue = Instance.new("Frame")

            MainValue.Name = "MainValue"
            MainValue.Parent = PartValue
            MainValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
            MainValue.BackgroundTransparency = 0
            MainValue.BorderSizePixel = 0
            -- MainValue.AnchorPoint = Vector2.new(0.5, 0.5)
            MainValue.Position = UDim2.new(0., 0, 0.0, 0)
            MainValue.ClipsDescendants = false

            local Conner_S1 = Instance.new("UICorner")

            Conner_S1.CornerRadius = UDim.new(0, 8)
            Conner_S1.Name = ""
            Conner_S1.Parent = MainValue

            local Conner_S2 = Instance.new("UICorner")

            Conner_S2.CornerRadius = UDim.new(0, 8)
            Conner_S2.Name = ""
            Conner_S2.Parent = ValueFrame

            local ConneValue = Instance.new("Frame")

            ConneValue.Name = "ConneValue"
            ConneValue.Parent = PartValue
            ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ConneValue.Size = UDim2.new(0, 13, 0,13)
            ConneValue.BackgroundTransparency = 0
            ConneValue.BorderSizePixel = 0
            ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
            ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.3,0.5, 0)
            ConneValue.ClipsDescendants = false


            local Conner_Conne = Instance.new("UICorner")

            Conner_Conne.CornerRadius = UDim.new(0, 300)
            Conner_Conne.Name = ""
            Conner_Conne.Parent = ConneValue

            local Addvalue = Instance.new("ImageButton")

            Addvalue.Name = "Imatog"
            Addvalue.Parent = SliderFrame
            Addvalue.BackgroundTransparency = 1.000
            Addvalue.BorderSizePixel = 0
            Addvalue.Position = UDim2.new(0.85, 0, 0.35, 0)
            Addvalue.Size = UDim2.new(0, 15, 0, 15)
            Addvalue.Image = "http://www.roblox.com/asset/?id=6035067836"
            Addvalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)

            local Deletevalue = Instance.new("ImageButton")

            Deletevalue.Name = "Imatog"
            Deletevalue.Parent = SliderFrame
            Deletevalue.BackgroundTransparency = 1.000
            Deletevalue.BorderSizePixel = 0
            Deletevalue.Position = UDim2.new(0.7, 0, 0.35, 0)
            Deletevalue.Size = UDim2.new(0, 15, 0, 15)
            Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
            Deletevalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)

            local function move(input)
                local pos =
                    UDim2.new(
                        math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                        0,
                        0.3,
                        0
                    )
                local pos1 =
                    UDim2.new(
                        math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                        0,
                        0,
                        5
                    )

                    MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

                    ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                    if floor == true then
                        local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                        CustomValue.Text = tostring(value)
                        callback(value)
                    else
                        local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                        CustomValue.Text = tostring(value)
                        callback(value)
                    end



                end

                local dragging = false
                ConneValue.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                ConneValue.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )
                SliderFrame.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                SliderFrame.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )


                ValueFrame.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                ValueFrame.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )

                game:GetService("UserInputService").InputChanged:Connect(
                    function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            move(input)
                        end
                    end
                    )

                    CustomValue.FocusLost:Connect(function()
                        if CustomValue.Text == "" then
                            CustomValue.Text  = de
                        end
                        if  tonumber(CustomValue.Text) > max then
                            CustomValue.Text  = max
                        end
                        MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                        ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0, 0) , "Out", "Sine", 0.2, true)
                        if floor == true then
                            CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                        else
                            CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                        end
                        pcall(callback, CustomValue.Text)
                    end)


            Addvalue.MouseButton1Click:Connect(function ()
                if CustomValue.Text == "" then
                    CustomValue.Text  = de
                end
                CustomValue.Text  = CustomValue.Text  - tonumber(lol)
                if  tonumber(CustomValue.Text) > max then
                    CustomValue.Text  = max
                end
                if  tonumber(CustomValue.Text) < min then
                    CustomValue.Text  = min
                end
                MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                if floor == true then
                    CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                else
                    CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                end
                pcall(callback, CustomValue.Text)
            end)

            Deletevalue.MouseButton1Click:Connect(function ()
                if CustomValue.Text == "" then
                    CustomValue.Text  = de
                end
                CustomValue.Text  = CustomValue.Text  + tonumber(lol)
                if  tonumber(CustomValue.Text) > max then
                    CustomValue.Text  = max
                end
                if  tonumber(CustomValue.Text) < min then
                    CustomValue.Text  = min
                end
                MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                if floor == true then
                    CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                else
                    CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                end
                pcall(callback, CustomValue.Text)
            end)

        end

        end

        function items:Drop(text,use,option,callback)

        if use == false then
            local DropFrame = Instance.new("Frame")

            DropFrame.Name = "DropFrame"
            DropFrame.Parent = ScrollingFrame_Pageframe
            DropFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)-- Color3.fromRGB(255, 255, 255)
            DropFrame.BorderSizePixel = 0
            DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            DropFrame.Size = UDim2.new(0, 213, 0, 30) -- UDim2.new(0, 213, 0, 35)
            DropFrame.BackgroundTransparency  = 0
            DropFrame.ClipsDescendants = true

            local ConnerDropFrame = Instance.new("UICorner")

            ConnerDropFrame.CornerRadius = UDim.new(0, 4)
            ConnerDropFrame.Name = ""
            ConnerDropFrame.Parent = DropFrame

            local DropFrameStroke = Instance.new("UIStroke")

            DropFrameStroke.Thickness = 1
            DropFrameStroke.Name = ""
            DropFrameStroke.Parent = DropFrame
            DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            DropFrameStroke.Color = Color3.fromRGB(255, 255, 255)
            DropFrameStroke.Transparency = 0.7





            local LabelFrameDrop = Instance.new("TextLabel")

            LabelFrameDrop.Parent = DropFrame
            LabelFrameDrop.Name = "LabelFrameDrop"
            LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
            LabelFrameDrop.Size =    UDim2.new(0, 213, 0, 30)
            LabelFrameDrop.Font = Enum.Font.SourceSansSemibold
            LabelFrameDrop.Text = ""
            LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelFrameDrop.TextSize = 14.000
        --   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelFrameDrop.BackgroundTransparency = 1
            LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


            local TextLabel_TapDrop = Instance.new("TextLabel")

            TextLabel_TapDrop.Parent = LabelFrameDrop
            TextLabel_TapDrop.Name = "TextLabel_TapDrop"
            TextLabel_TapDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
            TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
            TextLabel_TapDrop.Font = Enum.Font.SourceSansSemibold
            TextLabel_TapDrop.Text = tostring(text).." :"
            TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
            TextLabel_TapDrop.TextSize = 14.000
    --     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_TapDrop.BackgroundTransparency = 1
            TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


            local DropArbt_listimage = Instance.new("ImageButton")

            DropArbt_listimage.Parent = LabelFrameDrop
            DropArbt_listimage.BackgroundTransparency = 1.000
            DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
            DropArbt_listimage.Position = UDim2.new(0.9, 0, 0.5, 0)
            DropArbt_listimage.BorderSizePixel = 0
            DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
            DropArbt_listimage.Image = "http://www.roblox.com/asset/?id=6031091004"
            DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

            local ScolDown = Instance.new("ScrollingFrame")

            ScolDown.Name = "ScolDown"
            ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
            ScolDown.Parent = LabelFrameDrop
            ScolDown.Active = true
            ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScolDown.BorderSizePixel = 0
            ScolDown.Size = UDim2.new(0, 205, 0, 115)
            ScolDown.ScrollBarThickness = 3
            ScolDown.ClipsDescendants = true
            ScolDown.BackgroundTransparency = 1
            ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

            local UIListLayoutlist = Instance.new("UIListLayout")
            local UIPaddinglist = Instance.new("UIPadding")

            UIListLayoutlist.Name = "UIListLayoutlist"
            UIListLayoutlist.Parent = ScolDown
            UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayoutlist.Padding = UDim.new(0, 5)

            UIPaddinglist.Name = "UIPaddinglist"
            UIPaddinglist.Parent = ScolDown
            UIPaddinglist.PaddingTop = UDim.new(0, 5)
            UIPaddinglist.PaddingLeft = UDim.new(0, 12)

            local ButtonDrop = Instance.new("TextButton")

            ButtonDrop.Parent = DropFrame
            ButtonDrop.Name = "ButtonDrop"
            ButtonDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonDrop.Size = UDim2.new(0, 213, 0, 30)
            ButtonDrop.Font = Enum.Font.SourceSansSemibold
            ButtonDrop.Text = ""
            ButtonDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
            ButtonDrop.TextSize = 13.000
        --   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
            ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
            ButtonDrop.BackgroundTransparency = 1
            ButtonDrop.TextWrapped = true
            ButtonDrop.AutoButtonColor = false
            ButtonDrop.ClipsDescendants = true

            local dog = false

            local FrameSize = 75
            local cout = 0
            for i , v in pairs(option) do
                cout =cout + 1
                if cout == 1 then
                    FrameSize = 75
                elseif cout == 2 then
                    FrameSize = 110
                elseif cout >= 3 then
                    FrameSize = 150
                end

                local ListFrame = Instance.new("Frame")

                ListFrame.Name = "ListFrame"
                ListFrame.Parent = ScolDown
                ListFrame.BackgroundColor3 =  Color3.fromRGB(255,255,255)-- Color3.fromRGB(255, 255, 255)
                ListFrame.BorderSizePixel = 0
                ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                ListFrame.Size = UDim2.new(0, 180, 0, 30) -- UDim2.new(0, 213, 0, 35)
                ListFrame.BackgroundTransparency  = 1
                ListFrame.ClipsDescendants = true

                local TextLabel_TapDro2p = Instance.new("TextLabel")

                TextLabel_TapDro2p.Parent = ListFrame
                TextLabel_TapDro2p.Name =  tostring(v).."Dropdown"
                TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_TapDro2p.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 30)
                TextLabel_TapDro2p.Font = Enum.Font.SourceSansSemibold
                TextLabel_TapDro2p.Text = tostring(v)
                TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(155, 155, 155)
                TextLabel_TapDro2p.TextSize = 14.000
                TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_TapDro2p.BackgroundTransparency = 1
                TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

                local ButtonDrop2 = Instance.new("TextButton")

                ButtonDrop2.Parent = ListFrame
                ButtonDrop2.Name = "ButtonDrop2"
                ButtonDrop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonDrop2.Size = UDim2.new(0, 213, 0, 30)
                ButtonDrop2.Font = Enum.Font.SourceSansSemibold
                ButtonDrop2.Text = ""
                ButtonDrop2.TextColor3 = Color3.fromRGB(155, 155, 155)
                ButtonDrop2.TextSize = 13.000
            --   ButtonDrop2.AnchorPoint = Vector2.new(0.5, 0.5)
                ButtonDrop2.Position = UDim2.new(0., 0, 0., 0)
                ButtonDrop2.TextXAlignment = Enum.TextXAlignment.Center
                ButtonDrop2.BackgroundTransparency = 1
                ButtonDrop2.TextWrapped = true
                ButtonDrop2.AutoButtonColor = false
                ButtonDrop2.ClipsDescendants = true

                ButtonDrop2.MouseEnter:Connect(function ()
                    TweenService:Create(
                        TextLabel_TapDro2p,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end)

                ButtonDrop2.MouseLeave:Connect(function ()
                    TweenService:Create(
                        TextLabel_TapDro2p,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end)

                ButtonDrop2.MouseButton1Click:Connect(function()
                    TweenService:Create(
                        DropFrame,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        DropArbt_listimage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    TextLabel_TapDrop.Text =  text.." : "..tostring(v)
                    callback(v)
                    dog = not dog
                end
            )


                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            end


            DropFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    DropFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextLabel_TapDrop,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        DropFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    DropFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextLabel_TapDrop,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )


        ButtonDrop.MouseButton1Click:Connect(function()
            if dog == false then
                TweenService:Create(
                    DropFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = -180}
                ):Play()
                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            else
                TweenService:Create(
                    DropFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 0}
                ):Play()
                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            end
            dog = not dog
        end
    )
    ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )

        local dropfunc = {}

        function dropfunc:Clear()
            TextLabel_TapDrop.Text = tostring(text).." :"
            for i, v in next, ScolDown:GetChildren() do
                if v:IsA("Frame") then
                    v:Destroy()
                end
            end
            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end

        function dropfunc:Add(t)
            local ListFrame = Instance.new("Frame")

            ListFrame.Name = "ListFrame"
            ListFrame.Parent = ScolDown
            ListFrame.BackgroundColor3 =  Color3.fromRGB(255,255,255)-- Color3.fromRGB(255, 255, 255)
            ListFrame.BorderSizePixel = 0
            ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            ListFrame.Size = UDim2.new(0, 180, 0, 30) -- UDim2.new(0, 213, 0, 35)
            ListFrame.BackgroundTransparency  = 1
            ListFrame.ClipsDescendants = true

            local TextLabel_TapDro2p = Instance.new("TextLabel")

            TextLabel_TapDro2p.Parent = ListFrame
            TextLabel_TapDro2p.Name =  tostring(t).."Dropdown"
            TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_TapDro2p.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 30)
            TextLabel_TapDro2p.Font = Enum.Font.SourceSansSemibold
            TextLabel_TapDro2p.Text = tostring(t)
            TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(155, 155, 155)
            TextLabel_TapDro2p.TextSize = 14.000
            TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_TapDro2p.BackgroundTransparency = 1
            TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

            local ButtonDrop2 = Instance.new("TextButton")

            ButtonDrop2.Parent = ListFrame
            ButtonDrop2.Name = "ButtonDrop2"
            ButtonDrop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonDrop2.Size = UDim2.new(0, 213, 0, 30)
            ButtonDrop2.Font = Enum.Font.SourceSansSemibold
            ButtonDrop2.Text = ""
            ButtonDrop2.TextColor3 = Color3.fromRGB(155, 155, 155)
            ButtonDrop2.TextSize = 13.000
        --   ButtonDrop2.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonDrop2.Position = UDim2.new(0., 0, 0., 0)
            ButtonDrop2.TextXAlignment = Enum.TextXAlignment.Center
            ButtonDrop2.BackgroundTransparency = 1
            ButtonDrop2.TextWrapped = true
            ButtonDrop2.AutoButtonColor = false
            ButtonDrop2.ClipsDescendants = true

            ButtonDrop2.MouseEnter:Connect(function ()
                TweenService:Create(
                    TextLabel_TapDro2p,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end)

            ButtonDrop2.MouseLeave:Connect(function ()
                TweenService:Create(
                    TextLabel_TapDro2p,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end)

            ButtonDrop2.MouseButton1Click:Connect(function()
                TweenService:Create(
                    DropFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 0}
                ):Play()
                TextLabel_TapDrop.Text =  text.." : "..tostring(t)
                callback(t)
                dog = not dog
            end
        )

            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end
        return dropfunc

    else

        local location = option.location or self.flags
        local flag = not use and option.flag or ""
        local callback = callback or function() end
        local list = option.list or {}
        local default = list.default or list[1].Name

        if not use then
            location[flag] = default
        end


        local DropFrame = Instance.new("Frame")

        DropFrame.Name = "DropFrame"
        DropFrame.Parent = ScrollingFrame_Pageframe
        DropFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)-- Color3.fromRGB(255, 255, 255)
        DropFrame.BorderSizePixel = 0
        DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        DropFrame.Size = UDim2.new(0, 213, 0, 30) -- UDim2.new(0, 213, 0, 35)
        DropFrame.BackgroundTransparency  = 0
        DropFrame.ClipsDescendants = true

        local ConnerDropFrame = Instance.new("UICorner")

        ConnerDropFrame.CornerRadius = UDim.new(0, 4)
        ConnerDropFrame.Name = ""
        ConnerDropFrame.Parent = DropFrame

        local DropFrameStroke = Instance.new("UIStroke")

        DropFrameStroke.Thickness = 1
        DropFrameStroke.Name = ""
        DropFrameStroke.Parent = DropFrame
        DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        DropFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        DropFrameStroke.Transparency = 0.7





        local LabelFrameDrop = Instance.new("TextLabel")

        LabelFrameDrop.Parent = DropFrame
        LabelFrameDrop.Name = "LabelFrameDrop"
        LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
        LabelFrameDrop.Size =    UDim2.new(0, 213, 0, 30)
        LabelFrameDrop.Font = Enum.Font.SourceSansSemibold
        LabelFrameDrop.Text = ""
        LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelFrameDrop.TextSize = 14.000
    --   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelFrameDrop.BackgroundTransparency = 1
        LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


        local TextLabel_TapDrop = Instance.new("TextLabel")

        TextLabel_TapDrop.Parent = LabelFrameDrop
        TextLabel_TapDrop.Name = "TextLabel_TapDrop"
        TextLabel_TapDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
        TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
        TextLabel_TapDrop.Font = Enum.Font.SourceSansSemibold
        TextLabel_TapDrop.Text = tostring(text).." :"
        TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        TextLabel_TapDrop.TextSize = 14.000
--     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_TapDrop.BackgroundTransparency = 1
        TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


        local DropArbt_listimage = Instance.new("ImageButton")

        DropArbt_listimage.Parent = LabelFrameDrop
        DropArbt_listimage.BackgroundTransparency = 1.000
        DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
        DropArbt_listimage.Position = UDim2.new(0.9, 0, 0.5, 0)
        DropArbt_listimage.BorderSizePixel = 0
        DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
        DropArbt_listimage.Image = "http://www.roblox.com/asset/?id=6031091004"
        DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

        local ScolDown = Instance.new("ScrollingFrame")

        ScolDown.Name = "ScolDown"
        ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
        ScolDown.Parent = LabelFrameDrop
        ScolDown.Active = true
        ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScolDown.BorderSizePixel = 0
        ScolDown.Size = UDim2.new(0, 205, 0, 115)
        ScolDown.ScrollBarThickness = 3
        ScolDown.ClipsDescendants = true
        ScolDown.BackgroundTransparency = 1
        ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

        local UIListLayoutlist = Instance.new("UIListLayout")
        local UIPaddinglist = Instance.new("UIPadding")

        UIListLayoutlist.Name = "UIListLayoutlist"
        UIListLayoutlist.Parent = ScolDown
        UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayoutlist.Padding = UDim.new(0, 5)

        UIPaddinglist.Name = "UIPaddinglist"
        UIPaddinglist.Parent = ScolDown
        UIPaddinglist.PaddingTop = UDim.new(0, 5)
        UIPaddinglist.PaddingLeft = UDim.new(0, 12)

        local ButtonDrop = Instance.new("TextButton")

        ButtonDrop.Parent = DropFrame
        ButtonDrop.Name = "ButtonDrop"
        ButtonDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonDrop.Size = UDim2.new(0, 213, 0, 30)
        ButtonDrop.Font = Enum.Font.SourceSansSemibold
        ButtonDrop.Text = ""
        ButtonDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        ButtonDrop.TextSize = 13.000
    --   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
        ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
        ButtonDrop.BackgroundTransparency = 1
        ButtonDrop.TextWrapped = true
        ButtonDrop.AutoButtonColor = false
        ButtonDrop.ClipsDescendants = true

        local dog = false

        local FrameSize = 75
        local cout = 0
        for i , v in pairs(list) do
            cout =cout + 1
            if cout == 1 then
                FrameSize = 75
            elseif cout == 2 then
                FrameSize = 110
            elseif cout >= 3 then
                FrameSize = 150
            end

            local listtog = Instance.new("Frame")

            listtog.Name = "listtog"
            listtog.Parent = ScolDown
            listtog.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            listtog.BackgroundTransparency =1
            listtog.BorderSizePixel = 0
            listtog.ClipsDescendants = true
            listtog.AnchorPoint = Vector2.new(0.5, 0.5)
            listtog.Position = UDim2.new(0.5, 0, 0.5, 0)
            listtog.Size = UDim2.new(0, 210, 0, 33)


            local listtextbutton = Instance.new("TextButton")

            listtextbutton.Parent = listtog
            listtextbutton.BackgroundTransparency =1
            listtextbutton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            listtextbutton.BorderSizePixel = 0
            listtextbutton.Size =  UDim2.new(0, 210, 0, 33)
            listtextbutton.AutoButtonColor = false
            listtextbutton.Font = Enum.Font.SourceSans
            listtextbutton.Text = " "
            listtextbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
            listtextbutton.TextSize = 14.000

            local farmtoglist = Instance.new("TextButton")

            farmtoglist.Parent = listtextbutton
            farmtoglist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            farmtoglist.BorderColor3 = Color3.fromRGB(255, 255, 255)
            farmtoglist.BorderSizePixel = 0
            farmtoglist.AnchorPoint = Vector2.new(0.5, 0.5)
            farmtoglist.Position = UDim2.new(0.1, 0, 0.5, 0)
            farmtoglist.Size = UDim2.new(0, 23, 0, 23)
            farmtoglist.Font = Enum.Font.SourceSans
            farmtoglist.Text = " "
            farmtoglist.TextColor3 = Color3.fromRGB(0, 0, 0)
            farmtoglist.TextSize = 14.000
            farmtoglist.AutoButtonColor = false


            local farmtoglist2 = Instance.new("TextButton")

            farmtoglist2.Parent = farmtoglist
            farmtoglist2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
            farmtoglist2.BorderColor3 = Color3.fromRGB(255, 255, 255)
            farmtoglist2.BorderSizePixel = 0
            farmtoglist2.AnchorPoint = Vector2.new(0.5, 0.5)
            farmtoglist2.Position = UDim2.new(0.5, 0, 0.5, 0)
            farmtoglist2.Size = UDim2.new(0, 21, 0, 21)
            farmtoglist2.Font = Enum.Font.SourceSans
            farmtoglist2.Text = " "
            farmtoglist2.TextColor3 = Color3.fromRGB(0, 0, 0)
            farmtoglist2.TextSize = 14.000
            farmtoglist2.AutoButtonColor = false


            local listimage = Instance.new("ImageButton")

            listimage.Parent = farmtoglist2
            listimage.BackgroundTransparency = 1.000
            listimage.AnchorPoint = Vector2.new(0.5, 0.5)
            listimage.Position = UDim2.new(0.5, 0, 0.5, 0)
            listimage.BorderSizePixel = 0
            listimage.Size = UDim2.new(0, 0, 0, 0)
            listimage.Image = "http://www.roblox.com/asset/?id=5880482965"


            local textlist = Instance.new("TextLabel")


            textlist.Parent = listtextbutton
            textlist.Name = "textlist"
            textlist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textlist.BackgroundTransparency = 1.000
            textlist.AnchorPoint = Vector2.new(0.5, 0.5)
            textlist.Position = UDim2.new(0.5, 0, 0.5, 0)
            textlist.BorderSizePixel = 0
            textlist.Size = UDim2.new(0, 91, 0, 25)
            textlist.Font = Enum.Font.GothamSemibold
            textlist.Text = tostring(v.Name)
            textlist.TextColor3 = Color3.fromRGB(255, 255, 255)
            textlist.TextSize = 13.000



            local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 5)
            TextButton_Pageframe_Uiconner2.Name = ""
            TextButton_Pageframe_Uiconner2.Parent = farmtoglist

            local TextButton_Pageframe_Uiconner22 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner22.CornerRadius = UDim.new(0, 5)
            TextButton_Pageframe_Uiconner22.Name = ""
            TextButton_Pageframe_Uiconner22.Parent = farmtoglist2



            listtextbutton.MouseButton1Click:Connect(function()
                if not  location[v.flag] then
                    listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                    wait(0.1)
                    listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                else
                    listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                    wait(0.1)
                    listimage:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                end
                location[v.flag] = not location[v.flag]
                callback(location[v.flag])
            end
        )

        if  location[v.flag] then
            listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
            wait(0.1)
            listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)

            callback(location[v.flag])
        end

            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end


        DropFrame.MouseEnter:Connect(function()
            TweenService:Create(
                DropFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_TapDrop,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    DropFrame.MouseLeave:Connect(function()
            TweenService:Create(
                DropFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_TapDrop,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {ImageColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )


    ButtonDrop.MouseButton1Click:Connect(function()
        if dog == false then
            TweenService:Create(
                DropFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = -180}
            ):Play()
            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        else
            TweenService:Create(
                DropFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = 0}
            ):Play()
            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end
        dog = not dog
    end
)
ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )



        end



        end

        function items:TextBox(text,text2,callback)
            local TextFrame = Instance.new("Frame")

            TextFrame.Name = "TextFrame"
            TextFrame.Parent = ScrollingFrame_Pageframe
            TextFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
            TextFrame.BorderSizePixel = 0
            TextFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            TextFrame.Size = UDim2.new(0, 213, 0, 70)
            TextFrame.BackgroundTransparency  = 1
            TextFrame.ClipsDescendants = true

            local LabelNameSliderxd = Instance.new("TextLabel")

            LabelNameSliderxd.Parent = TextFrame
            LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelNameSliderxd.BackgroundTransparency = 1
            LabelNameSliderxd.BorderSizePixel = 0
            LabelNameSliderxd.Position = UDim2.new(0.5, 0, 0.2, 0)
            LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelNameSliderxd.Size = UDim2.new(0, 160, 0, 20)
            LabelNameSliderxd.Font = Enum.Font.GothamBold
            LabelNameSliderxd.Text = tostring(text)
            LabelNameSliderxd.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelNameSliderxd.TextSize = 11.000
            LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Center

            local ConerTextBox = Instance.new("UICorner")

            ConerTextBox.CornerRadius = UDim.new(0, 4)
            ConerTextBox.Name = ""
            ConerTextBox.Parent = TextFrame

            local FrameBox = Instance.new("Frame")

            FrameBox.Name = "TextFrame"
            FrameBox.Parent = TextFrame
            FrameBox.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
            FrameBox.BorderSizePixel = 0
            FrameBox.Position = UDim2.new(0.5, 0, 0.65, 0)
            FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)
            FrameBox.Size = UDim2.new(0, 158, 0, 30)
            FrameBox.BackgroundTransparency  = 0.2
            FrameBox.ClipsDescendants = true
            FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)

            local TextFrame2 = Instance.new("TextBox")

            TextFrame2.Parent = FrameBox
            TextFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextFrame2.BorderSizePixel = 0
            TextFrame2.ClipsDescendants = true
            TextFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
            TextFrame2.Size = UDim2.new(0, 158, 0, 35)
            TextFrame2.Font = Enum.Font.GothamSemibold
            TextFrame2.PlaceholderColor3 = Color3.fromRGB(155, 155, 155)
            TextFrame2.PlaceholderText = text2
            TextFrame2.Text = ""
            TextFrame2.TextColor3 = Color3.fromRGB(155, 155, 155)
            TextFrame2.TextSize = 12.000
            TextFrame2.BackgroundTransparency = 1

            local ConerTextBox2 = Instance.new("UICorner")

            ConerTextBox2.CornerRadius = UDim.new(0, 4)
            ConerTextBox2.Name = ""
            ConerTextBox2.Parent = FrameBox

            local TextBoxStroke = Instance.new("UIStroke")

            TextBoxStroke.Thickness = 1
            TextBoxStroke.Name = ""
            TextBoxStroke.Parent = FrameBox
            TextBoxStroke.LineJoinMode = Enum.LineJoinMode.Round
            TextBoxStroke.Color = Color3.fromRGB(255, 255, 255)
            TextBoxStroke.Transparency = 0.7


            TextFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    FrameBox,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    FrameBox,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextFrame2,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {PlaceholderColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextFrame2,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelNameSliderxd,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextBoxStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Thickness = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        TextFrame.MouseLeave:Connect(function()
            TweenService:Create(
                FrameBox,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 158, 0, 30)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                FrameBox,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(23, 23, 23)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextFrame2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {PlaceholderColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextBoxStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Thickness = 1} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelNameSliderxd,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextFrame2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
        )
            TextFrame2.FocusLost:Connect(function ()
                if #TextFrame2.Text > 0 then
                    pcall(callback,TextFrame2.Text)
                end
            end)
        end

        function items:Bind(text,bi,callback)
            local BindFrame = Instance.new("Frame")

            BindFrame.Name = "BindFrame"
            BindFrame.Parent = ScrollingFrame_Pageframe
            BindFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
            BindFrame.BorderSizePixel = 0
            BindFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            BindFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            BindFrame.Size = UDim2.new(0, 213, 0, 35)
            BindFrame.BackgroundTransparency  = 0
            BindFrame.ClipsDescendants = true

            local BindConner = Instance.new("UICorner")

            BindConner.CornerRadius = UDim.new(0, 4)
            BindConner.Name = ""
            BindConner.Parent = BindFrame

            local BindStroke = Instance.new("UIStroke")

            BindStroke.Thickness = 1
            BindStroke.Name = ""
            BindStroke.Parent = BindFrame
            BindStroke.LineJoinMode = Enum.LineJoinMode.Round
            BindStroke.Color = Color3.fromRGB(255, 255, 255)
            BindStroke.Transparency = 0.7

            local LabelBind = Instance.new("TextLabel")

            LabelBind.Parent = BindFrame
            LabelBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelBind.BackgroundTransparency = 1
            LabelBind.BorderSizePixel = 0
            LabelBind.Position = UDim2.new(0.4, 0, 0.5, 0)
            LabelBind.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelBind.Size = UDim2.new(0, 140, 0, 35)
            LabelBind.Font = Enum.Font.GothamBold
            LabelBind.Text = tostring(text)
            LabelBind.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelBind.TextSize = 11.000
            LabelBind.TextXAlignment = Enum.TextXAlignment.Left

            local key = bi.Name
            local LabelBind2 = Instance.new("TextButton")

            LabelBind2.Parent = BindFrame
            LabelBind2.Name = "LabelBind2"
            LabelBind2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelBind2.Size = UDim2.new(0, 100, 0, 19)
            LabelBind2.Font = Enum.Font.GothamBold
            LabelBind2.Text =  "KEY : "..key
            LabelBind2.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelBind2.TextSize = 11.000
            LabelBind2.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelBind2.Position = UDim2.new(0.75, 0, 0.5, 0)
            LabelBind2.TextXAlignment = Enum.TextXAlignment.Center
            LabelBind2.BackgroundTransparency = 1
            LabelBind2.TextWrapped = true

            local LabelBind22 = Instance.new("TextButton")

            LabelBind22.Parent = BindFrame
            LabelBind22.Name = "LabelBind22"
            LabelBind22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelBind22.Size = UDim2.new(0, 213, 0, 35)
            LabelBind22.Font = Enum.Font.GothamBold
            LabelBind22.Text =  ""
            LabelBind22.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelBind22.TextSize = 11.000
            LabelBind22.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelBind22.Position = UDim2.new(0.5, 0, 0.5, 0)
            LabelBind22.TextXAlignment = Enum.TextXAlignment.Center
            LabelBind22.BackgroundTransparency = 1
            LabelBind22.TextWrapped = true

            BindFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    BindStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind22,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind2,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )
            BindFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    BindStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind22,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind2,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

            LabelBind22.MouseButton1Click:Connect(function ()


                LabelBind2.Text = "KEY : ".."..."
                local inputwait = game:GetService("UserInputService").InputBegan:wait()
                local fuckulop = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode

                if
                fuckulop.Name ~= "Focus" and fuckulop.Name ~= "MouseMovement" and fuckulop.Name ~= "Focus"
                then
                    LabelBind2.Text =  "KEY : "..fuckulop.Name
                    key = fuckulop.Name
                end
                -- if fuckulop.Name ~= "Unknown" then
                --     LabelBind2.Text = fuckulop.Name
                --     key = fuckulop.Name
                -- end

            end)


            game:GetService("UserInputService").InputBegan:connect(
                function(current)
                    local fuckulop2 = current.KeyCode == Enum.KeyCode.Unknown and current.UserInputType or current.KeyCode

                        if fuckulop2.Name ==  key then
                            pcall(callback)

                    end
                end
                )

        end

        function items:Line()
            local LineFrame = Instance.new("Frame")

            LineFrame.Name = "LineFrame"
            LineFrame.Parent = ScrollingFrame_Pageframe
            LineFrame.BackgroundColor3 =  Color3.fromRGB(255, 255, 255)
            LineFrame.BorderSizePixel = 0
            LineFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            LineFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            LineFrame.Size = UDim2.new(0, 213, 0, 1)
            LineFrame.BackgroundTransparency  = 0
            LineFrame.ClipsDescendants = true

            local LineFrame_BindConner = Instance.new("UICorner")

            LineFrame_BindConner.CornerRadius = UDim.new(0, 30)
            LineFrame_BindConner.Name = ""
            LineFrame_BindConner.Parent = LineFrame

        end

        function items:Color(text,preset,callback)
            local Pixker = Instance.new("Frame")

            Pixker.Name = "Pixker"
            Pixker.Parent = ScrollingFrame_Pageframe
            Pixker.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            Pixker.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            Pixker.Size = UDim2.new(0, 213, 0, 33)
            Pixker.BackgroundTransparency = 0
            Pixker.BorderSizePixel = 0
            Pixker.AnchorPoint = Vector2.new(0.5, 0.5)
            Pixker.Position = UDim2.new(0.5, 0, 0.5, 0)
            Pixker.ClipsDescendants = true


            local BoxColorCorner2 = Instance.new("UICorner")

            BoxColorCorner2.CornerRadius = UDim.new(0, 4)
            BoxColorCorner2.Name = "BoxColorCorner"
            BoxColorCorner2.Parent = Pixker

            local MheeFrameStroke = Instance.new("UIStroke")

            MheeFrameStroke.Thickness = 1
            MheeFrameStroke.Name = ""
            MheeFrameStroke.Parent = Pixker
            MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            MheeFrameStroke.Color = Color3.fromRGB(255, 255, 255)
            MheeFrameStroke.Transparency = 0.7


            local TextFrameColor = Instance.new("TextLabel")

            TextFrameColor.Parent = Pixker
            TextFrameColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextFrameColor.BorderSizePixel = 0
            TextFrameColor.Size = UDim2.new(0, 200, 0, 34)
            TextFrameColor.Font = Enum.Font.SourceSans
            TextFrameColor.Text = "  "
            TextFrameColor.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextFrameColor.TextSize = 14.000
            TextFrameColor.BackgroundTransparency = 1
            TextFrameColor.Position = UDim2.new(0., 0, 0., 0)

            local TextReal = Instance.new("TextLabel")

            TextReal.Parent = TextFrameColor
            TextReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextReal.BorderSizePixel = 0
            TextReal.Size = UDim2.new(0, 140, 0, 34)
            TextReal.Font = Enum.Font.GothamSemibold
            TextReal.Text = text
            TextReal.TextColor3 = Color3.fromRGB(155,155, 155)
            TextReal.TextSize = 12.000
            TextReal.BackgroundTransparency = 1
            TextReal.Position = UDim2.new(0.05, 0, 0., 0)
            TextReal.TextXAlignment = Enum.TextXAlignment.Left

            local BoxColor = Instance.new("Frame")

            BoxColor.Name = "BoxColor"
            BoxColor.Parent = TextFrameColor
            BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BoxColor.Position = UDim2.new(0.85, 0, 0.5, 0)
            BoxColor.Size = UDim2.new(0, 35, 0, 19)
            BoxColor.AnchorPoint = Vector2.new(0.5, 0.5)

            local BoxColorCorner = Instance.new("UICorner")

            BoxColorCorner.CornerRadius = UDim.new(0, 4)
            BoxColorCorner.Name = "BoxColorCorner"
            BoxColorCorner.Parent = BoxColor

            local TextButton_Dropdown = Instance.new("TextButton")


            TextButton_Dropdown.Parent = TextFrameColor
            TextButton_Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TextButton_Dropdown.BorderSizePixel = 0
            TextButton_Dropdown.Position = UDim2.new(0., 0, 0.14705883, 0)
            TextButton_Dropdown.Size = UDim2.new(0, 200, 0, 33)
            TextButton_Dropdown.Font = Enum.Font.SourceSans
            TextButton_Dropdown.Text = "  "
            TextButton_Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_Dropdown.TextSize = 14.000
            TextButton_Dropdown.AutoButtonColor = false
            --TextButton_Dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_Dropdown.Position = UDim2.new(0, 0, 0, 0)
            TextButton_Dropdown.BackgroundTransparency = 1



            Pixker.MouseEnter:Connect(function()
                TweenService:Create(
                    MheeFrameStroke,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.}
                ):Play()
                TweenService:Create(
                    TextReal,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,255, 255)}
                ):Play()

            end)
            Pixker.MouseLeave:Connect(function()
                TweenService:Create(
                    MheeFrameStroke,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7}
                ):Play()
                TweenService:Create(
                    TextReal,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155,155, 155)}
                ):Play()
            end)
        -- Rainbow Toggle


        local TextButton_2_Toggle = Instance.new("TextButton")

        TextButton_2_Toggle.Parent = TextFrameColor
        TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
--        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_2_Toggle.BorderSizePixel = 0
        TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_2_Toggle.Position = UDim2.new(0.2, 0, 1.87, 0)
        TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
        TextButton_2_Toggle.Font = Enum.Font.SourceSans
        TextButton_2_Toggle.Text = " "
        TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_2_Toggle.TextSize = 12.000
        TextButton_2_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner.Name = ""
        TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

        local TextButton_3_Toggle = Instance.new("TextButton")

        TextButton_3_Toggle.Parent = TextButton_2_Toggle
        TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255,255)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_3_Toggle.BorderSizePixel = 0
        TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
        TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
        TextButton_3_Toggle.Font = Enum.Font.SourceSans
        TextButton_3_Toggle.Text = " "
        TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_3_Toggle.TextSize = 12.000
        TextButton_3_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner2.Name = ""
        TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

        local TextButton_4_Toggle = Instance.new("TextButton")

        TextButton_4_Toggle.Parent = TextButton_3_Toggle
        TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_4_Toggle.BorderSizePixel = 0
        TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
        TextButton_4_Toggle.Font = Enum.Font.SourceSans
        TextButton_4_Toggle.Text = " "
        TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_4_Toggle.TextSize = 12.000
        TextButton_4_Toggle.AutoButtonColor = false
        TextButton_4_Toggle.BackgroundTransparency = 1
        TextButton_4_Toggle.Visible = true

        local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner4.Name = ""
        TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


        local TextButton_Toggle = Instance.new("TextButton")

        TextButton_Toggle.Parent = ValueFrame
        TextButton_Toggle.BackgroundTransparency =1
        TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_Toggle.BorderSizePixel = 0
        TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
        TextButton_Toggle.AutoButtonColor = false
        TextButton_Toggle.Font = Enum.Font.SourceSans
        TextButton_Toggle.Text = " "
        TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_Toggle.TextSize = 12.000
        TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)

        local TextButton_3_Toggle2 = Instance.new("TextLabel")

        TextButton_3_Toggle2.Parent = TextButton_2_Toggle
        TextButton_3_Toggle2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
        TextButton_3_Toggle2.BorderColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_3_Toggle2.BorderSizePixel = 0
        TextButton_3_Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_3_Toggle2.Position = UDim2.new(1.9, 0, 0.5, 0)
        TextButton_3_Toggle2.Size = UDim2.new(0, 500, 0, 21)
        TextButton_3_Toggle2.Font = Enum.Font.SourceSansBold
        TextButton_3_Toggle2.Text = "Rainbow"
        TextButton_3_Toggle2.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_3_Toggle2.TextSize = 13.000
        TextButton_3_Toggle2.BackgroundTransparency = 1

        local OMF = Instance.new("TextButton")

        OMF.Parent = TextButton_2_Toggle
        OMF.BackgroundTransparency =1
        OMF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        OMF.BorderSizePixel = 0
        OMF.Size = UDim2.new(0, 100, 0, 20)
        OMF.AutoButtonColor = false
        OMF.Font = Enum.Font.SourceSans
        OMF.Text = " "
        OMF.TextColor3 = Color3.fromRGB(0, 0, 0)
        OMF.TextSize = 12.000
        OMF.AnchorPoint = Vector2.new(0.5, 0.5)
        OMF.Position = UDim2.new(1.3, 0, 0.5, 0)

        local Color =  Instance.new("ImageLabel")

        Color.Name = "Color"
        Color.Parent = TextFrameColor
        Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
        Color.Position = UDim2.new(0.05,0,4,0)
        Color.Size = UDim2.new(0, 195, 0, 40)
        Color.ZIndex = 0
        Color.BorderSizePixel = 0
        Color.Image = "rbxassetid://4155801252"

        local ColorFucj = Instance.new("UICorner")

        ColorFucj.CornerRadius = UDim.new(0, 4)
        ColorFucj.Name = ""
        ColorFucj.Parent = Color

        local ColorSelection =  Instance.new("ImageLabel")

        ColorSelection.Name = "ColorSelection"
        ColorSelection.Parent = Color
        ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
        ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ColorSelection.BackgroundTransparency = 1.000
        ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
        ColorSelection.Size = UDim2.new(0, 18, 0, 18)
        ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
        ColorSelection.ScaleType = Enum.ScaleType.Fit
        ColorSelection.Visible = true

        local Hue =  Instance.new("ImageLabel")

        Hue.Name = "Hue2"
        Hue.Parent = TextFrameColor
        Hue.Position = UDim2.new(0.14,0,3,0)
        Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Hue.Size = UDim2.new(0, 160, 0, 25)
        Hue.ZIndex = 0
        Hue.BorderSizePixel = 0

        local ColorFucj2 = Instance.new("UICorner")

        ColorFucj2.CornerRadius = UDim.new(0, 4)
        ColorFucj2.Name = ""
        ColorFucj2.Parent = Hue

        local HueGradient = Instance.new("UIGradient")

        HueGradient.Color = ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
            ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
            ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
            ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
            ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
        }
        HueGradient.Rotation = 0
        HueGradient.Name = "HueGradient"
        HueGradient.Parent = Hue

        local HueSelection =  Instance.new("ImageLabel")

        HueSelection.Name = "HueSelection"
        HueSelection.Parent = Hue
        HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
        HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HueSelection.BackgroundTransparency = 1.000
        HueSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
        HueSelection.Size = UDim2.new(0, 18, 0, 18)
        HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
        HueSelection.ScaleType = Enum.ScaleType.Fit
        HueSelection.Visible = true


        local BTN_XD = Instance.new("TextButton")

        BTN_XD.Parent = TextFrameColor
        BTN_XD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        BTN_XD.BorderColor3 = Color3.fromRGB(255, 255, 255)
        BTN_XD.BorderSizePixel = 0
        BTN_XD.AnchorPoint = Vector2.new(0.5, 0.5)
        BTN_XD.Position = UDim2.new(0.8, 0, 1.9, 0)
        BTN_XD.Size = UDim2.new(0, 50, 0, 25)
        BTN_XD.Font = Enum.Font.GothamSemibold
        BTN_XD.Text = "Confirm"
        BTN_XD.TextColor3 = Color3.fromRGB(255, 255, 255)
        BTN_XD.TextSize = 11.000
        BTN_XD.AutoButtonColor = false

        local BTN_XD_COnner = Instance.new("UICorner")

        BTN_XD_COnner.CornerRadius = UDim.new(0, 4)
        BTN_XD_COnner.Name = ""
        BTN_XD_COnner.Parent = BTN_XD



        local MheeFrameStroke = Instance.new("UIStroke")

        MheeFrameStroke.Thickness = 1
        MheeFrameStroke.Name = ""
        MheeFrameStroke.Parent = BTN_XD
        MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        MheeFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        MheeFrameStroke.Transparency = 0.7


        local UwU = false


        OMF.MouseButton1Click:Connect(function()
            if       UwU == false  then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            else
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            end
            UwU = not UwU
        end
    )


    OMF.MouseEnter:Connect(function()
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    OMF.MouseLeave:Connect(function()
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    OMF.MouseButton1Down:Connect(
            function()
                RainbowColorPicker = not RainbowColorPicker

                if ColorInput then
                    ColorInput:Disconnect()
                end

                if HueInput then
                    HueInput:Disconnect()
                end

                if RainbowColorPicker then


                    OldToggleColor = BoxColor.BackgroundColor3
                    OldColor = Color.BackgroundColor3
                    OldColorSelectionPosition = ColorSelection.Position
                    OldHueSelectionPosition = HueSelection.Position

                    while RainbowColorPicker do
                        BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
                        Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

                        ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                        HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

                        pcall(callback, BoxColor.BackgroundColor3)
                        wait()
                    end
                elseif not RainbowColorPicker then

                    BoxColor.BackgroundColor3 = OldToggleColor
                    Color.BackgroundColor3 = OldColor

                    ColorSelection.Position = OldColorSelectionPosition
                    HueSelection.Position = OldHueSelectionPosition

                    pcall(callback, BoxColor.BackgroundColor3)
                end
            end
        )
        TextButton_3_Toggle.MouseButton1Down:Connect(
            function()
                RainbowColorPicker = not RainbowColorPicker

                if ColorInput then
                    ColorInput:Disconnect()
                end

                if HueInput then
                    HueInput:Disconnect()
                end

                if RainbowColorPicker then


                    OldToggleColor = BoxColor.BackgroundColor3
                    OldColor = Color.BackgroundColor3
                    OldColorSelectionPosition = ColorSelection.Position
                    OldHueSelectionPosition = HueSelection.Position

                    while RainbowColorPicker do
                        BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
                        Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

                        ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                        HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

                        pcall(callback, BoxColor.BackgroundColor3)
                        wait()
                    end
                elseif not RainbowColorPicker then

                    BoxColor.BackgroundColor3 = OldToggleColor
                    Color.BackgroundColor3 = OldColor

                    ColorSelection.Position = OldColorSelectionPosition
                    HueSelection.Position = OldHueSelectionPosition

                    pcall(callback, BoxColor.BackgroundColor3)
                end
            end
        )


        local function UpdateColorPicker(nope)
            BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
            Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

            pcall(callback, BoxColor.BackgroundColor3)
        end
        ColorH =
        1 -
        (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
            Hue.AbsoluteSize.Y)
        ColorS =
            (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                Color.AbsoluteSize.X)
        ColorV =
            1 -
            (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                Color.AbsoluteSize.Y)

        BoxColor.BackgroundColor3 = preset
        Color.BackgroundColor3 = preset
        pcall(callback, BoxColor.BackgroundColor3)

        local RainbowColorPicker = false

        Color.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if RainbowColorPicker then
                        return
                    end

                    if ColorInput then
                        ColorInput:Disconnect()
                    end

                    ColorInput =
                        RunService.RenderStepped:Connect(
                            function()
                            local ColorX =
                                (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                    Color.AbsoluteSize.X)
                            local ColorY =
                                (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                    Color.AbsoluteSize.Y)

                            ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                            ColorS = ColorX
                            ColorV = 1 - ColorY

                            UpdateColorPicker(true)
                        end
                        )
                end
            end
        )


            Color.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if ColorInput then
                            ColorInput:Disconnect()
                        end
                    end
                end
            )

            Hue.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if RainbowColorPicker then
                            return
                        end

                        if HueInput then
                            HueInput:Disconnect()
                        end

                        HueInput =
                            RunService.RenderStepped:Connect(
                                function()
                                local HueY =
                                    (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                        Hue.AbsoluteSize.Y)
                                local HueX =
                                    (math.clamp(Mouse.X- Hue.AbsolutePosition.X, 0, Hue.AbsoluteSize.X) /
                                        Hue.AbsoluteSize.X)

                                HueSelection.Position = UDim2.new(HueX, 0, HueY, 0)
                                ColorH = 1 - HueY

                                UpdateColorPicker(true)
                            end
                            )
                    end
                end
            )

            Hue.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if HueInput then
                            HueInput:Disconnect()
                        end
                    end
                end
            )
            local sk = false
            TextButton_Dropdown.MouseButton1Click:Connect(function()
                if sk == false then
                TweenService:Create(
                    Pixker,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 180)}
                ):Play()
            else
                TweenService:Create(
                    Pixker,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 33)}
                ):Play()
            end
            sk = not sk
            end
        )
            BTN_XD.MouseButton1Click:Connect(
                function()
                    TweenService:Create(
                        Pixker,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 213, 0, 33)}
                    ):Play()
                    sk = not sk
                end
            )


        end
        function items:Label(text,image)
            if image == nil then
                image = "6031229361"
            end
            local labaelchange = {}
            local LabelFrame = Instance.new("Frame")


            LabelFrame.Name = "Mainframenoti"
            LabelFrame.Parent = ScrollingFrame_Pageframe
            LabelFrame.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            LabelFrame.BackgroundTransparency = 0
            LabelFrame.BorderSizePixel = 0
            LabelFrame.ClipsDescendants = false
            LabelFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelFrame.Position = UDim2.new(0.498, 0, 0.5, 0)
            LabelFrame.Size = UDim2.new(0, 213, 0, 28)

            local LabelFarm2 = Instance.new("TextLabel")

            LabelFarm2.Parent = LabelFrame
            LabelFarm2.Name = "TextLabel_Tap"
            LabelFarm2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            LabelFarm2.Size =UDim2.new(0, 130, 0,24 )
            LabelFarm2.Font = Enum.Font.SourceSansSemibold
            LabelFarm2.Text = text
            LabelFarm2.TextColor3 = Color3.fromRGB(255, 255, 255)
            LabelFarm2.TextSize = 12.000
            LabelFarm2.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelFarm2.Position = UDim2.new(0.5, 0, 0.5, 0)
            LabelFarm2.TextXAlignment = Enum.TextXAlignment.Center
            LabelFarm2.BackgroundTransparency = 1
            LabelFarm2.TextWrapped = true

            local ImageLabel_gx = Instance.new("ImageLabel")

            ImageLabel_gx.Parent = LabelFrame
            ImageLabel_gx.BackgroundTransparency = 1.000
            ImageLabel_gx.BorderSizePixel = 0
            ImageLabel_gx.Size = UDim2.new(0, 18, 0, 18)
            ImageLabel_gx.AnchorPoint = Vector2.new(0.5, 0.5)
            ImageLabel_gx.Position = UDim2.new(0.06, 0, 0.45, 0)
            ImageLabel_gx.Image = "http://www.roblox.com/asset/?id="..tostring(image)
            ImageLabel_gx.BackgroundTransparency = 1

            local noticore55 = Instance.new("UICorner")

            noticore55.CornerRadius = UDim.new(0, 4)
            noticore55.Name = ""
            noticore55.Parent = LabelFarm2

            local noticore2777 = Instance.new("UICorner")

            noticore2777.CornerRadius = UDim.new(0, 4)
            noticore2777.Name = ""
            noticore2777.Parent = LabelFrame

            local LabelStroke = Instance.new("UIStroke")

            LabelStroke.Thickness = 1
            LabelStroke.Name = ""
            LabelStroke.Parent = LabelFrame
            LabelStroke.LineJoinMode = Enum.LineJoinMode.Round
            LabelStroke.Color = Color3.fromRGB(255, 255, 255)
            LabelStroke.Transparency = 0.7

            LabelFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    LabelStroke,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency =0}
                ):Play()
            end
        )
            LabelFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    LabelStroke,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency =0.7}
                ):Play()
            end
        )
            function labaelchange:Change(text2)
                LabelFarm2.Text = text2
            end
            return  labaelchange
        end
        return  items
        end
    return  page
    end
return top
end


local Window = create:Win("Chill Hub")

game:GetService("CoreGui").redui.MainSceen.Visible = false

create:Notifile("Chill Hub", "Welcome to Chill Hub", 5)

game:GetService("CoreGui").redui.MainSceen.Visible = true


local Tap1 = Window:Taps("Auto Farm")
local Tap2 = Window:Taps("Find Fruit")
local Tap6 = Window:Taps("Quest")
local Tap3 = Window:Taps("Teleport & Buy")
local Tap4 = Window:Taps("Farm Bounty")
local Tap5 = Window:Taps("Setting")

local page1 = Tap1:newpage()
local page2 = Tap1:newpage()
local page3 = Tap2:newpage()
local page4 = Tap2:newpage()
local page5 = Tap3:newpage()
local page6 = Tap3:newpage()
local page7 = Tap4:newpage()
local page8 = Tap4:newpage()
local page9 = Tap5:newpage()
local page10 = Tap5:newpage()
local page11 = Tap6:newpage()
local page12 = Tap6:newpage()

local plr = game.Players.LocalPlayer

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local remotes = {}
    local a
    a=hookmetamethod(game,"__namecall",function(self,...)
        local args = {...}
        local method = getnamecallmethod()
        if method == "FireServer" or method == "InvokeServer" then
            if self.Name == "RemoteEvent" and not getgenv().goro and args[3] == "StopCharging" then
                remotes[self.Name] = args[1]
                return a(self,unpack(args))
            end
        end
          return a(self,...)
    end)
    
    local attackremote = {}
    
    local a

    a=hookmetamethod(game,"__namecall",function(self,...)
        local args = {...}
        local method = getnamecallmethod()
        if method == "FireServer" or method == "InvokeServer" then
            if self.Name == "RequestAnimation" and not getgenv().fastattack then
                attackremote[self.Name] = args[1]
                return a(self,unpack(args))
            end
        end
          return a(self,...)
    end)

    function serializeTable(val, name, skipnewlines, depth)
       skipnewlines = skipnewlines or false
       depth = depth or 0
    
       local tmp = string.rep("", depth)
    
       if name then tmp = tmp end
    
       if type(val) == "table" then
           tmp = tmp .. (not skipnewlines and "" or "")
    
           for k, v in pairs(val) do
               tmp =  tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. (not skipnewlines and "" or "")
           end
    
           tmp = tmp .. string.rep("", depth) 
       elseif type(val) == "number" then
           tmp = tmp .. tostring(val)
       elseif type(val) == "string" then
           tmp = tmp .. string.format("%q", val)
       elseif type(val) == "boolean" then
           tmp = tmp .. (val and "true" or "false")
       elseif type(val) == "function" then
           tmp = tmp  .. "func: " .. debug.getinfo(val).name
       else
           tmp = tmp .. tostring(val)
       end
    
       return tmp
    end

    local mt = getrawmetatable(game)
    local namecall = mt.__namecall
    local setreadonly = setreadonly or make_writable


    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local args = {...}
        local arguments = args
        local a = {}
        for i = 1, #arguments - 1 do
            a[i] = arguments[i]
        end
        local method = getnamecallmethod()

        if method == 'FireServer' or method == "InvokeServer" then
            if self.Name == 'Drown' and getgenv().Save["NoDame"] then
                if args[1] then
                    return nil
                end
            end
        end
        
        return namecall(self, ...)    
    end)

    setreadonly(mt, true)

    local a
    a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RemoteEvent" and args[3] == "StopCharging" and getgenv().Save["Autoskillvip"] then
            args[6] = 100
            return a(self,unpack(args))
        end
    end
      return a(self,...)
    end)
            local a
    a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RemoteEvent" and args[3] == "StopCharging" and getgenv().Save["Autoskillvip2"] then
            args[6] = "500"
            return a(self,unpack(args))
        end
    end
      return a(self,...)
    end)
            local a
    a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RemoteEvent" and args[3] == "StopCharging" and getgenv().Save["Autoskillvip3"] then
            args[6] = "1000"
            return a(self,unpack(args))
        end
    end
      return a(self,...)
    end)
        local a
    a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RemoteEvent" and args[3] == "StopCharging" and getgenv().Save["Autoskillvip4"] then
            args[6] = "10000"
            return a(self,unpack(args))
        end
    end
      return a(self,...)
    end)
            local a
    a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RemoteEvent" and args[3] == "StopCharging" and getgenv().Save["Autoskillvip5"] then
            args[6] = "100000"
            return a(self,unpack(args))
        end
    end
      return a(self,...)
    end)
            local a
    a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RemoteEvent" and args[3] == "StopCharging" and getgenv().Save["Autoskillvip6"] then
            args[6] = "100000000"
            return a(self,unpack(args))
        end
    end
      return a(self,...)
    end)
            local a
    a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RemoteEvent" and args[3] == "StopCharging" and getgenv().Save["Autoskillvip7"] then
            args[6] = "1000000000"
            return a(self,unpack(args))
        end
    end
      return a(self,...)
    end)
            local a
    a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RemoteEvent" and args[3] == "StopCharging" and getgenv().Save["Autoskillvip8"] then
            args[6] = "10000000000"
            return a(self,unpack(args))
        end
    end
      return a(self,...)
    end)
            local a
    a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RemoteEvent" and args[3] == "StopCharging" and getgenv().Save["Autoskillvip9"] then
            args[6] = "100000000000"
            return a(self,unpack(args))
        end
    end
      return a(self,...)
    end)



function loadcheck()
    if isfile("Chill Hub.json") then
        g = readfile("Chill Hub.json")
            return g
        else
            writefile("Chill Hub.json",game:GetService("HttpService"):JSONEncode(getgenv().Save))
        return
    end
end
getgenv().Save = {
    ["rejoin"] = false,
    ["Mod"] = false,
    ["raid"] = false,
    ["quest"] = false,
    ["rayleigh"] = false,
    ["NoDame"] = false,
    ["AutoSave"] = false,
    ["BringFruit"] = false,
    ["Autoskillvip"] = false,
    ["Autoskillvip2"] = false,
    ["Autoskillvip3"] = false,
    ["Autoskillvip4"] = false,
    ["Autoskillvip5"] = false,
    ["Autoskillvip6"] = false,
    ["Autoskillvip7"] = false,
    ["Autoskillvip8"] = false,
    ["Autoskillvip9"] = false,
    ["skillvip1"] = false,
    ["skillvip2"] = false,
    ["EQUIPTOOL"] = getgenv().tool,
    ["posFarm"] = tostring(getgenv().posFarm),
    ["tptodie"] = false,
    ["tptospawn"] = false,
    ["playerfarmbounty"] = getgenv().bobo,
    ["fixbugspawn"] = false,
    ["spawn"] = false,
    ["MethodBty"] = getgenv().methodbty,
    ["WebHookTF"] = false,
    ["WebHookText"] = getgenv().webhook,
    ["Hopseverf"] = false,
    ["Hopseverp"] = false,
    ["Farmmelee"] = false,
    ["Choosefruit"] = getgenv().choosefruit,
    ["FruitFarm"] = false,
    ["timespam"] = 0.5,
    ["savetime"] = false,
    ["bringcp"] = false,
    ["Phoenix"] = false,
    ["Magma"] = false, 
    ["Flare"] = false,
    ["Chilly"] = false,
    ["Chilly2"] = false,
    ["Bomb"] = false,
    ["Dark"] = false,
    ["Goro"] = false,
    ["Pika"] = false, 
    ["gravity"] = false,
    ["gravity1"] = false,
    ["gravity2"] = false,
    ["gravity3"] = false,
    ["vampire1"] = false,
    ["ChooseMet"] = getgenv().ChooseMet,
    ["TPPLAYER"] = false,
    ["acccp"] = false,
    ["autostore"] = false,
    ["findsam"] = false,
    ["Openbox"] = false,
    ["Quake"] = false,
    ["Quake2"] = false,
    ["Quake3"] = false,
    ["FixSpam"] = false,
    ["Noclip"] = false,
    ["Mtdf"] = getgenv().mtdf,
    ["AMtdf"] = false,
    ["DistanceDefense"] = 100,
    ["FastAttack"] = false,
    ["FastAttack2"] = false,
    ["Buso"] = false,
    ["Webhookfp"] = false,
    ["mixer"] = false,
    ["fish"] = false,
    ["hopmr"] = false,
    ["drink"] = false,
    ["killplayers"] = false,
    ["mtfa"] = getgenv().mtfa
}

function LoadSetting()
    if isfile("Chill Hub.json") then
            vb = game:GetService("HttpService"):JSONDecode(readfile("Chill Hub.json"))
            getgenv().Save = vb
                return vb
        else
            loadcheck()
        return
    end
end

function SaveSetting()
    if isfile("Chill Hub.json") then
            f = writefile
            writefile("Chill Hub.json",game:GetService("HttpService"):JSONEncode(getgenv().Save))
                return f
        else
            loadcheck()
        return
    end
end


loadcheck()
LoadSetting()

function ATTACK()
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
end

page1:Label("Main")
page5:Label("Tp IsLand")
page6:Label("Buy Item")
page8:Label("Farm All Players")

page8:Toggle("Farm All Players",getgenv().Save["killplayers"],function(bool)
    getgenv().Save["killplayers"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page8:Drop("Choose Method", false,{"Magma", "Rumble", "Pika" , "Flare" , "Vampire" , "Quake","Gravity","Flare"} , function(t)
    getgenv().mtfa = t 
    getgenv().Save["mtfa"] = getgenv().mtfa
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)


if getgenv().Save["mtfa"] == nil then
    getgenv().Save["mtfa"] = ""
end

page8:Label("Farm Players/War")
page10:Label("Auto Defense. When someone comes close, automatically kills")

page10:Drop("Choose Method", false,{"Magma", "Rumble", "Pika" , "Flare" , "Vampire" , "Quake","Gravity","Flare"} , function(t)
    getgenv().mtdf = t 
    getgenv().Save["Mtdf"] = getgenv().mtdf
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page10:Slider("Distance Defense", false , false , 0 , 10000 , tonumber(getgenv().Save["DistanceDefense"]),tonumber(getgenv().Save["DistanceDefense"]),false, function(t)
    getgenv().Save["DistanceDefense"] = t
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
    print(getgenv().Save["DistanceDefense"])
end)


page10:Toggle("Auto Defense", getgenv().Save["AMtdf"], function(t)
    getgenv().Save["AMtdf"] = t 
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

 page5:Drop("Choose Island" , false, {
     "Grassy","Snowy Mountains","Pursuer's Island","Bar","Cliffs","Windmill", "Cave","Krizma","Pirate","Green","Trees","Pyramid","Package","Snowy","Mountain", "Marine Ford","Sand Castle", "Forest","Evil",
"Crescent","Islands","Town","Rocky","Palm","Sand","Sand 2","Small","Tiny","Super Tiny","Grass","Atlar","Safe Place"
 }, function(t)
     getgenv().tpisland = t 
     if getgenv().tpisland == "Grassy" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(737, 241, 1209)
       elseif getgenv().tpisland == "Snowy Mountains"  then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(6501, 408, -1261)
       elseif getgenv().tpisland == "Pursuer's Island" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(4847, 570, -7143)
       elseif getgenv().tpisland == "Bar" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(1522, 260, 2188)
       elseif getgenv().tpisland == "Cliffs" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(4598, 217, 4964)
       elseif getgenv().tpisland == "Windmill" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-7, 224, -91)
       elseif getgenv().tpisland == "Cave" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-280, 217, -831)
       elseif getgenv().tpisland == "Krizma" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1109, 341, 1645)
       elseif getgenv().tpisland == "Pirate" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1283, 218, -1348)
       elseif getgenv().tpisland == "Green" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-2727, 253, 1041)
       elseif getgenv().tpisland == "Trees" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(1068, 217, 3351)
       elseif getgenv().tpisland == "Pyramid" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(118, 216, 4773)
       elseif getgenv().tpisland == "Package" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1668, 217, -300)
       elseif getgenv().tpisland == "Snowy" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1896, 222, 3385)
       elseif getgenv().tpisland == "Mountain" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(2052, 488, -701)
       elseif getgenv().tpisland == "Marine Ford" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-3164, 296, -3780)
       elseif getgenv().tpisland == "Sand Castle" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(1020, 224, -3277)
       elseif getgenv().tpisland == "Forest" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-5781, 216, 114)
       elseif getgenv().tpisland == "Evil" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-5169, 523, -7803)
       elseif getgenv().tpisland == "Crescent" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(3193, 357, 1670)
       elseif getgenv().tpisland == "Islands" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-4319, 245, 5252)
       elseif getgenv().tpisland == "Town" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(1818, 218, 755)
       elseif getgenv().tpisland == "Rocky" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-37, 229, 2149)
       elseif getgenv().tpisland == "Palm" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(766, 216, -1374)
       elseif getgenv().tpisland == "Sand" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-2747, 216, -942)
       elseif getgenv().tpisland == "Sand 2" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(162, 216, -2265)
       elseif getgenv().tpisland == "Small" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(1237, 240, -244)
       elseif getgenv().tpisland == "Tiny" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1235, 223, 623)
       elseif getgenv().tpisland == "Super Tiny" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-4007, 216, -2190)
       elseif getgenv().tpisland == "Grass" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(2096, 217, -1884)
       elseif getgenv().tpisland == "Atlar" then
         plr.Character.HumanoidRootPart.CFrame = game.workspace.Altar.RecepticalEffect.CFrame * CFrame.new(0, 5, 0)
       elseif getgenv().tpisland == "Safe Place" then
         for i,v in pairs(game:GetService("Workspace").ISLAND:GetChildren()) do
             if v.Name == "Part" then
                 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,10,0)
             end
         end
     end
 end)
 page6:Drop("Choose NPC" , false, {
    "Rayleigh","Better Drink","Drink","Flail","QuestFish","Krizma","Sword","Sniper","Emote","Affinity","Fish","Expertise"
    
    }, function(t)
    getgenv().tpmerchant = t
    if getgenv().tpmerchant == "Rayleigh" then
            local emoi = game:GetService("Workspace").Merchants.QuestHakiMerchant.Clickable.Available.Value
    if emoi == true
    then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Merchants.QuestHakiMerchant.HumanoidRootPart.CFrame
        else
            create:Notifile("Chill Hub", "Rayleigh did not spawn.!", 5)
            end
    elseif getgenv().tpmerchant == "Better Drink" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(1493, 260, 2171)
    elseif getgenv().tpmerchant == "Drink" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1282, 218, -1368)
    elseif getgenv().tpmerchant == "Flail" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(1110, 217, 3369)
    elseif getgenv().tpmerchant == "QuestFish" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1702, 216, -325)
    elseif getgenv().tpmerchant == "Krizma" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1072, 361, 1669)
    elseif getgenv().tpmerchant == "Sword" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(1005, 224, -3339)
    elseif getgenv().tpmerchant == "Sniper" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1843, 222, 3416)
    elseif getgenv().tpmerchant == "Emote" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(1522, 265, 2165)
    elseif getgenv().tpmerchant == "Affinity" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(113, 278, 4952)
            elseif getgenv().tpmerchant == "Fish" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(1983, 218, 566)
    elseif getgenv().tpmerchant == "Expertise" then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(903, 270, 1219)
        end
    end)
    page6:Label("Buy Drink")
    page6:Drop("Choose Drink",false, {"Lemonade+", "Smoothie+" , "Juice+", "Cider+", "Lemonade", "Smoothie", "Juice", "Cider" } , function(t)
        getgenv().drink = t
    end)
            page6:TextBox("Amount",". . .",function(a)
          getgenv().amountdrink = a
            end)
            page6:Button("Buy Drink",function()
drink()
            end)
        page6:Button("Instant Drink",function()
instdrink()
        end)
        page11:Label("Haki Quest ( lvl 1k+ )")
        page11:Toggle("Auto Get Haki",getgenv().Save["rayleigh"],function(r)
            getgenv()Save["rayleigh"] = r
                if getgenv().Save["rayleigh"] then
        SaveSetting()
                end
                end)
            page11:Label("Expertise Quest")
        page11:Toggle("Auto Expertise",getgenv().Save["quest"],function(r)
            getgenv()Save["quest"] = r
                if getgenv().Save["quest"] then
        SaveSetting()
        end
        end)
        page11:Label("Fishing")
                page11:Toggle("Auto Fish",getgenv().Save["fish"],function(r)
            getgenv()Save["fish"] = r
                if getgenv().Save["fish"] then
        SaveSetting()
        end
        end)
        page12:Label("Open Gui")
        page12:Drop("Select Npc",false,{"BetterDrinkMerchant","DrinkMerchant","FlailMerchant","QuestFishMerchant","QuestMerchant"
            ,"KrizmaMerch","SwordMerchant","SniperMerchant","Boat2Merchant","Boat1Merchant","Boat4Merchant","Boat3Merchant","EmoteMerchant","AffinityMerchant","QuestMerchant"
            ,"FishMerchant","ExpertiseMerchant","QuestHakiMerchant"}, function(c)
    getgenv().gui = c
end)
page12:Button("Talk", function()
for i,v in pairs(game:GetService("Workspace").Merchants:GetChildren()) do
    if v.Name == getgenv().gui then
        fireclickdetector(v.Clickable.ClickDetector)
end
end
end)
page12:Label("Haki Farm")
page12:Button("Haki 1",function()
    haki1()
end)
page12:Button("Haki 2",function()
    haki2()
end)
getgenv().NamePlayer = {}
for i,v in pairs(game.Players:GetChildren()) do
    table.insert(getgenv().NamePlayer ,v.Name)
end

local concu = page8:Drop("Choose Player",false ,getgenv().NamePlayer , function(t)
    getgenv().playerr = t 
    getgenv().Save["Players"] = getgenv().playerr
end)

if getgenv().Save["Players"] == nil then
    getgenv().Save["Players"] = ""
end

local plr1 = game.Players.LocalPlayer.Character
local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])

page8:Button("Refresh Players",function()
    concu:Clear()
    for i,v in pairs(game.Players:GetChildren()) do
       concu:Add(v.Name)
    end
end)

if getgenv().Save["ChooseMet"] == nil then
    getgenv().Save["ChooseMet"] = ""
end

page8:Drop("Select Method TP", false, {"Angel", "Normal", "Under", "Behind"}, function(t)
    getgenv().ChooseMet = t 
    getgenv().Save["ChooseMet"] = getgenv().ChooseMet
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page8:Toggle("TP TO PLAYER",getgenv().Save["TPPLAYER"],function(bool)
    getgenv().Save["TPPLAYER"] = bool
    local plr1 = game.Players.LocalPlayer.Character
    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude < 1000 and getgenv().Save["Players"] ~= nil and getgenv().Save["Players"] ~= "" then
        create:Notifile("Chill Hub", "Spawn Zone", 3)
    end
    if getgenv().Save["ChooseMet"] == "" then
        create:Notifile("Chill Hub", "Choose Method TP first", 3)
    end
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page8:Toggle("spamskill Phoenix",getgenv().Save["Phoenix"],function(bool)
    getgenv().Save["Phoenix"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill Magma",getgenv().Save["Magma"],function(bool)
    getgenv().Save["Magma"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill Flare",getgenv().Save["Flare"],function(bool)
    getgenv().Save["Flare"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill Chilly 1",getgenv().Save["Chilly"],function(bool)
    getgenv().Save["Chilly"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill Chilly 2",getgenv().Save["Chilly2"],function(bool)
    getgenv().Save["Chilly2"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill Bomb",getgenv().Save["Bomb"],function(bool)
    getgenv().Save["Bomb"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill Dark",getgenv().Save["Dark"],function(bool)
    getgenv().Save["Dark"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill Goro",getgenv().Save["Goro"],function(bool)
    getgenv().Save["Goro"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill Pika",getgenv().Save["Pika"],function(bool)
    getgenv().Save["Pika"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill gravity 1",getgenv().Save["gravity"],function(bool)
    getgenv().Save["gravity"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill gravity 2",getgenv().Save["gravity1"],function(bool)
    getgenv().Save["gravity1"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill gravity 3",getgenv().Save["gravity2"],function(bool)
    getgenv().Save["gravity2"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill gravity 4",getgenv().Save["gravity3"],function(bool)
    getgenv().Save["gravity3"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page8:Toggle("spamskill vampire1",getgenv().Save["vampire1"],function(bool)
    getgenv().Save["vampire1"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page8:Toggle("spamskill Quake",getgenv().Save["Quake"],function(bool)
    getgenv().Save["Quake"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page8:Toggle("spamskill Quake2",getgenv().Save["Quake2"],function(bool)
    getgenv().Save["Quake2"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page8:Toggle("spamskill Quake3",getgenv().Save["Quake3"],function(bool)
    getgenv().Save["Quake3"] = bool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)


Instance.new("Part",game:GetService("Workspace").IslandWindmill)
for i,v in pairs(game:GetService("Workspace").IslandWindmill:GetChildren()) do
    if v.Name == "Part" then
        v.Size = Vector3.new(60, 3, 65)
        v.Position = Vector3.new(444.61990356445, 15.088070869446, 1344.7097167969)
        v.Anchored = true
    end
end

    Instance.new("Part",game:GetService("Workspace").ISLAND)
        for i,v in pairs(game:GetService("Workspace").ISLAND:GetChildren()) do
            if v.Name == "Part" then
                v.Size = Vector3.new(60, 3, 65)
                v.Position = Vector3.new(math.random(10000),20000,math.random(10000))
                v.Anchored = true
            end
        end

page1:Button("safe zone", function()

for i,v in pairs(game:GetService("Workspace").ISLAND:GetChildren()) do
    if v.Name == "Part" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,10,0)
    end
end

end)

page9:Toggle("Auto Save" , getgenv().Save["AutoSave"],function(t)
    getgenv().Save["AutoSave"] = t
    SaveSetting()
end)
page9:Label("Anti Staff")
page9:Toggle("Auto Mod" , getgenv().Save["Mod"], function(m)
    create:Notifile("Chill Hub" , "You Will Got Protect Now", 5)
    getgenv().Save["Mod"] = m
    if getgenv().Save["Mod"] then
    SaveSetting()
    end
end)
page9:Label("Rejoin")
page9:Toggle("Auto Rejoin", getgenv().Save["rejoin"], function(r)
    getgenv().Save["rejoin"] = r
    if getgenv().Save["rejoin"] then
        SaveSetting()
    end
end)

page9:Label("Unlock ALl Emotes")
page9:Button("Click",function()
    emotes()
end)
page9:Label("Stun")
page9:Button("Anti Stun",function()
    stun()
end)
page7:Label("Farm Tp To Die")

aaaaa = page7:Label("Pos Spawn: ")

page7:Button("Set Spawn", function()
    getgenv().posFarm = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    getgenv().Save["posFarm"] = tostring(getgenv().posFarm)
    aaaaa:Change("Pos Spawn: " ..tostring(getgenv().Save["posFarm"]))
    create:Notifile("Chill Hub", "Pos Spawn: " ..tostring(getgenv().Save["posFarm"]), 3)
end)

if getgenv().Save["posFarm"] == nil then
    getgenv().Save["posFarm"] = ""
end

aaaaa:Change("Pos Spawn: " ..tostring(getgenv().Save["posFarm"]))

function StringToCFrame(String)
    local Split = string.split(String, ",")
    return CFrame.new(Split[1],Split[2],Split[3],Split[4],Split[5],Split[6],Split[7],Split[8],Split[9],Split[10],Split[11],Split[12])
end

page7:Toggle("Tp To Die",getgenv().Save["tptodie"],function(t)
    getgenv().Save["tptodie"] = t
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page7:Toggle("Tp To Spawn",getgenv().Save["tptospawn"],function(t)
    getgenv().Save["tptospawn"] = t
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page1:Button("Melee V1 (500 melee can use it)", function()
    local A_1 = "Seastone Cestus"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].UpdateMelee
    Event:FireServer(A_1)
    create:Notifile("Chill Hub", "500 Melee Can Use", 3)
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page1:Toggle("No dame water",getgenv().Save["NoDame"],function(x)
    getgenv().Save["NoDame"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)


page1:Toggle("Auto Haki Buso",getgenv().Save["Buso"],function(x)
    getgenv().Save["Buso"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page3:Label("Main Check Fruit")

page3:Toggle("Bring Fruit",getgenv().Save["BringFruit"],function(x)
    getgenv().Save["BringFruit"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page3:Button("Test WebHook",function()
    pcall(function()
        local url = getgenv().Save["WebHookText"]
        local data = {
        ["content"] = "Test Webhook",
        ["embeds"] = {
            {
                ["title"] = " Chill Hub Test WebHook",
                ["description"] = "Neon was here",
                ["type"] = "rich",
                ["color"] = tonumber(0xff8200),
            }
        }
        }
        local newdata = game:GetService("HttpService"):JSONEncode(data)
    
        local headers = {
        ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end)
end)

page3:Button("Check Fruit Webhook or F9",function()
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        for x,y in pairs(v.Backpack:GetChildren()) do
                if (string.find(y.Name, "Quake") or string.find(y.Name, "Phoenix") or string.find(y.Name, "Dark") or string.find(y.Name, "Vampire") or string.find(y.Name, "Grayity") or string.find(y.Name, "Ope") or string.find(y.Name, "Venom") or string.find(y.Name, "Candy Fruit") or string.find(y.Name, "Hollow")or string.find(y.Name, "Chilly")or string.find(y.Name, "Gas")or string.find(y.Name, "Flare")or string.find(y.Name, "Light")or string.find(y.Name, "Smoke")or string.find(y.Name, "Rumble")or string.find(y.Name, "Sand")or string.find(y.Name, "Magma")or string.find(y.Name, "Snow")) then
                    print("Player:" .. y.Name .. y.Parent.Parent.Name .. "\n" .. y.ToolTip)
                    pcall(function()
                        local url = getgenv().Save["WebHookText"]
                        local data = {
                        ["content"] = "@everyone",
                        ["embeds"] = {
                            {
                                ["title"] = " Neon Congratulation The keeper DF has been found",
                                ["description"] = "Username: " .."".. y.Parent.Parent.Name .. "".. "\nFruit: " ..  y.Name .."\n"..y.ToolTip.. "\nStop Hop Sever",
                                ["type"] = "rich",
                                ["color"] = tonumber(0xff8200),
                            }
                        }
                        }
                        local newdata = game:GetService("HttpService"):JSONEncode(data)
                    
                        local headers = {
                        ["content-type"] = "application/json"
                        }
                        request = http_request or request or HttpPost or syn.request
                        local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                        request(abcdef)
                        print("AA")
                    end)
                elseif y.Parent.Parent.Name ~= plr.Name and string.find(y.Name, "Fruit") and not string.find(y.Name, "Quake") and not string.find(y.Name, "Phoenix") and not string.find(y.Name, "Dark") and not string.find(y.Name, "Vampire") and not string.find(y.Name, "Grayity") and not string.find(y.Name, "Ope") and not string.find(y.Name, "Venom") and not string.find(y.Name, "Candy Fruit") and not string.find(y.Name, "Hollow")and not string.find(y.Name, "Chilly")and not string.find(y.Name, "Gas")and not string.find(y.Name, "Flare")and not string.find(y.Name, "Light")and not string.find(y.Name, "Smoke")and not string.find(y.Name, "Rumble")and not string.find(y.Name, "Sand")and not string.find(y.Name, "Magma")and not string.find(y.Name, "Snow") then
                    print("Player:" .. y.Name .. y.Parent.Parent.Name .. "\n" .. y.ToolTip)
                    local url = getgenv().Save["WebHookText"]
                        local data = {
                        ["content"] = "The keeper DF has been found",
                        ["embeds"] = {
                            {
                                ["title"] = "Neon",
                                ["description"] = "Username: " .."||".. y.Parent.Parent.Name .. "||".. "\nFruit: " ..  y.Name .."\n"..y.ToolTip.."\nHop Sever Now",
                                ["type"] = "rich",
                                ["color"] = tonumber(0xff8200),
                            }
                        }
                        }
                        local newdata = game:GetService("HttpService"):JSONEncode(data)
                    
                        local headers = {
                        ["content-type"] = "application/json"
                        }
                        request = http_request or request or HttpPost or syn.request
                        local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                        request(abcdef)
                    print("A")
                end
        end
    end
end)

page3:Toggle("Webhook Player",getgenv().Save["Webhookfp"],function(x)
    getgenv().Save["Webhookfp"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page3:Toggle("Hopsever Find Fruit",getgenv().Save["Hopseverf"],function(x)
    getgenv().Save["Hopseverf"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page3:Toggle("HopseverFind Player",getgenv().Save["Hopseverp"],function(x)
    getgenv().Save["Hopseverp"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page3:TextBox("Web Hook",". . .",function(x)
    getgenv().webhook = x
    getgenv().Save["WebHookText"] = getgenv().webhook
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page3:Toggle("WebHook Fruit",getgenv().Save["WebHookTF"],function(x)
    getgenv().Save["WebHookTF"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page2:Label("Farm Etc")

page2:Toggle("Auto Mixer",getgenv().Save["mixer"], function(cc)
    getgenv().Save["mixer"] = cc
        if not getgenv().Save["drink"] == true then
        create:Notifile("Notification", "Turn On Auto Drink Mixer First", 5)
        getgenv().Save["mixer"] = false
    end
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page2:Toggle("Auto Drink Mixer",getgenv().Save["drink"], function(cc)
    getgenv().Save["drink"] = cc
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page2:Toggle("Auto Hopsever Mixer",getgenv().Save["hopmr"], function(cc)
    getgenv().Save["hopmr"] = cc
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page2:Label("Farm Use Fruit")

page2:Drop("Choose Fruit Farm",false, {"Rumble", "Magma" , "Quake", "Gravity", "Vampire", "Pika", "Bomb"}, function(t)
    getgenv().choosefruit = t 
    getgenv().Save["Choosefruit"] = getgenv().choosefruit
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page2:Slider("Time Spam Fruit", false , true , 0 , 10 , tonumber(getgenv().Save["timespam"]),tonumber(getgenv().Save["timespam"]),false, function(t)
    getgenv().Save["timespam"] = t
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page2:Toggle("Farm skill",getgenv().Save["farmskill"], function(cc)
    getgenv().Save["farmskill"] = cc
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page2:Toggle("TP Mob", getgenv().Save["FruitFarm"] , function(t)
    getgenv().Save["FruitFarm"] = t 
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

if getgenv().Save["Choosefruit"] == nil then
    getgenv().Save["Choosefruit"] = ""
end

page4:Label("Main Farm Compass")

page4:Toggle("Bring Compass", getgenv().Save["bringcp"], function(t)
    getgenv().Save["bringcp"] = t
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page4:Toggle("Accept Compass", getgenv().Save["acccp"], function(t)
    getgenv().Save["acccp"] = t
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page4:Toggle("Auto Store(1-4)", getgenv().Save["autostore"], function(t)
    getgenv().Save["autostore"] = t
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page4:Toggle("Auto Find Sam", getgenv().Save["findsam"], function(t)
    getgenv().Save["findsam"] = t
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page4:Toggle("Auto Open Box", getgenv().Save["Openbox"], function(t)
    getgenv().Save["Openbox"] = t
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page1:Toggle("FastAttack",getgenv().Save["FastAttack"],function(x)
    getgenv().Save["FastAttack"] = x
    if ( not plr.Character:FindFirstChild("Yoru")) then
        create:Notifile("Chill Hub", "U need Equip Yoru", 5)
        getgenv().Save["FastAttack"] = false
    end
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page1:Toggle("FastAttack2",getgenv().Save["FastAttack2"],function(x)
    getgenv().Save["FastAttack2"] = x
    if ( not plr.Character:FindFirstChild("Kogatana")) then
        create:Notifile("Chill Hub", "U need Equip Kogatana", 5)
        getgenv().Save["FastAttack"] = false
    end
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page1:Toggle("Auto FixSpam",getgenv().Save["FixSpam"],function(x)
    getgenv().Save["FixSpam"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
    create:Notifile("Chill Hub", "Set Skill Fruit U want Spam (C button)", 5)
end)

page1:Toggle("NoClip",getgenv().Save["Noclip"],function(x)
    getgenv().Save["Noclip"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

    getgenv().weaponlist = {}
    for i, v in pairs(plr.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(getgenv().weaponlist, v.Name)
        end
    end
    for i, v in pairs(plr.Character:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(getgenv().weaponlist, v.Name)
        end
    end


getgenv().tool = ""
page1:Label("Change Dmg Skill")
page1:Toggle("Auto 100% skill",getgenv().Save["Autoskillvip"],function(x)
    getgenv().Save["Autoskillvip"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page1:Toggle("Auto 500% skill",getgenv().Save["Autoskillvip2"],function(x)
    getgenv().Save["Autoskillvip2"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page1:Toggle("Auto 1k% skill",getgenv().Save["Autoskillvip3"],function(x)
    getgenv().Save["Autoskillvip3"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page1:Toggle("Auto 5k% skill",getgenv().Save["Autoskillvip4"],function(x)
    getgenv().Save["Autoskillvip4"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
--[[page1:Toggle("Auto 100k% skill",getgenv().Save["Autoskillvip5"],function(x)
    getgenv().Save["Autoskillvip5"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page1:Toggle("Auto 1M% skill",getgenv().Save["Autoskillvip6"],function(x)
    getgenv().Save["Autoskillvip6"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page1:Toggle("Auto 10M% skill",getgenv().Save["Autoskillvip7"],function(x)
    getgenv().Save["Autoskillvip7"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page1:Toggle("Auto 100M% skill",getgenv().Save["Autoskillvip8"],function(x)
    getgenv().Save["Autoskillvip8"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)
page1:Toggle("Auto 1B% skill",getgenv().Save["Autoskillvip9"],function(x)
    getgenv().Save["Autoskillvip9"] = x
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)]]--

page1:Label("Farm: Melee")

local Dropdown = page1:Drop("Select Tool",false, getgenv().weaponlist , function(a) -- Use Selected <table> to auto select multiselection dropdown
    getgenv().tool = a
    getgenv().Save["EQUIPTOOL"] = getgenv().tool
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page1:Toggle("Farm use melee",getgenv().Save["Farmmelee"],function(x)
    getgenv().Save["Farmmelee"] = x 
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)


if getgenv().Save["EQUIPTOOL"] == nil then
    getgenv().Save["EQUIPTOOL"] = ""
end

page1:Button("Refresh", function()
    Dropdown:Clear()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
			if v:IsA("Tool") then
				Dropdown:Add(v.Name)
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
			if v:IsA("Tool") then
				Dropdown:Add(v.Name)
			end
		end
end)

getgenv().Concacsieuto = {}

function players()
    for i,v in pairs(game.Players:GetChildren()) do
        table.insert(getgenv().Concacsieuto, v.Name)
    end
end

players()
    
local concac = page7:Drop("Select Players" ,false, getgenv().Concacsieuto, function(t)
    getgenv().bobo = t
    getgenv().Save["playerfarmbounty"] = getgenv().bobo
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

    
page7:Drop("Select Method Farm" ,false, {"Sword or no burning damage like magma, gas...", "Burning damage like magma, gas..."}, function(t)
    getgenv().methodbty = t
    getgenv().Save["MethodBty"] = getgenv().methodbty
    if getgenv().methodbty == "Sword or no burning damage like magma, gas..." then
        create:Notifile("Chill Hub", "Sword or no burning damage like magma, gas...", 3)
    elseif getgenv().methodbty == "Burning damage like magma, gas..." then
        create:Notifile("Chill Hub", "Burning damage like magma, gas...", 3)
    end
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

if getgenv().Save["MethodBty"] == nil then
    getgenv().Save["MethodBty"] = ""
end

page7:Button("Refesh Players", function()
    concac:Clear()
        
    for i,v in pairs(game.Players:GetChildren()) do
        concac:Add(v.Name)
    end
end)

if getgenv().Save["playerfarmbounty"] == nil then
    getgenv().Save["playerfarmbounty"] = ""
end

page7:Toggle("auto spawn", getgenv().Save["spawn"], function(t)
    getgenv().Save["spawn"] = t 
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)

page7:Toggle("Fix bug auto spawn", getgenv().Save["fixbugspawn"], function(t)
    getgenv().Save["fixbugspawn"] = t 
    if getgenv().Save["AutoSave"] then
        SaveSetting()
    end
end)


spawn(function()
    pcall(function()
            while true do wait(2)
                pcall(function()
                    if getgenv().Save["spawn"] then
                        pcall(function()
                            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HealthBar.Frame:GetChildren()) do
                                if v.Name == "Label" then
                                    if v.Text ~= "" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                                    else
                                        wait(1)
                                        function click(a)
                                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,true,a,1)
                                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,false,a,1)
                                        end
                                        click(game:GetService("Players").LocalPlayer.PlayerGui.Load.Frame:WaitForChild("Load"))
                                    end
                                end
                            end
                        end)
                    end
                end)
            end
    end)
end)
spawn(function()
    pcall(function()
        while true do wait()
            if getgenv().Save["rayleigh"] then
                pcall(function()
for i,v in pairs(game:GetService("Workspace").Merchants:GetChildren()) do
    if v.Name == "QuestHakiMerchant" then
        fireclickdetector(v.Clickable.ClickDetector)
            end
    end
workspace.Merchants.QuestHakiMerchant.Clickable.Retum:FireServer()
game:GetService("Players").LocalPlayer.Character.Mark3:FireServer()
game:GetService("Players").LocalPlayer.Character.Mark3:FireServer()
game:GetService("Players").LocalPlayer.Character.Mark3:FireServer()
                        end)
                end
            end
                    end)
    end)
spawn(function()
    pcall(function()
                pcall(function()
   while true do wait()
       pcall(function()
if getgenv().Save["quest"] then
    pcall(function()
        workspace.Merchants.ExpertiseMerchant.Clickable.Retum:FireServer()
        wait(5)
    end)
end
end)
end
end)
end)
end)
spawn(function()
    pcall(function()
                pcall(function()
   while true do wait()
       pcall(function()
if getgenv().Save["fish"] then
    pcall(function()
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name , "Rod") then
                                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name , "Rod") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    end
                end
                        end
                    end
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if string.find(v.Name , "Rod") then
                                            for _,x in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if string.find(x.Name , "Rod") then
                        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                            if v:FindFirstChild("Bobber") then
                                if v.Bobber.Effect.Enabled == true then
                                    
                                    wait(0.5)
                                    local args = {
                                        [1] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                    }
                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(x.Name).Click:FireServer(unpack(args))
                                end
                            elseif v.Name == "Cast" and not v:FindFirstChild("Bobber") then
                                
                                wait(0.5)
                                local args = {
                                    [1] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                }
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild(x.Name).Click:FireServer(unpack(args))
                            end
                        end
                    end
                end
                            wait(0.5)
                        end
                    end
    end)
end
end)
end
end)
end)
end)
function haki1()
            for i = 1,5 do
    local Players = game:GetService("Players")
    local cache = {}
    function lol(name)
        if cache[name] then return cache[name] end
        local player = Players:FindFirstChild(name)
        if player then
            cache[name] = player.UserId
            return player.UserId
        end 
    
        local id
        pcall(function ()
            id = Players:lol(name)
        end)
        cache[name] = id
        return id
    end
    local ehh = game.Players.LocalPlayer.Name
    local Final = lol(ehh)
    _G.swim = true
    
    while _G.swim do
    wait(0) do
    local args = {
        [1] = "On",
        [2] = 1
    }
    game.Workspace.UserData["User_"..Final].III:FireServer(unpack(args))
    end
    end
    end
end
function haki2()
            for i = 1,5 do
    local Players = game:GetService("Players")
    local cache = {}
    function lol(name)
        if cache[name] then return cache[name] end
        local player = Players:FindFirstChild(name)
        if player then
            cache[name] = player.UserId
            return player.UserId
        end 
    
        local id
        pcall(function ()
            id = Players:lol(name)
        end)
        cache[name] = id
        return id
    end
    local ehh = game.Players.LocalPlayer.Name
    local Final = lol(ehh)
    _G.swim = true
    
    while _G.swim do
    wait(0) do
    local args = {
        [1] = "Off",
        [2] = 1
    }
    game.Workspace.UserData["User_"..Final].III:FireServer(unpack(args))
    end
    end
    end
    
end
spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Mod"] then
                    pcall(function()
local Players = game:GetService("Players")
local BlacklistedPlayers = {
    "Oblivic",
    "BowTiedPony",
    "Bige0n",
    "Farquanetta",
    "icydragonwingsis"
}

for _, v in pairs(Players:GetPlayers()) do 
    if table.find(BlacklistedPlayers, v.Name) then 
        Players.LocalPlayer:Kick("Staff OPL Has Join Server , Dont Worry. You Got Protect By Chill Hub")
    end
end

Players.PlayerAdded:Connect(function(v)
    if table.find(BlacklistedPlayers, v.Name) then 
        Players.LocalPlayer:Kick("Staff OPL Has Join Server , Dont Worry. You Got Protect By Chill Hub")
    end
end)

                    end)
                end
            end)
        end
    end)
end)
spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["rejoin"] then
                    pcall(function()
local prompt = assert(game:GetService("CoreGui"):FindFirstChild("promptOverlay", true), "Rejoin Now")
assert(not prompt:FindFirstChild("ErrorPrompt"), prompt:FindFirstChild("ErrorPrompt") and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer))
prompt.ChildAdded:Connect(function(child)
   assert(child, typeof(child) == "Instance" and child.Name == "ErrorPrompt" and child.ClassName == "Frame" and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer))
end)
end)
end
end)
end
end)
end)
spawn(function()
    pcall(function()
            while true do wait()
                pcall(function()
                    if getgenv().Save["fixbugspawn"] then
                        pcall(function()
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude < 1000 then
                                wait(10)
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude < 1000 then
                                    wait(5)
                                    game.Players.LocalPlayer.Character.Humanoid.Health = 0
                                end
                            end
                        end)
                    end
                end)
            end
    end)
end)
spawn(function()
    pcall(function()
            while true do wait(.1)
                pcall(function()
                    if getgenv().Save["tptodie"] then
                        pcall(function()
                            for i,v in pairs(game.Players:GetChildren()) do
                                if v.Name == getgenv().Save["playerfarmbounty"] and v.Character.Humanoid.Health > 0 then
                                    if (plr.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                                        wait(5)
                                        repeat wait()
                                            plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-1)
                                        until v.Character.Humanoid.Health < 0 or plr.Character.Humanoid.Health < 0 or not getgenv().Save["tptodie"]
                                    end
                                end
                            end
                        end)
                    end
                end)
            end
    end)
end)
spawn(function()
    pcall(function()
            while true do wait(0.1)
                pcall(function()
                    if getgenv().Save["tptospawn"] then
                        pcall(function()
                            if getgenv().Save["tptospawn"] then
                                pcall(function()
                                    if (plr.Character.HumanoidRootPart.Position - StringToCFrame(getgenv().Save["posFarm"]).Position).Magnitude > 5 then
                                        print("AAAAA")
                                        repeat wait()
                                            plr.Character.HumanoidRootPart.CFrame = StringToCFrame(getgenv().Save["posFarm"])
                                        until not getgenv().Save["tptospawn"] or plr.Humanoid.Health <= 0
                                    end
                                end)
                            end
                        end)
                    end
                end)
            end
    end)
end)
spawn(function()
    pcall(function()
            while true do wait(0.1)
                pcall(function()
                    if getgenv().Save["BringFruit"] then
                        pcall(function()
                            if getgenv().Save["BringFruit"] then
                                for i,v in pairs(game.Workspace.Trees.Tree.Model:GetChildren()) do 
                                    if v.ClassName == "Tool" then
                                        print("aaaa")
                                        fireclickdetector(v.Main.ClickDetector)
                                    end
                                end
                            end
                        end)
                    end
                end)
            end
    end)
end)

game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(v)
    if getgenv().Save["WebHookTF"] and (string.find(v.Name, "Quake") or string.find(v.Name, "Phoenix") or string.find(v.Name, "Dark") or string.find(v.Name, "Vampire") or string.find(v.Name, "Gravity") or string.find(v.Name, "Ope") or string.find(v.Name, "Venom") or string.find(v.Name, "Candy Fruit") or string.find(v.Name, "Hollow")or string.find(v.Name, "Chilly")or string.find(v.Name, "Gas")or string.find(v.Name, "Flare")or string.find(v.Name, "Light")or string.find(v.Name, "Smoke")or string.find(v.Name, "Rumble")or string.find(v.Name, "Sand")or string.find(v.Name, "Magma")or string.find(v.Name, "Snow")) then
        pcall(function()
            local url = getgenv().Save["WebHookText"]
            local data = {
            ["content"] = "@everyone Fruit Here",
            ["embeds"] = {
                {
                    ["title"] = "Neon V2",
                    ["description"] = "Username: " .."||".. game.Players.LocalPlayer.Name.. "||".. "\nFruit: " ..  v.Name .."\n"..v.ToolTip.. "\nStop Hop Sever",
                    ["type"] = "rich",
                    ["color"] = tonumber(0xff8200),
                }
            }
            }
            local newdata = game:GetService("HttpService"):JSONEncode(data)
        
            local headers = {
            ["content-type"] = "application/json"
            }
            request = http_request or request or HttpPost or syn.request
            local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
            request(abcdef)
        end)
    elseif getgenv().Save["WebHookTF"] and string.find(v.Name, "Fruit") and not string.find(v.Name, "Quake") and not string.find(v.Name, "Phoenix") and not string.find(v.Name, "Dark") and not string.find(v.Name, "Vampire") and not string.find(v.Name, "Gravity") and not string.find(v.Name, "Ope") and not string.find(v.Name, "Venom") and not string.find(v.Name, "Candy Fruit") and not string.find(v.Name, "Hollow")and not string.find(v.Name, "Chilly")and not string.find(v.Name, "Gas")and not string.find(v.Name, "Flare")and not string.find(v.Name, "Light")and not string.find(v.Name, "Smoke")and not string.find(v.Name, "Rumble")and not string.find(v.Name, "Sand")and not string.find(v.Name, "Magma")and not string.find(v.Name, "Snow") then
        create:Notifile("Neon V2", "Nothing", 5)
        local url = getgenv().Save["WebHookText"]
            local data = {
            ["content"] = "Fruit Trash",
            ["embeds"] = {
                {
                    ["title"] = "Neon V2",
                    ["description"] = "Username: " .."||".. game.Players.LocalPlayer.Name.. "||".. "\nFruit: " ..  v.Name .."\n"..v.ToolTip.."\nHop Sever Now",
                    ["type"] = "rich",
                    ["color"] = tonumber(0xff8200),
                }
            }
            }
            local newdata = game:GetService("HttpService"):JSONEncode(data)
        
            local headers = {
            ["content-type"] = "application/json"
            }
            request = http_request or request or HttpPost or syn.request
            local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
            request(abcdef)
    end
end)

spawn(function()
    pcall(function()
        while true do wait(0.1)
            pcall(function()
                if getgenv().Save["Hopseverf"] then
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        pcall(function()
                            print("Worrrrrr")
                            wait(5)
                            if not string.find(v.Name, "Plasma") and not string.find(v.Name, "Quake") and not string.find(v.Name, "Phoenix") and not string.find(v.Name, "Dark") and not string.find(v.Name, "Vampire") and not string.find(v.Name, "Gravity") and not string.find(v.Name, "Ope") and not string.find(v.Name, "Venom") and not string.find(v.Name, "Candy Fruit") and not string.find(v.Name, "Hollow")and not string.find(v.Name, "Chilly")and not string.find(v.Name, "Gas")and not string.find(v.Name, "Flare")and not string.find(v.Name, "Light")and not string.find(v.Name, "Smoke")and not string.find(v.Name, "Rumble")and not string.find(v.Name, "Sand")and not string.find(v.Name, "Magma")and not string.find(v.Name, "Snow") then
                                print("sdfesdf")
                                wait(10)
                                if game.PlaceId == 3237168 and not string.find(v.Name, "Plasma") and not string.find(v.Name, "Quake") and not string.find(v.Name, "Phoenix") and not string.find(v.Name, "Dark") and not string.find(v.Name, "Vampire") and not string.find(v.Name, "Gravity") and not string.find(v.Name, "Ope") and not string.find(v.Name, "Venom") and not string.find(v.Name, "Candy Fruit") and not string.find(v.Name, "Hollow")and not string.find(v.Name, "Chilly")and not string.find(v.Name, "Gas")and not string.find(v.Name, "Flare")and not string.find(v.Name, "Light")and not string.find(v.Name, "Smoke")and not string.find(v.Name, "Rumble")and not string.find(v.Name, "Sand")and not string.find(v.Name, "Magma")and not string.find(v.Name, "Snow") then
                                    create:Notifile("Neon v2", "Hop Now", 5)
                                    print("hopnow")
                                    local PlaceID = game.PlaceId
                                            local AllIDs = {}
                                    local foundAnything = ""
                                    local actualHour = os.date("!*t").hour
                                    local Deleted = false
                                    local File = pcall(function()
                                        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
                                    end)
                                    if not File then
                                        table.insert(AllIDs, actualHour)
                                        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                    end
                                    function TPReturner()
                                        local Site;
                                        if foundAnything == "" then
                                            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                                        else
                                            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                                        end
                                        local ID = ""
                                        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                                            foundAnything = Site.nextPageCursor
                                        end
                                        local num = 0;
                                        for i,v in pairs(Site.data) do
                                            local Possible = true
                                            ID = tostring(v.id) 
                                            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                                                for _,Existing in pairs(AllIDs) do
                                                    if num ~= 0 then
                                                        if ID == tostring(Existing) then
                                                            Possible = false
                                                        end
                                                    else
                                                        if tonumber(actualHour) ~= tonumber(Existing) then
                                                            local delFile = pcall(function()
                                                                delfile("NotSameServers.json")
                                                                AllIDs = {}
                                                                table.insert(AllIDs, actualHour)
                                                            end)
                                                        end
                                                    end
                                                    num = num + 1
                                                end
                                                if Possible == true then
                                                    table.insert(AllIDs, ID)
                                                    wait()
                                                    pcall(function()
                                                        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                                        wait()
                                                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                                                    end)
                                                    wait(4)
                                                end
                                            end
                                        end
                                    end
                                    
                                    function Teleport()
                                        while wait() do
                                            pcall(function()
                                                TPReturner()
                                                if foundAnything ~= "" then
                                                    TPReturner()
                                                end
                                            end)
                                        end
                                    end
                                
                                
                                    Teleport()
                                end
                            end
                        end)
                    end
                end
            end)
        end
    end)
end)
function drink()
                local buydrink = getgenv().drink
            local amountdrinkbuy = getgenv().amountdrink
                if buydrink == "Cider+" then
    for i = 1,amountdrink do
    local args = {
        [1] = "Cider+"
    }
    
    workspace.Merchants.BetterDrinkMerchant.Clickable.Retum:FireServer(unpack(args))
    end
    elseif buydrink == "Lemonade+" then
        
    for i = 1,amountdrink do
    local args = {
        [1] = "Lemonade+"
    }
    
    workspace.Merchants.BetterDrinkMerchant.Clickable.Retum:FireServer(unpack(args))
    end
            elseif buydrink == "Juice+" then
    for i = 1,amountdrink do
    local args = {
        [1] = "Juice+"
    }
    
    workspace.Merchants.BetterDrinkMerchant.Clickable.Retum:FireServer(unpack(args))
    end
    elseif buydrink == "Smoothie+" then
        for i = 1,amountdrink do
    
    local args = {
        [1] = "Smoothie+"
    }
    
    workspace.Merchants.BetterDrinkMerchant.Clickable.Retum:FireServer(unpack(args))
    end
    
    
            elseif buydrink == "Cider" then
    for i = 1,amountdrink do
    local args = {
        [1] = "Cider"
    }
    
    workspace.Merchants.DrinkMerchant.Clickable.Retum:FireServer(unpack(args))
    end
    elseif buydrink == "Lemonade" then
        for i = 1,amountdrink do
    
    local args = {
        [1] = "Lemonade"
    }
    
    workspace.Merchants.DrinkMerchant.Clickable.Retum:FireServer(unpack(args))
    end
    elseif buydrink == "Juice" then
            for i = 1,amountdrink do
    local args = {
        [1] = "Juice"
    }
    
    workspace.Merchants.DrinkMerchant.Clickable.Retum:FireServer(unpack(args))
    end
    elseif buydrink == "Smoothie" then
        for i = 1,amountdrink do
    
    local args = {
        [1] = "Smoothie"
    }
    
    workspace.Merchants.DrinkMerchant.Clickable.Retum:FireServer(unpack(args))
    end
    end
    end
function instdrink()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Juice") or string.find(v.Name, "Milk") or string.find(v.Name, "Cider") or string.find(v.Name, "Lemonade") or string.find(v.Name, "Smoothie") or string.find(v.Name, "Golden") then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                            game:GetService'VirtualUser':CaptureController()
                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        end
                        end
                end
spawn(function()
    pcall(function()
        while true do wait(0.1)
            pcall(function()
                if getgenv().Save["Farmmelee"] then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health ~= 0 and v:IsA("Model") then
                            pcall(function()
                                repeat wait()
                                    if getgenv().Save["Farmmelee"] then
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 99999999999)
                                        if plr.Backpack:FindFirstChild(getgenv().Save["EQUIPTOOL"]) then
                                            plr.Character.Humanoid:EquipTool(plr.Backpack[getgenv().Save["EQUIPTOOL"]])
                                        end
                                        ATTACK()
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(10,10,10)
                                        plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,2,2)
                                    end
                                until not getgenv().Save["Farmmelee"] or v.Humanoid.Health <= 0
                            end)
                        end
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait(0.1)
            pcall(function()
                if getgenv().Save["Hopseverp"] then
                    for x,y in pairs(game:GetService("Players"):GetChildren()) do
                        for i,v in pairs(y.Backpack:GetChildren()) do
                            print("Worrrrrr")
                            pcall(function()
                                wait(5)
                                if getgenv().Save["Hopseverp"] and not v:IsA("Tool") and not string.find(v.Name, "Quake") and not string.find(v.Name, "Phoenix") and not string.find(v.Name, "Dark") and not string.find(v.Name, "Vampire") and not string.find(v.Name, "Gravity") and not string.find(v.Name, "Ope") and not string.find(v.Name, "Venom") and not string.find(v.Name, "Candy Fruit") and not string.find(v.Name, "Hollow")and not string.find(v.Name, "Chilly")and not string.find(v.Name, "Gas")and not string.find(v.Name, "Flare")and not string.find(v.Name, "Light")and not string.find(v.Name, "Smoke")and not string.find(v.Name, "Rumble")and not string.find(v.Name, "Sand")and not string.find(v.Name, "Magma")and not string.find(v.Name, "Snow")and not string.find(v.Name, "Plasma") then
                                    print("sdfesdfesdf")
                                    wait(10)
                                    if getgenv().Save["Hopseverp"] and game.PlaceId == 3237168 and not v:IsA("Tool") and not string.find(v.Name, "Quake") and not string.find(v.Name, "Phoenix") and not string.find(v.Name, "Dark") and not string.find(v.Name, "Vampire") and not string.find(v.Name, "Gravity") and not string.find(v.Name, "Ope") and not string.find(v.Name, "Venom") and not string.find(v.Name, "Candy Fruit") and not string.find(v.Name, "Hollow")and not string.find(v.Name, "Chilly")and not string.find(v.Name, "Gas")and not string.find(v.Name, "Flare")and not string.find(v.Name, "Light")and not string.find(v.Name, "Smoke")and not string.find(v.Name, "Rumble")and not string.find(v.Name, "Sand")and not string.find(v.Name, "Magma")and not string.find(v.Name, "Snow")and not string.find(v.Name, "Plasma") then
                                        print("Niceeeeeeee")
                                        create:Notifile("Neon V2", "Hop Now", 5)
                                        local PlaceID = game.PlaceId
                                                local AllIDs = {}
                                        local foundAnything = ""
                                        local actualHour = os.date("!*t").hour
                                        local Deleted = false
                                        local File = pcall(function()
                                            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
                                        end)
                                        if not File then
                                            table.insert(AllIDs, actualHour)
                                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                        end
                                        function TPReturner()
                                            local Site;
                                            if foundAnything == "" then
                                                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                                            else
                                                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                                            end
                                            local ID = ""
                                            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                                                foundAnything = Site.nextPageCursor
                                            end
                                            local num = 0;
                                            for i,v in pairs(Site.data) do
                                                local Possible = true
                                                ID = tostring(v.id) 
                                                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                                                    for _,Existing in pairs(AllIDs) do
                                                        if num ~= 0 then
                                                            if ID == tostring(Existing) then
                                                                Possible = false
                                                            end
                                                        else
                                                            if tonumber(actualHour) ~= tonumber(Existing) then
                                                                local delFile = pcall(function()
                                                                    delfile("NotSameServers.json")
                                                                    AllIDs = {}
                                                                    table.insert(AllIDs, actualHour)
                                                                end)
                                                            end
                                                        end
                                                        num = num + 1
                                                    end
                                                    if Possible == true then
                                                        table.insert(AllIDs, ID)
                                                        wait()
                                                        pcall(function()
                                                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                                            wait()
                                                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                                                        end)
                                                        wait(4)
                                                    end
                                                end
                                            end
                                        end
                                        
                                        function Teleport()
                                            while wait() do
                                                pcall(function()
                                                    TPReturner()
                                                    if foundAnything ~= "" then
                                                        TPReturner()
                                                    end
                                                end)
                                            end
                                        end
                                    
                                    
                                        Teleport()
                                    end
                                end
                            end)
                        end
                    end
                end
            end)
        end
    end)
end)


for i,v in pairs(game:GetService("Players"):GetChildren()) do
    v.Backpack.ChildAdded:Connect(function(y)
        if getgenv().Save["Hopseverp"] and getgenv().Save["Webhookfp"] and (string.find(y.Name, "Quake") or string.find(y.Name, "Phoenix") or string.find(y.Name, "Dark") or string.find(y.Name, "Vampire") or string.find(y.Name, "Grayity") or string.find(y.Name, "Ope") or string.find(y.Name, "Venom") or string.find(y.Name, "Candy Fruit") or string.find(y.Name, "Hollow")or string.find(y.Name, "Chilly")or string.find(y.Name, "Gas")or string.find(y.Name, "Flare")or string.find(y.Name, "Light")or string.find(y.Name, "Smoke")or string.find(y.Name, "Rumble")or string.find(y.Name, "Sand")or string.find(y.Name, "Magma")or string.find(y.Name, "Snow")) then
            pcall(function()
                local url = getgenv().Save["WebHookText"]
                local data = {
                ["content"] = "@everyone",
                ["embeds"] = {
                    {
                        ["title"] = "Congratulation The keeper DF has been found",
                        ["description"] = "Username: " .."".. y.Parent.Parent.Name .. "".. "\nFruit: " ..  y.Name .."\n"..y.ToolTip.. "\nStop Hop Sever",
                        ["type"] = "rich",
                        ["color"] = tonumber(0xff8200),
                    }
                }
                }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
            
                local headers = {
                ["content-type"] = "application/json"
                }
                request = http_request or request or HttpPost or syn.request
                local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                request(abcdef)
            end)
        elseif y.Parent.Parent.Name ~= plr.Name and getgenv().Save["Hopseverp"] and getgenv().Save["Webhookfp"] and string.find(y.Name, "Fruit") and not string.find(y.Name, "Quake") and not string.find(y.Name, "Phoenix") and not string.find(y.Name, "Dark") and not string.find(y.Name, "Vampire") and not string.find(y.Name, "Grayity") and not string.find(y.Name, "Ope") and not string.find(y.Name, "Venom") and not string.find(y.Name, "Candy Fruit") and not string.find(y.Name, "Hollow")and not string.find(y.Name, "Chilly")and not string.find(y.Name, "Gas")and not string.find(y.Name, "Flare")and not string.find(y.Name, "Light")and not string.find(y.Name, "Smoke")and not string.find(y.Name, "Rumble")and not string.find(y.Name, "Sand")and not string.find(y.Name, "Magma")and not string.find(y.Name, "Snow") then
            local url = getgenv().Save["WebHookText"]
                local data = {
                ["content"] = "The keeper DF has been found",
                ["embeds"] = {
                    {
                        ["title"] = "Nothing",
                        ["description"] = "Username: " .."||"..  y.Parent.Parent.Name .. "||".. "\nFruit: " ..  y.Name .."\n"..y.ToolTip.."\nHop Sever Now",
                        ["type"] = "rich",
                        ["color"] = tonumber(0xff8200),
                    }
                }
                }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
            
                local headers = {
                ["content-type"] = "application/json"
                }
                request = http_request or request or HttpPost or syn.request
                local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                request(abcdef)
        end
    end)
end

                for i,v in pairs(game:GetService("Players"):GetChildren()) do
                    for x,y in pairs(v.Backpack:GetChildren()) do
                        if getgenv().Save["WebHookTF"] then
                            if getgenv().Save["WebHookTF"] and string.find(y.Name , "Plasma") or string.find(y.Name, "Quake") or string.find(y.Name, "Phoenix") or string.find(y.Name, "Dark") or string.find(y.Name, "Vampire") or string.find(y.Name, "Grayity") or string.find(y.Name, "Ope") or string.find(y.Name, "Venom") or string.find(y.Name, "Candy Fruit") or string.find(y.Name, "Hollow")or string.find(y.Name, "Chilly")or string.find(y.Name, "Gas")or string.find(y.Name, "Flare")or string.find(y.Name, "Light")or string.find(y.Name, "Smoke")or string.find(y.Name, "Rumble")or string.find(y.Name, "Sand")or string.find(y.Name, "Magma")or string.find(y.Name, "Snow") then
                                pcall(function()
                                    local url = getgenv().Save["WebHookText"]
                                    local data = {
                                    ["content"] = "@everyone",
                                    ["embeds"] = {
                                        {
                                            ["title"] = "Congratulation The keeper DF has been found",
                                            ["description"] = "Username: " .."".. y.Parent.Parent.Name .. "".. "\nFruit: " ..  y.Name .."\n"..y.ToolTip.. "\nStop Hop Sever",
                                            ["type"] = "rich",
                                            ["color"] = tonumber(0xff8200),
                                        }
                                    }
                                    }
                                    local newdata = game:GetService("HttpService"):JSONEncode(data)
                                
                                    local headers = {
                                    ["content-type"] = "application/json"
                                    }
                                    request = http_request or request or HttpPost or syn.request
                                    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                                    request(abcdef)
                                    print("AA")
                                end)
                            elseif y.Parent.Parent.Name ~= plr.Name and not string.find(y.Name , "Plasma") and string.find(y.Name, "Fruit") and not string.find(y.Name, "Quake") and not string.find(y.Name, "Phoenix") and not string.find(y.Name, "Dark") and not string.find(y.Name, "Vampire") and not string.find(y.Name, "Grayity") and not string.find(y.Name, "Ope") and not string.find(y.Name, "Venom") and not string.find(y.Name, "Candy Fruit") and not string.find(y.Name, "Hollow")and not string.find(y.Name, "Chilly")and not string.find(y.Name, "Gas")and not string.find(y.Name, "Flare")and not string.find(y.Name, "Light") and not string.find(y.Name, "Smoke") and not string.find(y.Name, "Rumble") and not string.find(y.Name, "Sand") and not string.find(y.Name, "Magma") and not string.find(y.Name, "Snow") then
                                local url = getgenv().Save["WebHookText"]
                                    local data = {
                                    ["content"] = "The keeper DF has been found",
                                    ["embeds"] = {
                                        {
                                            ["title"] = "Neon V2",
                                            ["description"] = "Username: " .."||".. y.Parent.Parent.Name .. "||".. "\nFruit: " ..  y.Name .."\n"..y.ToolTip.."\nHop Sever Now",
                                            ["type"] = "rich",
                                            ["color"] = tonumber(0xff8200),
                                        }
                                    }
                                    }
                                    local newdata = game:GetService("HttpService"):JSONEncode(data)
                                
                                    local headers = {
                                    ["content-type"] = "application/json"
                                    }
                                    request = http_request or request or HttpPost or syn.request
                                    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                                    request(abcdef)
                                print("A")
                            end
                        end
                    end
                end


    spawn(function()
        pcall(function() 
                while true do wait(0.1)
                    pcall(function()
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health ~= 0 then
                                if getgenv().Save["farmskill"] then
                                    if v.Humanoid.Health > 0 and getgenv().Save["Choosefruit"] == "Pika" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 100 then
                                        wait(getgenv().Save["timespam"])
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "LightPower8",
                                            [3] = "StartCharging",
                                            [4] = CFrame.new(v.HumanoidRootPart.Position),
                                            [5] = v.HumanoidRootPart,
                                            [6] = "Right"
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))
                                        
                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "LightPower8",
                                            [3] = "StopCharging",
                                            [4] = CFrame.new(v.HumanoidRootPart.Position),
                                            [5] = v.HumanoidRootPart,
                                            [6] = 100
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))
                                    end

                                if getgenv().Save["farmskill"] then
                                    if v.Humanoid.Health > 0 and getgenv().Save["Choosefruit"] == "Bomb" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 100 then
                                        wait(getgenv().Save["timespam"])    
                                        local arg = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "LightPowe2",
                                            [3] = "StartCharging",
                                            [4] = CFrame.new(v.HumanoidRootPart.Position),
                                            [5] = v.HumanoidRootPart,
                                            [6] = "Right"
                                        }
                                    
                                        game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))
                                     end                                
                                   
                                   local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "LightPower2",
                                            [3] = "StopCharging",
                                            [4] = CFrame.new(v.HumanoidRootPart.Position),
                                            [5] = v.HumanoidRootPart,
                                            [6] = 100
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))
                                    end 
                                    if v.Humanoid.Health > 0 and getgenv().Save["Choosefruit"] == "Vampire" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 100 then
                                        wait(getgenv().Save["timespam"])                                
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "VampirePower11",
                                            [3] = "StartCharging",
                                            [4] = CFrame.new(v.HumanoidRootPart.Position),
                                            [5] = v.HumanoidRootPart,
                                            [6] = "Right"
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Vampire.RemoteEvent:FireServer(unpack(args))
            
                                        
                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "VampirePower11",
                                            [3] = "StopCharging",
                                            [4] = CFrame.new(v.HumanoidRootPart.Position),
                                            [5] = v.HumanoidRootPart,
                                            [6] = 100
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Vampire.RemoteEvent:FireServer(unpack(args))
                                    end
                                    if v.Humanoid.Health > 0 and getgenv().Save["Choosefruit"] == "Gravity" then
                                        wait(getgenv().Save["timespam"])
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "GravityPower12",
                                            [3] = "StartCharging"
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                                        
                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "GravityPower12",
                                            [3] = "StartCharging",
                                            [4] = CFrame.new(v.HumanoidRootPart.Position),
                                            [5] = v.HumanoidRootPart
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                                
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "GravityPower12",
                                            [3] = "StopCharging",
                                            [4] = CFrame.new(v.HumanoidRootPart.Position),
                                            [5] = v.HumanoidRootPart,
                                            [6] = 150
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                                    end
                                        if v.Humanoid.Health > 0 and getgenv().Save["Choosefruit"] == "Quake" then
                                            wait(getgenv().Save["timespam"])
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "QuakePower4",
                                                [3] = "StartCharging",
                                                [5] = "Right"
                                            }
                                    
                                            game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                                            
                                    
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "QuakePower4",
                                                [3] = "StopCharging",
                                                [4] = v.HumanoidRootPart,
                                                [5] = CFrame.new(v.HumanoidRootPart.Position),
                                                [6] = 100,
                                                [7] = v.HumanoidRootPart.Position
                                            }
                                    
                                            game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                                        end
                                        if v.Humanoid.Health > 0 and getgenv().Save["Choosefruit"] == "Rumble" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 100 then
                                            wait(getgenv().Save["timespam"])
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "RumblePower2",
                                                [3] = "StartCharging",
                                                [4] = CFrame.new(v.HumanoidRootPart.CFrame.Position.x,v.HumanoidRootPart.CFrame.Position.y - 10, v.HumanoidRootPart.CFrame.Position.z),
                                                [5] = v.HumanoidRootPart,
                                                [6] = "Right"
                                            }
                                            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Rumble.RemoteEvent:FireServer(unpack(args))
                                            
                                           
                                            
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "RumblePower2",
                                                [3] = "StopCharging",
                                                [4] = Vector3.new(v.HumanoidRootPart.CFrame.Position.x,v.HumanoidRootPart.CFrame.Position.y - 10, v.HumanoidRootPart.CFrame.Position.z),
                                                [5] = v.HumanoidRootPart,
                                                [6] = 200,
                                                [7] = Vector3.new(v.HumanoidRootPart.CFrame.Position.x,v.HumanoidRootPart.CFrame.Position.y - 10, v.HumanoidRootPart.CFrame.Position.z)
                                            }
                                            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Rumble.RemoteEvent:FireServer(unpack(args))
                                        end
                                        if v.Humanoid.Health > 0 and getgenv().Save["Choosefruit"] == "Magma" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 100 then
                                            wait(getgenv().Save["timespam"])
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "MagmaPower7",
                                                [3] = "StartCharging",
                                                [4] = CFrame.new(v.HumanoidRootPart.Position),
                                                [5] = v.HumanoidRootPart,
                                                [6] = "Right"
                                            }
                                            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                    
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "MagmaPower7",
                                                [3] = "StopCharging",
                                                [4] = CFrame.new(v.HumanoidRootPart.Position),
                                                [6] = 100
                                            }
                                            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
            
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "MagmaPower7",
                                                [3] = "StopCharging",
                                                [4] = CFrame.new(v.HumanoidRootPart.Position),
                                                [5] = v.HumanoidRootPart,
                                                [6] = 100
                                            }
            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "MagmaPower7",
                                                [3] = "StartCharging",
                                                [4] = CFrame.new(v.HumanoidRootPart.Position),
                                                [5] = v.HumanoidRootPart,
                                                [6] = "Left"
                                            }
            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                                        end 
                                    if v.Humanoid.MaxHealth - v.Humanoid.Health >= 5000 then
                                        v.Humanoid.Health = 0
                                    end
                                end
                            end
                        end
                    end)
                end
        end)
    end)

spawn(function()
    pcall(function()
        while true do wait()
            if getgenv().Save["FruitFarm"] then
                pcall(function()
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (plr.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                            pcall(function()
                                repeat wait()
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        if getgenv().Save["Choosefruit"] == "Vampire" then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,100,0)
                                        end
                                        if getgenv().Save["Choosefruit"] == "Gravity" then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-100,0)
                                        end
                                        if getgenv().Save["Choosefruit"] == "Rumble" then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-100,0)
                                        end
                                        if getgenv().Save["Choosefruit"] == "Magma" then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,2,-50)
                                        end
                                        if getgenv().Save["Choosefruit"] == "Bomb" then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,2,-50)
                                        end
                                        if getgenv().Save["Choosefruit"] == "Quake" then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-100,0)
                                        end
                                        if getgenv().Save["Choosefruit"] == "Pika" then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,2,-20)
                                        end
                                until not getgenv().Save["FruitFarm"] or v.Humanoid.Health == 0
                            end)
                        end
                    end
                end)
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Goro"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "RumblePower2",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.CFrame.Position.x,plr2.Character.HumanoidRootPart.CFrame.Position.y - 10, plr2.Character.HumanoidRootPart.CFrame.Position.z),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Rumble.RemoteEvent:FireServer(unpack(args))
                                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "RumblePower2",
                            [3] = "StopCharging",
                            [4] = Vector3.new(plr2.Character.HumanoidRootPart.CFrame.Position.x,plr2.Character.HumanoidRootPart.CFrame.Position.y - 10, plr2.Character.HumanoidRootPart.CFrame.Position.z),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 200,
                            [7] = Vector3.new(plr2.Character.HumanoidRootPart.CFrame.Position.x,plr2.Character.HumanoidRootPart.CFrame.Position.y - 10, plr2.Character.HumanoidRootPart.CFrame.Position.z)
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Rumble.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Bomb"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = "BombPower4",
                            [2] = "StartCharging",
                            [3] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [4] = plr2.Character.HumanoidRootPart,
                            [5] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Bomb.RemoteEvent:FireServer(unpack(args))
                        
                        
                        
                        local args = {
                            [1] = "BombPower4",
                            [2] = "StopCharging",
                            [3] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [4] = plr2.Character.HumanoidRootPart,
                            [5] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Bomb.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Dark"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "DarkPower10",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Left"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Dark.RemoteEvent:FireServer(unpack(args))
                
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "DarkPower10",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Dark.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Phoenix"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "PhoenixPower3",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Right"
                        }

                        game:GetService("Players").LocalPlayer.Character.Powers.Phoenix.RemoteEvent:FireServer(unpack(args))
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "PhoenixPower3",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 100
                        }

                        game:GetService("Players").LocalPlayer.Character.Powers.Phoenix.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Magma"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "MagmaPower9",
                            [3] = "Create",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = workspace.Cave.Stone
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                        
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "MagmaPower7",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                        
                        
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "MagmaPower7",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Flare"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "FlarePower2",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "FlarePower2",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [6] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "FlarePower4"
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "FlarePower5",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "FlarePower5",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 100
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Chilly"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "ChillyPower2",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "ChillyPower2",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [6] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "ChillyPower2"
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "ChillyPower2",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "ChillyPower2",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 100
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Chilly2"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "ChillyPower5",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "ChillyPower5",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [6] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "ChillyPower5"
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "ChillyPower5",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "ChillyPower5",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 100
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Pika"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "LightPower8",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))
                        
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "LightPower8",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["gravity"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower8",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower8",
                            [3] = "StopCharging",
                            [4] = CFrame.new(Vector3.new(plr2.Character.HumanoidRootPart.Position)),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 300
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))    
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["gravity1"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower11",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart
                        }
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower11",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 150
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["gravity2"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower12",
                            [3] = "StartCharging"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                        
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower12",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower12",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 150
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)
spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["gravity3"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower4",
                            [3] = "StartCharging"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                        
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower4",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower4",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 300
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))

                    end
                end
            end)
        end
    end)
end)
spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["vampire1"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "VampirePower11",
                            [3] = "StartCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Vampire.RemoteEvent:FireServer(unpack(args))
                        
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "VampirePower11",
                            [3] = "StopCharging",
                            [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                            [5] = plr2.Character.HumanoidRootPart,
                            [6] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Vampire.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                local plr1 = game.Players.LocalPlayer.Character
                local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                if getgenv().Save["TPPLAYER"] then
                    if getgenv().Save["TPPLAYER"] and getgenv().Save["ChooseMet"] ~= "" then
                        repeat wait()
                            if (plr2.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                                if getgenv().Save["ChooseMet"] == "Normal" then
                                    plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                                end
                                if getgenv().Save["ChooseMet"] == "Angel" then
                                    plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame * CFrame.new(0,200,0)
                                end
                                if getgenv().Save["ChooseMet"] == "Under" then
                                    plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame * CFrame.new(0,-200,0)
                                end
                                if getgenv().Save["ChooseMet"] == "Behind" then
                                    plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame * CFrame.new(200,0,0)
                                end
                            else
                                for i,v in pairs(game:GetService("Workspace").ISLAND:GetChildren()) do
                                    if v.Name == "Part" then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,10,0)
                                    end
                                end
                            end
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        until not getgenv().Save["TPPLAYER"] or plr2.Humanoid.Health == 0 or plr1.Humanoid.Health == 0
                    else
                        for i,v in pairs(game:GetService("Workspace").ISLAND:GetChildren()) do
                            if v.Name == "Part" then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,10,0)
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            if getgenv().Save["acccp"] then
                workspace.Merchants.QuestMerchant.Clickable.Retum:FireServer("Claim10")
            end
        end
    end)
end)

function autostore()
    pcall(function()
        if getgenv().autostore then
            if game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock1.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF1.DevilFruit.Text == "Empty" then
                local args = {
                    [1] = "StoredDF1"
                }
                
                game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].StoredDFRequest:FireServer(unpack(args))
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock2.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF2.DevilFruit.Text == "Empty" then
                local args = {
                    [1] = "StoredDF2"
                }
                
                game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].StoredDFRequest:FireServer(unpack(args))
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock3.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF3.DevilFruit.Text == "Empty" then
                local args = {
                    [1] = "StoredDF3"
                }
                
                game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].StoredDFRequest:FireServer(unpack(args))
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock4.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF4.DevilFruit.Text == "Empty" then
                local args = {
                    [1] = "StoredDF4"
                }
                
                game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].StoredDFRequest:FireServer(unpack(args))
            end
        end
    end)
end
function autostoremain()
    pcall(function()
        if getgenv().autostore then
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock4.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF4.DevilFruit.Text == "Empty" and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock1.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF1.DevilFruit.Text == "Empty" or game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock2.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF2.DevilFruit.Text == "Empty" or game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock3.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF3.DevilFruit.Text == "Empty" then
                        if string.find(v.Name, "Quake") or string.find(v.Name, "Phoenix") or string.find(v.Name, "Dark") or string.find(v.Name, "Vampire") or string.find(v.Name, "Gravity") or string.find(v.Name, "Ope") or string.find(v.Name, "Venom") or string.find(v.Name, "Candy") or string.find(v.Name, "Hollow")or string.find(v.Name, "Chilly")or string.find(v.Name, "Gas")or string.find(v.Name, "Flare")or string.find(v.Name, "Light")or string.find(v.Name, "Smoke")or string.find(v.Name, "Rumble")or string.find(v.Name, "Sand")or string.find(v.Name, "Magma")or string.find(v.Name, "Snow") then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[v.Name])
                            end
                        end
                    end
                end
            end
        end
    end)
end



spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["autostore"] then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock1.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF1.DevilFruit.Text == "Empty" or game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock2.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF2.DevilFruit.Text == "Empty" or game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.Unlock3.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.Storage.Frame.StoredDF3.DevilFruit.Text == "Empty" then
                        if getgenv().autostore then
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if string.find(v.Name, "Quake") or string.find(v.Name, "Phoenix") or string.find(v.Name, "Dark") or string.find(v.Name, "Vampire") or string.find(v.Name, "Gravity") or string.find(v.Name, "Ope") or string.find(v.Name, "Venom") or string.find(v.Name, "Candy") or string.find(v.Name, "Hollow")or string.find(v.Name, "Chilly")or string.find(v.Name, "Gas")or string.find(v.Name, "Flare")or string.find(v.Name, "Light")or string.find(v.Name, "Smoke")or string.find(v.Name, "Rumble")or string.find(v.Name, "Sand")or string.find(v.Name, "Magma")or string.find(v.Name, "Snow") then
                                        autostoremain()
                                    end
                                end
                            end
                        end
                        if getgenv().autostore then
                            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                if v:IsA("Tool") then
                                    if string.find(v.Name, "Quake") or string.find(v.Name, "Phoenix") or string.find(v.Name, "Dark") or string.find(v.Name, "Vampire") or string.find(v.Name, "Gravity") or string.find(v.Name, "Ope") or string.find(v.Name, "Venom") or string.find(v.Name, "Candy") or string.find(v.Name, "Hollow")or string.find(v.Name, "Chilly")or string.find(v.Name, "Gas")or string.find(v.Name, "Flare")or string.find(v.Name, "Light")or string.find(v.Name, "Smoke")or string.find(v.Name, "Rumble")or string.find(v.Name, "Sand")or string.find(v.Name, "Magma")or string.find(v.Name, "Snow") then
                                        autostore()
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

function findsam()
    pcall(function()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v.Name == "Compass" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Poser.Value)
                wait(0.5)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(0,0))
            end
        end
    end)
end

function equipsam()
    pcall(function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "Compass" then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Compass") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Compass"])
                end
            end
        end
    end)
end

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["findsam"] and (plr.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Compass") then
                        equipsam()
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChild("Compass") then
                        wait(0.5)
                        findsam()
                    else
                    end
                end
            end)
        end
    end)
end)

function equipbox()
    pcall(function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if string.find(v.Name, "Rare Box") or string.find(v.Name, "Ultra Rare Box") then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[v.Name])
            end
        end
    end)
end

function usebox()
    pcall(function()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if string.find(v.Name, "Rare Box") or string.find(v.Name, "Ultra Rare Box") then
                wait(0.5)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(0,0))
            end
        end
    end)
end


spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Openbox"] then
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name, "Rare Box") or string.find(v.Name, "Ultra Rare Box") then
                            equipbox()
                        end
                    end
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if string.find(v.Name, "Rare Box") or string.find(v.Name, "Ultra Rare Box") then
                            usebox()
                        end
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Quake"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower4",
                        [3] = "StartCharging",
                        [5] = "Right"
                    }
            
                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                    
            
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower4",
                        [3] = "StopCharging",
                        [4] = plr2.Character.HumanoidRootPart,
                        [5] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                        [6] = 100,
                        [7] = plr2.Character.HumanoidRootPart.Position
                    }
            
                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Quake2"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower3",
                        [3] = "StartCharging",
                        [5] = "Left"
                    }
            
                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                    
            
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower3",
                        [3] = "StopCharging",
                        [4] = plr2.Character.HumanoidRootPart,
                        [5] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                        [6] = 60,
                        [7] = plr2.Character.HumanoidRootPart.Position
                    }
            
                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args)) 
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Quake3"] then
                    local plr1 = game.Players.LocalPlayer.Character
                    local plr2 = game.Players:FindFirstChild(getgenv().Save["Players"])
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower2",
                        [3] = "StartCharging"
                    }
            
                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
            
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower2",
                        [3] = "StopCharging",
                        [4] = CFrame.new(plr2.Character.HumanoidRootPart.Position),
                        [6] = 100,
                        [7] = plr2.Character.HumanoidRootPart.Position,
                        [8] = plr2.Character.HumanoidRootPart.Position
                    }
            
                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                end
            end)
        end
    end)
end)
    
spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["FixSpam"] then
                    wait(3)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Noclip"] then
                    if not plr.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") and getgenv().Save["Noclip"] then
                        local BV = Instance.new("BodyVelocity", plr.Character.HumanoidRootPart)
                        BV.MaxForce = Vector3.new(100000, 100000, 100000)
                        BV.Velocity = Vector3.new(0, 0, 0)
                    elseif getgenv().Save["Noclip"] == false then
                        for i,v in pairs(plr.Character.HumanoidRootPart:GetChildren()) do
                            if v.Name == "BodyVelocity" then
                                v:destroy()
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["AMtdf"] then
                    pcall(function()
                        for i,v in pairs(game.Players:GetChildren()) do
                            if v.Name ~= plr.Name and v.Character.Humanoid.Health > 0 then
                                if (plr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude <= getgenv().Save["DistanceDefense"] then
                                    print("AAA")
                                    if v.Character.Humanoid.Health > 0 and getgenv().Save["Mtdf"] == "Flare"  then
                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "FlarePower2",
                                            [3] = "StartCharging",
                                            [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                            [5] = v.Character.HumanoidRootPart,
                                            [6] = "Right"
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "FlarePower2",
                                            [3] = "StopCharging",
                                            [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                            [6] = 100
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "FlarePower4"
                                        }
                                
                                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                                
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "FlarePower5",
                                            [3] = "StartCharging",
                                            [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                            [5] = v.Character.HumanoidRootPart,
                                            [6] = "Right"
                                        }
                                
                                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                                
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "FlarePower5",
                                            [3] = "StopCharging",
                                            [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                            [5] = v.Character.HumanoidRootPart,
                                            [6] = 100
                                        }
                                
                                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                                    end
                                    if v.Character.Humanoid.Health > 0 and getgenv().Save["Mtdf"] == "Pika" then
                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "LightPower8",
                                            [3] = "StartCharging",
                                            [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                            [5] = v.Character.HumanoidRootPart,
                                            [6] = "Right"
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))
                                        
                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "LightPower8",
                                            [3] = "StopCharging",
                                            [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                            [5] = v.Character.HumanoidRootPart,
                                            [6] = 100
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))
                                    end
                                    if v.Character.Humanoid.Health > 0 and getgenv().Save["Mtdf"] == "Vampire" then
                                                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "VampirePower11",
                                            [3] = "StartCharging",
                                            [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                            [5] = v.Character.HumanoidRootPart,
                                            [6] = "Right"
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Vampire.RemoteEvent:FireServer(unpack(args))
            
                                        
                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "VampirePower11",
                                            [3] = "StopCharging",
                                            [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                            [5] = v.Character.HumanoidRootPart,
                                            [6] = 100
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Vampire.RemoteEvent:FireServer(unpack(args))
                                    end
                                    if v.Character.Humanoid.Health > 0 and getgenv().Save["Mtdf"] == "Gravity" then
                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "GravityPower12",
                                            [3] = "StartCharging"
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                                        
                                        
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "GravityPower12",
                                            [3] = "StartCharging",
                                            [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                            [5] = v.Character.HumanoidRootPart
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                                
                                        local args = {
                                            [1] = tonumber(serializeTable(remotes)),
                                            [2] = "GravityPower12",
                                            [3] = "StopCharging",
                                            [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                            [5] = v.Character.HumanoidRootPart,
                                            [6] = 150
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                                    end
                                        if v.Character.Humanoid.Health > 0 and getgenv().Save["Mtdf"] == "Quake" then
                                            
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "QuakePower4",
                                                [3] = "StartCharging",
                                                [5] = "Right"
                                            }
                                    
                                            game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                                            
                                    
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "QuakePower4",
                                                [3] = "StopCharging",
                                                [4] = v.Character.HumanoidRootPart,
                                                [5] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                                [6] = 100,
                                                [7] = v.Character.HumanoidRootPart.Position
                                            }
                                    
                                            game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                                        end
                                        if v.Character.Humanoid.Health > 0 and getgenv().Save["Mtdf"] == "Rumble"  then
                                            
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "RumblePower2",
                                                [3] = "StartCharging",
                                                [4] = CFrame.new(v.Character.HumanoidRootPart.CFrame.Position.x,v.Character.HumanoidRootPart.CFrame.Position.y - 10, v.Character.HumanoidRootPart.CFrame.Position.z),
                                                [5] = v.Character.HumanoidRootPart,
                                                [6] = "Right"
                                            }
                                            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Rumble.RemoteEvent:FireServer(unpack(args))
                                            
                                        
                                            
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "RumblePower2",
                                                [3] = "StopCharging",
                                                [4] = Vector3.new(v.Character.HumanoidRootPart.CFrame.Position.x,v.Character.HumanoidRootPart.CFrame.Position.y - 10, v.Character.HumanoidRootPart.CFrame.Position.z),
                                                [5] = v.Character.HumanoidRootPart,
                                                [6] = 200,
                                                [7] = Vector3.new(v.Character.HumanoidRootPart.CFrame.Position.x,v.Character.HumanoidRootPart.CFrame.Position.y - 10, v.Character.HumanoidRootPart.CFrame.Position.z)
                                            }
                                            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Rumble.RemoteEvent:FireServer(unpack(args))
                                        end
                                        if v.Character.Humanoid.Health > 0 and getgenv().Save["Mtdf"] == "Magma"  then
                                            
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "MagmaPower7",
                                                [3] = "StartCharging",
                                                [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                                [5] = v.Character.HumanoidRootPart,
                                                [6] = "Right"
                                            }
                                            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                    
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "MagmaPower7",
                                                [3] = "StopCharging",
                                                [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                                [6] = 100
                                            }
                                            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
            
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "MagmaPower7",
                                                [3] = "StopCharging",
                                                [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                                [5] = v.Character.HumanoidRootPart,
                                                [6] = 100
                                            }
            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                                            local args = {
                                                [1] = tonumber(serializeTable(remotes)),
                                                [2] = "MagmaPower7",
                                                [3] = "StartCharging",
                                                [4] = CFrame.new(v.Character.HumanoidRootPart.Position),
                                                [5] = v.Character.HumanoidRootPart,
                                                [6] = "Left"
                                            }
            
                                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                                        end 
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do task.wait()
            if getgenv().Save["FastAttack"] then
                pcall(function()
                    if plr.Character:FindFirstChild("Yoru") and tonumber(serializeTable(attackremote)) ~= nil and tonumber(serializeTable(attackremote)) ~= "" then
                        local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Yoru.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Yoru.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Yoru.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Yoru.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Yoru.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Yoru.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Yoru.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Yoru.RequestAnimation:FireServer(unpack(args))
                                        game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(0,0))
                    end
                end)
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do task.wait()
            if getgenv().Save["FastAttack2"] then
                pcall(function()
                    if plr.Character:FindFirstChild("Kogatana") and tonumber(serializeTable(attackremote)) ~= nil and tonumber(serializeTable(attackremote)) ~= "" then
                        local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Kogatana.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Kogatana.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Kogatana.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Kogatana.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Kogatana.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Kogatana.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Kogatana.RequestAnimation:FireServer(unpack(args))
                                                local args = {
                            [1] = tonumber(serializeTable(attackremote))
                        }

                        game:GetService("Players").LocalPlayer.Character.Kogatana.RequestAnimation:FireServer(unpack(args))
                                        game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(0,0))
                    end
                end)
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["Buso"] then
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.PlayerGui.HealthBar.Frame.Haki.Frame.Visible == true and not game:GetService("Players").LocalPlayer.PlayerGui.HealthBar.Frame.Status:FindFirstChild("BusoHaki") then
                            workspace.UserData["User_"..game.Players.LocalPlayer.UserId].UpdateHaki:FireServer()
                        end
                    end)
                end
            end)
        end
    end)
end)

getgenv().drinkcheck = false

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["drink"] and getgenv().drinkcheck then
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Juice") or string.find(v.Name, "Milk") or string.find(v.Name, "Cider") or string.find(v.Name, "Lemonade") or string.find(v.Name, "Smoothie") or string.find(v.Name, "Golden") then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                            game:GetService'VirtualUser':CaptureController()
                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        end
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["mixer"] then
                    pcall(function()
                        if getgenv().Save["drink"] == true then
                                                    for i,v in pairs(game.Workspace:GetChildren()) do 
                                if v.ClassName == "Tool" then
                                    v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                end
                                                    end
                        wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12, 216, -351)
                            wait(0.2)
                                                        for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4, 216, -378)
                            wait(0.2)
                                                        for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-114, 216, -750)
                            wait(0.2)
                                                                                    for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-133, 216, -710)
                            wait(0.2)
                                                                                                                for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-204, 224, -206)
                                                        wait(0.2)
                                                                                                                for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1754, 217, -327)
                                                                                    wait(0.2)
                                                                                                                for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1706, 217, -326)
                                                                                                                wait(0.2)
                                                                                                                for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1754, 216, -217)
                                                                                                                                            wait(0.2)
                                                                                                                for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1550, 217, -307)
                                                                                                                                                                        wait(0.2)
                                                                                                                for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1494, 217, -306)
wait(0.2)
                                                                                                                for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1493, 217, -290)
wait(0.2)
                                                                                                                for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1871, 218, 823)
                            wait(0.2)
                                                                                                                for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1858, 218, 814)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1882, 219, 838)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1989, 235, 568)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1970, 219, 576)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1989, 218, 561)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1981, 217, 553)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1517, 217, -289)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1186, 217, -285)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1173, 217, -286)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1009, 220, 3342)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2601, 254, 1111)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2618, 254, 1110)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(989, 224, -3337)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(916, 216, 3409)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(882, 218, 3364)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1167, 219, 3228)
wait(0.2)
     for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            
                            for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end

                            wait(2)
                            for i,v in pairs(game:GetService("Workspace").Island8.Kitchen:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                fireclickdetector(v)
                                end
                            end
                            wait(7)
                            getgenv().drinkcheck = true
                            end
                    end)
                end
            end)
        end
    end)
    end)

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["hopmr"] and getgenv().drinkcheck then
                    if getgenv().Save["hopmr"] and getgenv().drinkcheck then
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            wait(20)
                            if v:IsA("Tool") and (not string.find(v.Name , "Juice") and not string.find(v.Name , "Milk")) and getgenv().Save["hopmr"] and getgenv().drinkcheck == true then
                                wait(10)
                                print("HOP")
                                if v:IsA("Tool") and (not string.find(v.Name , "Juice") or not string.find(v.Name , "Milk")) and getgenv().Save["hopmr"] and getgenv().drinkcheck == true then
                                    create:Notifile("Neon V2", "Hop Now", 5)
                                        local PlaceID = game.PlaceId
                                        local AllIDs = {}
                                        local foundAnything = ""
                                        local actualHour = os.date("!*t").hour
                                        local Deleted = false
                                        local File = pcall(function()
                                        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
                                        end)
                                        if not File then
                                        table.insert(AllIDs, actualHour)
                                        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                        end
                                        function TPReturner()
                                        local Site;
                                        if foundAnything == "" then
                                        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                                        else
                                        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                                        end
                                        local ID = ""
                                        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                                        foundAnything = Site.nextPageCursor
                                        end
                                        local num = 0;
                                        for i,v in pairs(Site.data) do
                                        local Possible = true
                                        ID = tostring(v.id) 
                                        if tonumber(v.maxPlayers) > tonumber(v.playing) then
                                            for _,Existing in pairs(AllIDs) do
                                                if num ~= 0 then
                                                    if ID == tostring(Existing) then
                                                        Possible = false
                                                    end
                                                    else
                                                            if tonumber(actualHour) ~= tonumber(Existing) then
                                                                        local delFile = pcall(function()
                                                                            delfile("NotSameServers.json")
                                                                            AllIDs = {}
                                                                            table.insert(AllIDs, actualHour)
                                                                        end)
                                                                    end
                                                                end
                                                                num = num + 1
                                                            end
                                                            if Possible == true then
                                                                table.insert(AllIDs, ID)
                                                                wait()
                                                                pcall(function()
                                                                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                                                    wait()
                                                                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                                                                end)
                                                                wait(4)
                                                            end
                                                        end
                                                    end
                                                end
                                                
                                                function Teleport()
                                                    while wait() do
                                                        pcall(function()
                                                            TPReturner()
                                                            if foundAnything ~= "" then
                                                                TPReturner()
                                                            end
                                                        end)
                                                    end
                                                end
                                            
                                            
                                    Teleport()
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

function danhvaodauno()
    local no = nil
    for i,v in pairs(game.Players:GetChildren()) do
        if getgenv().Save["killplayers"] and (plr.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 and (v.Character.HumanoidRootPart.Position - game:GetService("Workspace").CustomizeModel.SpawnAreaStuffK.HBase.Position).Magnitude > 1000 then
            no = v 
        end
    end
    return no
end

spawn(function()
    pcall(function()
        while true do wait()
            pcall(function()
                if getgenv().Save["killplayers"] then
                    plr.Character.HumanoidRootPart.CFrame = danhvaodauno().Character.HumanoidRootPart.CFrame * CFrame.new(0,-100,0)
                    if getgenv().Save["ChooseMet"] == "Normal" then
                        plr1.HumanoidRootPart.CFrame = danhvaodauno().Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                    end
                    if getgenv().Save["ChooseMet"] == "Angel" then
                        plr1.HumanoidRootPart.CFrame = danhvaodauno().Character.HumanoidRootPart.CFrame * CFrame.new(0,200,0)
                    end
                    if getgenv().Save["ChooseMet"] == "Under" then
                        plr1.HumanoidRootPart.CFrame = danhvaodauno().Character.HumanoidRootPart.CFrame * CFrame.new(0,-200,0)
                    end
                    if getgenv().Save["ChooseMet"] == "Behind" then
                        plr1.HumanoidRootPart.CFrame = danhvaodauno().Character.HumanoidRootPart.CFrame * CFrame.new(200,0,0)
                    end
                    if danhvaodauno().Character.Humanoid.Health > 0 and getgenv().Save["mtfa"] == "Flare"  then
                                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "FlarePower2",
                            [3] = "StartCharging",
                            [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                            [5] = danhvaodauno().Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "FlarePower2",
                            [3] = "StopCharging",
                            [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                            [6] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "FlarePower4"
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "FlarePower5",
                            [3] = "StartCharging",
                            [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                            [5] = danhvaodauno().Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "FlarePower5",
                            [3] = "StopCharging",
                            [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                            [5] = danhvaodauno().Character.HumanoidRootPart,
                            [6] = 100
                        }
                
                        game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))
                    end
                    if danhvaodauno().Character.Humanoid.Health > 0 and getgenv().Save["mtfa"] == "Pika" then
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "LightPower8",
                            [3] = "StartCharging",
                            [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                            [5] = danhvaodauno().Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))
                        
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "LightPower8",
                            [3] = "StopCharging",
                            [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                            [5] = danhvaodauno().Character.HumanoidRootPart,
                            [6] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))
                    end
                    if danhvaodauno().Character.Humanoid.Health > 0 and getgenv().Save["mtfa"] == "Vampire" then
                                                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "VampirePower11",
                            [3] = "StartCharging",
                            [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                            [5] = danhvaodauno().Character.HumanoidRootPart,
                            [6] = "Right"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Vampire.RemoteEvent:FireServer(unpack(args))

                        
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "VampirePower11",
                            [3] = "StopCharging",
                            [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                            [5] = danhvaodauno().Character.HumanoidRootPart,
                            [6] = 100
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Vampire.RemoteEvent:FireServer(unpack(args))
                    end
                    if danhvaodauno().Character.Humanoid.Health > 0 and getgenv().Save["mtfa"] == "Gravity" then
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower12",
                            [3] = "StartCharging"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                        
                        
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower12",
                            [3] = "StartCharging",
                            [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                            [5] = danhvaodauno().Character.HumanoidRootPart
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                
                        local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "GravityPower12",
                            [3] = "StopCharging",
                            [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                            [5] = danhvaodauno().Character.HumanoidRootPart,
                            [6] = 150
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.Powers.Gravity.RemoteEvent:FireServer(unpack(args))
                    end
                        if danhvaodauno().Character.Humanoid.Health > 0 and getgenv().Save["mtfa"] == "Quake" then
                            
                            local args = {
                                [1] = tonumber(serializeTable(remotes)),
                                [2] = "QuakePower4",
                                [3] = "StartCharging",
                                [5] = "Right"
                            }
                    
                            game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                            
                    
                            local args = {
                                [1] = tonumber(serializeTable(remotes)),
                                [2] = "QuakePower4",
                                [3] = "StopCharging",
                                [4] = v.Character.HumanoidRootPart,
                                [5] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                                [6] = 100,
                                [7] = danhvaodauno().Character.HumanoidRootPart.Position
                            }
                    
                            game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                        end
                        if danhvaodauno().Character.Humanoid.Health > 0 and getgenv().Save["mtfa"] == "Rumble"  then
                            
                            local args = {
                                [1] = tonumber(serializeTable(remotes)),
                                [2] = "RumblePower2",
                                [3] = "StartCharging",
                                [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.CFrame.Position.x,danhvaodauno().Character.HumanoidRootPart.CFrame.Position.y - 10, danhvaodauno().Character.HumanoidRootPart.CFrame.Position.z),
                                [5] = danhvaodauno().Character.HumanoidRootPart,
                                [6] = "Right"
                            }
                            
                            game:GetService("Players").LocalPlayer.Character.Powers.Rumble.RemoteEvent:FireServer(unpack(args))
                            
                        
                            
                            local args = {
                                [1] = tonumber(serializeTable(remotes)),
                                [2] = "RumblePower2",
                                [3] = "StopCharging",
                                [4] = Vector3.new(danhvaodauno().Character.HumanoidRootPart.CFrame.Position.x,danhvaodauno().Character.HumanoidRootPart.CFrame.Position.y - 10, danhvaodauno().Character.HumanoidRootPart.CFrame.Position.z),
                                [5] = danhvaodauno().Character.HumanoidRootPart,
                                [6] = 200,
                                [7] = Vector3.new(danhvaodauno().Character.HumanoidRootPart.CFrame.Position.x,danhvaodauno().Character.HumanoidRootPart.CFrame.Position.y - 10, danhvaodauno().Character.HumanoidRootPart.CFrame.Position.z)
                            }
                            
                            game:GetService("Players").LocalPlayer.Character.Powers.Rumble.RemoteEvent:FireServer(unpack(args))
                        end
                        if danhvaodauno().Character.Humanoid.Health > 0 and getgenv().Save["mtfa"] == "Magma"  then
                            
                            local args = {
                                [1] = tonumber(serializeTable(remotes)),
                                [2] = "MagmaPower7",
                                [3] = "StartCharging",
                                [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                                [5] = danhvaodauno().Character.HumanoidRootPart,
                                [6] = "Right"
                            }
                            
                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
    
                            local args = {
                                [1] = tonumber(serializeTable(remotes)),
                                [2] = "MagmaPower7",
                                [3] = "StopCharging",
                                [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                                [6] = 100
                            }
                            
                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))

                            local args = {
                                [1] = tonumber(serializeTable(remotes)),
                                [2] = "MagmaPower7",
                                [3] = "StopCharging",
                                [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                                [5] = danhvaodauno().Character.HumanoidRootPart,
                                [6] = 100
                            }

                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                            local args = {
                                [1] = tonumber(serializeTable(remotes)),
                                [2] = "MagmaPower7",
                                [3] = "StartCharging",
                                [4] = CFrame.new(danhvaodauno().Character.HumanoidRootPart.Position),
                                [5] = danhvaodauno().Character.HumanoidRootPart,
                                [6] = "Left"
                            }

                            game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                        end 
                end
            end)
        end
    end)
end)
function emotes()
    game:GetService("Players").LocalPlayer.PlayerGui.Menu.Frame.C.Frame.Nametag.Text = "N E O N HUB OP:L".. "\n" .. "https://discord.gg/fkJPchKkAp"
                local Players = game:GetService("Players") local cache = {} function lol(name) if cache[name] then return cache[name] end local player = Players:FindFirstChild(name) if player then cache[name] = player.UserId return player.UserId end local id pcall(function () id = Players:lol(name) end) cache[name] = id return id end local ehh = game.Players.LocalPlayer.Name local Final = lol(ehh) 
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark1.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark2.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark3.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark4.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark5.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark6.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark7.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark8.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark9.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark10.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark11.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark12.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark13.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark14.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark15.Value = true
                game:GetService("Workspace").UserData["User_"..Final].Data.CB_Mark16.Value = true
end
function stun() 
                    local hoangashdeptrai = game.Players.LocalPlayer.Character
    hoangashdeptrai["DF_Disabled"].Value = false
    hoangashdeptrai.HeartStolen.Value = true
    hoangashdeptrai.Returned.Value = false
    hoangashdeptrai.Hobbied.Value = false
    hoangashdeptrai.HMS.Value = false
    hoangashdeptrai.ChillyPunched.Value = false
    hoangashdeptrai.CandyTouched.Value = false
    hoangashdeptrai.Negative.Value = false
    hoangashdeptrai.OpeSevered.Value = false
    hoangashdeptrai.SnowTouched.Value = false
    hoangashdeptrai.RumbleStun.Value = false
    hoangashdeptrai.GravityCrushed.Value = false
    end
messagebox("Welcome To Chill Hub","Chill Hub",0)