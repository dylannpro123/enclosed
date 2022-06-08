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
231365320, -- $hayne [ Bought perms ] ID: 599401314761310228
142520118, -- brad332 [ Buyer ] ID: 889616346428616754
2729947701, -- Lurk [ Buyer ] ID: NIL
229699737,
122644876, -- DIOR [ BOOSTER ] ID: NIL
1796663810, -- LJ [ BOOSTER ] ID: 861030213550473216
811507413, -- NIL
962119063, -- zaxores [ CashApp ] ID: 938466691610992650
856141316,
2421598446,
2624892174, -- cristal :O
3491670301,
3409413695,
1787705083,
2666159559,
1611434354,
46280,
1519558847,
3446975025,
706391658, -- Blue [ Booster ] ID: 804489930642292786
2232767864, -- Anthony [Booster] ID :852402774276964432
79287609,
3133107789,
653530947,
744155641, -- Cashapp
1670716401, -- Robux
560563786, -- Cashapp
135021150, -- Cashapp
90734753, -- Robux
2707258503,
154111318, -- Cashapp
71229536,
3102935299, -- cashapp
546512748,
}

local success, err = pcall(function()
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Character then
            if table.find(ModIDs,v.UserId) then
                v.Character.Humanoid.DisplayName = "[⭐]"..v.DisplayName
            elseif not v.Character.Head:FindFirstChild("OriginalSize") then
                v.Character.Humanoid.DisplayName = "[🔒]"..v.DisplayName
            end
        end
    end
end)
return ModIDs
