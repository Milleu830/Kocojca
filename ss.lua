print("Loading Config: " .. _G.cfig)
local url
local main = {
    'milleu830',
    'thanksviet1'
}

wait(0.3)
-- Function to check if the player's name is in the 'main' table
local function isInMain(playerName)
    for _, name in ipairs(main) do
        if name == playerName then
            return true
        end
    end
    return false
end

if isInMain(game.Players.LocalPlayer.Name) then
   print("main acc")
   url = "https://raw.githubusercontent.com/Milleu830/BFcfig/main/main.json"
end

if _G.cfig == "Trial" and not isInMain(game.Players.LocalPlayer.Name) then
    print("not main")
    url = "https://raw.githubusercontent.com/Milleu830/BFcfig/main/Trial.json"
elseif _G.cfig == "V3" and not isInMain(game.Players.LocalPlayer.Name) then
    print("not main")
    url = "https://raw.githubusercontent.com/Milleu830/BFcfig/main/V3.json"
elseif _G.cfig == "Farm" and not isInMain(game.Players.LocalPlayer.Name) then
    print("not main")
    url = "https://raw.githubusercontent.com/Milleu830/BFcfig/main/Farm.json"
end

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerName = player.Name  -- Extract player's name as a string

-- Check if the URL is set before proceeding
if url then
    local response = game:HttpGet(url)
    
    -- Decode JSON response into a Lua table
    local config = HttpService:JSONDecode(response)
    
    -- Specify the folder and filename for saving the configuration
    local folder = "Banana Cat Hub"
    local filename = playerName .. "-BFNew.json"  -- Use player's name for the filename
    
    -- Ensure the folder exists
    if not isfolder(folder) then
        makefolder(folder)
    end
    
wait(0.3)
print("write cfig")
    writefile(folder .. "/" .. filename, HttpService:JSONEncode(config))
else
    warn("URL not set. Configuration may not have been loaded.")
end
wait(0.5)
print("loading script")
getgenv().Key = "0aa6c60c34e27ae1e69153eb" 
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
