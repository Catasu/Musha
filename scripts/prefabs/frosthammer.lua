local assets=
{
	Asset("ANIM", "anim/frosthammer.zip"),
	Asset("ANIM", "anim/swap_frosthammer.zip"),
	Asset("ANIM", "anim/swap_frosthammer2.zip"),
	Asset("ATLAS", "images/inventoryimages/frosthammer.xml"),
	Asset("IMAGE", "images/inventoryimages/frosthammer.tex"),
}

local prefabs =
{
    "icespikes_fx_1",
    "icespikes_fx_2",
    "icespikes_fx_3",
    "icespikes_fx_4",
}
---------------------------
local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level >= 4005 then
--inst.components.talker:Say("[ Frost Hammer ]-\n[Grow Points]".. (inst.level))
end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/10")
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/30")
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/50")
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/70")
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/90")
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/120")
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/150")
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/180")
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/210")
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/250")
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/350")
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/450")
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/550")
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/650")
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/750")
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/850")
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/950")
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/1050")
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/1200")
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/1400")
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/1600")
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/1800")
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/2000")
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/2200")
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/2400")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/2600")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/2800")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/3000")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("[ Frost Hammer ] \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/4000")
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("[ Frost Hammer ] \n[MAX]")
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


local function Upgradedamage(inst, data)
if inst.components.fueled:IsEmpty() then
inst.broken = true
elseif not inst.components.fueled:IsEmpty() then
inst.broken = false
end
if inst.broken then
   inst.components.weapon:SetDamage(1)
	inst.components.talker:Say("-Broken Frost Hammer \nDamage (1)")
  
elseif not inst.broken then

 if inst.level >=0 and inst.level <10 then
    inst.components.weapon:SetDamage(75)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV1)\nDamage (75)")
 elseif inst.level >=10 and inst.level <30 then
    inst.components.weapon:SetDamage(77)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV2)\nDamage (77)")
 elseif inst.level >=30 and inst.level <50 then
    inst.components.weapon:SetDamage(79)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV3)\nDamage (79)")
 elseif inst.level >=50 and inst.level <70 then
    inst.components.weapon:SetDamage(81)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV4)\nDamage (81)")
 elseif inst.level >=70 and inst.level <90 then
    inst.components.weapon:SetDamage(83)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV5)\nDamage (83)")
 elseif inst.level >=90 and inst.level <120 then
    inst.components.weapon:SetDamage(85)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV6)\nDamage (85)")
 elseif inst.level >=120 and inst.level <150 then
    inst.components.weapon:SetDamage(87)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV7)\nDamage (87)")
elseif inst.level >=150 and inst.level <180 then
    inst.components.weapon:SetDamage(89)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV8)\nDamage (89)")
elseif inst.level >=180 and inst.level <210 then
    inst.components.weapon:SetDamage(91)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV9)\nDamage (91)")
elseif inst.level >=210 and inst.level <250 then
    inst.components.weapon:SetDamage(93)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV10)\nDamage (93)")
elseif inst.level >=250 and inst.level <350 then
    inst.components.weapon:SetDamage(95)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV11)\nDamage (95)")
elseif inst.level >=350 and inst.level <450 then
    inst.components.weapon:SetDamage(97)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV12)\nDamage (97)")
elseif inst.level >=450 and inst.level <550 then
    inst.components.weapon:SetDamage(99)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV13)\nDamage (99)")
elseif inst.level >=550 and inst.level <650 then
    inst.components.weapon:SetDamage(101)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV14)\nDamage (101)")
elseif inst.level >=650 and inst.level <750 then
    inst.components.weapon:SetDamage(103)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV15)\nDamage (103)")
elseif inst.level >=750 and inst.level <850 then
    inst.components.weapon:SetDamage(105)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV16)\nDamage (105)")
elseif inst.level >=850 and inst.level <950 then
    inst.components.weapon:SetDamage(107)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV17)\nDamage (107)")
elseif inst.level >=950 and inst.level <1050 then
    inst.components.weapon:SetDamage(109)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV18)\nDamage (109)")
elseif inst.level >=1050 and inst.level <1200 then
    inst.components.weapon:SetDamage(111)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV19)\nDamage (111)")
elseif inst.level >=1200 and inst.level <1400 then
    inst.components.weapon:SetDamage(113)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV20)\nDamage (113)")
