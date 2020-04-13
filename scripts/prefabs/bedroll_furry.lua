local assets=
{
	Asset("ANIM", "anim/swap_bedroll_furry.zip"),
}

local function onsleep(inst, sleeper)
	local br = nil
	if inst.components.stackable then
		br = inst.components.stackable:Get()
	else
		br = inst
	end

	if br and br.components.finiteuses then
		if br.components.finiteuses:GetUses() <= 1 then
			br:Remove()
			br.persists = false
		end
	end
	GetPlayer().HUD:Hide()
	TheFrontEnd:Fade(false,1)
	inst:DoTaskInTime(1.2, function() 
		TheFrontEnd:Fade(true,1) 
		GetPlayer().HUD:Show()
		
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
		
		sleeper.sg:GoToState("wakeup")
		
		if sleeper.components.hunger then
			-- Check SGwilson, state "bedroll", if you change this value
			sleeper.components.hunger:DoDelta(-TUNING.CALORIES_HUGE, false, true)
		end

		if sleeper.components.sanity then
			sleeper.components.sanity:DoDelta(TUNING.SANITY_HUGE, false)
		end

		if sleeper.components.health then
			sleeper.components.health:DoDelta(TUNING.HEALING_MEDLARGE, false, "bedroll", true)
		end
		
		if sleeper.components.temperature then
		if inst:HasTag("DLC") or GetPlayer().components.moisture then
			if sleeper.components.temperature.current < TUNING.TARGET_SLEEP_TEMP then
				sleeper.components.temperature:SetTemperature(TUNING.TARGET_SLEEP_TEMP)
			elseif sleeper.components.temperature.current > TUNING.TARGET_SLEEP_TEMP * 1.5 then
				sleeper.components.temperature:SetTemperature(sleeper.components.temperature.current + (TUNING.TARGET_SLEEP_TEMP * .5))
			end
		elseif not inst:HasTag("DLC") then	
				sleeper.components.temperature:SetTemperature(sleeper.components.temperature.maxtemp)
			end
		end

		GetClock():MakeNextDay()
	end)
end

local function onuse()
	GetPlayer().AnimState:OverrideSymbol("swap_bedroll", "swap_bedroll_furry", "bedroll_furry")	
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
	 if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
	MakeInventoryFloatable(inst, "idle_water", "idle")	end 
	
    anim:SetBank("swap_bedroll_furry")
    anim:SetBuild("swap_bedroll_furry")
    anim:PlayAnimation("idle")
    
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetConsumption(ACTIONS.SLEEPIN, 1)
    inst.components.finiteuses:SetMaxUses(3)
    inst.components.finiteuses:SetUses(3)

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    
	MakeSmallBurnable(inst, TUNING.LONG_BURNABLE)
    MakeSmallPropagator(inst)
	if inst:HasTag("DLC") then
    inst.components.burnable:MakeDragonflyBait(3)
    end
    inst:AddComponent("sleepingbag")
	inst.components.sleepingbag.onsleep = onsleep
    
    inst.onuse = onuse
    
    
    return inst
end

return Prefab( "common/inventory/bedroll_furry", fn, assets) 
