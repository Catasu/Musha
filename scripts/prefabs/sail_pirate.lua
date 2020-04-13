
local piratesailassets=
{
    Asset("ANIM", "anim/swap_sail_pirates.zip"),
}

local function startconsuming(inst)
    if inst.components.fueled and not inst.components.fueled.consuming then 
        inst.components.fueled:StartConsuming()
    end 
end 

local function stopconsuming(inst)
    if inst.components.fueled and inst.components.fueled.consuming then 
        inst.components.fueled:StopConsuming()
    end 
end 


local function onmounted(boat, data)
    local item = boat.components.container:GetItemInBoatSlot(BOATEQUIPSLOTS.BOAT_SAIL)
    data.driver.AnimState:OverrideSymbol(item.symboltooverride, item.build, item.symbol)

    if data.driver.components.locomotor then
        data.driver.components.locomotor:AddSpeedModifier_Mult("SAIL", item.sail_speed_mult)
    end
end 

local function ondismounted(boat, data) 
    local item = boat.components.container:GetItemInBoatSlot(BOATEQUIPSLOTS.BOAT_SAIL)
    data.driver.AnimState:ClearOverrideSymbol(item.symboltooverride)
    stopconsuming(item)
    
    if data.driver.components.locomotor then
        data.driver.components.locomotor:RemoveSpeedModifier_Mult("SAIL")
    end
end 

local function onstartmoving(boat, data)
    local item = boat.components.container:GetItemInBoatSlot(BOATEQUIPSLOTS.BOAT_SAIL)
    startconsuming(item)
end 

local function onstopmoving(boat, data)
    local item = boat.components.container:GetItemInBoatSlot(BOATEQUIPSLOTS.BOAT_SAIL)
    stopconsuming(item)
end 

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol(inst.symboltooverride, inst.build, inst.symbol)

    if inst.showPropFX then
        local driver = owner.components.drivable.driver
        if driver then
            driver.AnimState:Show("PROPDROP")
        end
    end

    if owner.components.drivable.driver then 
        local driver = owner.components.drivable.driver
        driver.AnimState:OverrideSymbol(inst.symboltooverride, inst.build, inst.symbol)
        driver:PushEvent("sailequipped")
        if inst.flapsound then 
            driver.SoundEmitter:PlaySound( "dontstarve_DLC002/" .. inst.flapsound) 
        end
        if driver.components.locomotor then
            driver.components.locomotor:AddSpeedModifier_Mult("SAIL", inst.sail_speed_mult)
        end
    end

    inst:ListenForEvent("mounted", onmounted, owner)
    inst:ListenForEvent("dismounted", ondismounted, owner)
    inst:ListenForEvent("boatstartmoving", onstartmoving, owner)
    inst:ListenForEvent("boatstopmoving", onstopmoving, owner)
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol(inst.symboltooverride)
    local driver = owner.components.drivable.driver
    if driver then
        driver.AnimState:Hide("PROPDROP")
    end

    if owner.components.drivable.driver then 
        local driver = owner.components.drivable.driver
        driver.AnimState:ClearOverrideSymbol(inst.symboltooverride)
        driver:PushEvent("sailunequipped")
        if inst.flapsound then 
            driver.SoundEmitter:PlaySound( "dontstarve_DLC002/" .. inst.flapsound) 
        end

        if driver.components.locomotor then
            driver.components.locomotor:RemoveSpeedModifier_Mult("SAIL")
        end
    end 

    inst:RemoveEventCallback("mounted", onmounted, owner)
    inst:RemoveEventCallback("dismounted", ondismounted, owner)
    inst:RemoveEventCallback("boatstartmoving", onstartmoving, owner)
    inst:RemoveEventCallback("boatstopmoving", onstopmoving, owner)
    stopconsuming(inst)
end

local function sail_perish(inst)
    onunequip(inst, inst.components.inventoryitem.owner)
    inst:Remove()
end 

local function common_fn(Sim)
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, "idle_water", "idle")
    inst:AddTag("sail")   

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/sail_pirate.xml"
	
    inst:AddComponent("fueled")
    inst.components.fueled.fueltype = "USAGE"
    inst.components.fueled:SetDepletedFn(sail_perish)

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)
    inst.components.burnable:MakeDragonflyBait(3)
       
    inst:AddComponent("equippable")
    inst.components.equippable.boatequipslot = BOATEQUIPSLOTS.BOAT_SAIL
    inst.components.equippable.equipslot = nil
    
    inst.onmounted = onmounted
    inst.ondismounted = ondismounted

    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
    
    return inst
end

local function piratesail_fn(Sim)
    local inst = common_fn(Sim)

    inst.build = "swap_sail_pirates"
    inst.symbol = "swap_sail"
    inst.symboltooverride = "swap_sail"
    inst.AnimState:SetBank("sail")
    inst.AnimState:SetBuild(inst.build)
    inst.AnimState:PlayAnimation("idle")
    inst.components.fueled:InitializeFuelLevel(TUNING.IRON_WIND_PERISH_TIME)
    inst.sail_speed_mult = TUNING.FEATHER_SAIL_SPEED_MULT
    inst.loopsound = "common/sail_LP_feather"
    inst.flapsound = "common/sail_flap_feather"
  
    return inst
end 

return Prefab( "common/inventory/sail_pirate", piratesail_fn, piratesailassets)