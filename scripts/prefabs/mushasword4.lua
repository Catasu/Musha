local assets=
{
	Asset("ANIM", "anim/mushasword4.zip"),
	Asset("ANIM", "anim/swap_phoenixaxe.zip"),
	Asset("ANIM", "anim/swap_phoenixaxe2.zip"),
	Asset("ANIM", "anim/swap_phoenixaxe_broken.zip"),
	Asset("ATLAS", "images/inventoryimages/mushasword4.xml"),
	Asset("IMAGE", "images/inventoryimages/mushasword4.tex"),
 
}
---------------------------

local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level >= 4005 then
--inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[]-\n[Grow Points]".. (inst.level))
end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/10")
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/30")
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/50")
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/70")
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/90")
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/120")
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/150")
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/180")
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/210")
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/250")
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/350")
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/450")
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/550")
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/650")
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/750")
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/850")
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/950")
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1050")
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1200")
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1400")
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1600")
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/1800")
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2000")
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2200")
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2400")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2600")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/2800")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/3000")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."] \n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]\n".. (inst.level).."/4000")
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.." \n[MAX]")
end
end

local function cancreatelight(staff, caster, target, pos)
    local ground = GetWorld()
    if ground and pos then
        local tile = ground.Map:GetTileAtPoint(pos.x, pos.y, pos.z)
        return tile ~= GROUND.IMPASSIBLE and tile < GROUND.UNDERGROUND
    end
    return false
end

local function createlight(staff, target, pos)
local player = GetPlayer()
    local caster = staff.components.inventoryitem.owner
if caster.components.sanity.current >= 12 then

    local light = SpawnPrefab("lightning")
    --local light2 = SpawnPrefab("stafflight")
	local light2 = SpawnPrefab("musha_spore_fire")
		
    light.Transform:SetPosition(pos.x, pos.y, pos.z)
    light2.Transform:SetPosition(pos.x, pos.y, pos.z)
	light2.components.follower:SetLeader(caster)
	
        caster.components.sanity:DoDelta(-12)
        --caster.components.sanity:DoDelta(-TUNING.SANITY_HUGE)

    elseif caster.components.sanity.current < 12 then
	player.components.talker:Say("not enough [Sanity]..")
    end

end


local function yellow_reticuletargetfn()
    return Vector3(ThePlayer.entity:LocalToWorldSpace(5, 0, 0))
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

local function Upgradedamage(inst,data)
if inst.components.fueled:IsEmpty() then
inst.broken = true
elseif not inst.components.fueled:IsEmpty() then
inst.broken = false
end

if inst.broken then
   inst.components.weapon:SetDamage(1)
	inst.components.talker:Say(STRINGS.MUSHA_WEAPON_BROKEN.." \n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (1)")
  
elseif not inst.broken then

if inst.boost then
 if inst.level >=0 and inst.level <10 then
    inst.components.weapon:SetDamage(75)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV1)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (75)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(4D/50C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=10 and inst.level <30 then
 inst.components.weapon:SetDamage(77)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV2)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (77)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(4D/50C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.weapon:SetDamage(79)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV3)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (79)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(4D/50C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=50 and inst.level <70 then
   inst.components.weapon:SetDamage(81)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV4)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (81)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(4D/50C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=70 and inst.level <90 then
  inst.components.weapon:SetDamage(83)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV5)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (83)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(4D/50C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=90 and inst.level <120 then
  inst.components.weapon:SetDamage(85)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV6)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (85)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(4D/50C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=120 and inst.level <150 then
 inst.components.weapon:SetDamage(87)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV7)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (87)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(4D/50C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
elseif inst.level >=150 and inst.level <180 then
 inst.components.weapon:SetDamage(89)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV8)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (89)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(4D/50C)\n")
