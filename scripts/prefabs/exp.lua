local assets=
{
  Asset("ANIM", "anim/exp.zip"),
  Asset("ATLAS", "images/inventoryimages/exp.xml"),
  Asset("IMAGE", "images/inventoryimages/exp.tex"),

}

local function OnPutInInventory(inst)
   inst.invexp = true
end

local function OnDropped(inst,data)
   inst.invexp = false
end

local function close_on(inst)
local player = GetPlayer()

if not inst.invexp and not player:HasTag("valkyrieh") and player:HasTag("expx1") then
player.components.health:DoDelta(5)
player.components.sanity:DoDelta(5)
	player.level = player.level + 1
	player.components.talker:Say("extra [EXP](+1) \n".. (player.level))
		inst:AddTag("noclick")
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(inst:GetPosition():Get())
	inst.Transform:SetScale(0.25, 0.25, 0.25)
	inst.components.colourtweener:StartTween({.2,.2,.2,.2}, .1)
	inst:DoTaskInTime(1, function() inst:Remove() end) end)
	
elseif not inst.invexp and not player:HasTag("valkyrieh") and player:HasTag("expx2") then
player.components.health:DoDelta(5)
player.components.sanity:DoDelta(5)
	player.level = player.level + 2
	player.components.talker:Say("extra [EXP](+2) \n".. (player.level))
		inst:AddTag("noclick")
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(inst:GetPosition():Get())
	inst.Transform:SetScale(0.25, 0.25, 0.25)
	inst.components.colourtweener:StartTween({.2,.2,.2,.2}, .1)
	inst:DoTaskInTime(1, function() inst:Remove() end) end)
	
elseif not inst.invexp and not player:HasTag("valkyrieh") and player:HasTag("expx3") then
player.components.health:DoDelta(5)
player.components.sanity:DoDelta(5)
	player.level = player.level + 3
	player.components.talker:Say("extra [EXP](+3) \n".. (player.level))
		inst:AddTag("noclick")
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(inst:GetPosition():Get())
	inst.Transform:SetScale(0.25, 0.25, 0.25)
	inst.components.colourtweener:StartTween({.2,.2,.2,.2}, .1)
	inst:DoTaskInTime(1, function() inst:Remove() end) end)
	
elseif not inst.invexp and not player:HasTag("valkyrieh") and player:HasTag("expx4") then
player.components.health:DoDelta(5)
player.components.sanity:DoDelta(5)
	player.level = player.level + 10
	player.components.talker:Say("extra [EXP](+4) \n".. (player.level))
		inst:AddTag("noclick")
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(inst:GetPosition():Get())
	inst.Transform:SetScale(0.25, 0.25, 0.25)
	inst.components.colourtweener:StartTween({.2,.2,.2,.2}, .1)
	inst:DoTaskInTime(1, function() inst:Remove() end) end)

end
end

local function far(inst)
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
    --inst.AnimState:SetMultColour(1, 1, 1, 0.3)

    local light = inst.entity:AddLight()
    light:SetFalloff(0.3)
    light:SetIntensity(.3)
    light:SetRadius(0.3)
    light:SetColour(120/255, 120/255, 150/255)
    light:Enable(true)
    inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
	inst.Transform:SetScale(0.5, 0.5, 0.5)
    inst:AddComponent("edible")
    inst.components.edible.foodtype = "EXP"
inst:AddComponent("colourtweener")
    inst.components.edible.sanityvalue = 0
    inst.components.edible.healthvalue = 40
    inst.components.edible.hungervalue = 0
    inst:AddComponent("tradable")
        inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "exp.tex" )

    --inst:AddComponent("stackable")
	--inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = 40000000
    inst.components.fuel.fueltype = "CHEMICAL"

    inst:AddComponent("inspectable")

    inst:AddComponent("bait")
    inst:AddTag("molebait")
    
    inst:AddComponent("inventoryitem")
inst.components.inventoryitem.atlasname = "images/inventoryimages/exp.xml"

        inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(4, 5)
    inst.components.playerprox:SetOnPlayerNear(close_on)
    inst.components.playerprox:SetOnPlayerFar(far)

    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)

    return inst
end

return Prefab( "common/inventory/exp", fn, assets) 

