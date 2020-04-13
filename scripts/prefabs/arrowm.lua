local assets=
{
	Asset("ANIM", "anim/arrowm.zip"),
    Asset("ATLAS", "images/inventoryimages/arrowm.xml"),
    Asset("IMAGE", "images/inventoryimages/arrowm.tex"),
	Asset("ATLAS", "images/inventoryimages/dummy_arrow0.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow0.tex"),
	Asset("ATLAS", "images/inventoryimages/dummy_arrow1.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow1.tex"),
	Asset("ATLAS", "images/inventoryimages/dummy_arrow2.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow2.tex"),
	
}
 
 local function dummy_to_arrow(inst)
-- local player = inst.components.inventoryitem.owner
 local player = GetPlayer()
 local arrow = SpawnPrefab("arrowm")
 local arrow2 = SpawnPrefab("arrowm")
   if player and player.components.inventory then
  player.components.inventory:GiveItem(arrow)
  player.components.inventory:GiveItem(arrow2)
  else
  arrow.Transform:SetPosition(inst:GetPosition():Get())
  arrow2.Transform:SetPosition(inst:GetPosition():Get())
  end
  inst:Remove()
  end
  
 
local function arrow_normal()
local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
   
    MakeInventoryPhysics(inst)
    inst.AnimState:SetBank("blow_dart")
    inst.AnimState:SetBuild("arrowm")
    inst.AnimState:PlayAnimation("idle_pipe")
	inst.Transform:SetScale(1, 1.45, 1)

if SaveGameIndex:IsModeShipwrecked() or GetPlayer():HasTag("dlc2") then
         inst.DLC2 = true
		end			

	 if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
	MakeInventoryFloatable(inst, "idle_pipe_water", "idle_pipe")	end 
	
	inst:AddTag("arrowm")
	inst:AddComponent("inspectable")
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/arrowm.xml"
	
	
    return inst
end

local function dummy_arrow0()
local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
   
    MakeInventoryPhysics(inst)
    inst.AnimState:SetBank("blow_dart")
    inst.AnimState:SetBuild("arrowm")
    inst.AnimState:PlayAnimation("idle_pipe")
	inst.Transform:SetScale(1, 1.45, 1)
	
	--inst:AddTag("arrowm")
	inst:AddComponent("inspectable")
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/dummy_arrow0.xml"
	inst:DoTaskInTime(0.5, function()	dummy_to_arrow(inst) end)
    return inst
end

local function dummy_arrow1()
local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
   
    MakeInventoryPhysics(inst)
    inst.AnimState:SetBank("blow_dart")
    inst.AnimState:SetBuild("arrowm")
    inst.AnimState:PlayAnimation("idle_pipe")
	inst.Transform:SetScale(1, 1.45, 1)
	
	--inst:AddTag("arrowm")
	inst:AddComponent("inspectable")
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/dummy_arrow1.xml"
	inst:DoTaskInTime(0.5, function()	dummy_to_arrow(inst) end)
    return inst
end

local function dummy_arrow2()
local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
   
    MakeInventoryPhysics(inst)
    inst.AnimState:SetBank("blow_dart")
    inst.AnimState:SetBuild("arrowm")
    inst.AnimState:PlayAnimation("idle_pipe")
	inst.Transform:SetScale(1, 1.45, 1)
	
	--inst:AddTag("arrowm")
	inst:AddComponent("inspectable")
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/dummy_arrow2.xml"
	inst:DoTaskInTime(0.5, function()	dummy_to_arrow(inst) end)
	
    return inst
end

local function dummy_arrow3()
local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
   
    MakeInventoryPhysics(inst)
    inst.AnimState:SetBank("blow_dart")
    inst.AnimState:SetBuild("arrowm")
    inst.AnimState:PlayAnimation("idle_pipe")
	inst.Transform:SetScale(1, 1.45, 1)
	
	--inst:AddTag("arrowm")
	inst:AddComponent("inspectable")
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/dummy_arrow3.xml"
	inst:DoTaskInTime(0.5, function()	dummy_to_arrow(inst) end)
	
    return inst
end

return Prefab( "common/inventory/arrowm", arrow_normal, assets),
Prefab( "common/inventory/dummy_arrow0", dummy_arrow0, assets),
Prefab( "common/inventory/dummy_arrow1", dummy_arrow1, assets),
Prefab( "common/inventory/dummy_arrow2", dummy_arrow2, assets),
Prefab( "common/inventory/dummy_arrow3", dummy_arrow3, assets)
	