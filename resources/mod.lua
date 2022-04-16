local ModIDs = {
2578531818, -- Dylann [ friend ] ID: Private.
3522308, -- joa [ buyer ] ID: 699236911679537202
871072260, -- josh [ buyer ] ID: 363855519108300811
2771913184, -- Gin [ buyer ] ID: 619778034748227584
1576315081,
976264468, -- astro [ buyer ] ID: 814870020437049425
1911536577, -- tsm_chepy [ Booster ] ID: 935049342723690496
1840257900, -- Dino. [ Buyer ] ID: 746984612810457192
93551071, -- smoove [ Booster ] ID: 892853352252178473
1677262137, -- smoove [ Booster ] ID: 892853352252178473
3437381617, -- ILoveLildarkie [ Booster + Buyer ] 
3250625327, -- $hayne [ Buyer ] ID: 599401314761310228
2400295635, -- astro [ Booster ] ID: 950761756437934101
957826090, -- medium [ made a video ] ID: 600781152390873198
2512074231, -- vqq [ Gave nitro ;3 ] ID: 940823168262766672
}

local success, err = pcall(function()
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Character then
            if table.find(ModIDs,v.UserId) then
                v.Character.Humanoid.DisplayName = "[⭐]"..v.DisplayName
            elseif not v.Character.Head:FindFirstChild("OriginalSize") then
                v.Character.Humanoid.DisplayName = "[🤡]"..v.DisplayName
            end
        end
    end
end)
return ModIDs
