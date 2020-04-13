local assets=
{
	Asset("ANIM", "anim/musha_flute.zip"),
	Asset("ATLAS", "images/inventoryimages/musha_flute.xml"),
	Asset("IMAGE", "images/inventoryimages/musha_flute.tex"),
}

local function onfinished(inst)
	if not inst.broken then
	inst:RemoveComponent("instrument")
	inst.broken = true
end end

local function Hearmusha(inst, musician, instrument, data)
local user = musician
	if inst.components.health  and inst.components.sanity and inst:HasTag("musha") then
	inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
	end
	if inst.components.health  and inst.components.sanity and inst:HasTag("player") then
   	SpawnPrefab("sparklefx").Transform:SetPosition(inst:GetPosition():Get())
	if inst.DLC or inst.DLC2 then
	SpawnPrefab("green_leaves").Transform:SetPosition(inst:GetPosition():Get())
	end
	inst.components.health:DoDelta(25) 
	        inst.components.sanity:DoDelta(5)
	end

	if inst.components.health and inst:HasTag("companion") then
   	SpawnPrefab("sparklefx").Transform:SetPosition(inst:GetPosition():Get())	
	inst.components.health:DoDelta(250) 
	end
	if inst:HasTag("DLC2") then
		if inst.components.poisonable then
			inst.components.poisonable:Cure(inst) end
			end
	if inst.DLC2 then
		if inst.components.poisonable then
			inst.components.poisonable:Cure(inst) end
			end
		user.components.playercontroller:Enable(false)
		user:DoTaskInTime(2.4, function() user.components.playercontroller:Enable(true) end)
 end

local function TakeItem(inst, item, data)
	SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get())
	inst.components.finiteuses:SetUses(10)
		if inst.broken then
	inst:AddComponent("instrument")
	inst.components.instrument.range = TUNING.PANFLUTE_SLEEPRANGE
    inst.components.instrument:SetOnHeardFn(Hearmusha)
	inst.broken = false
end end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()

	inst:AddTag("flute")
    	--inst:AddTag("horn")
	inst:AddTag("musha_flute")

    inst.AnimState:SetBank("pan_flute")
    inst.AnimState:SetBuild("musha_flute")

    inst.AnimState:PlayAnimation("idle")
    MakeInventoryPhysics(inst)
    
    inst:AddComponent("inspectable")
    inst:AddComponent("instrument")
    inst.components.instrument.range = TUNING.PANFLUTE_SLEEPRANGE
    inst.components.instrument:SetOnHeardFn(Hearmusha)
    
    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.PLAY)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(10)
    inst.components.finiteuses:SetUses(10)
    inst.components.finiteuses:SetOnFinished( onfinished)
    inst.components.finiteuses:SetConsumption(ACTIONS.PLAY, 1)
	
	if inst:HasTag("DLC2") then
		inst:AddComponent("poisonhealer") end
	
	inst:AddComponent("fueled")
    inst.components.fueled.fueltype = "GLOWDUST"
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true 

    inst:AddComponent("inventoryitem")
    	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_flute.xml"
     inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_flute.tex" )


    return inst
end

return Prefab( "common/inventory/musha_flute", fn, assets) 
