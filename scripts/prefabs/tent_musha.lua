require "prefabutil"

local tent_assets =
{
    Asset("ANIM", "anim/tent_musha.zip"),
	Asset("ANIM", "anim/tent_musha_on.zip"),
	Asset("ANIM", "anim/tent_musha_broken.zip"),
}

local function duration_light(inst, data)
 	local max_duration = 100
	local min_duration = 0	
	local mxx=math.floor(max_duration-min_duration)
	local curr=math.floor(inst.duration-min_duration)
	local duration = ""..math.floor(curr*100/mxx).."%"
 if not inst.using_on then	
 inst.components.talker:Say(STRINGS.NAMES.TENT_MUSHA.."\n"..(duration))
 end 
end
 

local function onhammered(inst, worker)
	if inst:HasTag("fire") and inst.components.burnable then
		inst.components.burnable:Extinguish()
	end
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("hit")
		inst.AnimState:PushAnimation("idle", true)
	end
end

local function OnDurability(inst,sleeper)
    if not inst.broken and not inst:HasTag("burnt") then
	inst.broken = true
--inst.SoundEmitter:PlaySound("dontstarve/common/minerhatOut")
inst.Light:Enable(false)
inst.light_on = false
inst.using_on = false
inst.components.machine:TurnOff()
inst.Light:Enable(false)
inst.light_on = false
	    inst.AnimState:PlayAnimation("destroy")
   --     inst:ListenForEvent("animover", inst.Remove)
		inst:RemoveComponent("sleepingbag")
        inst.SoundEmitter:PlaySound("dontstarve/common/tent_dis_pre")
       -- inst.persists = false
		--inst:DoTaskInTime(16 * FRAMES, onfinishedsound)
		scheduler:ExecuteInTime(2, function()
		SpawnPrefab("collapse_big").Transform:SetPosition(inst:GetPosition():Get())
		  inst.AnimState:SetBuild("tent_musha_broken")
		  inst.AnimState:PlayAnimation("place") inst.AnimState:PushAnimation("idle", true)
	end)
    end
end

local function onfinished(inst)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("destroy")
		inst:ListenForEvent("animover", function(inst, data) inst:Remove() end)
		inst.SoundEmitter:PlaySound("dontstarve/common/tent_dis_pre")
		inst.persists = false
		inst:DoTaskInTime(16*FRAMES, function() inst.SoundEmitter:PlaySound("dontstarve/common/tent_dis_twirl") end)
	end
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle", true)
end

--------
local function on_close(inst)
if inst.light_on then
GetPlayer().warm_tent = true
end   end

local function far(inst)
GetPlayer().warm_tent = false 
end

 local function on_light_tent(inst, data)
 if not inst.broken then
  inst.AnimState:SetBuild("tent_musha_on")
inst.Light:Enable(true)
inst.light_on = true
on_close(inst)
if inst.duration <= 0 then
inst.components.machine:TurnOff()
inst.Light:Enable(false)
inst.light_on = false
end
if not inst.using_on then
inst.SoundEmitter:PlaySound("dontstarve/common/minerhatAddFuel")
inst:DoPeriodicTask(0.5, function() if inst.light_on and inst.duration > 0 then

inst.duration = inst.duration - 0.01
duration_light(inst) 
elseif inst.light_on and inst.duration <= 0 then
OnDurability(inst)
end
 end) end end end
 -----------
local function off_light_tent(inst, data)
 if not inst.broken and not inst.using_on then
 --inst.AnimState:SetBuild("tent_musha")
inst.SoundEmitter:PlaySound("dontstarve/common/minerhatOut")
inst.Light:Enable(false)
inst.light_on = false
on_close(inst)
 inst.AnimState:SetBuild("tent_musha")
end end 

