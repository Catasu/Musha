local assets=
{
	Asset("ANIM", "anim/mushasword2.zip"),
	Asset("ANIM", "anim/swap_mushasword2.zip"),
    	Asset("ATLAS", "images/inventoryimages/mushasword2.xml"),
	Asset("IMAGE", "images/inventoryimages/mushasword2.tex"),
		Asset("ANIM", "anim/swap_mushasword2_boost.zip"),
}

local function finished(inst)
local owner = inst.components.inventoryitem.owner
local inv = inst.components.inventoryitem
local item = SpawnPrefab("mushasword3")
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
---------------------------
local function levelexp(inst,data)

	local max_exp = 1000
	local exp = math.min(inst.level, max_exp)

if inst.level <= 1000 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II]- \n[Grow Points]".. (inst.level))
end
if inst.level >=0 and inst.level <100 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/100")
inst.level1 = true
elseif inst.level >=100 and inst.level <200 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/200")
inst.level2 = true
inst.level1 = false
elseif inst.level >=200 and inst.level <300 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/300")
inst.level3 = true
inst.level1 = false
inst.level2 = false
elseif inst.level >=300 and inst.level <500 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/500")
inst.level4 = true
inst.level1 = false
inst.level2 = false
inst.level3 = false
elseif inst.level >=500 and inst.level <1000 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/1000(Upgrade)")
inst.level5 = true
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
elseif inst.level >=1000 then
if not inst.finished then
inst.components.talker:Say(STRINGS.MUSHA_WEAPON_SWORD_BASE_UP.."\n[MAX]")
inst.finished = true
finished(inst)
end
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

local function OnDurability(inst, data)
inst.broken = true
    inst.components.weapon:SetDamage(1)
	inst.components.talker:Say(STRINGS.MUSHA_WEAPON_BROKEN.." \n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (1)")
end


local function Upgradedamage(inst)
if inst.components.fueled:IsEmpty() then
inst.broken = true 
   inst.components.weapon:SetDamage(1)
	inst.components.talker:Say(STRINGS.MUSHA_WEAPON_BROKEN.." \n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (1)")
end
if inst.broken then
   inst.components.weapon:SetDamage(1)
	inst.components.talker:Say(STRINGS.MUSHA_WEAPON_BROKEN.." \n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (1)")
   end
if not inst.broken then
 
        if inst.level1 then
    inst.components.weapon:SetDamage(52)
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II (LV1)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (52)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(5C)")
        elseif inst.level2 then
    inst.components.weapon:SetDamage(53)
  
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II (LV2)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (53)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(8C)")
        elseif inst.level3 then
    inst.components.weapon:SetDamage(54)
  
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II (LV3)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (54)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(12C)")
        elseif inst.level4 then
    inst.components.weapon:SetDamage(55)
  
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II (LV4)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (55)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(16C)")
        elseif inst.level5 then
    inst.components.weapon:SetDamage(56)
  
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ II (LV5)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (56)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(20C)")
		

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
Upgradedamage(inst)
if not inst.forgelab_on then
   if math.random() < expchance1 and inst.level <= 4005 then
	inst.level = inst.level + 2
	levelexp(inst)
	inst.components.talker:Say("-"..STRINGS.MUSHA_WEAPON_SWORD_FIRE.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(2)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-"..STRINGS.MUSHA_WEAPON_SWORD_FIRE.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(5)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-"..STRINGS.MUSHA_WEAPON_SWORD_FIRE.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(8)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4005 then
	inst.level = inst.level + 1
	levelexp(inst)
    end
elseif inst.forgelab_on then
inst.active_forge = true
forgelab(inst)
	  if math.random() < expchance1 and inst.level <= 4005 then
	inst.level = inst.level + 10
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FORGE_LUCKY.."\n+(10)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 25
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FORGE_LUCKY.."\n+(25)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 40
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FORGE_LUCKY.."\n+(40)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FORGE_LUCKY.."\n+(5)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
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
    Upgradedamage(inst)
end


local function onattack_FRAME(inst, attacker, target)
local player = GetPlayer()
local framechance1 = 0.05
local framechance2 = 0.08
local framechance3 = 0.12
local framechance4 = 0.16
local framechance5 = 0.2
local expchance = 0.05
local damagedur1 = 0.2
local damagedur2 = 0.5
local damagedur3 = 0.7
local damagedur4 = 1


if math.random() < expchance and not inst.broken and inst.level < 4000 then
	inst.level = inst.level + 1
	inst.components.talker:Say(STRINGS.MUSHA_WEAPON..":GP+1")
	--levelexp(inst)
end
    if target and not inst.broken and math.random() < damagedur1 then
inst.components.fueled:DoDelta(-150000)
    elseif target and not inst.broken and math.random() < damagedur2 then
inst.components.fueled:DoDelta(-75000)
    elseif target and not inst.broken and math.random() < damagedur3 then
inst.components.fueled:DoDelta(-35000)
    elseif target and not inst.broken and math.random() < damagedur4 then
inst.components.fueled:DoDelta(-20000)
    elseif target and inst.broken then
		local fx = SpawnPrefab("splash")
	local pos = Vector3(target.Transform:GetWorldPosition())
fx.Transform:SetPosition(pos:Get())
	inst.components.talker:Say(STRINGS.MUSHA_WEAPON_BROKEN.." \n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (1)")
    end

  	  if target and target.components.burnable and inst.level1 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance1 and not player:HasTag("framea") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-10)
  	  elseif target and target.components.burnable and inst.level2 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance1 and not player:HasTag("framea") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-15)
  	  elseif target and target.components.burnable and inst.level3 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance1 and not player:HasTag("framea") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-20)
  	  elseif target and target.components.burnable and inst.level4 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance1 and not player:HasTag("framea") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-25)
  	  elseif target and target.components.burnable and inst.level5 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance1 and not player:HasTag("framea") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-30)

    elseif target.components.burnable and target.sg and not target.sg:HasStateTag("frozen") and not target:HasTag("wall") and not target:HasTag("structure") and player:HasTag("framea") and not player:HasTag("DLC") then
            target.sg:GoToState("hit")
        target.components.burnable:Ignite()
