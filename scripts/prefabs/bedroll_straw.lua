local assets=
{
	Asset("ANIM", "anim/swap_bedroll_straw.zip"),
}

local function onsleep(inst, sleeper)
	local br = nil
	if inst.components.stackable then
		br = inst.components.stackable:Get()
	else
		br = inst
	end
	
	if br then
		br.persists = false
		br:Remove()
	end
	
	GetPlayer().HUD:Hide()
	TheFrontEnd:Fade(false,1)
	inst:DoTaskInTime(1.2, function() 
		GetPlayer().HUD:Show()
		TheFrontEnd:Fade(true,1) 
		
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
			sleeper.components.hunger:DoDelta(-TUNING.CALORIES_HUGE, false, true)
		end

		if sleeper.components.sanity then
			sleeper.components.sanity:DoDelta(TUNING.SANITY_LARGE, false)
		end
	
if not inst:HasTag("DLC") then
		 if sleeper.components.temperature then
		 	sleeper.components.temperature:SetTemperature(15)
		 end end
		
		
		GetClock():MakeNextDay()
	end)
end

local function onuse()
	GetPlayer().AnimState:OverrideSymbol("swap_bedroll", "swap_bedroll_straw", "bedroll_straw")
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
	 if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
	MakeInventoryFloatable(inst, "idle_water", "idle")	end 
	
    anim:SetBank("swap_bedroll_straw")
    anim:SetBuild("swap_bedroll_straw")
    anim:PlayAnimation("idle")
    
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM

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

return Prefab( "common/inventory/bedroll_straw", fn, assets) 