local function onsleep(inst, sleeper)
if not inst.broken then
if not inst:HasTag("DLC") and not inst:HasTag("DLC2") then
SpawnPrefab("pine_needles").Transform:SetPosition(inst:GetPosition():Get())	
elseif (inst:HasTag("DLC") or inst:HasTag("DLC2")) then
   if inst.duration >= 70  then
	SpawnPrefab("green_leaves").Transform:SetPosition(inst:GetPosition():Get())	
    elseif inst.duration < 70 and inst.duration >= 40  then
	SpawnPrefab("yellow_leaves").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.duration < 40 and inst.duration >= 10  then
	SpawnPrefab("orange_leaves").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.duration < 10 then
	SpawnPrefab("red_leaves").Transform:SetPosition(inst:GetPosition():Get())
	end end end


	if GetClock():IsDay() then
		local tosay = "ANNOUNCE_NODAYSLEEP"
		if GetWorld():IsCave() then
			tosay = "ANNOUNCE_NODAYSLEEP_CAVE"
		end
		if sleeper.components.talker then
			sleeper.components.talker:Say(GetString(sleeper.prefab, tosay))
			return
		end
	end

	if inst:HasTag("fire") then
		if sleeper.components.talker then
			sleeper.components.talker:Say(GetString(sleeper.prefab, "ANNOUNCE_NOSLEEPONFIRE"))
		end
		return
	end
	
	local hounded = GetWorld().components.hounded

	local danger = FindEntity(inst, 10, function(target) 
		return
			(target:HasTag("monster") and not target:HasTag("player") and not sleeper:HasTag("spiderwhisperer"))
			or (target:HasTag("monster") and not target:HasTag("player") and sleeper:HasTag("spiderwhisperer") and not target:HasTag("spider"))
			or (target:HasTag("pig") and not target:HasTag("player") and sleeper:HasTag("spiderwhisperer"))
			or (target.components.combat and target.components.combat.target == sleeper)
	end)
	
	if hounded and (hounded.warning or hounded.timetoattack <= 0) then
		danger = true
	end
	
	if danger then
		if sleeper.components.talker then
			sleeper.components.talker:Say(GetString(sleeper.prefab, "ANNOUNCE_NODANGERSLEEP"))
		end
		return
	end

	if sleeper.components.hunger.current < TUNING.CALORIES_MED then
		sleeper.components.talker:Say(GetString(sleeper.prefab, "ANNOUNCE_NOHUNGERSLEEP"))
		return
	end
	
	sleeper.components.health:SetInvincible(true)
	sleeper.components.playercontroller:Enable(false)

	GetPlayer().HUD:Hide()
	TheFrontEnd:Fade(false,1)

	inst:DoTaskInTime(1.2, function() 
		
		GetPlayer().HUD:Show()
		TheFrontEnd:Fade(true,1) 
		
		if GetClock():IsDay() then

			local tosay = "ANNOUNCE_NODAYSLEEP"
			if GetWorld():IsCave() then
				tosay = "ANNOUNCE_NODAYSLEEP_CAVE"
			end

			if sleeper.components.talker then				
				sleeper.components.talker:Say(GetString(sleeper.prefab, tosay))
				sleeper.components.health:SetInvincible(false)
				sleeper.components.playercontroller:Enable(true)
				return
			end
		end
		
		if sleeper.components.sanity then
			sleeper.components.sanity:DoDelta(TUNING.SANITY_HUGE)
		end
		
		if sleeper.components.hunger then
			sleeper.components.hunger:DoDelta(-TUNING.CALORIES_HUGE, false, true)
		end
		
		if sleeper.components.health then
			sleeper.components.health:DoDelta(TUNING.HEALING_HUGE, false, "tent", true)
		end
		
		if sleeper.components.temperature and sleeper.components.temperature.current < TUNING.TARGET_SLEEP_TEMP then
			sleeper.components.temperature:SetTemperature(TUNING.TARGET_SLEEP_TEMP)
		end	
		local moisture_start = nil
		if sleeper.components.moisture and sleeper.components.moisture:GetMoisture() > 0 then
			moisture_start = sleeper.components.moisture.moisture
		end		
	if not inst:HasTag("DLC") and not GetPlayer().components.moisture then
		if sleeper.components.temperature then
			sleeper.components.temperature:SetTemperature(sleeper.components.temperature.maxtemp)
		end 
		end

		inst.duration = inst.duration - 15
		--inst.components.finiteuses:Use()
		GetClock():MakeNextDay()
		
	if inst:HasTag("DLC") or GetPlayer().components.moisture then	
		if moisture_start then
			sleeper.components.moisture.moisture = moisture_start - TUNING.SLEEP_MOISTURE_DELTA
			if sleeper.components.moisture.moisture < 0 then sleeper.components.moisture.moisture = 0 end
		end
		end

if sleeper:HasTag("musha") then
		sleeper.tenting = true
		--[[if sleeper.components.stamina_sleep then
			sleeper.components.stamina_sleep:DoDelta(50)
		end
		if sleeper.components.fatigue_sleep then
			sleeper.components.fatigue_sleep:DoDelta(-50)
		end
		if sleeper.components.spellpower then
			sleeper.components.spellpower:DoDelta(50)
		end]]
if sleeper.music and sleeper.music <=100 then
	sleeper.music = sleeper.music + 20
	if sleeper.music >=100 then
	sleeper.music = sleeper.music *0 + 100
	sleeper:AddTag("switlight")
	end
elseif sleeper.music and sleeper.music >=100 then
sleeper.music = sleeper.music *0 + 100
sleeper:AddTag("switlight")
end
end
	
		sleeper.components.health:SetInvincible(false)
		sleeper.components.playercontroller:Enable(true)
		sleeper.sg:GoToState("wakeup")	
		if inst.duration <= 0 then
		OnDurability(inst) 
		end
	end)
