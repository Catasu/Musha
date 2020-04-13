local assets=
{
	Asset("ANIM", "anim/swap_frostpocket.zip"),
	Asset("ATLAS", "images/inventoryimages/broken_frosthammer.xml"),
	Asset("IMAGE", "images/inventoryimages/broken_frosthammer.tex"),
	Asset( "ANIM", "anim/DS_butterfly_g_s.zip"),

}

local slotpos_2 = {}

for y = 0, 1 do
	table.insert(slotpos_2, Vector3(-162, -y*75 + 114 ,0))
	table.insert(slotpos_2, Vector3(-162 +75, -y*75 + 114 ,0))
end

local function itemtest(inst, item, slot)
	if not (item:HasTag("tstone") or item:HasTag("backpack")) then
			return true
end
end

local function finished(inst)
local owner = inst.components.inventoryitem.owner
local inv = inst.components.inventoryitem
local item = SpawnPrefab("frostback")

if inst.components.container then
inst.components.container:DropEverything() 
end

    if inv ~= nil and owner ~= nil then
        SpawnPrefab("statue_transition_2").Transform:SetPosition(owner:GetPosition():Get())
		if owner.components.container then
		owner.components.container:GiveItem(item)
		else
		item.Transform:SetPosition(inst:GetPosition():Get())
		end
	else
        SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get())
		item.Transform:SetPosition(inst:GetPosition():Get())
    end
    inst:Remove()
end

--------------------------
local function levelexp(inst,data)

	local max_exp = 1000
	local exp = math.min(inst.level, max_exp)

if inst.level <= 1000 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I]- \n[Grow Points]".. (inst.level))
end
if inst.level >=0 and inst.level <100 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/100")
inst.level1 = true
elseif inst.level >=100 and inst.level <200 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/200")
inst.level2 = true
inst.level1 = false
elseif inst.level >=200 and inst.level <300 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/300")
inst.level3 = true
inst.level1 = false
inst.level2 = false
elseif inst.level >=300 and inst.level <500 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/500")
inst.level4 = true
inst.level1 = false
inst.level2 = false
inst.level3 = false
elseif inst.level >=500 and inst.level <800 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/800 "..STRINGS.MUSHA_UPGRADE)
inst.level5 = true
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
elseif inst.level >=800 then
inst.level5 = true
inst.components.talker:Say(STRINGS.MUSHA_UPGRADE)
finished(inst)
end
end

local function onpreload(inst, data)
	if data then
		if data.level then
		inst.level = data.level
			levelexp(inst)
end
	end
		end
local function onsave(inst, data)
	data.level = inst.level
	data.charge_time = inst.charge_time
end
local function ShouldAcceptItem(inst, item)
    if item.components.edible and inst.components.hunger and inst.components.eater then
        return inst.components.eater:CanEat(item) and inst.components.hunger:GetPercent() <= 1
    end
end
local function OnGetItemFromPlayer(inst, giver, item)
    if item.components.edible then
        end
        if inst.components.eater:Eat(item) then
	inst.components.hunger:DoDelta(10)
		local fx = SpawnPrefab("splash")
	local pos = Vector3(inst.Transform:GetWorldPosition())
fx.Transform:SetPosition(pos:Get())

        end
    end

local function OnDurability(inst, data)
inst.broken = true
inst.components.fueled:StopConsuming()        
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.." [I]\n"..STRINGS.MUSHA_ARMOR.." (0)\n"..STRINGS.MUSHA_ITEM_DUR.." (0)")
end

local function UpgradeArmor(inst)
if inst.broken then
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.01)
   end
if not inst.broken then
        if inst.level1 then
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.05)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I (LV 1)]\n"..STRINGS.MUSHA_ARMOR.."(5)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(5)")
        elseif inst.level2 then
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.1)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I (LV 2)]\n"..STRINGS.MUSHA_ARMOR.."(10)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(5)")
        elseif inst.level3 then
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.15)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I (LV 3)]\n"..STRINGS.MUSHA_ARMOR.."(15)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(10)")
        elseif inst.level4 then
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.2)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I (LV 4)]\n"..STRINGS.MUSHA_ARMOR.."(20)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(15)")
        elseif inst.level5 then
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.25)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."[I (LV 5)]\n"..STRINGS.MUSHA_ARMOR.."(25)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)")
       
