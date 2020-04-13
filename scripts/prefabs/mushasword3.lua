local assets=
{
	Asset("ANIM", "anim/mushasword3.zip"),
	Asset("ANIM", "anim/swap_mushasword3.zip"),
    	Asset("ATLAS", "images/inventoryimages/mushasword3.xml"),
	Asset("IMAGE", "images/inventoryimages/mushasword3.tex"),
    Asset("ATLAS", "images/inventoryimages/mushasword2.xml"),
	Asset("IMAGE", "images/inventoryimages/mushasword2.tex"),
		--Asset("ANIM", "anim/swap_mushasword_boost.zip"),
	Asset("ANIM", "anim/swap_mushasword2_boost.zip"),
	Asset("ANIM", "anim/swap_mushasword3_boost.zip"),
}

---------------------------
local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level <= 4000 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."III- \n[Grow Points]".. (inst.level))
end
if inst.level >=0 and inst.level <800 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."III- \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/800")
inst.level1 = true
elseif inst.level >=800 and inst.level <1600 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."III- \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/1600")
inst.level2 = true
inst.level1 = false
elseif inst.level >=1600 and inst.level <2400 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."III- \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/2400")
inst.level3 = true
inst.level1 = false
inst.level2 = false
elseif inst.level >=2400 and inst.level <4000 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."III- \n"..STRINGS.MUSHA_ITEM_GROWPOINTS.."\n".. (inst.level).."/4000")
inst.level4 = true
inst.level1 = false
inst.level2 = false
inst.level3 = false
elseif inst.level >=4000 then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."III- \n[MAX]")
inst.level5 = true
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
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
	if inst.task then inst.task:Cancel() inst.task = nil end
end

local function Upgradedamage(inst)
if inst.components.fueled:IsEmpty() then
inst.broken = true 
   inst.components.weapon:SetDamage(1)
	inst.components.talker:Say(STRINGS.MUSHA_WEAPON_BROKEN.." \n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (1)")
end
if inst.broken then
   inst.components.weapon:SetDamage(1)
 	if not inst.DLC2 then
	inst.components.equippable.walkspeedmult = 1.0
	end
	inst.components.talker:Say(STRINGS.MUSHA_WEAPON_BROKEN.." \n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (1)")
   end
if not inst.broken then
   	if not inst.DLC2 then
		if inst.level1 then
    inst.components.weapon:SetDamage(58)
  inst.components.equippable.walkspeedmult = 1.02
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ III (LV1)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (58)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(5C)\n"..STRINGS.MUSHA_ITEM_SPEED.."(2)")
        elseif inst.level2 then
    inst.components.weapon:SetDamage(60)
  inst.components.equippable.walkspeedmult = 1.05
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ III (LV2)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (60)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(8C)\n"..STRINGS.MUSHA_ITEM_SPEED.."(5)")
        elseif inst.level3 then
    inst.components.weapon:SetDamage(62)
   inst.components.equippable.walkspeedmult = 1.1
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ III (LV3)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (62)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(12C)\n"..STRINGS.MUSHA_ITEM_SPEED.."(10)")
        elseif inst.level4 then
    inst.components.weapon:SetDamage(64)
  inst.components.equippable.walkspeedmult = 1.15
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ III (LV4)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (64)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(16C)\n"..STRINGS.MUSHA_ITEM_SPEED.."(15)")
        elseif inst.level5 then
    inst.components.weapon:SetDamage(66)
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ III (LV5)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (66)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(20C)\n"..STRINGS.MUSHA_ITEM_SPEED.."(20)")
  inst.components.equippable.walkspeedmult = 1.2
