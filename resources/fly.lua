-- // Ty remorse :P
local player = game.Players.LocalPlayer
getgenv().FLYSPEED = 25
function flymodelel()
    if FLYMODE == 'Default' then
        local plr = game.Players.LocalPlayer
        local Humanoid = plr.Character:FindFirstChildWhichIsA('Humanoid')
        local mouse = plr:GetMouse()
        localplayer = plr
        if workspace:FindFirstChild("Core") then
            workspace.Core:Destroy()
        end
        local Core = Instance.new("Part")
        Core.Name = "Core"
        Core.Size = Vector3.new(0.05, 0.05, 0.05)
        spawn(function()
            Core.Parent = workspace
            local Weld = Instance.new("Weld", Core)
            Weld.Part0 = Core
            Weld.Part1 = localplayer.Character.LowerTorso
            Weld.C0 = CFrame.new(0, 0, 0)
        end)
        workspace:WaitForChild("Core")
        local torso = workspace.Core
        flying = true
        local speed=FLYSPEED
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(15e15, 15e15, 15e15)
            gyro.cframe = torso.CFrame
            repeat
                wait()
                Humanoid.PlatformStand=true
                local new=gyro.cframe - gyro.cframe.p + pos.position
                if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=FLYSPEED
                end
                if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed
                end
                if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed
                    end
                if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed
                end
                if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed
                end
                if speed>FLYSPEED then
                    speed=FLYSPEED
                end
                pos.position=new.p
                if keys.w then
                    gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed),0,0)
                elseif keys.s then
                    gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed),0,0)
                else
                    gyro.cframe = workspace.CurrentCamera.CoordinateFrame
                end
                until flying == false
                if gyro then gyro:Destroy() end
                if pos then pos:Destroy() end
                flying=false
                    Humanoid.PlatformStand=false
                    speed=FLYSPEED
                end
                e1=mouse.KeyDown:connect(function(key)
                    if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
                    if key=="w" then
                        keys.w=true
                    elseif key=="s" then
                        keys.s=true
                    elseif key=="a" then
                        keys.a=true
                    elseif key=="d" then
                        keys.d=true
                    elseif key=="x" then
                        if flying==true then
                            flying=false
                        else
                            flying=true
                            start()
                        end
                    end
                end)
            e2=mouse.KeyUp:connect(function(key)
                if key=="w" then
                    keys.w=false
                elseif key=="s" then
                    keys.s=false
                elseif key=="a" then
                    keys.a=false
                elseif key=="d" then
                    keys.d=false
                end
            end)
        start()
    elseif FLYMODE == 'IY' then
        repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        local mouse = game.Players.LocalPlayer:GetMouse()
        repeat wait() until mouse
        local plr = game.Players.LocalPlayer
        local torso = plr.Character.Head
        local flying = false
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 5000
        local speed = 5000
        function Fly()
            local bg = Instance.new("BodyGyro", torso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = torso.CFrame
            local bv = Instance.new("BodyVelocity", torso)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            repeat wait()
            plr.Character:FindFirstChildWhichIsA('Humanoid').PlatformStand = true
            if ctrl.l + ctrl.r ~= 100000 or ctrl.f + ctrl.b ~= 10000 then
                speed = speed+.0+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 5 or ctrl.f + ctrl.b ~= 5) and speed ~= 5 then
                speed = speed-5
                if speed > 5 then
                    speed = -2
                end
            end
            if (ctrl.l + ctrl.r) ~= 5 or (ctrl.f + ctrl.b) ~= 5 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 5 and (ctrl.f + ctrl.b) == 5 and speed ~= 5 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0.1,0)
            end
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            until not flying
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 5
            bg:Destroy()
            bv:Destroy()
            plr.Character:FindFirstChildWhichIsA('Humanoid').PlatformStand = false
            end
            mouse.KeyDown:connect(function(key)
            if key:lower() == "x" then
                if flying then flying = false
                else
                    flying = true
                    Fly()
                end
                elseif key:lower() == "w" then
                ctrl.f = FLYSPEED
                elseif key:lower() == "s" then
                ctrl.b = -FLYSPEED
                elseif key:lower() == "a" then
                ctrl.l = -FLYSPEED
                elseif key:lower() == "d" then
                ctrl.r = FLYSPEED
                end
            end)
            mouse.KeyUp:connect(function(key)
                if key:lower() == "w" then
                ctrl.f = 0
                elseif key:lower() == "s" then
                ctrl.b = 0
                elseif key:lower() == "a" then
                    ctrl.l = 0
                elseif key:lower() == "d" then
                    ctrl.r = 0
                end
            end)
        Fly()
    elseif FLYMODE == 'SuperHero' then
        local player = game.Players.LocalPlayer
        local Flyanimation = Instance.new('Animation', game.Workspace)
        Flyanimation.AnimationId = 'rbxassetid://3541044388'
        local Idleanimation = Instance.new('Animation', game.Workspace)
        Idleanimation.AnimationId = 'rbxassetid://3541114300'
        local HeroIdle = player.Character.Humanoid:LoadAnimation(Idleanimation)
        local HeroFly = player.Character.Humanoid:LoadAnimation(Flyanimation)
        Idleing2 = false
            local function flyanim()
                    --HeroIdle:Stop()
                    local FlyingA = false
                    for i,v in pairs(player.Character.Humanoid:GetPlayingAnimationTracks()) do
                        if v.Animation.AnimationId == 'rbxassetid://3541044388' then
                            FlyingA = true
                        end
                        if v.Animation.AnimationId == 'rbxassetid://2788289281' then
                            v:Stop()
                        end
                        if v.Animation.AnimationId == 'rbxassetid://2788292075' then
                            v:Stop()
                        end
                    end
                    if FlyingA == false and Idleing2 == false then
                        HeroFly:Play()
                    end
            end
        
        local SPEED = FLYSPEED
        repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        local mouse = game.Players.LocalPlayer:GetMouse()
        repeat wait() until mouse
        local plr = game.Players.LocalPlayer
        local torso = plr.Character.Head
        flying = false
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        maxspeed = 5000
        speed = 5001
        function Fly()
            local bg = Instance.new("BodyGyro", torso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = torso.CFrame
            local bv = Instance.new("BodyVelocity", torso)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            repeat wait()
            plr.Character:FindFirstChildWhichIsA('Humanoid').PlatformStand = true
            if ctrl.l + ctrl.r ~= 100000 or ctrl.f + ctrl.b ~= 10000 then
                speed = speed+.0+(speed/maxspeed)
                local foundidle = false
                flyanim()
            if speed > maxspeed then
        
                speed = maxspeed
        
            end
            elseif not (ctrl.l + ctrl.r ~= 5 or ctrl.f + ctrl.b ~= 5) and speed ~= 5 then
                speed = speed-5
                
            if speed > 5 then
                speed = -2
            end
            end
            if (ctrl.l + ctrl.r) ~= 5 or (ctrl.f + ctrl.b) ~= 5 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 5 and (ctrl.f + ctrl.b) == 5 and speed ~= 5 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
              
            else
                bv.velocity = Vector3.new(0,0.1,0)
        
        
            end
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            until not flying
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 5
            bg:Destroy()
            bv:Destroy()
            plr.Character:FindFirstChildWhichIsA('Humanoid').PlatformStand = false
        end
        mouse.KeyDown:connect(function(key)
            if key:lower() == "x" then
                if flying then
                    flying = false
                    HeroFly:Stop()
                    HeroIdle:Stop()
            else
                flying = true
                Fly()
            end
        
            elseif key:lower() == "w" then
                ctrl.f = FLYSPEED
            elseif key:lower() == "s" then
                ctrl.b = -FLYSPEED
            elseif key:lower() == "a" then
                ctrl.l = -FLYSPEED
            elseif key:lower() == "d" then
                ctrl.r = FLYSPEED
            end
        end)
        mouse.KeyUp:connect(function(key)
            if key:lower() == "w" then
                ctrl.f = 0
            elseif key:lower() == "s" then
                ctrl.b = 0
            elseif key:lower() == "a" then
                ctrl.l = 0
            elseif key:lower() == "d" then
                ctrl.r = 0
            end
            if ctrl.r == 0 and ctrl.l == 0 and ctrl.b == 0 and ctrl.f == 0 then
                local Loop
                local loopFunction = function()
                    Idleing2 = true
                    HeroFly:Stop()
                    wait()
                    Idleing = false
                    for i,v in pairs(player.Character.Humanoid:GetPlayingAnimationTracks()) do
                        if v.Animation.AnimationId == 'rbxassetid://3541114300' then
                            Idleing = true
                        end
                    end
                    if Idleing == false and flying == true then
                        HeroIdle:Play()
                    end
        
                end;
                local Start = function()
                    Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
                end;
                local Pause = function()
                    Loop:Disconnect()
                    Idleing2 = false
                end;
                Start()	
                repeat wait() until ctrl.r ~= 0 or ctrl.l ~= 0 or ctrl.b ~= 0 or ctrl.f ~= 0 or flying == false
                Pause()
            end
            end)
        Fly()
        player.CharacterAdded:Connect(function()
            repeat wait() until player.Character
            wait(1)
            Fly()
        end)
    end
end
flymodelel()