end
end
end
-------- --------
-------- --------
local function forgelab(inst, data)
 if inst.active_forge then
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 6, {"forge_musha"})
for k,v in pairs(ents) do
if inst.active_forge then
v.active_forge =  true
inst.active_forge = false
end end 
 end end
-------- --------
local function TakeItem(inst, item, data)
local expchance0 = 1
local expchance1 = 0.3
local expchance2 = 0.2
local expchance3 = 0.12
	inst.components.fueled:DoDelta(5000000)
	SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get())
inst.broken = false      
UpgradeArmor(inst)
 if not inst.forgelab_on then
   if math.random() < expchance1 and inst.level <= 4600 then
	inst.level = inst.level + 2
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(2)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4600 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(5)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4600 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(8)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4600 then
	inst.level = inst.level + 1
	levelexp(inst)
     end
elseif inst.forgelab_on then
inst.active_forge = true
forgelab(inst)
	  if math.random() < expchance1 and inst.level <= 4600 then
	inst.level = inst.level + 10
	levelexp(inst)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_TALK_FORGE_LUCKY.." x5]\n+(10)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4600 then
	inst.level = inst.level + 25
	levelexp(inst)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_TALK_FORGE_LUCKY.." x5]\n+(25)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4600 then
	inst.level = inst.level + 40
	levelexp(inst)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_TALK_FORGE_LUCKY.." x5]\n+(40)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4600 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_TALK_FORGE_LUCKY.." x5]\n+(5)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
    end
	inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
end
	if inst.broken then
	inst.broken = false 
	end
end
-------- --------
-------- --------

local function OnLoad(inst, data)
    UpgradeArmor(inst)
end

--------

local function onequip(inst, owner) 
   inst:AddTag("talkf")
    UpgradeArmor(inst)
inst.components.fueled:StartConsuming()        

    owner.AnimState:OverrideSymbol("swap_body", "DS_butterfly_g_s", "backpack")
    owner.AnimState:OverrideSymbol("swap_body", "DS_butterfly_g_s", "swap_body")
    owner.components.inventory:SetOverflow(inst)
    inst.components.container:Open(owner)

    inst.expfn = function(attacked, data)
local expchance = 0.5
local damagedur1 = 0.2
local damagedur2 = 0.5
local damagedur3 = 0.7
local damagedur4 = 1

