require "prefabutil"

local assets=
{
	Asset("ANIM", "anim/swap_pirate_musha_bag.zip"),
	Asset("ATLAS", "images/inventoryimages/backpack_base.xml"),
    Asset("IMAGE", "images/inventoryimages/backpack_base.tex"),
	
	Asset("ANIM", "anim/musha_chest.zip"),
	Asset("ATLAS", "images/inventoryimages/musha_chest.xml"),
    Asset("IMAGE", "images/inventoryimages/musha_chest.tex"),
}
--[[
local slotpos = {}

for y = 0, 5 do
	table.insert(slotpos, Vector3(-162, -y*75 + 170 ,0))
	table.insert(slotpos, Vector3(-162 +75, -y*75 + 170 ,0))
end

local slotpos_5 = {}

for y = 3, 0, -1 do
    for x = 0, 2 do
        table.insert(slotpos_5, Vector3(75*x-75*2+75, 60*y-60*2+32,0))
    end
end]]
local slotpos = {}

for y = 0, 7 do
	table.insert(slotpos, Vector3(-162, -y*65 + 240 ,0))
	table.insert(slotpos, Vector3(-162 +75, -y*65 + 240 ,0))
end

local slotpos_5 = {}

for y = 3, 0, -1 do
    for x = 0, 3 do
        table.insert(slotpos_5, Vector3(60*x-60*2+30, 60*y-60*2+30,0))
    end
end

local function onfar(inst)
	if inst.components.container then
		inst.components.container:Close()
		--inst.AnimState:PlayAnimation("close")
		inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")
	end
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle_empty")
end

local function ondeploy(inst, pt, deployer)
	inst.equiped = false
	inst.dropped = true
	deployer:RemoveTag("heavy_chest")
	if inst.DLC2 and deployer.components.locomotor then
	deployer.components.locomotor:AddSpeedModifier_Additive("BPB")
	end
	if inst.task_speed then 
	inst.task_speed:Cancel() inst.task_speed = nil 
	end
	local chest = SpawnPrefab("musha_chest") 
	if chest then 
		pt = Vector3(pt.x, 0, pt.z)
		chest.Physics:SetCollides(false)
		chest.Physics:Teleport(pt.x, pt.y, pt.z) 
		chest.Physics:SetCollides(true)
		chest.SoundEmitter:PlaySound("dontstarve/common/craftable/chest")
		chest.AnimState:PlayAnimation("place")
		chest.AnimState:PushAnimation("closed", true)
		
		if inst.components.container ~= nil then
		local inv = inst.components.container 
		for i = 1, inv:GetNumSlots() do
        local item = inv:GetItemInSlot(i)
			if chest.components.container then
			chest.components.container:GiveItem(item)
			else
			inst.components.container:DropEverything()
			end
		end
		end

		inst:Remove()
	end
end

local function item_deploytest(inst, pt)
	local ground = GetWorld()
	local tile = GROUND.GRASS

	if ground and ground.Map then
		tile = ground.Map:GetTileAtPoint(pt:Get())
	end

	local onWater = ground.Map:IsWater(tile)

	return not onWater
end

local function pickupfn(inst, guy, data)
	
	if guy.components and guy.components.inventory then
		local backpack = SpawnPrefab("backpack_base")
		inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
		guy.components.inventory:GiveItem(backpack)
			if backpack then
			backpack.dropped = false
			end
		local inv = inst.components.container 
		for i = 1, inv:GetNumSlots() do
        local item = inv:GetItemInSlot(i)
			if backpack.components.container ~= nil then  
			backpack.components.container:GiveItem(item)
			else
			inst.components.container:DropEverything()
			end	
		end
	end	
		
		inst:Remove()
			
		return true 
	
end

local function Dropped_chest(inst)
inst.dropped = true
if inst.task_speed then 
inst.task_speed:Cancel() inst.task_speed = nil 
end

