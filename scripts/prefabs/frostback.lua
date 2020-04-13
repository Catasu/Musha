local assets=
{
	Asset("ANIM", "anim/backpack.zip"),
	Asset("ANIM", "anim/frostback.zip"),
	Asset("ANIM", "anim/swap_frostback.zip"),
	Asset("ANIM", "anim/ui_chest_frosthammer2.zip"),
	Asset( "ANIM", "anim/DS_butterfly_g2_s.zip"),
	Asset( "ANIM", "anim/DS_butterfly_r_s.zip"),
}


local slotpos = {}
--
for y = 0, 3 do
	table.insert(slotpos, Vector3(-162, -y*70 + 113 ,3))
	table.insert(slotpos, Vector3(-162 +75, -y*70 + 113 ,3))
end

--[[for y = 0, 4 do
	table.insert(slotpos, Vector3(-162, -y*58 + 124 ,0))
	table.insert(slotpos, Vector3(-162 +75, -y*58 + 124 ,0))
end]]

local function itemtest(inst, item, slot)
	if not (item:HasTag("tstone") or item:HasTag("backpack")) then
			return true
end
end

local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level >= 4005 then

end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/10")
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/30")
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/50")
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/70")
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/90")
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/120")
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/150")
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/180")
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/210")
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/250")
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/350")
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/450")
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/550")
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/650")
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/750")
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/850")
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/950")
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1050")
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1200")
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1400")
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1600")
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1800")
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2000")
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2200")
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2400")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2600")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2800")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/3000")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/4000")
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n[MAX]")
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

--------
local function UpgradeArmor(inst)
if inst.broken then
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.01)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II II]\nArmor (1)")
 	if not inst.DLC2 then
  inst.components.equippable.walkspeedmult = 1.0
   	elseif inst.DLC2 then
  --inst.components.equippable.walkspeedmult = 0
  end
            inst.components.fueled:StopConsuming()        
   end

if not inst.broken then
 if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.03)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV1)\n"..STRINGS.MUSHA_ARMOR.."(3)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.06)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV2)\n"..STRINGS.MUSHA_ARMOR.."(6)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.09)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV3)\n"..STRINGS.MUSHA_ARMOR.."(9)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.12)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV4)\n"..STRINGS.MUSHA_ARMOR.."(12)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.15)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV5)\n"..STRINGS.MUSHA_ARMOR.."(15)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.18)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV6)\n"..STRINGS.MUSHA_ARMOR.."(18)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.21)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV7)\n"..STRINGS.MUSHA_ARMOR.."(21)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.24)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV8)\n"..STRINGS.MUSHA_ARMOR.."(24)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.27)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV9)\n"..STRINGS.MUSHA_ARMOR.."(27)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.3)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV10)\n"..STRINGS.MUSHA_ARMOR.."(30)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.33)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV11)\n"..STRINGS.MUSHA_ARMOR.."(33)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.36)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV12)\n"..STRINGS.MUSHA_ARMOR.."(36)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.39)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV13)\n"..STRINGS.MUSHA_ARMOR.."(39)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.42)
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV14)\n"..STRINGS.MUSHA_ARMOR.."(42)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.45)
--inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV15)\n"..STRINGS.MUSHA_ARMOR.."(45)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.48)
 --inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV16)\n"..STRINGS.MUSHA_ARMOR.."(48)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.51)
 --inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV17)\n"..STRINGS.MUSHA_ARMOR.."(51)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.54)
--inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV18)\n"..STRINGS.MUSHA_ARMOR.."(54)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.57)
 --inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV19)\n"..STRINGS.MUSHA_ARMOR.."(57)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.60)
 --inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV20)\n"..STRINGS.MUSHA_ARMOR.."(60)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.63)
 --inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV21)\n"..STRINGS.MUSHA_ARMOR.."(63)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.66)
 --inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV22)\n"..STRINGS.MUSHA_ARMOR.."(66)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.69)
 --inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV23)\n"..STRINGS.MUSHA_ARMOR.."(69)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.72)
 --inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV24)\n"..STRINGS.MUSHA_ARMOR.."(72)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.75)
 --inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV25)\n"..STRINGS.MUSHA_ARMOR.."(75)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(50)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.78)
--inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV26)\n"..STRINGS.MUSHA_ARMOR.."(78)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(50)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.80)
--inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV27)\n"..STRINGS.MUSHA_ARMOR.."(80)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(50)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.82)
--inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV28)\n"..STRINGS.MUSHA_ARMOR.."(82)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(50)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.84)
--inst.components.equippable.walkspeedmult = 1.08
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV29)\n"..STRINGS.MUSHA_ARMOR.."(84)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(50)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.85)
--inst.components.equippable.walkspeedmult = 1.1
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II (LV30)\n"..STRINGS.MUSHA_ARMOR.."(85)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(50)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Small)")
end
end 
end
   
-------- --------
local function OnDurability(inst, data)
inst.broken = true
UpgradeArmor(inst)
end
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
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(2)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4600 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(5)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4600 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_FROST.."II \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(8)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
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


local function Release_Frost(inst,owner)
local danger = FindEntity(owner, 7, function(target) 
                return (target:HasTag("monster") and not target:HasTag("player") and not owner:HasTag("spiderwhisperer"))
                    or (target:HasTag("monster") and not target:HasTag("player") and owner:HasTag("spiderwhisperer") and not target:HasTag("spider"))
                    or (target:HasTag("pig") and not target:HasTag("player") and owner:HasTag("spiderwhisperer"))
                    or (target.components.combat and target.components.combat.target == owner) end)

            local hounded = GetWorld().components.hounded

			if hounded and (hounded.warning or hounded.timetoattack <= 0) then
				--if GetClock():IsDay() then
				danger = true
					end
			--elseif not hounded then
				--danger = false	
					--end
		if owner then
			if danger and not inst.danger_wing_s then 
			inst.danger_wing_s = true	
			inst.peace_wing = false
			
			if not inst.DLC2 then
		if inst.level >=0 and inst.level <250 then
inst.components.equippable.walkspeedmult = 1.2
elseif inst.level >=250 and inst.level <250 then
inst.components.equippable.walkspeedmult = 1.22
elseif inst.level >=250 and inst.level <1400 then
inst.components.equippable.walkspeedmult = 1.24
elseif inst.level >= 1400 and inst.level <4000 then
inst.components.equippable.walkspeedmult = 1.26
elseif inst.level >= 4000 then
inst.components.equippable.walkspeedmult = 1.3
		end
			end
				owner.AnimState:OverrideSymbol("swap_body", "DS_butterfly_r_s", "swap_body")
				
			elseif not danger and not inst.peace_wing then 
			inst.danger_wing_s = false	
			inst.peace_wing = true
			if not inst.DLC2 then
			inst.components.equippable.walkspeedmult = 1.0
			end
				owner.AnimState:OverrideSymbol("swap_body", "DS_butterfly_g2_s", "swap_body")
				
			end
if inst.DLC2 then		
if inst.danger_wing_s or inst.danger_wing then 
--local player = GetPlayer()

--owner.components.locomotor:AddSpeedModifier_Additive("FROSTBACK",3,99999999)
		
	if inst.level >=0 and inst.level <250 then
owner.components.locomotor:AddSpeedModifier_Additive("FROSTBACK",2,99999999)
elseif inst.level >=250 and inst.level <250 then
owner.components.locomotor:AddSpeedModifier_Additive("FROSTBACK",2.2,99999999)
elseif inst.level >=250 and inst.level <1400 then
owner.components.locomotor:AddSpeedModifier_Additive("FROSTBACK",2.4,99999999)
elseif inst.level >= 1400 and inst.level <4000 then
owner.components.locomotor:AddSpeedModifier_Additive("FROSTBACK",2.6,99999999)
elseif inst.level >= 4000 then
owner.components.locomotor:AddSpeedModifier_Additive("FROSTBACK",3,99999999)
	end
	