end
	  	elseif inst.DLC2 then
		inst.components.equippable.walkspeedmult = 0.1
		if inst.level1 then
    inst.components.weapon:SetDamage(58)
 
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ III (LV1)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (58)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(5C)\n"..STRINGS.MUSHA_ITEM_SPEED.."(10)")
        elseif inst.level2 then
    inst.components.weapon:SetDamage(60)
  
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ III (LV2)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (60)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(8C)\n"..STRINGS.MUSHA_ITEM_SPEED.."(10)")
        elseif inst.level3 then
    inst.components.weapon:SetDamage(62)
   
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ III (LV3)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (62)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(12C)\n"..STRINGS.MUSHA_ITEM_SPEED.."(10)")
        elseif inst.level4 then
    inst.components.weapon:SetDamage(64)
  
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ III (LV4)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (64)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(16C)\n"..STRINGS.MUSHA_ITEM_SPEED.."(10)")
        elseif inst.level5 then
    inst.components.weapon:SetDamage(66)
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[ III (LV5)]\n"..STRINGS.MUSHA_WEAPON_DAMAGE.." (66)\n"..STRINGS.MUSHA_WEAPON_FIRE.."(20C)\n"..STRINGS.MUSHA_ITEM_SPEED.."(10)")
  
end end
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
if caster.components.sanity.current >= 40 then

    local light = SpawnPrefab("lightning")
    local light2 = SpawnPrefab("stafflight")

    light.Transform:SetPosition(pos.x, pos.y, pos.z)
    light2.Transform:SetPosition(pos.x, pos.y, pos.z)

        --caster.components.sanity:DoDelta(-TUNING.SANITY_MEDLARGE)
        caster.components.sanity:DoDelta(-TUNING.SANITY_HUGE)

    elseif caster.components.sanity.current < 40 then
	player.components.talker:Say("not enough [Sanity]..")
    end

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
  	  elseif target and target.components.burnable and inst.level2 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance2 and not player:HasTag("framea") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-15)
  	  elseif target and target.components.burnable and inst.level3 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance3 and not player:HasTag("framea") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-20)
  	  elseif target and target.components.burnable and inst.level4 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance4 and not player:HasTag("framea") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-25)
  	  elseif target and target.components.burnable and inst.level5 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance5 and not player:HasTag("framea") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-30)
--power
  	  elseif target and target.components.burnable and inst.level1 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance1 and not player:HasTag("framea") and inst:HasTag("boost") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-20)
  	  elseif target and target.components.burnable and inst.level2 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance2 and not player:HasTag("framea") and inst:HasTag("boost") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-30)
  	  elseif target and target.components.burnable and inst.level3 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance3 and not player:HasTag("framea") and inst:HasTag("boost") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-40)
  	  elseif target and target.components.burnable and inst.level4 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance4 and not player:HasTag("framea") and inst:HasTag("boost") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-50)
  	  elseif target and target.components.burnable and inst.level5 and not target:HasTag("wall") and not target:HasTag("structure") and math.random() < framechance5 and not player:HasTag("framea") and inst:HasTag("boost") then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-60)

    elseif target.components.burnable and target.sg and not target.sg:HasStateTag("frozen") and not target:HasTag("wall") and not target:HasTag("structure") and player:HasTag("framea") and not player:HasTag("DLC") then
            target.sg:GoToState("hit")
        target.components.burnable:Ignite()
local fx = SpawnPrefab("statue_transition")
local pos = Vector3(target.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
        --attacker.components.sanity:DoDelta(-5)
		target.components.health:DoDelta(-20)
		player:RemoveTag("framea") 
    elseif target.components.burnable and target.sg and not target.sg:HasStateTag("frozen") and not target:HasTag("wall") and not target:HasTag("structure") and player:HasTag("framea") and player:HasTag("DLC") then
            target.sg:GoToState("hit")
        target.components.burnable:Ignite()
local fx = SpawnPrefab("groundpoundring_fx")
local pos = Vector3(target.Transform:GetWorldPosition())
	fx.Transform:SetScale(0.5, 0.5, 0.5)
	fx.Transform:SetPosition(pos:Get())
        --attacker.components.sanity:DoDelta(-5)
		target.components.health:DoDelta(-40)
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
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword2", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
		player:AddTag("phoenixblade") 

end
local function onunequip(inst, owner) 
    Upgradedamage(inst)
   inst:RemoveTag("talkf")
inst:RemoveTag("boost") 
	inst.Light:Enable(false)
       inst:RemoveComponent("spellcaster")
    if inst.task then inst.task:Cancel() inst.task = nil end
    if inst.sanity then inst.sanity:Cancel() inst.sanity = nil end
local player = GetPlayer()
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
		player:RemoveTag("phoenixblade") 
		player:RemoveTag("framea") 
end

local function sanity(inst, owner)
local player = GetPlayer()
if owner.components.health and owner.components.health:IsHurt() and not inst.broken  then
        owner.components.sanity:DoDelta(1,false)
end
end
local function consume(inst, owner)
if not inst.broken then
inst.components.fueled:DoDelta(-50000)
end
end

  local function boost(inst, data, owner, fname_override)
local player = GetPlayer()
        local owner = inst.components.inventoryitem.owner
if owner and inst.broken then
	inst:RemoveTag("boost") 
	player.components.talker:Say("Phoenix Blade is Broken !")
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."[]\n"..STRINGS.MUSHA_ITEM_DUR.." (0)")
	inst.Light:Enable(false)
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword2", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
        inst.components.useableitem:StopUsingItem()
