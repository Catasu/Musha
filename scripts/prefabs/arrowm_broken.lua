local assets=
{
	Asset("ANIM", "anim/arrowm.zip"),
    Asset("ATLAS", "images/inventoryimages/arrowm_broken.xml"),
    Asset("IMAGE", "images/inventoryimages/arrowm_broken.tex"),
	
}

 
local function arrowm_broken()
local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
   
    MakeInventoryPhysics(inst)
    inst.AnimState:SetBank("blow_dart")
    inst.AnimState:SetBuild("arrowm")
    inst.AnimState:PlayAnimation("idle_red")
	inst.Transform:SetScale(1, 1.45, 1)

if SaveGameIndex:IsModeShipwrecked() or GetPlayer():HasTag("dlc2") then
         inst.DLC2 = true
		end			
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
	MakeInventoryFloatable(inst, "idle_pipe_water", "idle_red")	end 
	
	inst:AddTag("arrowm")
	inst:AddComponent("inspectable")
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/arrowm_broken.xml"
	inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL
	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)
	
    return inst
end


return Prefab( "common/inventory/arrowm_broken", arrowm_broken, assets)