elseif inst.level >=180 and inst.level <210 then
 inst.components.weapon:SetDamage(91)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV9)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (91)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(4D/50C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
elseif inst.level >=210 and inst.level <250 then
 inst.components.weapon:SetDamage(93)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV10)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (93)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(7D/55C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=250 and inst.level <350 then
 inst.components.weapon:SetDamage(95)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV11)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (95)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(7D/55C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=350 and inst.level <450 then
  inst.components.weapon:SetDamage(97)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV12)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (97)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(7D/55C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=450 and inst.level <550 then
 inst.components.weapon:SetDamage(99)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV13)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (99)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(7D/55C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=550 and inst.level <650 then
  inst.components.weapon:SetDamage(101)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV14)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (101)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(7D/55C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=650 and inst.level <750 then
 inst.components.weapon:SetDamage(103)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV15)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (103)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(7D/55C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=750 and inst.level <850 then
 inst.components.weapon:SetDamage(105)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV16)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (105)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(7D/55C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=850 and inst.level <950 then
  inst.components.weapon:SetDamage(107)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV17)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (107)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(7D/55C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=950 and inst.level <1050 then
 inst.components.weapon:SetDamage(109)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV18)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (109)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(7D/55C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.weapon:SetDamage(111)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV19)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (111)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(7D/55C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=1200 and inst.level <1400 then
  inst.components.weapon:SetDamage(113)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV20)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (113)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=1400 and inst.level <1600 then
  inst.components.weapon:SetDamage(115)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV21)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (115)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.weapon:SetDamage(117)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV22)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (117)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.weapon:SetDamage(119)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV23)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (119)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.weapon:SetDamage(121)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV24)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (121)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.weapon:SetDamage(123)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV25)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (123)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=2400 and inst.level <2600 then
 inst.components.weapon:SetDamage(125)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV26)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (125)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(25D/36C)")
elseif inst.level >=2600 and inst.level <2800 then
 inst.components.weapon:SetDamage(127)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV27)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (127)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(25D/36C)")
elseif inst.level >=2800 and inst.level <3000 then
  inst.components.weapon:SetDamage(129)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV28)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (129)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(25D/36C)")
elseif inst.level >=3000 and inst.level <4000 then
 inst.components.weapon:SetDamage(131)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(LV29)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (131)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(25D/36C)")
elseif inst.level >=4000 then
  inst.components.weapon:SetDamage(133)
	inst.components.talker:Say("[".. STRINGS.MUSHA_WEAPON_SWORD_PAXE .." ]\n(Max30)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (133)\n"..STRINGS.MUSHA_WEAPON_BLOOD.."(9D/60C)\n"..STRINGS.MUSHA_WEAPON_DARK.."(25D/36C)")
end

elseif not inst.boost then
 if inst.level >=0 and inst.level <10 then
    inst.components.weapon:SetDamage(30)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV1)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (30)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=10 and inst.level <30 then
    inst.components.weapon:SetDamage(32)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV2)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (32)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=30 and inst.level <50 then
    inst.components.weapon:SetDamage(34)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV3)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (34)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=50 and inst.level <70 then
    inst.components.weapon:SetDamage(36)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV4)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (36)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=70 and inst.level <90 then
    inst.components.weapon:SetDamage(38)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV5)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (38)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=90 and inst.level <120 then
    inst.components.weapon:SetDamage(40)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV6)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (40)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
 elseif inst.level >=120 and inst.level <150 then
    inst.components.weapon:SetDamage(41)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV7)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (41)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
elseif inst.level >=150 and inst.level <180 then
    inst.components.weapon:SetDamage(42)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV8)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (42)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
elseif inst.level >=180 and inst.level <210 then
    inst.components.weapon:SetDamage(43)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV9)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (43)\n"..STRINGS.MUSHA_WEAPON_DARK.."(10D/12C)")
elseif inst.level >=210 and inst.level <250 then
    inst.components.weapon:SetDamage(44)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV10)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (44)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=250 and inst.level <350 then
    inst.components.weapon:SetDamage(45)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV11)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (45)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=350 and inst.level <450 then
    inst.components.weapon:SetDamage(46)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV12)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (46)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=450 and inst.level <550 then
    inst.components.weapon:SetDamage(47)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV13)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (47)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=550 and inst.level <650 then
    inst.components.weapon:SetDamage(48)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV14)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (48)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=650 and inst.level <750 then
    inst.components.weapon:SetDamage(49)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV15)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (49)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=750 and inst.level <850 then
    inst.components.weapon:SetDamage(50)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV16)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (50)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=850 and inst.level <950 then
    inst.components.weapon:SetDamage(51)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV17)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (51)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=950 and inst.level <1050 then
    inst.components.weapon:SetDamage(52)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV18)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (52)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=1050 and inst.level <1200 then
    inst.components.weapon:SetDamage(53)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV19)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (53)\n"..STRINGS.MUSHA_WEAPON_DARK.."(15D/20C)")