elseif not inst.danger_wing_s and not inst.danger_wing then 
--local player = GetPlayer()
owner.components.locomotor:RemoveSpeedModifier_Additive("FROSTBACK")
end	
end	
		end
end

local function OnBlocked(owner)
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
end

local function OnLoad(inst, data)
    UpgradeArmor(inst)
end

--------

local function onequip(inst, owner) 
   inst:AddTag("talkf")
    UpgradeArmor(inst)
inst.components.fueled:StartConsuming()        

    owner.AnimState:OverrideSymbol("swap_body", "DS_butterfly_g2_s", "backpack")
    owner.AnimState:OverrideSymbol("swap_body", "DS_butterfly_g2_s", "swap_body")
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
	local freezechance1 = 0.2
	local freezechance2 = 0.3
	local freezechance3 = 0.4
	local freezechance4 = 0.5
	local prefab = "icespike_fx_"..math.random(1,4)
		local fx = SpawnPrefab(prefab)
	       if data and math.random() < freezechance1 and attacker and attacker.components.freezable and inst.level <250 and attacker.components.combat then 
            attacker.components.freezable:AddColdness(0.2)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.5, 1)
			fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and math.random() < freezechance2 and attacker and attacker.components.freezable and inst.level >=250 and inst.level <1400 and attacker.components.combat then
            attacker.components.freezable:AddColdness(0.3)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.7, 1)
			fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and math.random() < freezechance3 and attacker and attacker.components.freezable and inst.level >=1400 and inst.level <2200 and attacker.components.combat then 
            attacker.components.freezable:AddColdness(0.4)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 1, 1)
			fx.Transform:SetPosition(attacker:GetPosition():Get())
		elseif data and math.random() < freezechance3 and attacker and attacker.components.freezable and inst.level >=2200 and attacker.components.combat then
			attacker.components.freezable:AddColdness(0.5)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 1.1, 1)
			fx.Transform:SetPosition(attacker:GetPosition():Get())
		            end end

    inst:ListenForEvent("attacked", inst.freezefn, owner)
    inst:ListenForEvent("attacked", inst.expfn, owner)
	inst:ListenForEvent("blocked", OnBlocked, owner)
	inst.task1 = inst:DoPeriodicTask(0.2, function() Release_Frost(inst, owner) end)
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
	inst:RemoveEventCallback("blocked", OnBlocked, owner)
if inst.task1 then inst.task1:Cancel() inst.task1 = nil end
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
	
	if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        inst.DLC2 = true
	MakeInventoryFloatable(inst, "idle_water", "anim")	
	end
	
    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("frostback.tex")

    inst.AnimState:SetBank("armor_slurtleshell")
    inst.AnimState:SetBuild("DS_butterfly_g2_s")
    inst.AnimState:PlayAnimation("anim")
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/frostback.xml"

  -- inst.components.inventoryitem.cangoincontainer = false
	if inst.DLC2 then
	inst.components.inventoryitem.foleysound = "dontstarve_DLC002/common/foley/seashell_suit"
	else
	inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/krampuspack"
	end
    inst:AddComponent("armor")

		
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

        inst:AddTag("fridge")
		inst:AddTag("backpack")
	inst:AddTag("musha_items")
    inst:AddComponent("container")
    inst.components.container.itemtestfn = itemtest
    inst.components.container:SetNumSlots(#slotpos)
    inst.components.container.widgetslotpos = slotpos
    inst.components.container.widgetanimbank = "ui_backpack_2x4"
    inst.components.container.widgetanimbuild = "ui_chest_frosthammer2"
    inst.components.container.widgetpos = Vector3(-5,-70,0)
    inst.components.container.side_widget = true
    inst.components.container.type = "pack"

    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst.OnLoad = OnLoad

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
    inst.components.talker.offset = Vector3(0,100,0)
    inst.components.talker.symbol = "swap_object"

	inst.level = 0
	levelexp(inst)
inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

        inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
        inst.components.fueled:InitializeFuelLevel(30000000)
       inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
inst.components.fueled:StartConsuming()        

    return inst
end

return Prefab( "common/inventory/frostback", fn, assets) 
