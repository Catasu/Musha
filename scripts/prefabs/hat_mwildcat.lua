local assets=
{	Asset("ANIM", "anim/hat_mwildcat.zip"),
	Asset("ANIM", "anim/hat_mwildcat2.zip"),
  Asset("ATLAS", "images/inventoryimages/hat_mwildcat.xml"),
  Asset("IMAGE", "images/inventoryimages/hat_mwildcat.tex"),
}
---------------------------
--------------growable

local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level >= 4005 then

end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/10")
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/30")
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/50")
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/70")
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/90")
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/120")
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/150")
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/180")
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/210")
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/250")
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/350")
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/450")
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/550")
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/650")
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/750")
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/850")
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/950")
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1050")
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1200")
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1400")
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1600")
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1800")
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2000")
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2200")
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2400")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2600")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2800")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/3000")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/4000")
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n[MAX]")
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
local function UpgradeArmor(inst, data, owner)
local owner = inst.components.inventoryitem.owner
if inst.components.fueled:IsEmpty() then
inst.broken = true
inst.boost = false
elseif not inst.components.fueled:IsEmpty() then
inst.broken = false
		if not inst:HasTag("gasmask") then
		inst:AddTag("gasmask")
		if owner and not owner:HasTag("has_gasmask") then
			owner:AddTag("has_gasmask")
		end	
		end
end
if inst.broken then
inst.boost = false
inst.Light:Enable(false)
inst:RemoveTag("gasmask")  
	if owner and owner:HasTag("has_gasmask") then
	owner:RemoveTag("has_gasmask")
	end
inst.components.equippable.poisongasblocker = false
   inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
	inst.components.talker:Say("-[Broken Iron Cat]\n"..STRINGS.MUSHA_ITEM_DUR.." (0)")
            inst.components.fueled:StopConsuming()   
			    if inst.task then inst.task:Cancel() inst.task = nil end
   end

if not inst.broken then
		
  if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.46)
    inst.components.insulator.insulation = TUNING.INSULATION_SMALL
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV1)]\n"..STRINGS.MUSHA_ARMOR.."(46)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(Small)")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.47)
    inst.components.insulator.insulation = TUNING.INSULATION_SMALL
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV2)]\n"..STRINGS.MUSHA_ARMOR.."(47)"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(Small)")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.48)
     inst.components.insulator.insulation = TUNING.INSULATION_SMALL
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV3)]\n"..STRINGS.MUSHA_ARMOR.."(48)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(Small)")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.49)
     inst.components.insulator.insulation = TUNING.INSULATION_SMALL
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV4)]\n"..STRINGS.MUSHA_ARMOR.."(49)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(Small)")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition( 99999999999999999999999999999999999999999999999999, 0.5)
     inst.components.insulator.insulation = TUNING.INSULATION_SMALL
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV5)]\n"..STRINGS.MUSHA_ARMOR.."(5)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(Small)")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.51)
     inst.components.insulator.insulation = TUNING.INSULATION_SMALL
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV6)]\n"..STRINGS.MUSHA_ARMOR.."(51)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(Small)")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.52)
     inst.components.insulator.insulation = TUNING.INSULATION_SMALL
     
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV7)]\n"..STRINGS.MUSHA_ARMOR.."(52)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(Small)")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.53)
    inst.components.insulator.insulation = TUNING.INSULATION_SMALL
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV8)]\n"..STRINGS.MUSHA_ARMOR.."(53)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(Small)")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.54)
    inst.components.insulator.insulation = TUNING.INSULATION_SMALL
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV9)]\n"..STRINGS.MUSHA_ARMOR.."(54)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(Small)")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition( 99999999999999999999999999999999999999999999999999, 0.55)
     inst.components.insulator.insulation = TUNING.INSULATION_SMALL
 
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV10)]\n"..STRINGS.MUSHA_ARMOR.."(55)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.56)
     inst.components.insulator.insulation = TUNING.INSULATION_MED

inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV11)]\n"..STRINGS.MUSHA_ARMOR.."(56)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.57)
      inst.components.insulator.insulation = TUNING.INSULATION_MED

inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV12)]\n"..STRINGS.MUSHA_ARMOR.."(57)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.58)
      inst.components.insulator.insulation = TUNING.INSULATION_MED

inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV13)]\n"..STRINGS.MUSHA_ARMOR.."(58)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.59)
      inst.components.insulator.insulation = TUNING.INSULATION_MED

inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV14)]\n"..STRINGS.MUSHA_ARMOR.."(59)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.60)
      inst.components.insulator.insulation = TUNING.INSULATION_MED

inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV15)]\n"..STRINGS.MUSHA_ARMOR.."(60)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition( 99999999999999999999999999999999999999999999999999, 0.62)
      inst.components.insulator.insulation = TUNING.INSULATION_MED
 
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV16)]\n"..STRINGS.MUSHA_ARMOR.."(62)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.64)
      inst.components.insulator.insulation = TUNING.INSULATION_MED

inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV17)]\n"..STRINGS.MUSHA_ARMOR.."(64)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.66)
     inst.components.insulator.insulation = TUNING.INSULATION_MED

inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV18)]\n"..STRINGS.MUSHA_ARMOR.."(66)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.68)
      inst.components.insulator.insulation = TUNING.INSULATION_MED

inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV19)]\n"..STRINGS.MUSHA_ARMOR.."(68)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.70)
      inst.components.insulator.insulation = TUNING.INSULATION_MED

inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV20)]\n"..STRINGS.MUSHA_ARMOR.."(70)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.72)
	inst.components.insulator.insulation = (TUNING.INSULATION_MED)
	
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV21)]\n"..STRINGS.MUSHA_ARMOR.."(72)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.74)
      inst.components.insulator.insulation = (TUNING.INSULATION_MED)
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV22)]\n"..STRINGS.MUSHA_ARMOR.."(74)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.76)
      inst.components.insulator.insulation = (TUNING.INSULATION_MED)
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV23)]\n"..STRINGS.MUSHA_ARMOR.."(76)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.70)
      inst.components.insulator.insulation = (TUNING.INSULATION_MED)
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV24)]\n"..STRINGS.MUSHA_ARMOR.."(70)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.80)
      inst.components.insulator.insulation = (TUNING.INSULATION_MED)
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV25)]\n"..STRINGS.MUSHA_ARMOR.."(80)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.82)
     inst.components.insulator.insulation = (TUNING.INSULATION_MED)
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV26)]\n"..STRINGS.MUSHA_ARMOR.."(82)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.84)
     inst.components.insulator.insulation = (TUNING.INSULATION_MED)
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV27)]\n"..STRINGS.MUSHA_ARMOR.."(84)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.86)
     inst.components.insulator.insulation = (TUNING.INSULATION_MED)
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV28)]\n"..STRINGS.MUSHA_ARMOR.."(86)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.88)
     inst.components.insulator.insulation = (TUNING.INSULATION_MED)
    
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV29)]\n"..STRINGS.MUSHA_ARMOR.."(88)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(99999999999999999999999999999999999999999999999999, 0.9)
     inst.components.insulator.insulation = (TUNING.INSULATION_MED * 2)
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_CAT.."(LV30)]\n"..STRINGS.MUSHA_ARMOR.."(90)\n"..STRINGS.MUSHA_ITEM_WARMNCOOL.."(MED)")

end
end
end


local function OnDurability(inst, data)
inst.broken = true
 	UpgradeArmor(inst)
	inst.components.fueled:StopConsuming()        
 end
 
local function ChangeInsulation(inst)
if GetSeasonManager():IsSummer() then
    inst.components.insulator:SetSummer()
else
 	inst.components.insulator:SetWinter()
end end	
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
	inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(2)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4600 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(5)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4600 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_HAT_CAT.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(8)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
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

-------- --------

local function OnLoad(inst, data)
    UpgradeArmor(inst)
end

local function drop_Cat(inst, ranout)
		inst.components.fueled:StopConsuming()
		inst.SoundEmitter:PlaySound("dontstarve/common/minerhatOut")
		inst.Light:Enable(false)
		inst.boost = false
		inst:RemoveTag("gasmask")  
		inst.components.equippable.poisongasblocker = false
	end

    local function onequip(inst, owner, fname_override)
	if owner.DLC or inst.DLC then
	ChangeInsulation(inst)	
	end
inst.components.fueled:StartConsuming()        
inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
if not inst.boost then
inst:RemoveTag("gasmask")  owner:RemoveTag("has_gasmask")
inst.components.equippable.poisongasblocker = false
inst.Light:Enable(false)
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mwildcat", "swap_hat")
        owner.AnimState:Show("HAT")
       owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
elseif inst.boost then
inst:AddTag("gasmask")  owner:AddTag("has_gasmask")
inst.components.equippable.poisongasblocker = true
inst.Light:Enable(true)
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mwildcat2", "swap_hat")
        owner.AnimState:Show("HAT")
       owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
        end
    UpgradeArmor(inst)
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