end
----
if owner and not inst:HasTag("boost") and not inst.broken then
	inst:AddTag("boost")
	player.components.talker:Say("Power Blade !")
    inst.task = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
    inst.sanity = inst:DoPeriodicTask(10, function() sanity(inst, owner) end)
inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") 
  
        inst.entity:AddLight()
		local fx = SpawnPrefab("collapse_small")
	local pos = Vector3(inst.Transform:GetWorldPosition())
fx.Transform:SetPosition(pos:Get())

	inst.components.talker:Say("-[Power Blade III]\nDouble critical\nSanity regen\nLight on\nSummon Small Sun")
        inst.entity:AddLight()
	inst.Light:SetRadius(0.8)
    inst.Light:SetFalloff(0.5)
    inst.Light:SetIntensity(0.5)
    inst.Light:SetColour(180/255, 50/255, 50/255)
	inst.Light:Enable(true)

    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword3_boost", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 

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
    inst:AddTag("nopunch")

        inst.components.useableitem:StopUsingItem()

-----------
elseif owner and inst:HasTag("boost") and not inst.broken then
	inst:RemoveTag("boost") 
	player.components.talker:Say("Power off !")
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_BLADE_A.."III\nPower Off")
    inst:RemoveComponent("spellcaster")
    if inst.task then inst.task:Cancel() inst.task = nil end
    if inst.sanity then inst.sanity:Cancel() inst.sanity = nil end

	inst.Light:Enable(false)
		local fx = SpawnPrefab("small_puff")
	local pos = Vector3(inst.Transform:GetWorldPosition())
fx.Transform:SetPosition(pos:Get())
  inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")

    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword2", "swap_nightmaresword")
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
  
    inst.AnimState:SetBank("nightmaresword")
    inst.AnimState:SetBuild("mushasword3")
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
    	inst.components.inventoryitem.atlasname = "images/inventoryimages/mushasword3.xml"
     inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "blade_3.tex" )
  local player = GetPlayer()
if SaveGameIndex:IsModeShipwrecked() or player:HasTag("dlc2") then
         inst.DLC2 = true
		end			
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
	MakeInventoryFloatable(inst, "idle_water", "idle")	end 
   inst:AddTag("light")

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
 	if inst.DLC2 then
  inst.components.equippable.walkspeedmult = 0.10
  end
	inst.entity:AddLight()
	inst.Light:SetRadius(0.8)
    inst.Light:SetFalloff(0.5)
    inst.Light:SetIntensity(0.5)
    inst.Light:SetColour(200/255, 60/255, 60/255)
	inst.Light:Enable(true)
    inst.OnLoad = OnLoad

        inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
        inst.components.fueled:InitializeFuelLevel(20000000)
       inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
inst.components.fueled:StopConsuming()
inst:RemoveTag("boost") 
       inst:RemoveComponent("spellcaster")
	   inst:AddTag("musha_items") 
	inst.level = 0
	levelexp(inst)
inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

    return inst
end

return Prefab( "common/inventory/mushasword3", fn, assets) 