local x,y,z = inst.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x,y,z, 3, {"musha"})
	for k,v in pairs(ents) do
		if v:HasTag("heavy_chest") then
		v:RemoveTag("heavy_chest") 
		end
		if inst.DLC2 or v.DLC2 and v.components.locomotor then
		v.components.locomotor:AddSpeedModifier_Additive("BPB")
		end
	end

end

local function OnPutInInventory_chest(inst,owner)
inst.dropped = false
local player = GetPlayer()
local owner = inst.components.inventoryitem.owner

	if owner and inst.equiped or inst.dropped then
	owner:RemoveTag("heavy_chest")
	elseif not inst.equiped and not inst.dropped then
	if inst.components.talker and player.components.talker then
	if math.random() < 0.2 then
	player.components.talker:Say(STRINGS.MUSHA_ITEM_MUSHACEHST_HEAVY1)
elseif math.random() < 0.2 then
	player.components.talker:Say(STRINGS.MUSHA_ITEM_MUSHACEHST_HEAVY2)
elseif math.random() < 0.2 then
	player.components.talker:Say(STRINGS.MUSHA_ITEM_MUSHACEHST_HEAVY3)
elseif math.random() < 0.2 then
	player.components.talker:Say(STRINGS.MUSHA_ITEM_MUSHACEHST_HEAVY4)	
elseif math.random() < 0.2 then
	player.components.talker:Say(STRINGS.MUSHA_ITEM_MUSHACEHST_HEAVY5)
else
	player.components.talker:Say(STRINGS.MUSHA_ITEM_MUSHACEHST_HEAVY6)
	end
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_MCHEST_HEAVY)
	end
	owner:AddTag("heavy_chest")
	if inst.DLC2 and player.components.locomotor then
	player.components.locomotor:AddSpeedModifier_Additive("BPB",-3,99999999)
	elseif not inst.DLC2 and player.components.locomotor then
	inst.task_speed = inst:DoPeriodicTask(0.3, function()
	if not inst.equiped and not inst.dropped then
	player.components.locomotor.groundspeedmultiplier = 0.5
	else
	player.components.locomotor.groundspeedmultiplier = 1
	end
	end )
	end
	
	end

end

local function onunequip(inst, owner) 
inst.equiped = false
		if inst.DLC2 then
		--owner.components.locomotor:AddSpeedModifier_Additive("BPB")
		end
	owner:RemoveTag("heavy_chest")
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("backpack")
    owner.components.inventory:SetOverflow(nil)
    inst.components.container:Close(owner)
end

local function onequip(inst, owner) 
inst.equiped = true
owner:RemoveTag("heavy_chest")
if not inst.DLC2 and inst.task_speed then 
inst.task_speed:Cancel() inst.task_speed = nil 
end
	if inst.components.talker and owner.components.talker then
	if math.random() < 0.2 then
	owner.components.talker:Say(STRINGS.MUSHA_ITEM_CHESTBASE_HEAVY1)
	elseif math.random() < 0.2 then
	owner.components.talker:Say(STRINGS.MUSHA_ITEM_CHESTBASE_HEAVY2)
	elseif math.random() < 0.2 then
	owner.components.talker:Say(STRINGS.MUSHA_ITEM_CHESTBASE_HEAVY3)
	elseif math.random() < 0.2 then
	owner.components.talker:Say(STRINGS.MUSHA_ITEM_CHESTBASE_HEAVY4)
	else
	owner.components.talker:Say(STRINGS.MUSHA_ITEM_CHESTBASE_HEAVY5)
	end
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_MCHEST_MED)
	end
	if inst.DLC2 and owner.components.locomotor then
	owner.components.locomotor:AddSpeedModifier_Additive("BPB",-1.5,99999999)
	else
	inst.components.equippable.walkspeedmult = 0.75
	end

    owner.AnimState:OverrideSymbol("swap_body", "swap_pirate_musha_bag", "backpack")
    owner.AnimState:OverrideSymbol("swap_body", "swap_pirate_musha_bag", "swap_body")
    owner.components.inventory:SetOverflow(inst)
    inst.components.container:Open(owner)
    
