local assets=
{
	--Asset("ANIM", "anim/swap_pirate_booty_bag.zip"),
	--Asset("ANIM", "anim/swap_pirate_musha_bag.zip"),
	
	Asset( "ANIM", "anim/musha_backpack4.zip"),
}

local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level >= 4005 then

end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/10")
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/30")
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/50")
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/70")
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/90")
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/120")
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/150")
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/180")
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/210")
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/250")
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/350")
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/450")
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/550")
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/650")
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/750")
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/850")
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/950")
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1050")
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1200")
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1400")
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1600")
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1800")
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2000")
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2200")
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2400")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2600")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2800")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/3000")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/4000")
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n[MAX]")
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
end
---------------------------------------

local function UpgradeArmor(inst, data)
if inst.components.fueled:IsEmpty() then
inst.broken = true
elseif not inst.components.fueled:IsEmpty() then
inst.broken = false
end
if inst.broken then
 inst.components.fueled:StopConsuming()        
    inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_BROKEN.."\n"..STRINGS.MUSHA_ARMOR.." (0)\n"..STRINGS.MUSHA_ITEM_DUR.." (0)")
  
elseif not inst.broken then

 if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.02)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV1)\n"..STRINGS.MUSHA_ARMOR .." (2)")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.04)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV2)\n"..STRINGS.MUSHA_ARMOR .." (4)")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.06)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV3)\n"..STRINGS.MUSHA_ARMOR .." (6)")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.08)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV4)\n"..STRINGS.MUSHA_ARMOR .." (8)")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.1)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV5)\n"..STRINGS.MUSHA_ARMOR .." (10)")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.12)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV6)\n"..STRINGS.MUSHA_ARMOR .." (12)")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.14)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV7)\n"..STRINGS.MUSHA_ARMOR .." (14)")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.16)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV8)\n"..STRINGS.MUSHA_ARMOR .." (16)")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.18)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV9)\n"..STRINGS.MUSHA_ARMOR .." (18)")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.20)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV10)\n"..STRINGS.MUSHA_ARMOR .." (20)")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.22)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV11)\n"..STRINGS.MUSHA_ARMOR .." (22)")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.24)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV12)\n"..STRINGS.MUSHA_ARMOR .." (24)")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.26)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV13)\n"..STRINGS.MUSHA_ARMOR .." (26)")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.28)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV14)\n"..STRINGS.MUSHA_ARMOR .." (28)")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.30)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV15)\n"..STRINGS.MUSHA_ARMOR .." (30)")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.31)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV16)\n"..STRINGS.MUSHA_ARMOR .." (31)")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.32)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV17)\n"..STRINGS.MUSHA_ARMOR .." (32)")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.33)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV18)\n"..STRINGS.MUSHA_ARMOR .." (33)")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.34)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV19)\n"..STRINGS.MUSHA_ARMOR .." (34)")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.35)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV20)\n"..STRINGS.MUSHA_ARMOR .." (35)")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.36)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV21)\n"..STRINGS.MUSHA_ARMOR .." (36)")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.37)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV22)\n"..STRINGS.MUSHA_ARMOR .." (37)")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.38)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV23)\n"..STRINGS.MUSHA_ARMOR .." (38)")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.39)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV24)\n"..STRINGS.MUSHA_ARMOR .." (39)")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.4)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV25)\n"..STRINGS.MUSHA_ARMOR .." (40)")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.41)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV26)\n"..STRINGS.MUSHA_ARMOR .." (41)")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.42)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV27)\n"..STRINGS.MUSHA_ARMOR .." (42)")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.43)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV28)\n"..STRINGS.MUSHA_ARMOR .." (43)")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.44)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV29)\n"..STRINGS.MUSHA_ARMOR .." (44)")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.45)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." (LV30)\n"..STRINGS.MUSHA_ARMOR .." (45)")
end
end
end

