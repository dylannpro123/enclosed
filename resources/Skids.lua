local cool = {
    2578531818,
    3733631470,
    1
}

local url = game:HttpGet("http://38.242.134.182:3388/whitelists")
local success, err = pcall(function()
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Character then
            if table.find(cool,v.UserId) then
                v.Character.Humanoid.DisplayName = "[👑]"..v.DisplayName
            elseif string.find(url,v.UserId) then
                v.Character.Humanoid.DisplayName = "[⭐]"..v.DisplayName
            elseif not v.Character.Head:FindFirstChild("OriginalSize") then
                v.Character.Humanoid.DisplayName = "[🔒]"..v.DisplayName
            end
        end
    end
end)