if data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 10 then
inst.components.fueled:DoDelta(-50000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 10 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 20 then
inst.components.fueled:DoDelta(-80000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 20 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 30 then
inst.components.fueled:DoDelta(-110000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 30 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 40 then
inst.components.fueled:DoDelta(-140000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 40 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 50 then
inst.components.fueled:DoDelta(-170000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 50 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 60 then
inst.components.fueled:DoDelta(-300000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 60 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 70 then
inst.components.fueled:DoDelta(-330000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 70 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 60 then
inst.components.fueled:DoDelta(-360000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 70 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 80 then
inst.components.fueled:DoDelta(-390000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 80 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 90 then
inst.components.fueled:DoDelta(-450000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 90 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 100 then
inst.components.fueled:DoDelta(-600000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 100 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 100 then
inst.components.fueled:DoDelta(-850000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 100 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 150 then
inst.components.fueled:DoDelta(-1000000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 150 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 200 then
inst.components.fueled:DoDelta(-1400000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 200 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 250 then
inst.components.fueled:DoDelta(-1800000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 250 and data.attacker.components.combat and data.attacker.components.combat.defaultdamage <= 300 then
inst.components.fueled:DoDelta(-2600000)
elseif data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.defaultdamage > 300 then
inst.components.fueled:DoDelta(-3000000)
end

if data and data.attacker and math.random() < damagedur1 then
inst.components.fueled:DoDelta(-50000)
elseif data and data.attacker and math.random() < damagedur2 then
inst.components.fueled:DoDelta(-30000)
elseif data and data.attacker and math.random() < damagedur3 then
inst.components.fueled:DoDelta(-10000)
end

if data and data.attacker and math.random() < expchance and inst.level < 4010 then
	inst.level = inst.level + 1
			levelexp(inst)

		end 
	    end


    inst.freezefn = function(attacked, data)
	local attacker = data.attacker
		local prefab = "icespikes_fx_"..math.random(1,4)
		local fx = SpawnPrefab(prefab)
        if data and attacker and attacker.components.freezable and inst.level1 then
            attacker.components.freezable:AddColdness(0.05)
            attacker.components.freezable:SpawnShatterFX()
        elseif data and attacker and attacker.components.freezable and inst.level2 then
            attacker.components.freezable:AddColdness(0.05)
            attacker.components.freezable:SpawnShatterFX()
        elseif data and attacker and attacker.components.freezable and inst.level3 then
            attacker.components.freezable:AddColdness(0.1)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.3, 1)
		fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and attacker and attacker.components.freezable and inst.level4 then
            attacker.components.freezable:AddColdness(0.15)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.4, 1)
		fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and attacker and attacker.components.freezable and inst.level5 then
            attacker.components.freezable:AddColdness(0.2)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.5, 1)
		fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and attacker and attacker.components.freezable and inst:HasTag("level6") then
            attacker.components.freezable:AddColdness(0.24)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.6, 1)
		fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and attacker and attacker.components.freezable and inst:HasTag("level7") then
            attacker.components.freezable:AddColdness(0.28)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.7, 1)
		fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and attacker and attacker.components.freezable and inst:HasTag("level8") then
            attacker.components.freezable:AddColdness(0.32)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.8, 1)
		fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and attacker and attacker.components.freezable and inst:HasTag("level9") then
            attacker.components.freezable:AddColdness(0.36)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.9, 1)
		fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and attacker and attacker.components.freezable and inst:HasTag("level10") then
            attacker.components.freezable:AddColdness(0.4)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 1, 1)
        end 
    end

    inst:ListenForEvent("attacked", inst.freezefn, owner)
    inst:ListenForEvent("attacked", inst.expfn, owner)
end

local function onunequip(inst, owner) 
inst.components.fueled:StopConsuming()        
   inst:RemoveTag("talkf")
    UpgradeArmor(inst)
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("backpack")
    owner.components.inventory:SetOverflow(nil)
    inst.components.container:Close(owner)

    inst:RemoveEventCallback("attacked", inst.freezefn, owner)
    inst:RemoveEventCallback("attacked", inst.expfn, owner)

end

local function onopen(inst)
  inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
end

local function onclose(inst)
  inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
end

local function fn(Sim)
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
  	inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)
    
    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("broken_frosthammer.tex")

    inst.AnimState:SetBank("armor_slurtleshell")
    inst.AnimState:SetBuild("DS_butterfly_g_s")
    inst.AnimState:PlayAnimation("anim")
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/broken_frosthammer.xml"

   -- inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/krampuspack"
local player = GetPlayer()
if SaveGameIndex:IsModeShipwrecked() or player:HasTag("dlc2") then
         inst.DLC2 = true
		end			
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
	MakeInventoryFloatable(inst, "idle_water", "anim")	end
	
    inst:AddComponent("armor")

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
inst:AddTag("musha_items")
    inst:AddTag("fridge")
	inst:AddTag("backpack")
    inst:AddComponent("container")
    inst.components.container.itemtestfn = itemtest
    inst.components.container:SetNumSlots(#slotpos_2)
    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_backpack_2x4"
    inst.components.container.widgetanimbuild = "ui_chest_frosthammer"
    inst.components.container.widgetpos = Vector3(120,-180,0)
    inst.components.container.widgetpos = Vector3(-5,-50,0)
    inst.components.container.side_widget = true
    inst.components.container.type = "pack"

    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst.OnLoad = OnLoad

        inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
        inst.components.fueled:InitializeFuelLevel(20000000)
       inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
inst.components.fueled:StartConsuming()        

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 19
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
    inst.components.talker.offset = Vector3(0,100,0)
    inst.components.talker.symbol = "swap_object"

	inst.level = 0
	levelexp(inst)
inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

    return inst
end

return Prefab( "common/inventory/broken_frosthammer", fn, assets) 

