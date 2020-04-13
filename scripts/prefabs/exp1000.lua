local assets=
{
	Asset("ANIM", "anim/exp.zip"),
  Asset("ATLAS", "images/inventoryimages/exp100cheat.xml"),
  Asset("IMAGE", "images/inventoryimages/exp100cheat.tex"),

}

local function OnPutInInventory(inst)
   inst.invexp = true
end

local function OnDropped(inst,data)
   inst.invexp = false
end

local function onclose(inst)
local player = GetPlayer()
if not inst.invexp and not player:HasTag("valkyrieh") then
	local fx2 = SpawnPrefab("sparklefx")
	fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 1, 1)
	fx2.Transform:SetPosition(0, 0, 0)
	player.components.health:DoDelta(100) 
	player.components.sanity:DoDelta(100) 
	player.components.stamina_sleep:DoDelta(100) 
	player.components.fatigue_sleep:DoDelta(-100) 
	player.components.spellpower:DoDelta(100)
	player.music = player.music + 100
	player.treasure = player.treasure + 100
    inst:Remove()
end
end

local function far(inst)
end

local function onequip(inst, owner)
	inst:DoTaskInTime(0, function() 
		if TheSim then 
			local minimap = TheSim:FindFirstEntityWithTag("minimap")
				if minimap then
				minimap.MiniMap:EnableFogOfWar(false)
			end
		end
	end)
end

local function onunequip(inst, owner) 
	inst:DoTaskInTime(0, function() 
		if TheSim then
			local minimap = TheSim:FindFirstEntityWithTag("minimap")
			minimap.MiniMap:EnableFogOfWar(true)
			
		end
    end)
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst.entity:AddSoundEmitter()
    
    inst.AnimState:SetBank("bulb")
    inst.AnimState:SetBuild("exp")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetMultColour(1, 1, 1, 0.3)

    local light = inst.entity:AddLight()
    light:SetFalloff(0.3)
    light:SetIntensity(.3)
    light:SetRadius(0.3)
    light:SetColour(120/255, 120/255, 150/255)
    light:Enable(true)
    inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

   	--[[inst:AddComponent("edible")
    inst.components.edible.foodtype = "SEEDS"
    inst.components.edible.sanityvalue = 100
    inst.components.edible.healthvalue = 100
    inst.components.edible.hungervalue = 0]]
    inst:AddComponent("tradable")
        inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "exp.tex" )

    --inst:AddComponent("stackable")
	--inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = 10000000
    inst.components.fuel.fueltype = "CHEMICAL"
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
inst.components.inventoryitem.atlasname = "images/inventoryimages/exp100cheat.xml"
       inst:AddComponent("equippable")
       inst.components.equippable.equipslot = EQUIPSLOTS.BODY
       inst.components.equippable.walkspeedmult = 3
	      inst.components.equippable:SetOnEquip(onequip)
       inst.components.equippable:SetOnUnequip(onunequip)
	   
        inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(4, 5)
    inst.components.playerprox:SetOnPlayerNear(onclose)
    inst.components.playerprox:SetOnPlayerFar(far)

    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)

    return inst
end

return Prefab( "common/inventory/exp100cheat", fn, assets) 

