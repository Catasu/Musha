local assets=
{

  Asset("ATLAS", "images/inventoryimages/Tequila.xml"),
  Asset("IMAGE", "images/inventoryimages/Tequila.tex"),
}
local function item_oneaten(inst, eater)
if eater:HasTag("musha") and eater.components.fatigue_sleep then
eater.components.stamina_sleep:DoDelta(25)
eater.components.fatigue_sleep:DoDelta(-50)
eater.components.spellpower:DoDelta(15)
end
end
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("bulb")
    inst.AnimState:PlayAnimation("idle")
	
	inst.Transform:SetScale(0.7,0.6,0.7)  
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM


    inst.components.edible.sanityvalue = -10
    inst.components.edible.healthvalue = -5
    inst.components.edible.hungervalue = 25
	inst.components.edible:SetOnEatenFn(item_oneaten)
	inst.components.edible.temperaturedelta = TUNING.HOT_FOOD_BONUS_TEMP
	inst.components.edible.temperatureduration = TUNING.FOOD_TEMP_LARGE
			
		inst:AddComponent("perishable")
		inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
		inst.components.perishable:StartPerishing()
		inst.components.perishable.onperishreplacement = "spoiled_food"
	
    --[[local light = inst.entity:AddLight()
    light:SetFalloff(0.6)
    light:SetIntensity(.5)
    light:SetRadius(0.25)
    light:SetColour(69/255, 131/255, 145/255)
    light:Enable(true)
    inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )]]
	

    ---------------------       
    
	--inst.components.inspectable.getstatus = GetStatus
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/green_fruit.xml"

		
    return inst
end



return Prefab( "Tequila", fn, assets)