end


local function onopen_chest(inst)
	inst.AnimState:PlayAnimation("open")
	inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_open")
end

local function onclose_chest(inst)
	inst.AnimState:PlayAnimation("close")
	inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")
end

local function onopen(inst)
	inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_open")
end

local function onclose(inst)
	inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")
end

local function itemtest(inst, item, slot)
	if not ( item.components.container ) and not item:HasTag("ro_bin_egg") then
			return true
end
end

local function canpickup(inst)
	
		return true
end

local function packfn(Sim)
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("pirate_booty_bag")
    inst.AnimState:SetBuild("swap_pirate_musha_bag")
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("backpack")

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("backpack_base.tex")
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/backpack_base.xml"
    
	if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() or GetPlayer().DLC2 then
	inst.DLC2 = true
	inst.components.inventoryitem.foleysound = "dontstarve_DLC002/common/foley/pirate_booty_pack"
	else
    inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/backpack"
	--inst.components.inventoryitem.cangoincontainer = false
	end
	inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory_chest)
	inst.components.inventoryitem:SetOnDroppedFn(Dropped_chest)
	
	if inst.DLC2 then
	MakeInventoryFloatable(inst, "idle_water", "anim")
	end
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
    
    
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos)
    inst.components.container.widgetslotpos = slotpos
    inst.components.container.widgetanimbank = "ui_krampusbag_2x8"
    inst.components.container.widgetanimbuild = "ui_krampusbag_2x8"

    inst.components.container.widgetpos = Vector3(-5,-120,0)
	inst.components.container.side_widget = true    
    inst.components.container.type = "pack"
	inst.components.container.itemtestfn = itemtest
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

	inst:AddComponent("deployable")
	inst.components.deployable.ondeploy = ondeploy
	inst.components.deployable.placer = "musha_chest_placer"
	inst.components.deployable.test = item_deploytest
    
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
    inst.components.talker.offset = Vector3(0,100,0)
    inst.components.talker.symbol = "swap_object"	 

    return inst
end

local function chestfn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("musha_chest.tex")
	
	inst:AddTag("structure")
	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("chest")
	inst.AnimState:SetBuild("musha_chest")
	inst.AnimState:PlayAnimation("closed", true)
	
	--inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.canbepickedup = true
	--inst.components.inventoryitem.cangoincontainer = true
	--inst.components.inventoryitem.nobounce = true
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_chest.xml"
	inst.Transform:SetScale(1.1, 1.1, 1.1)				
	inst:AddComponent("container")
		inst.components.container:SetNumSlots(#slotpos_5)
		inst.components.container.itemtestfn = itemtest
		inst.components.container.onopenfn = onopen_chest
		inst.components.container.onclosefn = onclose_chest

		inst.components.container.widgetslotpos = slotpos_5
		inst.components.container.widgetanimbank = "ui_chest_3x3"
		inst.components.container.widgetanimbuild = "ui_chest_3x3"
		inst.components.container.widgetpos = Vector3(0, 200, 0)
		inst.components.container.side_align_tip = 160
			
			inst:AddTag("musha_chest")
			inst:AddTag("pogproof")

	inst:AddComponent("inspectable")
	
	inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(3,5)
	inst.components.playerprox:SetOnPlayerFar(onfar)

	MakeSnowCovered(inst, .01)    
	inst:ListenForEvent( "onbuilt", onbuilt)

	inst:AddComponent("pickupable")
	inst.components.pickupable:SetOnPickupFn(pickupfn)
	inst.components.pickupable.canpickupfn = canpickup
	
	 inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
    inst.components.talker.offset = Vector3(0,100,0)
    inst.components.talker.symbol = "swap_object"	
	
	return inst
end


return 
	Prefab( "common/inventory/backpack_base", packfn, assets),

	MakePlacer( "common/musha_chest_placer", "chest", "musha_chest", "closed" ),
	Prefab( "common/musha_chest", chestfn, assets)	 
		 
