local assets =
{
     Asset("ANIM", "anim/mushroom_spore_blue.zip"),
	 Asset("ANIM", "anim/mushroom_spore_red.zip"),
}


local brain = require "brains/musha_sporebrain"

local function depleted(inst)
    if inst:IsInLimbo() then
	    inst:Remove()
    else
       -- inst.components.workable:SetWorkable(false)
        inst:PushEvent("death")
        inst:RemoveTag("spore") -- so crowding no longer detects it
		SpawnPrefab("musha_spore").Transform:SetPosition(inst:GetPosition():Get())
        inst.persists = false
        -- clean up when offscreen, because the death event is handled by the SG
        inst:DoTaskInTime(3, inst.Remove)
    end
end


local function on_close(inst)
inst.components.locomotor.walkspeed = 1.5
	end

local function far(inst)
if inst.components.follower.leader then
inst.components.locomotor.walkspeed = 4
	end
end

local function checkforcrowding(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local spores = TheSim:FindEntities(x,y,z, 20, {"spore"})
    if #spores > 10 then
        inst.components.perishable:SetPercent(0)
    else
        inst.crowdingtask = inst:DoTaskInTime(15 + math.random()*15, checkforcrowding)
    end
end

local function onload(inst)
    -- If we loaded, then just turn the light on
    inst.Light:Enable(true)
    inst.DynamicShadow:Enable(true)
end

local function light_orb()

 
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
    	inst.entity:AddDynamicShadow()
        inst.entity:AddLight()
		
	local player = GetPlayer()
		if player:HasTag("DLC2")then
         inst.DLC2 = true
		 end
		if player:HasTag("DLC")then
		 inst.DLC = true
		end		
		
		if inst.DLC2 then
		MakeAmphibiousGhostPhysics(inst, 1, .5)
		elseif not inst.DLC2 then
    	MakeCharacterPhysics(inst, 1, .5)
		end
		
		--RemovePhysicsColliders(inst)
		if GetSeasonManager():IsWinter() then
        inst.AnimState:SetBuild("mushroom_spore_red")
		else
		inst.AnimState:SetBuild("mushroom_spore_blue")
		end
        inst.AnimState:SetBank("mushroom_spore")
        inst.AnimState:PlayAnimation("flight_cycle", true)

        inst.DynamicShadow:Enable(false)

	    inst.Light:SetColour(185/255,190/255,250/255)
	    inst.Light:SetIntensity(0.75)
	    inst.Light:SetFalloff(0.55)
	    inst.Light:SetRadius(4.5)
	    inst.Light:Enable(false)
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
		
	    inst.DynamicShadow:SetSize(.8, .5)

        --inst:AddTag("show_spoilage")
        --inst:AddTag("spore")
		inst:AddTag("musha_light2")
		inst:AddTag("noclick")
		--inst:AddTag("character")
		inst:AddTag("companion")
		--inst:AddTag("HASHEATER")
	   inst:AddComponent("follower")
	   
	inst.components.follower.canaccepttarget = false


        inst:AddComponent("inspectable")

        inst:AddComponent("knownlocations")

	    inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
	    inst.components.locomotor:EnableGroundSpeedMultiplier(false)
	    inst.components.locomotor:SetTriggersCreep(false)
	    inst.components.locomotor.walkspeed = 1.5
 	--------------------
    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(6, 7)
    inst.components.playerprox:SetOnPlayerNear(on_close)
    inst.components.playerprox:SetOnPlayerFar(far)
	--------------------
	
        inst:AddComponent("perishable")
        inst.components.perishable:SetPerishTime(500)
        inst.components.perishable:StartPerishing()
        inst.components.perishable:SetOnPerishFn(depleted)
        inst:AddComponent("sanityaura")
        inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL

		inst.Transform:SetScale(1.85, 1.85, 1.85)
		inst:DoPeriodicTask(1, function()
if inst.components.perishable:GetPercent() >= 0.8 then
inst.Transform:SetScale(1.85, 1.85, 1.85)
elseif inst.components.perishable:GetPercent() < 0.8 and inst.components.perishable:GetPercent() >= 0.6 then
inst.Transform:SetScale(1.65, 1.65, 1.65)
elseif inst.components.perishable:GetPercent() < 0.6 and inst.components.perishable:GetPercent() >= 0.4 then
inst.Transform:SetScale(1.45, 1.45, 1.45)
elseif inst.components.perishable:GetPercent() < 0.4 and inst.components.perishable:GetPercent() >= 0.2 then
inst.Transform:SetScale(1.25, 1.25, 1.25)
elseif inst.components.perishable:GetPercent() < 0.2 then
inst.Transform:SetScale(1, 1, 1)
end
		end)
	
	--[[
        inst:AddComponent("burnable")
        inst.components.burnable:SetFXLevel(1)
        inst.components.burnable:SetBurnTime(1)
        inst.components.burnable:AddBurnFX("fire", Vector3(0, 0, 0), "spore")
        inst.components.burnable:SetOnIgniteFn(DefaultBurnFn)
        inst.components.burnable:SetOnBurntFn(DefaultBurntFn)
        inst.components.burnable:SetOnExtinguishFn(DefaultExtinguishFn)
	
        inst:AddComponent("propagator")
        inst.components.propagator.acceptsheat = true
        inst.components.propagator:SetOnFlashPoint(DefaultIgniteFn)
        inst.components.propagator.flashpoint = 1
        inst.components.propagator.decayrate = 0.5
        inst.components.propagator.damages = false
     ]]
	 --local season = GetSeasonManager():GetSeason()
	 
       inst:AddComponent("heater")
        if GetSeasonManager():IsWinter() then
			inst.Light:SetColour(255/255,175/255,160/255)
            inst.components.heater.heat = 80
		elseif inst.DLC2 then
			if GetSeasonManager():IsWetSeason() then
			inst.Light:SetColour(255/255,175/255,160/255)
            inst.components.heater.heat = 15
			end
        elseif inst.DLC or inst.DLC2 then
			if GetSeasonManager():IsSummer() then
			inst.Light:SetColour(160/255,175/255,255/255)
            inst.components.heater.heat = -80
			inst.components.heater.iscooler = true
			end
		elseif inst.DLC2 then
			if GetSeasonManager():IsDrySeason() then
			inst.Light:SetColour(160/255,175/255,255/255)
            inst.components.heater.heat = -80
			inst.components.heater.iscooler = true
			end
        end
	 
	    inst:SetStateGraph("SGmushaspore2")
	    inst:SetBrain(brain)

        -- note: the first check is faster, because this might be from dropping a stack
        inst.crowdingtask = inst:DoTaskInTime(1 + math.random()*15, checkforcrowding)

        inst.OnLoad = onload

        return inst
	end


return Prefab("musha_spore2", light_orb, assets)
 