elseif inst.level >=1200 and inst.level <1400 then
    inst.components.weapon:SetDamage(54)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV20)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (54)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=1400 and inst.level <1600 then
    inst.components.weapon:SetDamage(55)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV21)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (55)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=1600 and inst.level <1800 then
    inst.components.weapon:SetDamage(56)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV22)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (56)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=1800 and inst.level <2000 then
    inst.components.weapon:SetDamage(57)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV23)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (57)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=2000 and inst.level <2200 then
    inst.components.weapon:SetDamage(58)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV24)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (58)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=2200 and inst.level <2400 then
    inst.components.weapon:SetDamage(59)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV25)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (59)\n"..STRINGS.MUSHA_WEAPON_DARK.."(20D/28C)")
elseif inst.level >=2400 and inst.level <2600 then
    inst.components.weapon:SetDamage(60)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV26)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (60)\n"..STRINGS.MUSHA_WEAPON_DARK.."(25D/36C)")
elseif inst.level >=2600 and inst.level <2800 then
    inst.components.weapon:SetDamage(61)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV27)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (61)\n"..STRINGS.MUSHA_WEAPON_DARK.."(25D/36C)")
elseif inst.level >=2800 and inst.level <3000 then
    inst.components.weapon:SetDamage(62)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV28)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (62)\n"..STRINGS.MUSHA_WEAPON_DARK.."(25D/36C)")
elseif inst.level >=3000 and inst.level <4000 then
    inst.components.weapon:SetDamage(63)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(LV29)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (63)\n"..STRINGS.MUSHA_WEAPON_DARK.."(25D/36C)")
elseif inst.level >=4000 then
    inst.components.weapon:SetDamage(64)
	inst.components.talker:Say("[ "..STRINGS.MUSHA_WEAPON_SWORD_AXE.." ]\n(Max30)\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (64)\n"..STRINGS.MUSHA_WEAPON_DARK.."(25D/36C)")
end

end	


end
end
-------- --------
local function OnDurability(inst, data)
inst.broken = true
 Upgradedamage(inst)
 --UpgradeArmor(inst)
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
Upgradedamage(inst)
if not inst.forgelab_on then
   if math.random() < expchance1 and inst.level <= 4005 then
	inst.level = inst.level + 2
	levelexp(inst)
	inst.components.talker:Say("-"..STRINGS.MUSHA_WEAPON_SWORD_AXE.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(2)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-"..STRINGS.MUSHA_WEAPON_SWORD_AXE.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(5)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-"..STRINGS.MUSHA_WEAPON_SWORD_AXE.." \n"..STRINGS.MUSHA_ITEM_LUCKY.." +(8)\n["..STRINGS.MUSHA_ITEM_GROWPOINTS.."]".. (inst.level))
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
local owner = inst.components.inventoryitem.owner
local framechance1 = 0.12
local framechance2 = 0.20
local framechance3 = 0.28
local framechance4 = 0.36
local poisone_1 = 0.5
local poisone_2 = 0.55
local poisone_3 = 0.6

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

	  
if not inst.boost then
  
  	  if target and inst.level <250 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance1 and not player:HasTag("framea") then
        if target.components.burnable then
		target.components.burnable:Ignite()
		end