end

local function onpreload(inst, data)
	if data then
		if data.duration then
		inst.duration = data.duration
			duration_light(inst)
end
	end
		end
		
					
local function TakeItem(inst, item, data)
	inst.components.fueled:DoDelta(1)
	SpawnPrefab("small_puff").Transform:SetPosition(inst:GetPosition():Get())
	SpawnPrefab("pine_needles").Transform:SetPosition(inst:GetPosition():Get())	
	if  inst:HasTag("DLC") and not inst:HasTag("DLC2") then
	SpawnPrefab("green_leaves").Transform:SetPosition(inst:GetPosition():Get())
	--SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get())
	end
    if inst.duration < 100 then
	inst.duration = inst.duration + 20
	duration_light(inst)
	if inst.duration > 100 then
	inst.duration = inst.duration * 0 +100
	duration_light(inst)
	end    end
	if inst.broken then 
	inst.AnimState:PlayAnimation("destroy")
	inst.broken = false
   		scheduler:ExecuteInTime(2, function()
		SpawnPrefab("collapse_big").Transform:SetPosition(inst:GetPosition():Get())
		  inst.AnimState:SetBuild("tent_musha")
		  inst:AddComponent("sleepingbag")
		inst.components.sleepingbag.onsleep = onsleep
	  inst.AnimState:PlayAnimation("place") inst.AnimState:PushAnimation("idle", true)	end)
	   end 
	   end
		
local function onsave(inst, data)
	data.duration = inst.duration
	if inst:HasTag("burnt") or inst:HasTag("fire") then
        data.burnt = true
    end
end

local function onload(inst, data)
	if data and data.burnt then
        inst.components.burnable.onburnt(inst)
    end
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst:AddTag("tent")    
    
    MakeObstaclePhysics(inst, 1)    

    inst:AddTag("structure")
    anim:SetBank("tent")
    anim:SetBuild("tent_musha")

    anim:PlayAnimation("idle", true)
    
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon( "tent_musha.tex" )
	
    --[[inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = 2
    inst.components.fuel.startsize = "medium"
    --]]
    
    inst:AddComponent("inspectable")
	
	inst.entity:AddLight()
	inst.Light:SetRadius(5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.8)
    inst.Light:SetColour(180/255,180/255,180/255)	
	inst.Light:Enable(false)
	inst.light_on = false
	inst:AddComponent("machine")
    inst.components.machine.turnonfn = on_light_tent
    inst.components.machine.turnofffn = off_light_tent
    inst.components.machine.cooldowntime = 0	
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 21
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
    inst.components.talker.offset = Vector3(0,-780,0)
    inst.components.talker.symbol = "swap_object"
    inst:AddComponent("fueled")
	inst.duration = 100  
	inst:ListenForEvent("duration", duration_light)	
    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(15, 15)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(5)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	--inst:AddComponent("finiteuses")
    --inst.components.finiteuses:SetMaxUses(TUNING.TENT_USES)
    --inst.components.finiteuses:SetUses(TUNING.TENT_USES)
    --inst.components.finiteuses:SetOnFinished( onfinished )

       inst.components.fueled.fueltype = "BURNABLE"
       inst.components.fueled:InitializeFuelLevel(100)
        inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
		inst.components.fueled:StopConsuming() 	
		
	inst:AddComponent("sleepingbag")
	inst.components.sleepingbag.onsleep = onsleep
	MakeSnowCovered(inst, .01)
	inst:ListenForEvent( "onbuilt", onbuilt)

	MakeLargeBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(5, 5)
    inst.components.playerprox:SetOnPlayerNear(on_close)
    inst.components.playerprox:SetOnPlayerFar(far)
	
	inst.OnSave = onsave 
    inst.OnLoad = onload
	inst.OnPreLoad = onpreload
	
    return inst
end

return Prefab( "common/objects/tent_musha", fn, tent_assets),
MakePlacer("common/tent_musha_placer", "tent", "tent_musha", "idle")