elseif inst.level >=1400 and inst.level <1600 then
    inst.components.weapon:SetDamage(115)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV21)\nDamage (115)")
elseif inst.level >=1600 and inst.level <1800 then
    inst.components.weapon:SetDamage(117)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV22)\nDamage (117)")
elseif inst.level >=1800 and inst.level <2000 then
    inst.components.weapon:SetDamage(119)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV23)\nDamage (119)")
elseif inst.level >=2000 and inst.level <2200 then
    inst.components.weapon:SetDamage(121)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV24)\nDamage (121)")
elseif inst.level >=2200 and inst.level <2400 then
    inst.components.weapon:SetDamage(123)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV25)\nDamage (123)")
elseif inst.level >=2400 and inst.level <2600 then
    inst.components.weapon:SetDamage(125)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV26)\nDamage (125)")
elseif inst.level >=2600 and inst.level <2800 then
    inst.components.weapon:SetDamage(127)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV27)\nDamage (127)")
elseif inst.level >=2800 and inst.level <3000 then
    inst.components.weapon:SetDamage(129)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV28)\nDamage (129)")
elseif inst.level >=3000 and inst.level <4000 then
    inst.components.weapon:SetDamage(131)
	inst.components.talker:Say("[ Frost Hammer ]\n(LV29)\nDamage (131)")