local function OnDurability(inst, data)
inst.broken = true
 	UpgradeArmor(inst)
	inst.components.fueled:StopConsuming()
if inst.consume then inst.consume:Cancel() inst.consume = nil end	 
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
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(2)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4600 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(5)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4600 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_PIRATE.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(8)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
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
local function OnBlocked(owner)
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
end
local function OnLoad(inst, data)
    UpgradeArmor(inst)
end
local function OnPutInInventory(inst)
    UpgradeArmor(inst)
    end 
--------
local function SpawnOinc(inst, owner)
	local player = GetPlayer()
	player.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")

    local dubloon = SpawnPrefab("oinc")
    local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(0,2,0)

    dubloon.Transform:SetPosition(pt:Get())
    local angle = owner.Transform:GetRotation()*(PI/180)
    local sp = (math.random()+1) * -1
    dubloon.Physics:SetVel(sp*math.cos(angle), math.random()*2+8, -sp*math.sin(angle))
    dubloon.components.inventoryitem:OnStartFalling()
end
local function SpawnDubloon(inst, owner)
	local player = GetPlayer()
	player.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")

    local dubloon = SpawnPrefab("dubloon")
    local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(0,2,0)

    dubloon.Transform:SetPosition(pt:Get())
    local angle = owner.Transform:GetRotation()*(PI/180)
    local sp = (math.random()+1) * -1
    dubloon.Physics:SetVel(sp*math.cos(angle), math.random()*2+8, -sp*math.sin(angle))
    dubloon.components.inventoryitem:OnStartFalling()
end
local function SpawnGold(inst, owner)
	local player = GetPlayer()
	player.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")

    local goldnugget = SpawnPrefab("goldnugget")
    local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(0,2,0)

    goldnugget.Transform:SetPosition(pt:Get())
    local angle = owner.Transform:GetRotation()*(PI/180)
    local sp = (math.random()+1) * -1
    goldnugget.Physics:SetVel(sp*math.cos(angle), math.random()*2+8, -sp*math.sin(angle))
    goldnugget.components.inventoryitem:OnDropped()
	
end
---------------------------------------shield on
local function consume(inst, owner)
if not inst.broken and inst.shield then
inst.components.fueled:DoDelta(-20000)
end
if inst.broken and inst.shield then
inst.components.fueled:DoDelta(0)
end
end

local function InShadow(inst, data)
local owner = inst.components.inventoryitem.owner
local x,y,z = inst.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 8)
for k,v in pairs(ents) do
--inst.sleep_on 
if v.components.combat and v.components.combat.target == owner and not (v:HasTag("berrythief") or v:HasTag("prey") or v:HasTag("bird") or v:HasTag("butterfly")) then
		v.components.combat.target = nil		
end
end  
end
 
local function on_shield(inst, owner)

if inst.shield and not inst.broken then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR.."(100)")
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 1)
    inst.consume = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
	
	elseif inst.shield and inst.broken then
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_BROKEN.."]\n"..STRINGS.MUSHA_ARMOR.."(0)")
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
      if inst.consume then inst.consume:Cancel() inst.consume = nil end
end 
end

local function off_shield(inst)

if inst.shield then
inst.shield = false
UpgradeArmor(inst)
end
if inst.consume then inst.consume:Cancel() inst.consume = nil end
end

local function heart(inst)

	local container = inst.components.container
	local player = GetPlayer()
		for i = 1, container:GetNumSlots() do
	        local item = container:GetItemInSlot(i)
	     	if item then 
	     		local replacement = nil 
				if item.prefab == "dragoonheart" then 
				player.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") 
						local fx = SpawnPrefab("collapse_small")
					local pos = Vector3(player.Transform:GetWorldPosition())
					fx.Transform:SetScale(0.5, 0.5, 0.5)
				fx.Transform:SetPosition(pos:Get())
				end
			     	
		     	if item.prefab == "dragoonheart" then 
		     		replacement = "redgem"
				   	end  
		     	if replacement then 
	     			local stacksize = 1 
	     			if item.components.stackable then 
	     				stacksize = item.components.stackable:StackSize()
	     			end 
	     			local newprefab = SpawnPrefab(replacement)
	     			if newprefab.components.stackable then 
	     				newprefab.components.stackable:SetStackSize(stacksize)
	     			end 
	     			container:RemoveItemBySlot(i)
	     			item:Remove()
	     			container:GiveItem(newprefab, i)
	     		end 
		     end 
		end 
		return false 
	end
	
