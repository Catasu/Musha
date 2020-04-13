local assets=
{
	Asset("ANIM", "anim/cristal.zip"),
  Asset("ATLAS", "images/inventoryimages/cristal.xml"),
  Asset("IMAGE", "images/inventoryimages/cristal.tex"),

}
local function item_oneaten(inst, eater)
	local dark2 = SpawnPrefab("statue_transition_2")
	dark2.Transform:SetPosition(eater:GetPosition():Get())
	if inst.DLC then	
	SpawnPrefab("green_leaves").Transform:SetPosition(eater:GetPosition():Get())
	end
    if math.random() < 0.6 then
		local poo = SpawnPrefab("glowberry_plant")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	
		
    elseif math.random() < 0.5 then
		local poo = SpawnPrefab("flower_cave")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	
		
    elseif math.random() < 0.5 then
		local poo = SpawnPrefab("flower_cave_double")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	
		
    elseif math.random() < 0.5 then
		local poo = SpawnPrefab("flower_cave_triple")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	
		
    else
		local poo = SpawnPrefab("glowberry_plant")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	
		
	end 
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst.entity:AddSoundEmitter()
    
    inst.AnimState:SetBank("bulb")
    inst.AnimState:SetBuild("cristal")
    inst.AnimState:PlayAnimation("idle")

    local light = inst.entity:AddLight()
    light:SetFalloff(0.7)
    light:SetIntensity(.5)
    light:SetRadius(1.5)
    light:SetColour(69/255, 180/255, 200/255)
    light:Enable(true)
    inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

    inst:AddComponent("edible")
--    inst.components.edible.foodtype = "ELEMENTAL"
--    inst.components.edible.foodtype = "CRISTAL"
	inst.components.edible.foodtype = "VEGGIE"
    inst.components.edible.hungervalue = 0
	inst.components.edible.healthvalue = 99
	inst.components.edible:SetOnEatenFn(item_oneaten)	   
    inst:AddComponent("tradable")
        inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "cristal.tex" )

    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

--    inst:AddComponent("fuel")
--    inst.components.fuel.fuelvalue = 120000000
 --   inst.components.fuel.fueltype = "CHEMICAL"
local player = GetPlayer()
if player:HasTag("DLC")then
         inst.DLC = true
		end	
    
    inst:AddComponent("inspectable")

    inst:AddComponent("bait")
    inst:AddTag("molebait")
    
    inst:AddComponent("inventoryitem")
inst.components.inventoryitem.atlasname = "images/inventoryimages/cristal.xml"

    return inst
end

return Prefab( "common/inventory/cristal", fn, assets) 

