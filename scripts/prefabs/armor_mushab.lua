local assets=
{
	Asset("ANIM", "anim/armor_mushab.zip"),
  Asset("ATLAS", "images/inventoryimages/armor_mushab.xml"),
  Asset("IMAGE", "images/inventoryimages/armor_mushab.tex"),
Asset( "ANIM", "anim/DS_butterfly_p_s.zip"),
}


local function OnOpen(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/lighter_on")
end 

local function OnClose(inst) 
    inst.SoundEmitter:PlaySound("dontstarve/wilson/lighter_on")
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

--[[
local slotpos = {}

for y = 0, 6 do
	table.insert(slotpos, Vector3(-162, -y*75 + 240 ,0))
	table.insert(slotpos, Vector3(-162 +75, -y*75 + 240 ,0))
end
]]
--------------
local function healowner(inst, owner)
    if (owner.components.health and owner.components.health:IsHurt())
    and (owner.components.hunger and owner.components.hunger.current > 160 and owner.components.health:GetPercent() > 0.6)then
        owner.components.health:DoDelta(2,false)
elseif (owner.components.health and owner.components.health:IsHurt())
    and (owner.components.hunger and owner.components.hunger.current < 160 and owner.components.hunger and owner.components.hunger.current > 60  )then
        owner.components.health:DoDelta(1,false)
        owner.components.sanity:DoDelta(1,false)
elseif (owner.components.health and owner.components.health:IsHurt())
    and (owner.components.hunger and owner.components.hunger.current < 60 )then
        owner.components.sanity:DoDelta(2,false)
    end
end

local function OnBlocked(owner) 
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour") 
end

local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level >= 4005 then

end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/10")
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/30")
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/50")
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/70")
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/90")
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/120")
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/150")
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/180")
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/210")
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/250")
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/350")
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/450")
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/550")
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/650")
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/750")
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/850")
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/950")
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1050")
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1200")
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1400")
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1600")
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1800")
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2000")
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2200")
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2400")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2600")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2800")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/3000")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/4000")
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say(STRINGS.MUSHA_ARMOR_MUSHAB.." \n[MAX]")
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
inst.components.fueled:StopConsuming()        
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
inst.components.talker:Say("-[Broken Princess Armor]\nArmor (0)\n"..STRINGS.MUSHA_ITEM_DUR.." (0)")
end

local function ChangeInsulation(inst)
if GetSeasonManager():IsSummer() then
    inst.components.insulator:SetSummer()
else
 	inst.components.insulator:SetWinter()
end end	

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
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.34)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV1)]\n"..STRINGS.MUSHA_ARMOR.." (34)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.36)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV2)]\n"..STRINGS.MUSHA_ARMOR.." (36)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.38)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV3)]\n"..STRINGS.MUSHA_ARMOR.." (38)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.40)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV4)]\n"..STRINGS.MUSHA_ARMOR.." (40)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.42)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV5)]\n"..STRINGS.MUSHA_ARMOR.." (42)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.44)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV6)]\n"..STRINGS.MUSHA_ARMOR.." (44)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.46)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV7)]\n"..STRINGS.MUSHA_ARMOR.." (46)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.48)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV8)]\n"..STRINGS.MUSHA_ARMOR.." (48)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.50)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV9)]\n"..STRINGS.MUSHA_ARMOR.." (50)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(20)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.52)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV10)]\n"..STRINGS.MUSHA_ARMOR.." (52)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.54)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV11)]\n"..STRINGS.MUSHA_ARMOR.." (54)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.56)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV12)]\n"..STRINGS.MUSHA_ARMOR.." (56)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.58)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV13)]\n"..STRINGS.MUSHA_ARMOR.." (58)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.60)
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV14)]\n"..STRINGS.MUSHA_ARMOR.." (60)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.62)

inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV15)]\n"..STRINGS.MUSHA_ARMOR.." (62)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.64)
 
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV16)]\n"..STRINGS.MUSHA_ARMOR.." (64)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.66)
 
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV17)]\n"..STRINGS.MUSHA_ARMOR.." (66)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.68)

inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV18)]\n"..STRINGS.MUSHA_ARMOR.." (68)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.70)
 
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV19)]\n"..STRINGS.MUSHA_ARMOR.." (70)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(30)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.72)
 
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV20)]\n"..STRINGS.MUSHA_ARMOR.." (72)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.74)
 
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV21)]\n"..STRINGS.MUSHA_ARMOR.." (74)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.76)
 
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV22)]\n"..STRINGS.MUSHA_ARMOR.." (76)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.78)
 
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV23)]\n"..STRINGS.MUSHA_ARMOR.." (78)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.80)
 
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV24)]\n"..STRINGS.MUSHA_ARMOR.." (80)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.82)
 
inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV25)]\n"..STRINGS.MUSHA_ARMOR.." (82)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.84)

inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV26)]\n"..STRINGS.MUSHA_ARMOR.." (84)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.86)

inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV27)]\n"..STRINGS.MUSHA_ARMOR.." (86)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.88)

inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV28)]\n"..STRINGS.MUSHA_ARMOR.." (88)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.90)

inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV29)]\n"..STRINGS.MUSHA_ARMOR.." (90)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.92)

inst.components.talker:Say("["..STRINGS.MUSHA_ARMOR_MUSHAB.."(LV30)]\n"..STRINGS.MUSHA_ARMOR.." (92)\n"..STRINGS.MUSHA_ITEM_FREEZE.."(40)\n"..STRINGS.MUSHA_ITEM_REGEN.."\n["..STRINGS.MUSHA_ITEM_WARMNCOOL.."]")
end
end
end

local function OnLoad(inst, data)
    UpgradeArmor(inst)
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

local function onequip(inst, owner) 
if owner.DLC or inst.DLC then
	ChangeInsulation(inst)	
	end
   inst:AddTag("talkf")
    UpgradeArmor(inst)
inst.components.fueled:StartConsuming()        
    owner.AnimState:OverrideSymbol("swap_body", "DS_butterfly_p_s", "swap_body")
    owner.components.inventory:SetOverflow(inst)
    inst.components.container:Open(owner)

    inst.task = inst:DoPeriodicTask(12, function() healowner(inst, owner) end)

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
	local prefab = "icespikes_fx_"..math.random(1,4)
		local fx = SpawnPrefab(prefab)
	       if data and math.random() < freezechance1 and attacker and attacker.components.freezable and inst.level <250 then 
            attacker.components.freezable:AddColdness(0.2)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.5, 1)
			fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and math.random() < freezechance2 and attacker and attacker.components.freezable and inst.level >=250 and inst.level <1400 then
            attacker.components.freezable:AddColdness(0.3)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 0.7, 1)
			fx.Transform:SetPosition(attacker:GetPosition():Get())
        elseif data and math.random() < freezechance3 and attacker and attacker.components.freezable and inst.level >=1400 then
            attacker.components.freezable:AddColdness(0.4)
            attacker.components.freezable:SpawnShatterFX()
			fx.Transform:SetScale(1, 1, 1)
			fx.Transform:SetPosition(attacker:GetPosition():Get())
		            end end
    inst:ListenForEvent("attacked", inst.freezefn, owner)
	inst:ListenForEvent("blocked", OnBlocked, owner)
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

    inst.task:Cancel() inst.task = nil 

    inst:RemoveEventCallback("attacked", inst.freezefn, owner)
    inst:RemoveEventCallback("attacked", inst.expfn, owner)
	inst:RemoveEventCallback("blocked", OnBlocked, owner)
end

local function onfinished(inst)
    inst:Remove()
end

local function fn(Sim)
	local inst = CreateEntity()
  	inst.entity:AddSoundEmitter()
  
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
   -- inst.AnimState:SetBank("armor_mushab")
    inst.AnimState:SetBank("armor_slurtleshell")
    inst.AnimState:SetBuild("DS_butterfly_p_s")
    inst.AnimState:PlayAnimation("anim")
	if GetPlayer().components.moisture then
         inst.DLC = true
	end
  inst:AddTag("musha_items")  
    inst:AddTag("metal")
    inst:AddTag("backpack")
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	if inst.DLC2 then
	inst.components.inventoryitem.foleysound = "dontstarve_DLC002/common/foley/obsidian_armour"
	else
	inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/metalarmour"
	end
    --inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/jewlery"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/armor_mushab.xml"
local player = GetPlayer()
if SaveGameIndex:IsModeShipwrecked() or player:HasTag("dlc2") then
         inst.DLC2 = true
		end			
     if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
	MakeInventoryFloatable(inst, "idle_water", "anim")	end 
   
---resurrect
--[[     
	inst:AddComponent("playerprox")
    inst:AddComponent("resurrector")
   -- inst.components.resurrector.active = true
	inst.components.resurrector.doresurrect = doresurrect5
	inst.components.resurrector.makeusedfn = makeused5
    inst.components.playerprox:SetDist(10, 11)
    inst.components.playerprox:SetOnPlayerNear(close)
    inst.components.playerprox:SetOnPlayerFar(far)
]]
----------------------
    inst:AddComponent("container")
	    inst.components.container.itemtestfn = itemtest
    inst.components.container:SetNumSlots(#slotpos)
    inst.components.container.widgetslotpos = slotpos
    --ui_krampusbag_2x8
    inst.components.container.widgetanimbank = "ui_piggyback_2x6"
    inst.components.container.widgetanimbuild = "ui_piggyback_2x6"
    --[[inst.components.container.widgetpos = Vector3(-140,-75,0)]]
	inst.components.container.widgetpos = Vector3(-5,-70,0)
	inst.components.container.type = "pack"
	
	inst.components.container.side_widget = true    

 -------------------------   
    inst:AddComponent("armor")
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
    
    inst.OnLoad = OnLoad

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(1, 0.8, 0.95, 1)
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

return Prefab( "common/inventory/armor_mushab", fn, assets) 