--------------Shield hat
 
local function onuseshield(inst,owner)
local owner = inst.components.inventoryitem.owner

 if not inst.broken then
	inst.shield = true
	owner.AnimState:OverrideSymbol("swap_body", "musha_backpack4", "swap_body")
	on_shield(inst)
        if owner then
             owner.sg:GoToState("shell_enter")
owner.SoundEmitter:PlaySound("dontstarve/wilson/pickup_reeds")
inst:DoTaskInTime(1, function() InShadow(inst) end)
        end
		
		elseif inst.broken then
		end
	if IsDLCInstalled(CAPY_DLC) then
	heart(inst)
	end	
end

local function offuseshield(inst,owner)

   if inst.consume then inst.consume:Cancel() inst.consume = nil end
	off_shield(inst)
	
end

local function stopusingshield(inst, data)
local player = GetPlayer()
local body = inst.components.inventory and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.BODY)
--local back = inst.components.inventory and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.BACK)
--local pack = inst.components.inventory and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.PACK)

	if data.statename == "shell_idle" or data.statename == "shell_hit" or data.statename == "shell_enter" then
       inst.shield = true
		if inst.components.container and inst.opend then
        inst.components.container:Open(owner)
		end
    else
        inst.shield = false
		body.components.useableitem:StopUsingItem()
		offuseshield(inst)
		if inst.components.container and inst.opend then
        inst.components.container:Open(owner)
		end
    end
end

local function dropping(inst,owner)
--local owner = inst.components.inventoryitem.owner
local container = owner.components.container
	local player = GetPlayer()
		for i = 1, container:GetNumSlots() do
	        local item = container:GetItemInSlot(i)
	     	if item then
			owner.components.inventory:DropItem(item)
			end
		end		
end

local function onequip(inst, owner)
local player = GetPlayer()
inst.opend = true
if not inst.shield then
    UpgradeArmor(inst)
	end
	inst.components.fueled:StartConsuming()
    owner.AnimState:OverrideSymbol("swap_body", "musha_backpack4", "backpack")
	owner.AnimState:OverrideSymbol("swap_body", "musha_backpack4", "swap_body")
    owner.components.inventory:SetOverflow(inst)
    if inst.components.container then
        inst.components.container:Open(owner)
	end
	if SaveGameIndex:IsModeShipwrecked() then
    inst.dubloon_task = inst:DoPeriodicTask(TUNING.TOTAL_DAY_TIME, function() SpawnDubloon(inst, owner) end)
	elseif SaveGameIndex:IsModePorkland() then
    inst.dubloon_task = inst:DoPeriodicTask(TUNING.TOTAL_DAY_TIME, function() SpawnOinc(inst, owner) end)
	else
    inst.dubloon_task = inst:DoPeriodicTask(TUNING.TOTAL_DAY_TIME*2, function() SpawnGold(inst, owner) end)
	end
inst.defense = function(attacked, data)	

if inst.shield then
if data and data.attacker and data.attacker.components.combat and data.attacker.components.combat.target == owner then
		data.attacker.components.combat.target = nil		
end end

	if math.random() < 0.76 then
local shadowangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), shadowangle*DEGREES, math.random(2,2), 5, false, false)
local tentacle = SpawnPrefab("tentacle_shadow")
local x,y,z = inst.Transform:GetWorldPosition()
tentacle.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
	end