local fx = SpawnPrefab("statue_transition")
local pos = Vector3(target.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
        target.components.health:DoDelta(-10)
		attacker.components.sanity:DoDelta(1)
  	  elseif target and inst.level >=250 and inst.level <1400 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance2 and not player:HasTag("framea") then
        if target.components.burnable then
		target.components.burnable:Ignite()
		end
local fx = SpawnPrefab("statue_transition")
local pos = Vector3(target.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
        target.components.health:DoDelta(-15)
		attacker.components.sanity:DoDelta(1)
  	  elseif target and inst.level >=1400 and inst.level <2200 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance3 and not player:HasTag("framea") then
         if target.components.burnable then
		target.components.burnable:Ignite()
		end
local fx = SpawnPrefab("statue_transition")
local pos = Vector3(target.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
        target.components.health:DoDelta(-20)
       attacker.components.sanity:DoDelta(2)
  	  elseif target and inst.level >=2200 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance4 and not player:HasTag("framea") then
         if target.components.burnable then
		target.components.burnable:Ignite()
		end
local fx = SpawnPrefab("statue_transition")
local pos = Vector3(target.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
       target.components.health:DoDelta(-25)
 	  attacker.components.sanity:DoDelta(2)
       
	end
	
elseif inst.boost and target.components.locomotor and target.components.health and not target.components.health:IsDead() and not target:HasTag("shadowcreature") and not target:HasTag("structure") then
		if math.random() < poisone_1 and inst.boost and inst.level <250 and not target:HasTag("slow_poison") then
        
		local poison = SpawnPrefab("debuff_blood")
		poison.Transform:SetPosition(target:GetPosition():Get())
		--poison.Transform:SetScale(1,1,1)
		target:AddTag("slow_poison")
		if poison and target:HasTag("slow_poison") then
			if not inst.blood then 
            inst.blood = SpawnPrefab( "debuff_blood" )
            local follower = inst.blood.entity:AddFollower()
                         follower:FollowSymbol( owner.GUID, "swap_object", 1, -150, 0.5 )
			end
		local follower = poison.entity:AddFollower()
			if not target:HasTag("cavedweller") then
			follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, -10, 0.5 )
			else
			follower:FollowSymbol(target.GUID, "body", 0, -10, 0.5 )
			end
		end
		GetWorld():DoPeriodicTask(3, function() 
		if target:HasTag("slow_poison") and not target.components.health:IsDead() then 
				target.components.health:DoDelta(-4)
				attacker.components.health:DoDelta(4)
			if not target:HasTag("giant") and not target:HasTag("epic") and not target:HasTag("wet") and not target:HasTag("ghost") then			
				target.components.locomotor:Stop()
				if target:HasTag("spider") and not target:HasTag("spiderqueen") then
					target.sg:GoToState("hit_stunlock")
				else
					target.sg:GoToState("hit")
				end
			end

		elseif poison and target.components.health:IsDead() then
				poison:Remove()
		end	end)
		GetWorld():DoTaskInTime(15, function() target.components.locomotor.groundspeedmultiplier = 1 target:RemoveTag("slow_poison") poison:Remove() 
		if inst.blood then 
		inst.blood:Remove() inst.blood = nil 
		end end)
		
	elseif math.random() < poisone_2 and inst.boost and inst.level >=250 and inst.level <1400 and not target:HasTag("slow_poison") then
        
 		local poison = SpawnPrefab("debuff_blood")
		poison.Transform:SetPosition(target:GetPosition():Get())
		--poison.Transform:SetScale(1,1,1)
		target:AddTag("slow_poison")
		if poison and target:HasTag("slow_poison") then
		if not inst.blood then 
            inst.blood = SpawnPrefab( "debuff_blood" )
            local follower = inst.blood.entity:AddFollower()
            follower:FollowSymbol( owner.GUID, "swap_object", 1, -150, 0.5 )
			end
		local follower = poison.entity:AddFollower()
			if not target:HasTag("cavedweller") then
			follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, -10, 0.5 )
			else
			follower:FollowSymbol(target.GUID, "body", 0, -10, 0.5 )
			end
		end
		GetWorld():DoPeriodicTask(3, function() 
		if target:HasTag("slow_poison") and not target.components.health:IsDead() then
				target.components.health:DoDelta(-6)
				attacker.components.health:DoDelta(6)
			if not target:HasTag("giant") and not target:HasTag("epic") and not target:HasTag("wet") and not target:HasTag("ghost") then			
				target.components.locomotor:Stop()
				if target:HasTag("spider") and not target:HasTag("spiderqueen") then
					target.sg:GoToState("hit_stunlock")
				else
					target.sg:GoToState("hit")
				end
			end
				target.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
		elseif poison and target.components.health:IsDead() then
				poison:Remove()
		end	end)		
		GetWorld():DoTaskInTime(15, function() target.components.locomotor.groundspeedmultiplier = 1 target:RemoveTag("slow_poison") poison:Remove() 
		if inst.blood then 
		inst.blood:Remove() inst.blood = nil 
		end end)
	
	elseif math.random() < poisone_3 and inst.boost and inst.level >=1400 and not target:HasTag("slow_poison") then
        
		local poison = SpawnPrefab("debuff_blood")
		poison.Transform:SetPosition(target:GetPosition():Get())
		--poison.Transform:SetScale(1,1,1)
		target:AddTag("slow_poison")
		if poison and target:HasTag("slow_poison") then
		if not inst.blood then 
            inst.blood = SpawnPrefab( "debuff_blood" )
            local follower = inst.blood.entity:AddFollower()
            follower:FollowSymbol( owner.GUID, "swap_object", 1, -150, 0.5 )
			end
		local follower = poison.entity:AddFollower()
			if not target:HasTag("cavedweller") then
			follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, -10, 0.5 )
			else
			follower:FollowSymbol(target.GUID, "body", 0, -10, 0.5 )
			end
		end
		GetWorld():DoPeriodicTask(3, function() 
		if target:HasTag("slow_poison") and not target.components.health:IsDead() then
				target.components.health:DoDelta(-8)
				attacker.components.health:DoDelta(8)
			if not target:HasTag("giant") and not target:HasTag("epic") and not target:HasTag("wet") and not target:HasTag("ghost") then			
				target.components.locomotor:Stop()
				if target:HasTag("spider") and not target:HasTag("spiderqueen") then
					target.sg:GoToState("hit_stunlock")
				else
					target.sg:GoToState("hit")
				end
			end
				target.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
		elseif poison and target.components.health:IsDead() then
				poison:Remove()
		end	end)
		GetWorld():DoTaskInTime(15, function() target.components.locomotor.groundspeedmultiplier = 1 target:RemoveTag("slow_poison") poison:Remove() 
		if inst.blood then 
		inst.blood:Remove() inst.blood = nil 
		end end)
		end
end
    if target.components.burnable and target.components.burnable:IsBurning() then
        target.components.burnable:Extinguish()
    end
    if target.components.combat and not target:HasTag("companion") then
        target.components.combat:SuggestTarget(attacker)
    end
	
		local player = GetPlayer()
		if target and not target:HasTag("wall") and not target:HasTag("structure") and player:HasTag("framea") and not (player:HasTag("lightningblue1") and player:HasTag("lightningblue2")) then
        if target.components.burnable then
		 end
		local fx = SpawnPrefab("statue_transition")
		local pos = Vector3(target.Transform:GetWorldPosition())
		fx.Transform:SetPosition(pos:Get())
        target.components.health:DoDelta(-40)
        --attacker.components.sanity:DoDelta(-8)
		--attacker.components.health:DoDelta(20)
		player:RemoveTag("framea")
				
		end
		 
end


local function onequip(inst, owner)
   Upgradedamage(inst)
 
	if not inst.broken then
    if inst.pick then
	inst.components.weapon:SetRange(1)
	inst.axe = false
	inst:AddTag("phoenix_pickaxe")
    owner.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe2", "phoenixaxe")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
	else
	inst.components.weapon:SetRange(0)
	inst.axe = true
	inst.pick = false
	inst:RemoveTag("phoenix_pickaxe")
	owner.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe", "phoenixaxe")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
	end
	elseif inst.broken then
	inst.components.weapon:SetRange(0)
	inst.axe = true
	inst.pick = false
	inst:RemoveTag("phoenix_pickaxe")
	owner.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe_broken", "phoenixaxe")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
	end

	owner:AddTag("phoenixblade") 
end

local function onunequip(inst, owner) 
   Upgradedamage(inst)
   
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
		owner:RemoveTag("framea") 
		owner:RemoveTag("phoenixblade") 

		
	 if inst.blood then 
        inst.blood:Remove()
        inst.blood = nil
    end 
end

local function boost(inst, data, owner, fname_override)
local player = inst.components.inventoryitem.owner
local owner = inst.components.inventoryitem.owner
local change_fx = SpawnPrefab("small_puff")
        local follower = change_fx.entity:AddFollower()
				follower:FollowSymbol( owner.GUID, "swap_object", 1, -150, 0.5 )
if owner and inst.broken then
	inst.boost = false 	
	inst:RemoveComponent("spellcaster")
	Upgradedamage(inst)	
	inst.axe = true	
	inst.pick = false
	inst:RemoveTag("phoenix_pickaxe")
	inst.components.talker:Say("-["..STRINGS.MUSHA_WEAPON_SWORD_AXE.."]\n"..STRINGS.MUSHA_ITEM_DUR.." (0)")
    owner.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe_broken", "phoenixaxe")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
        inst.components.useableitem:StopUsingItem()
end

if owner and not inst.boost and not inst.broken then
	inst.boost = true
	if not inst.components.spellcaster then
       inst:AddComponent("spellcaster")
    inst.components.spellcaster:SetSpellFn(createlight)
    inst.components.spellcaster:SetSpellTestFn(cancreatelight)
    inst.components.spellcaster.canuseonpoint = true
    inst.components.spellcaster.canusefrominventory = false
    inst:AddComponent("reticule")
    inst.components.reticule.targetfn = function() 
        return Vector3(GetPlayer().entity:LocalToWorldSpace(5,0,0))
    end
    inst.components.reticule.ease = true
	end
	Upgradedamage(inst)	
	inst.pick = true	
	inst.axe = false
	inst:AddTag("phoenix_pickaxe")
	inst.components.weapon:SetRange(1)

	inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
	--[[local fx = SpawnPrefab("collapse_small")
		local pos = Vector3(inst.Transform:GetWorldPosition())
		fx.Transform:SetPosition(pos:Get())]]
		
    owner.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe2", "phoenixaxe")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 

    inst.components.useableitem:StopUsingItem()
-----------
elseif owner and inst.boost and not inst.broken then
	inst.boost = false 	 
	inst:RemoveComponent("spellcaster")
	Upgradedamage(inst)	
	inst.axe = true
	inst.pick = false
	inst:RemoveTag("phoenix_pickaxe")
	inst.components.weapon:SetRange(0)


	--local fx = SpawnPrefab("small_puff")
	--local pos = Vector3(inst.Transform:GetWorldPosition())
	--fx.Transform:SetPosition(pos:Get())
 inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") 

    owner.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe", "phoenixaxe")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 

        inst.components.useableitem:StopUsingItem()
end
end

local function fn(Sim)
	local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	
    MakeInventoryPhysics(inst)
 	
    inst.AnimState:SetBank("mushasword4")
    inst.AnimState:SetBuild("mushasword4")
    inst.AnimState:PlayAnimation("idle")
    
		inst:AddTag("sharp")
        inst:AddTag("metal")
		inst:AddTag("phoenix_axe")
		
    inst:AddComponent("weapon")
	inst.components.weapon:SetRange(0)
    inst.components.weapon:SetDamage(90)
    inst.components.weapon:SetOnAttack(Upgradedamage)

      inst.components.weapon:SetOnAttack(onattack_FRAME)
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mushasword4.xml"
    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "mushasword4.tex" )
	
	local player = GetPlayer()
	if SaveGameIndex:IsModeShipwrecked() or player:HasTag("dlc2") or player:HasTag("dlc") then
       inst:AddTag("waterproofer")
	end			

    --[[inst.entity:AddLight()
	inst.Light:SetRadius(.3)
    inst.Light:SetFalloff(.7)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(250/255,65/255,65/255)
	inst.Light:Enable(true)]]
    inst.OnLoad = OnLoad

	inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(1, 0.8, 0.65, 1)
    inst.components.talker.offset = Vector3(200,-250,0)

    inst.components.talker.symbol = "swap_object"

    inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(boost)
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

	inst:AddComponent("tool")
	inst.components.tool:SetAction(ACTIONS.CHOP)
	inst.components.tool:SetAction(ACTIONS.MINE)
	 
    inst:AddComponent("fueled")
    inst.components.fueled.fueltype = "CHEMICAL"
    inst.components.fueled:InitializeFuelLevel(30000000)
       inst.components.fueled:SetDepletedFn(OnDurability)
       inst.components.fueled.ontakefuelfn = TakeItem
       inst.components.fueled.accepting = true
		inst.components.fueled:StopConsuming()  
		
--inst.boost = false 
--inst.axe = true      
inst:AddTag("musha_items") 

	inst.level = 0
	levelexp(inst)
	inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

    return inst
end

return Prefab( "common/inventory/mushasword4", fn, assets) 