elseif inst.level >=4000 then
    inst.components.weapon:SetDamage(133)
	inst.components.talker:Say("[ Frost Hammer ]\n(Max30)\nDamage (133)")
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
	inst.components.talker:Say("[ Frost Hammer ]\nLucky Points ! +(2)\n[Grow Points]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("[ Frost Hammer ]\nLucky Points ! +(5)\n[Grow Points]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("[ Frost Hammer ]\nLucky Points ! +(8)\n[Grow Points]".. (inst.level))
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
	inst.components.talker:Say("[ Forge -Lucky Points x5]\n+(10)\n[Grow Points]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 25
	levelexp(inst)
	inst.components.talker:Say("[ Forge -Lucky Points x5]\n+(25)\n[Grow Points]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 40
	levelexp(inst)
	inst.components.talker:Say("[ Forge -Lucky Points x5]\n+(40)\n[Grow Points]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("[ Forge -Lucky Points x5]\n+(5)\n[Grow Points]".. (inst.level))
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

--------
local function yellow_reticuletargetfn()
    return Vector3(ThePlayer.entity:LocalToWorldSpace(5, 0, 0))
end

local function cansummon(staff, caster, target, pos)
    local ground = GetWorld()
    if ground and pos then
        local tile = ground.Map:GetTileAtPoint(pos.x, pos.y, pos.z)
        return tile ~= GROUND.IMPASSIBLE and tile < GROUND.UNDERGROUND
    end
    return false
end

local function summoning(staff, target, pos)
local player = GetPlayer()
    local caster = staff.components.inventoryitem.owner
	if caster.components.sanity.current >= 40 and caster.components.leader:CountFollowers("frost_tentacle") < 8 then
    local light = SpawnPrefab("splash")
    local light2 = SpawnPrefab("tentacle_frost")
	local fail1 = SpawnPrefab("statue_transition")
    local fail2 = SpawnPrefab("statue_transition_2")
    fail1.Transform:SetPosition(pos.x, pos.y, pos.z)
    fail2.Transform:SetPosition(pos.x, pos.y, pos.z)
    light.Transform:SetPosition(pos.x, pos.y, pos.z)
    light2.Transform:SetPosition(pos.x, pos.y, pos.z)
    light2.components.follower:SetLeader(caster)
	caster.components.sanity:DoDelta(-25)

    elseif caster.components.sanity.current < 40 then
    local fail1 = SpawnPrefab("small_puff")
    fail1.Transform:SetPosition(pos.x, pos.y, pos.z)
	caster.components.talker:Say("Musha can't do it right now.")
	
	elseif caster.components.leader:CountFollowers("frost_tentacle") >= 8 then
	local fail1 = SpawnPrefab("small_puff")
    fail1.Transform:SetPosition(pos.x, pos.y, pos.z)
	caster.components.talker:Say("Musha can't do it right now.\n[Frost Tentacle]:Limited summoned")
	
    end

end

local function frosta_hammer(inst, owner)
local player = GetPlayer()
local weapon = player.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
if weapon and player:HasTag("frosta") and player.frosthammer2 then
 	player.AnimState:OverrideSymbol("swap_object", "swap_frosthammer2", "frosthammer")
    player.AnimState:Show("ARM_carry") 
    player.AnimState:Hide("ARM_normal") 
elseif weapon and not player:HasTag("frosta") and player.frosthammer2 then
	player.AnimState:OverrideSymbol("swap_object", "swap_frosthammer", "frosthammer")
    player.AnimState:Show("ARM_carry") 
    player.AnimState:Hide("ARM_normal") 
end
	end
	
local function SpawnIceFx(inst, target)
    if not inst or not target then return end
    local numFX = math.random(3,5)
    local pos = target:GetPosition()
    local targetPos = target:GetPosition()
    local vec = targetPos - pos
    vec = vec:Normalize()
    local dist = pos:Dist(targetPos)
    local angle = inst:GetAngleToPoint(targetPos:Get())

    for i = 1, numFX do
        inst:DoTaskInTime(math.random() * 0.1, function(inst)
            local prefab = "icespikes_fx_"..math.random(1,4)
            local fx = SpawnPrefab(prefab)
            if fx then
                local x = GetRandomWithVariance(0, 1)
                local z = GetRandomWithVariance(0, 1)
                local offset = (vec * math.random(dist * 0.1, dist)) + Vector3(x,0,z)
                fx.Transform:SetPosition((offset+pos):Get())
            end
        end)
    end
end	

local function onattack_FROST(inst, attacker, target)
local freezechance1 = 0.4
local freezechance2 = 0.5
local freezechance3 = 0.6

local player = GetPlayer()

local expchance = 0.05
local damagedur1 = 0.2
local damagedur2 = 0.5
local damagedur3 = 0.7
local damagedur4 = 1

if inst.boost then
local fx = SpawnPrefab("groundpoundring_fx")
local fx2 = SpawnPrefab("groundpoundring_fx")
local pos = Vector3(target.Transform:GetWorldPosition())
	fx.Transform:SetScale(0.3, 0.3, 0.3)
	fx2.Transform:SetScale(0.45, 0.45, 0.45)
	fx.Transform:SetPosition(pos:Get())
	inst:DoTaskInTime(0.2, function() fx2.Transform:SetPosition(pos:Get()) end)
	
elseif not inst.boost then
local fx = SpawnPrefab("groundpoundring_fx")
local fx2 = SpawnPrefab("groundpoundring_fx")
local pos = Vector3(target.Transform:GetWorldPosition())
	fx.Transform:SetScale(0.45, 0.45, 0.45)
	fx2.Transform:SetScale(0.6, 0.6, 0.6)
	fx.Transform:SetPosition(pos:Get())
	inst:DoTaskInTime(0.2, function() fx2.Transform:SetPosition(pos:Get()) end)

end
 
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
	
    if target.components.freezable then
		if not inst.power then
		target.components.freezable:AddColdness(0.15)
        target.components.freezable:SpawnShatterFX()
		elseif inst.power then
        target.components.freezable:AddColdness(1.65)
        target.components.freezable:SpawnShatterFX()
		SpawnIceFx(inst, attacker.components.combat.target)
		inst.power = false
		local prefab = "icespikes_fx_"..math.random(1,4)
		local fx = SpawnPrefab(prefab)
		fx.Transform:SetScale(1.0, 2, 1.0)
		fx.Transform:SetPosition(target:GetPosition():Get())	
		end
	end	

	if inst.boost then
	if math.random() < freezechance1 and target.components.freezable and inst.level <250 then
        target.components.freezable:AddColdness(0.7)
       	local prefab = "icespikes_fx_"..math.random(1,4)
		local fx = SpawnPrefab(prefab)
		fx.Transform:SetScale(1, 1.2, 1)
		fx.Transform:SetPosition(target:GetPosition():Get())	
		--target.components.health:DoDelta(-10)
		if target.components.locomotor and target.components.health and not target.components.health:IsDead() and not target:HasTag("shadowcreature") and not target:HasTag("structure") and not target:HasTag("slow_frozen") then
		target:AddTag("slow_frozen")
		local frozen = SpawnPrefab("debuff_frozen")
		frozen.Transform:SetPosition(target:GetPosition():Get())
		frozen.Transform:SetScale(0.5,0.8,0.5)
		if frozen and target:HasTag("slow_frozen") then
		local follower = frozen.entity:AddFollower()
		follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
	GetWorld():DoTaskInTime(4, function() target.components.locomotor.groundspeedmultiplier = 1 target:RemoveTag("slow_frozen") frozen:Remove() end)
		end
	elseif math.random() < freezechance2 and target.components.freezable and inst.level >=250 and inst.level <1400 then
        target.components.freezable:AddColdness(0.8)
        local prefab = "icespikes_fx_"..math.random(1,4)
		local fx = SpawnPrefab(prefab)
		fx.Transform:SetScale(1, 1.35, 1)
		fx.Transform:SetPosition(target:GetPosition():Get())
		--target.components.health:DoDelta(-20)
		if target.components.locomotor and target.components.health and not target.components.health:IsDead() and not target:HasTag("shadowcreature") and not target:HasTag("structure") and not target:HasTag("slow_frozen") then
		target:AddTag("slow_frozen")
		local frozen = SpawnPrefab("debuff_frozen")
		frozen.Transform:SetPosition(target:GetPosition():Get())
		frozen.Transform:SetScale(0.5,0.8,0.5)
		if frozen and target:HasTag("slow_frozen") then
		local follower = frozen.entity:AddFollower()
		follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
	GetWorld():DoTaskInTime(4, function() target.components.locomotor.groundspeedmultiplier = 1 target:RemoveTag("slow_frozen") frozen:Remove() end)
		end
	elseif math.random() < freezechance3 and target.components.freezable and inst.level >=1400 then
        target.components.freezable:AddColdness(0.9)
        local prefab = "icespikes_fx_"..math.random(1,4)
		local fx = SpawnPrefab(prefab)
		fx.Transform:SetScale(1, 1.5, 1)
		fx.Transform:SetPosition(target:GetPosition():Get())	
		--target.components.health:DoDelta(-30)	
		if target.components.locomotor and target.components.health and not target.components.health:IsDead() and not target:HasTag("shadowcreature") and not target:HasTag("structure") and not target:HasTag("slow_frozen") then
		target:AddTag("slow_frozen")
		local frozen = SpawnPrefab("debuff_frozen")
		frozen.Transform:SetPosition(target:GetPosition():Get())
		frozen.Transform:SetScale(0.5,0.8,0.5)
		if frozen and target:HasTag("slow_frozen") then
		local follower = frozen.entity:AddFollower()
		follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
	GetWorld():DoTaskInTime(4, function() target.components.locomotor.groundspeedmultiplier = 1 target:RemoveTag("slow_frozen") frozen:Remove() end)
		end		
	end
	end
	
 	local player = GetPlayer()
		if target and player:HasTag("frosta") and not (player:HasTag("lightningblue1") and player:HasTag("lightningblue2")) then
		if target.components.freezable then
		target.components.freezable:AddColdness(1.25)
		--target.components.freezable:SpawnShatterFX()
		SpawnIceFx(inst, attacker.components.combat.target)
			end
        --attacker.components.sanity:DoDelta(-5)
		--target.components.health:DoDelta(-30)
		player:RemoveTag("frosta")
		end
	
	if player:HasTag("frosta") then
	player:RemoveTag("frosta") 
	end
	
	if target.components.sleeper and target.components.sleeper:IsAsleep() then
        target.components.sleeper:WakeUp()
    end
    if target.components.burnable and target.components.burnable:IsBurning() then
        target.components.burnable:Extinguish()
    end
    if target.components.combat and not target:HasTag("companion") then
        target.components.combat:SuggestTarget(attacker)
    end
	
	frosta_hammer(inst)
	
end

local function sanity_cost(inst, owner)
    if owner.components.sanity and inst.cost_on then
		inst.power = true
		if not inst.winter then
        owner.components.sanity:DoDelta(-1,false)
		end
		inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
		owner.AnimState:OverrideSymbol("swap_object", "swap_frosthammer2", "frosthammer")
		owner.AnimState:Show("ARM_carry") 
		owner.AnimState:Hide("ARM_normal")
    end
end

 local function Release_Frost(inst,owner, data)
 inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
	inst.boost = false
	if GetSeasonManager():IsWinter() then
		inst.winter = true
	if inst.level >=0 and inst.level <10 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (75)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=10 and inst.level <30 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (77)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=30 and inst.level <50 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (79)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=50 and inst.level <70 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (81)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=70 and inst.level <90 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (83)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=90 and inst.level <120 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (85)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=120 and inst.level <150 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (87)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=150 and inst.level <180 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (89)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=180 and inst.level <210 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (91)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=210 and inst.level <250 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (93)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=250 and inst.level <350 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (95)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=350 and inst.level <450 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (97)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=450 and inst.level <550 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (99)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=550 and inst.level <650 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (101)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=650 and inst.level <750 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (103)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=750 and inst.level <850 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (105)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=850 and inst.level <950 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (107)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=950 and inst.level <1050 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (109)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=1050 and inst.level <1200 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (111)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=1200 and inst.level <1400 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (113)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=1400 and inst.level <1600 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (115)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=1600 and inst.level <1800 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (117)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=1800 and inst.level <2000 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (119)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=2000 and inst.level <2200 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (121)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=2200 and inst.level <2400 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (123)\nArea Attack\nFrozen Shard\nWinter(no-Cost)")
elseif inst.level >=2400 and inst.level <2600 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (125)\nArea Attack\nFrozen Shard\nFrozen Tentacle\nWinter(no-Cost)")
elseif inst.level >=2600 and inst.level <2800 then
 	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (127)\nArea Attack\nFrozen Shard\nFrozen Tentacle\nWinter(no-Cost)")
elseif inst.level >=2800 and inst.level <3000 then
 	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (129)\nArea Attack\nFrozen Shard\nFrozen Tentacle\nWinter(no-Cost)")
elseif inst.level >=3000 and inst.level <4000 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (131)\nArea Attack\nFrozen Shard\nFrozen Tentacle\nWinter(no-Cost)")
elseif inst.level >=4000 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (133)\nArea Attack\nFrozen Shard\nFrozen Tentacle\nWinter(no-Cost)")
end	
	else	
		inst.winter = false
	if inst.level >=0 and inst.level <10 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (75)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=10 and inst.level <30 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (77)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=30 and inst.level <50 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (79)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=50 and inst.level <70 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (81)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=70 and inst.level <90 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (83)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=90 and inst.level <120 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (85)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=120 and inst.level <150 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (87)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=150 and inst.level <180 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (89)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=180 and inst.level <210 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (91)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=210 and inst.level <250 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (93)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=250 and inst.level <350 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (95)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=350 and inst.level <450 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (97)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=450 and inst.level <550 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (99)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=550 and inst.level <650 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (101)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=650 and inst.level <750 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (103)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=750 and inst.level <850 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (105)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=850 and inst.level <950 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (107)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=950 and inst.level <1050 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (109)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=1050 and inst.level <1200 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (111)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=1200 and inst.level <1400 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (113)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=1400 and inst.level <1600 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (115)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=1600 and inst.level <1800 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (117)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=1800 and inst.level <2000 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (119)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=2000 and inst.level <2200 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (121)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=2200 and inst.level <2400 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (123)\nArea Attack\nFrozen Shard\nCooler (Cost)")
elseif inst.level >=2400 and inst.level <2600 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (125)\nArea Attack\nFrozen Shard\nFrozen Tentacle\nCooler (Cost)")
elseif inst.level >=2600 and inst.level <2800 then
 	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (127)\nArea Attack\nFrozen Shard\nFrozen Tentacle\nCooler (Cost)")
elseif inst.level >=2800 and inst.level <3000 then
 	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (129)\nArea Attack\nFrozen Shard\nFrozen Tentacle\nCooler (Cost)")
elseif inst.level >=3000 and inst.level <4000 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (131)\nArea Attack\nFrozen Shard\nFrozen Tentacle\nCooler (Cost)")
elseif inst.level >=4000 then
	inst.components.talker:Say("[ Release Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (133)\nArea Attack\nFrozen Shard\nFrozen Tentacle\nCooler (Cost)")
end

if not inst.components.heater then
	inst:AddComponent("heater")
    inst.components.heater.iscooler = true
    inst.components.heater.equippedheat = -2
	end
end
	if inst.level >=2200 then --level10
		if not inst.components.spellcaster then
    inst:AddComponent("spellcaster")
    inst.components.spellcaster:SetSpellFn(summoning)
    inst.components.spellcaster.canuseonpoint = true
		end
		if not inst.components.reticule then
	inst:AddComponent("reticule")
    inst.components.reticule.targetfn = yellow_reticuletargetfn
    inst.components.reticule.ease = true
		end
	end

end
	 
local function Preserved_Frost(inst, data)
	inst.power = false
	inst.boost = true
	--inst.components.talker:Say("-[Preserved Frost]\nFreeze Hit")
	if inst.components.heater then
	inst:RemoveComponent("heater")
	end
	inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
	if inst.components.reticule then
	inst:RemoveComponent("reticule")
	end
	if inst.components.spellcaster then
    inst:RemoveComponent("spellcaster")
 	end
end	
	  
 local function OnOpen(inst)
	if inst.boost then
	local player = GetPlayer()
	if player.berserk then
	player.components.combat:SetAreaDamage(4, .5)
	else
	player.components.combat:SetAreaDamage(2, .5)
	end
	
   inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
	Release_Frost(inst)
	inst.boost = false
	inst.cost_on = true

	inst.components.useableitem:StopUsingItem()

	elseif not inst.boost then
	local player = GetPlayer()
	if player.berserk then
	player.components.combat:SetAreaDamage(2.5, .5)
	else
	player.components.combat:SetAreaDamage(0, 0)
	end
	inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")

	inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
	if inst.level >=0 and inst.level <10 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (75)\nFrost(40C)\n(Freeze n Slow)")
elseif inst.level >=10 and inst.level <30 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (77)\nFrost(40C)\n(Freeze n Slow)")
elseif inst.level >=30 and inst.level <50 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (79)\nFrost(40C)\n(Freeze n Slow)")
elseif inst.level >=50 and inst.level <70 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (81)\nFrost(40C)\n(Freeze n Slow)")
elseif inst.level >=70 and inst.level <90 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (83)\nFrost(40C)\n(Freeze n Slow)")
elseif inst.level >=90 and inst.level <120 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (85)\nFrost(40C)\n(Freeze n Slow)")
elseif inst.level >=120 and inst.level <150 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (87)\nFrost(40C)\n(Freeze n Slow)")
elseif inst.level >=150 and inst.level <180 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (89)\nFrost(40C)\n(Freeze n Slow)")
elseif inst.level >=180 and inst.level <210 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (91)\nFrost(40C)\n(Freeze n Slow)")
elseif inst.level >=210 and inst.level <250 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (93)\nFrost(50C)\n(Freeze n Slow)")
elseif inst.level >=250 and inst.level <350 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (95)\nFrost(50C)\n(Freeze n Slow)")
elseif inst.level >=350 and inst.level <450 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (97)\nFrost(50C)\n(Freeze n Slow)")
elseif inst.level >=450 and inst.level <550 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (99)\nFrost(50C)\n(Freeze n Slow)")
elseif inst.level >=550 and inst.level <650 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (101)\nFrost(50C)\n(Freeze n Slow)")
elseif inst.level >=650 and inst.level <750 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (103)\nFrost(50C)\n(Freeze n Slow)")
elseif inst.level >=750 and inst.level <850 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (105)\nFrost(50C)\n(Freeze n Slow)")
elseif inst.level >=850 and inst.level <950 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (107)\nFrost(50C)\n(Freeze n Slow)")
elseif inst.level >=950 and inst.level <1050 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (109)\nFrost(50C)\n(Freeze n Slow)")
elseif inst.level >=1050 and inst.level <1200 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (111)\nFrost(50C)\n(Freeze n Slow)")
elseif inst.level >=1200 and inst.level <1400 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (113)\nFrost(60C)\n(Freeze n Slow)")
elseif inst.level >=1400 and inst.level <1600 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (115)\nFrost(60C)\n(Freeze n Slow)")
elseif inst.level >=1600 and inst.level <1800 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (117)\nFrost(60C)\n(Freeze n Slow)")
elseif inst.level >=1800 and inst.level <2000 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (119)\nFrost(60C)\n(Freeze n Slow)")
elseif inst.level >=2000 and inst.level <2200 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (121)\nFrost(60C)\n(Freeze n Slow)")
elseif inst.level >=2200 and inst.level <2400 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (123)\nFrost(60C)\n(Freeze n Slow)")
elseif inst.level >=2400 and inst.level <2600 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (125)\nFrost(60C)\n(Freeze n Slow)")
elseif inst.level >=2600 and inst.level <2800 then
 	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (127)\nFrost(60C)\n(Freeze n Slow)")
elseif inst.level >=2800 and inst.level <3000 then
 	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (129)\nFrost(60C)\n(Freeze n Slow)")
elseif inst.level >=3000 and inst.level <4000 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (131)\nFrost(60C)\n(Freeze n Slow)")
elseif inst.level >=4000 then
	inst.components.talker:Say("[ Preserved Frost ]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (133)\nFrost(60C)\n(Freeze n Slow)")
end

	--Upgradedamage(inst)
	Preserved_Frost(inst)
	inst.boost = true
	inst.cost_on = false
	local owner = inst.components.inventoryitem.owner
	owner.AnimState:OverrideSymbol("swap_object", "swap_frosthammer", "frosthammer")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal")
	inst.components.useableitem:StopUsingItem()
	
	end 
end		
local function OnClose(inst) 
  inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
	Preserved_Frost(inst)
	inst.boost = true
	inst.cost_on = false
    end

local function OnDropped(inst,data)
   inst:AddTag("talkf")
    end
local function OnPutInInventory(inst)
   inst:RemoveTag("talkf")
    end

local function onequip(inst, owner) 
inst.boost = true
local player = GetPlayer()
   inst:AddTag("talkf")
 owner.frost = true
 owner.frosthammer2 = true
 owner:AddTag("frosthammer")
    Upgradedamage(inst)
   inst.task2 = inst:DoPeriodicTask(3, function() sanity_cost(inst, owner) end)
	owner.AnimState:OverrideSymbol("swap_object", "swap_frosthammer", "frosthammer")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end

local function onunequip(inst, owner) 
inst.boost = true
inst.power = false
	if owner.berserk then
	owner.components.combat:SetAreaDamage(2.5, .5)
	else
	owner.components.combat:SetAreaDamage(0, 0)
	end
owner.frost = false
owner.frosthammer2 = false
inst.cost_on = false
 if inst.task2 then inst.task2:Cancel() inst.task2 = nil end
   inst:RemoveTag("talkf")
	owner:RemoveTag("frosthammer") 
	owner:RemoveTag("frosta") 
	if inst.components.heater then
	inst:RemoveComponent("heater")
	end
	inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
	if inst.components.reticule then
	inst:RemoveComponent("reticule")
	end
	if inst.components.spellcaster then
    inst:RemoveComponent("spellcaster")
 	end
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 

 end
  
local function fn(Sim)

	local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("frosthammer")
    inst.AnimState:SetBuild("frosthammer")
    inst.AnimState:PlayAnimation("idle")
	
  local player = GetPlayer()
if SaveGameIndex:IsModeShipwrecked() or player:HasTag("dlc2") or player:HasTag("dlc") then
         inst.DLC2 = true
		 inst:AddTag("waterproofer")
		end		
		
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
	MakeInventoryFloatable(inst, "idle_water", "idle")	
	end  
	
    inst:AddComponent("weapon")
    inst.components.weapon:SetOnAttack(Upgradedamage)

    inst.components.weapon:SetRange(1.6)
	
  inst.components.weapon:SetOnAttack(onattack_FROST)
  

    inst.OnLoad = OnLoad

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
    inst.components.talker.offset = Vector3(200,-250,0)
    inst.components.talker.symbol = "swap_object"

    -----
    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.HAMMER)
    -------
    -------
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
    	inst.components.inventoryitem.atlasname = "images/inventoryimages/frosthammer.xml"
     inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "frosthammer.tex" )
   ---------------------  
        inst:AddTag("metal")
		inst:AddTag("musha_items") 
		inst:AddTag("frost_hammer") 

	inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
       inst.components.fueled:InitializeFuelLevel(30000000)
       inst.components.fueled:SetDepletedFn(OnDurability)
       inst.components.fueled.ontakefuelfn = TakeItem
       inst.components.fueled.accepting = true
	inst.components.fueled:StopConsuming()        
	inst.boost = true 
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnOpen)
	
	--[[if not inst.DLC2 then
	inst.components.equippable.walkspeedmult = 0.9
	elseif inst.DLC2 then
	inst.components.equippable.walkspeedmult = -0.1
	end]]

	inst.level = 0
Upgradedamage(inst)	
inst:ListenForEvent("levelup", levelexp)

	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

    return inst
end


return Prefab( "common/inventory/frosthammer", fn, assets, prefabs) 