end

    local function onunequip(inst, owner)
		if owner:HasTag("gasmask") then
			owner:RemoveTag("has_gasmask")
		end
		inst:RemoveTag("gasmask")
		inst.components.equippable.poisongasblocker = false
    UpgradeArmor(inst)
	inst.boost = false 
	inst.Light:Enable(false)
inst.components.fueled:StopConsuming()        
    inst:RemoveEventCallback("attacked", inst.expfn, owner)
    if inst.task then inst.task:Cancel() inst.task = nil end

         owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

    end

local function consume(inst, owner)
if not inst.broken and inst.boost then
inst.components.fueled:DoDelta(-30000)
end
if inst.broken and inst.boost then
inst.components.fueled:DoDelta(0)
end
end

  local function gogleon(inst, data, owner, fname_override)
  local owner = inst.components.inventoryitem.owner
if owner and inst.broken then
	inst.boost = false 
	inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
	inst.Light:Enable(false)
	owner.components.talker:Say(STRINGS.MUSHA_WEAPON_BROKEN_TALK)
	inst.components.talker:Say(STRINGS.MUSHA_ARMOR_BROKEN.."\n"..STRINGS.MUSHA_ARMOR.." (0)\n"..STRINGS.MUSHA_ITEM_DUR.." (0)")
  
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mwildcat", "swap_hat")
        owner.AnimState:Show("HAT")
       owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
        inst.components.useableitem:StopUsingItem()
end
if owner and not inst.boost and not inst.broken then
	inst.boost = true 
	SpawnPrefab("collapse_small").Transform:SetPosition(inst:GetPosition():Get())
	inst.SoundEmitter:PlaySound("dontstarve/common/minerhatAddFuel")
	inst:AddTag("gasmask")  owner:AddTag("has_gasmask") 

	inst.components.equippable.poisongasblocker = true
	inst.Light:Enable(true)
	
	--owner.components.talker:Say("Goggle on !")
    inst.task = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mwildcat2", "swap_hat")
        owner.AnimState:Show("HAT")
       owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
		UpgradeArmor(inst)

        inst.components.useableitem:StopUsingItem()

-----------
elseif owner and inst.boost and not inst.broken then
	inst.boost = false 
	inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
	inst:RemoveTag("gasmask")  owner:RemoveTag("has_gasmask")
	inst.components.equippable.poisongasblocker = false
	inst.Light:Enable(false)
    if inst.task then inst.task:Cancel() inst.task = nil end
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mwildcat", "swap_hat")
        owner.AnimState:Show("HAT")
       owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
		UpgradeArmor(inst)
        inst.components.useableitem:StopUsingItem()
end
end

---------------hat fn sim
	
local function fn(sim)
	local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()

	inst.entity:AddLight()
		inst.Light:SetFalloff(0.4)
		inst.Light:SetIntensity(.7)
		inst.Light:SetRadius(2)
		inst.Light:SetColour(155/255, 175/255, 195/255)
		inst.Light:Enable(false)
	
    MakeInventoryPhysics(inst)
 --[[ local player = GetPlayer()
	if SaveGameIndex:IsModeShipwrecked() or player:HasTag("dlc2") or player:HasTag("dlc") then
         inst.DLC2 = true
	inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0
		end	]]
	if GetPlayer().components.moisture then
         inst.DLC = true
	end	 
	inst:AddTag("hat")
	
	inst:AddTag("musha_items")

    inst.AnimState:SetBank("hat_mwildcat")
    inst.AnimState:SetBuild("hat_mwildcat")

    inst.AnimState:PlayAnimation("idle")
        
    inst:AddComponent("inspectable")
    	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hat_mwildcat.xml"
			
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.6, 0.8, 1, 1)
    inst.components.talker.offset = Vector3(0,-500,0)
    inst.components.talker.symbol = "swap_object"

   inst:AddComponent("armor")
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.4)
 
            inst:AddComponent("useableitem")
		inst.components.useableitem:SetOnUseFn(gogleon)
        inst:AddComponent("equippable")
        inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
        inst.components.equippable:SetOnEquip( onequip )
        inst.components.equippable:SetOnUnequip( onunequip )
		inst.components.inventoryitem:SetOnDroppedFn( drop_Cat )
		
       -- inst:AddComponent("insulator")
		--inst.components.insulator:SetSummer()
 
	inst.level = 0
	inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

        inst:AddComponent("fueled")
		inst.components.fueled.fueltype = "CHEMICAL"
		inst.components.fueled:InitializeFuelLevel(32000000)
		inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
		inst.components.fueled:StartConsuming()      
		
		--UpgradeArmor(inst)

    return inst
end
---------------------------------
return Prefab( "common/inventory/hat_mwildcat", fn, assets ) 