local fx = SpawnPrefab("statue_transition")
local pos = Vector3(target.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
        --attacker.components.sanity:DoDelta(-5)
		target.components.health:DoDelta(-30)
		player:RemoveTag("framea") 

    elseif target.components.burnable and target.sg and not target.sg:HasStateTag("frozen") and not target:HasTag("wall") and not target:HasTag("structure") and player:HasTag("framea") and player:HasTag("DLC") then
            target.sg:GoToState("hit")
        target.components.burnable:Ignite()
local fx = SpawnPrefab("groundpoundring_fx")
local pos = Vector3(target.Transform:GetWorldPosition())
	fx.Transform:SetScale(0.5, 0.5, 0.5)
	fx.Transform:SetPosition(pos:Get())
        --attacker.components.sanity:DoDelta(-5)
		target.components.health:DoDelta(-53)
		player:RemoveTag("framea") 
	    end

    if target.components.burnable and target.components.burnable:IsBurning() then
        target.components.burnable:Extinguish()
    end
    if target.components.combat and not target:HasTag("companion") then
        target.components.combat:SuggestTarget(attacker)
    end
		player:RemoveTag("framea") 
end

local function OnDropped(inst,data)
   inst:AddTag("talkf")
    end
local function OnPutInInventory(inst)
   inst:RemoveTag("talkf")
    end

local function onequip(inst, owner)
    Upgradedamage(inst)
   inst:AddTag("talkf")
local player = GetPlayer()
   player:AddTag("phoenixblade")
 if inst.level <500 then       
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword2", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
 elseif inst.level >=500 then  
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword2_boost", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 

 end
end
local function onunequip(inst, owner) 
    Upgradedamage(inst)
   inst:RemoveTag("talkf")
   local player = GetPlayer()
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
		player:RemoveTag("phoenixblade") 
		player:RemoveTag("framea") 
end


local function fn(Sim)
	local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	
    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("nightmaresword")
    inst.AnimState:SetBuild("mushasword2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetMultColour(1, 1, 1, 0.6)

    inst:AddTag("sharp")
        inst:AddTag("metal")
    inst:AddComponent("weapon")
    inst.components.weapon:SetOnAttack(Upgradedamage)

      inst.components.weapon:SetOnAttack(onattack_FRAME)


    -------
    

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    	inst.components.inventoryitem.atlasname = "images/inventoryimages/mushasword2.xml"
     inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "blade_2.tex" )
  local player = GetPlayer()
	
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() or player:HasTag("dlc2") then
	inst.DLC2 = true
	MakeInventoryFloatable(inst, "idle_water", "idle")	end 
        inst.entity:AddLight()
	inst.Light:SetRadius(.5)
    inst.Light:SetFalloff(.9)
    inst.Light:SetIntensity(.9)
    inst.Light:SetColour(250/255,65/255,65/255)
	inst.Light:Enable(true)
    inst.OnLoad = OnLoad

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(1, 0.8, 0.65, 1)
    inst.components.talker.offset = Vector3(200,-250,0)

    inst.components.talker.symbol = "swap_object"

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
 
        inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
        inst.components.fueled:InitializeFuelLevel(20000000)
       inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
inst.components.fueled:StopConsuming()        
inst:AddTag("musha_items") 
	inst.level = 0
	levelexp(inst)
inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

    return inst
end

return Prefab( "common/inventory/mushasword2", fn, assets) 
