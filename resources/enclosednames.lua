function initiateNames()
	game.Players.LocalPlayer.Character.UpperTorso:FindFirstChild('OriginalSize'):Destroy()
	for _,v in pairs(game:GetService('Players'):GetPlayers()) do
		if v.Character then
			if not v.Character.UpperTorso:FindFirstChild('OriginalSize') then
				v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[🅿️] ' .. v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName)
			end
			if table.find(MODS, v.UserId) then
				v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[⭐] ' .. v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName)
			end
			if table.find(ADMIN, v.UserId) then
				v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[👑] ' .. v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName)
			end
		end
	end
end
end
