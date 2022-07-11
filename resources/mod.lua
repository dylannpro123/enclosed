local ModIDs = {
3522308, -- joa [ buyer ] ID: 699236911679537202
871072260, -- josh [ buyer ] ID: 363855519108300811
2771913184, -- Gin [ buyer ] ID: 619778034748227584
1576315081,
976264468, -- astro [ buyer ] ID: 814870020437049425
1840257900, -- Dino. [ Buyer ] ID: 746984612810457192
3437381617, -- ILoveLildarkie [ Booster + Buyer ] 
3250625327, -- $hayne [ Buyer ] ID: 599401314761310228
957826090, -- medium [ made a video ] ID: 600781152390873198
2512074231, -- vqq [ Gave nitro ;3 ] ID: 940823168262766672
231365320, -- $hayne [ Bought perms ] ID: 599401314761310228
142520118, -- brad332 [ Buyer ] ID: 889616346428616754
2729947701, -- Lurk [ Buyer ] ID: NIL
229699737,
122644876, -- DIOR [ BOOSTER ] ID: NIL
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
20462347, -- robux
413712803,
3586827532, -- Booster ID: 956964339032653854
3149721329, -- Booster ID: 956964339032653854
1812410913, -- Booster ID: 816284979277070376
2017829328,
267399500, -- ID: 292041957113593856 PP: V M initials.
50361239,
1507335571,
187044292, -- booster ID: 751752410128711732
1228967855, -- nitro 
375869572, -- leak prev
3560086746, -- Never take [ Booster ]
130833627, -- never take [ Booster ]
3528239106, -- tiney (dusty friend)
2294188446, -- NIGGA BALLS UWU XD FUCK ME UR SO PRO uwuwuwuwuwuwuwuwwwwwwwwwwwwwwwwwwwuuuuuuuuuuuuuuuuuuuuuuuuuu
233788690,
3159557294, -- nom
153542023, --refined
1487097,
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