end	
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

   inst:ListenForEvent("attacked", inst.expfn, owner)
    inst:ListenForEvent("attacked", inst.defense, owner)
	inst:ListenForEvent("newstate", stopusingshield, owner) 
	inst:ListenForEvent("blocked", OnBlocked, owner)
end

	
local function onunequip(inst, owner)
 inst.opend = false
inst.components.fueled:StopConsuming()        
      UpgradeArmor(inst)
    owner.AnimState:ClearOverrideSymbol("swap_body")
	owner.AnimState:ClearOverrideSymbol("backpack")
		    inst:RemoveEventCallback("attacked", inst.expfn, owner)
		    inst:RemoveEventCallback("attacked", inst.defense, owner)
			inst:RemoveEventCallback("newstate", stopusingshield, owner)
			inst:RemoveEventCallback("blocked", OnBlocked, owner)
    owner.components.inventory:SetOverflow(nil)
    inst.components.container:Close(owner)
if IsDLCInstalled(CAPY_DLC) then	
    inst.dubloon_task:Cancel()
    inst.dubloon_task = nil
	end
if not IsDLCInstalled(CAPY_DLC) then	
	inst.goldnugget_task:Cancel()
    inst.goldnugget_task = nil
	end
if IsDLCInstalled(CAPY_DLC) then
	heart(inst)
	end
end


local function onopen(inst)
	inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_open", "open")
end

local function onclose(inst)
	inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_close", "open")
		if IsDLCInstalled(CAPY_DLC) then
	heart(inst)
	end
end

local function itemtest(inst, item, slot)
	if not ( item:HasTag("backpack")) then
			return true
end
end

local slotpos = {}

for y = 0, 5 do
	table.insert(slotpos, Vector3(-162, -y*75 + 170 ,0))
	table.insert(slotpos, Vector3(-162 +75, -y*75 + 170 ,0))
end

local function fn(Sim)
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)

 	inst.AnimState:SetBank("armor_slurtleshell")
    inst.AnimState:SetBuild("musha_backpack4")
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("backpack")
    inst:AddTag("fridge")
   -- inst:AddTag("lowcool")
	inst:AddTag("nocool")
	inst:AddTag("musha_items")	
   inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.6, 0.9, 0.9, 1)
    inst.components.talker.offset = Vector3(0,100,0)
    inst.components.talker.symbol = "swap_object"

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    --inst.components.inventoryitem.cangoincontainer = false
		if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
   	 MakeInventoryFloatable(inst, "idle_water", "anim")
		end
	if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
	inst.components.inventoryitem.foleysound = "dontstarve_DLC002/common/foley/pirate_booty_pack"
	else
	inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/marblearmour"
	end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/pirateback.xml"
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "pirateback.tex" )
	inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
   
    inst:AddComponent("armor")
	inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.02)

	inst:AddComponent("container")
	inst.components.container.itemtestfn = itemtest
    inst.components.container:SetNumSlots(#slotpos)
    inst.components.container.widgetslotpos = slotpos
    inst.components.container.widgetanimbank = "ui_piggyback_2x6"
    inst.components.container.widgetanimbuild = "ui_piggyfrost_2x6"
    inst.components.container.widgetpos = Vector3(-5,-70,0)
    inst.components.container.side_widget = true
    inst.components.container.type = "pack"

    --inst.components.container.onopenfn = onopen
    --inst.components.container.onclosefn = onclose
	
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	inst:AddComponent("useableitem")
       inst.components.useableitem:SetOnUseFn(onuseshield)
       inst.components.useableitem:SetOnStopUseFn(offuseshield)
	
     inst.OnLoad = OnLoad

        inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
        inst.components.fueled:InitializeFuelLevel(30000000)
       inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
--inst.components.fueled:StartConsuming()        

	inst.level = 0
inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

    return inst
end

return Prefab( "common/inventory/pirateback", fn, assets)
