local assets=
{
	Asset("ANIM", "anim/hat_mprincess.zip"),
  Asset("ATLAS", "images/inventoryimages/hat_mprincess.xml"),
 -- Asset("IMAGE", "images/inventoryimages/hat_mprincess.tex")
}
--------------
local function healowner(inst, owner)
    if (owner.components.health and owner.components.health:IsHurt())
    and (owner.components.hunger and owner.components.hunger.current > 160 and owner.components.health:GetPercent() > 0.6)then
        owner.components.health:DoDelta(1,false)

    end
end
-----------

local function makeused2(inst)
	inst.AnimState:PlayAnimation("debris")
end

local function doresurrect2(inst, dude)
    dude.entity:AddLight()
	dude.Light:SetRadius(3)
    dude.Light:SetFalloff(10)
    dude.Light:SetIntensity(.5)
    dude.Light:SetColour(15/255,165/255,165/255)
	dude.Light:Enable(true)
 	inst:AddTag("busy")	
	inst.persists = false
    if inst.Physics then
		RemovePhysicsColliders(inst)
    end
    --dude:Hide()
    if dude.HUD then
        dude.HUD:Hide()
    end
    if dude.components.playercontroller then
        dude.components.playercontroller:Enable(false)
    end

    inst:RemoveComponent("inspectable")
    dude:ClearBufferedAction()
------
    scheduler:ExecuteInTime(2, function()
        dude:Show()
       -- inst:Hide()

inst.AnimState:PlayAnimation("debris")
-------
        dude.sg:GoToState("amulet_rebirth")
        dude:DoTaskInTime(4, function() 

            if dude.HUD then
                dude.HUD:Show()
            end
									
            if dude.components.health then
				dude.components.health:RecalculatePenalty()
                dude.components.health:Respawn(100)
                dude.components.health:SetInvincible(true)
            end
          if dude.components.sanity then
			    dude.components.sanity:SetPercent(.5)
            end
          if dude.components.hunger then
                dude.components.hunger:SetPercent(.5)
            end
		if dude:HasTag("DLC2") then
		if dude.components.poisonable then
			dude.components.poisonable:Cure(inst) end
			end
        if dude.components.playercontroller then
                dude.components.playercontroller:Enable(true)
            end
            inst:RemoveTag("busy")
            dude.components.health:SetInvincible(false)
	dude.Light:Enable(false)

 end)
	inst:Show()
dude.components.talker:Say(STRINGS.MUSHA_HAT_PRINCESS.."\n"..STRINGS.MUSHA_ITEM_RESURRECTION.."(On)")
 end)
	local dark2 = SpawnPrefab("statue_transition_2")
	local pos = Vector3(inst.Transform:GetWorldPosition())
dark2.Transform:SetPosition(pos:Get())
	local gdust = SpawnPrefab("glowdust")
gdust.Transform:SetPosition(pos:Get())
--SaveGameIndex:DeregisterResurrector(inst)
	inst:Remove()
            end
----------------
local function check_resurrect_on(inst)
local player = GetPlayer()
if GetWorld():IsCave() and inst.active_resurrect and not inst.in_cave then
if inst.components.resurrector then
	inst.components.resurrector.active = false
	inst:RemoveComponent("resurrector")  
	inst.in_cave = true end
elseif not GetWorld():IsCave() and player.components.health:IsDead() then
	inst:AddComponent("resurrector")  
    inst.components.resurrector.active = true
	inst.components.resurrector.doresurrect = doresurrect2
	inst.components.resurrector.makeusedfn = makeused2
	inst.active_resurrect = true
	inst.in_cave = false
end end

local function closee(inst)
local player = GetPlayer()
if GetWorld():IsCave() then
	inst.components.talker:Say(STRINGS.MUSHA_ITEM_RESURRECT_PENALTY..":"..STRINGS.MUSHA_ITEM_RESURRECTION.."(OFF)")
elseif not GetWorld():IsCave() then
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_PRINCESS.."]\n"..STRINGS.MUSHA_ITEM_RESURRECTION.."(ON)")
check_resurrect_on(inst)
 end end

local function farr(inst)
if GetWorld():IsCave() then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_RESURRECT_PENALTY..":"..STRINGS.MUSHA_ITEM_RESURRECTION.."(OFF)")
elseif not GetWorld():IsCave() then
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_PRINCESS.."]\n"..STRINGS.MUSHA_ITEM_RESURRECTION.."(ON)")

end end

local function OnPutInInventory(inst)
if not GetWorld():IsCave() then
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_PRINCESS.."]\n"..STRINGS.MUSHA_ITEM_RESURRECTION.."(ON)")
check_resurrect_on(inst)
elseif GetWorld():IsCave() then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_RESURRECT_PENALTY..":"..STRINGS.MUSHA_ITEM_RESURRECTION.."(OFF)")
end end 
	
local function OnDropped(inst,data)
if not GetWorld():IsCave() then
inst.components.talker:Say("["..STRINGS.MUSHA_HAT_PRINCESS.."]\n"..STRINGS.MUSHA_ITEM_RESURRECTION.."(ON)")
check_resurrect_on(inst)
elseif GetWorld():IsCave() then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_RESURRECT_PENALTY..":"..STRINGS.MUSHA_ITEM_RESURRECTION.."(OFF)")
end end
--------------
---------------------------------------
local function UpgradeArmor(inst, data)
if inst.components.fueled:IsEmpty() then
inst.broken = true
inst.healing1 = false
elseif not inst.components.fueled:IsEmpty() then
inst.broken = false
inst.broken = false
end
if inst.broken then
inst.components.fueled:StopConsuming()        
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
inst.components.talker:Say(STRINGS.MUSHA_HAT_BROKEN_C.."\n"..STRINGS.MUSHA_ARMOR.." (0)\n"..STRINGS.MUSHA_ITEM_DUR.." (0)")

  
elseif not inst.broken and not inst.shield then

inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.10)
inst.components.talker:Say(STRINGS.MUSHA_HAT_PRINCESS.."(Basic)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Tiny)\n"..STRINGS.MUSHA_ARMOR.."(10)")
 if not GetWorld():IsCave() then
inst.components.talker:Say(STRINGS.MUSHA_HAT_PRINCESS.."(Basic)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Tiny)\n"..STRINGS.MUSHA_ARMOR.."(10)\n"..STRINGS.MUSHA_ITEM_RESURRECTION.."(ON)")
elseif GetWorld():IsCave() then
inst.components.talker:Say(STRINGS.MUSHA_HAT_PRINCESS.."(Basic)\n"..STRINGS.MUSHA_ITEM_SANITY_REGEN.."(Tiny)\n"..STRINGS.MUSHA_ARMOR.."(10)\n"..STRINGS.MUSHA_ITEM_RESURRECT_PENALTY..": "..STRINGS.MUSHA_ITEM_RESURRECTION.."(OFF)")
end
end end

local function OnDurability(inst, data)
inst.broken = true
 	UpgradeArmor(inst)
	inst.components.fueled:StopConsuming()        
	if inst.consume then inst.consume:Cancel() inst.consume = nil end
 end
-------- --------
local function TakeItem(inst, item, data)
local expchance0 = 1
local expchance1 = 0.3
local expchance2 = 0.2
local expchance3 = 0.12
	inst.components.fueled:DoDelta(5000000)
	SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get())    
	if inst.broken then
	inst.broken = false 
end end
---------------------------------------shield on
local function consume(inst, owner)
if not inst.broken and inst.shield then
inst.components.fueled:DoDelta(-20000)
end
if inst.broken and inst.shield then
inst.components.fueled:DoDelta(0)
end
end

local function on_shield(inst, owner)
if inst.shield and not inst.broken then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_SHIELD.."\n"..STRINGS.MUSHA_ARMOR.."(100)")
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 1)
    inst.consume = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
	
	elseif inst.shield and inst.broken then
inst.components.talker:Say(STRINGS.MUSHA_ITEM_SHIELD_BROKEN.."\n"..STRINGS.MUSHA_ARMOR.."(0)")
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
     if inst.consume then inst.consume:Cancel() inst.consume = nil end
end end

local function off_shield(inst)
if inst.shield then
inst.shield = false
UpgradeArmor(inst)
   if inst.consume then inst.consume:Cancel() inst.consume = nil end
end end
--------------Shield hat
    local function stopusingshield(inst, data)
        local hat = inst.components.inventory and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if hat and not (data.statename == "hide_idle" or data.statename == "hide") then
		inst.shield = false
        hat.components.useableitem:StopUsingItem()
        end
    end
	--[[
local function OnPutInInventory(inst)
inst.healing1 = false
      UpgradeArmor(inst)
    end ]]
local function OnBlocked(owner) 
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour") 
	
	if owner.DLC or owner.DLC2 then
   	SpawnPrefab("green_leaves").Transform:SetPosition(owner:GetPosition():Get())	
	end
end		
    local function onequipcrown(inst, owner)
	   UpgradeArmor(inst)
	   	inst.components.fueled:StartConsuming() 
     owner.AnimState:OverrideSymbol("swap_hat", "hat_mprincess", "swap_hat")
     owner.AnimState:Show("HAT")
       owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
	
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY

 
    inst.expfn = function(attacked, data)
local expchance = 0.5
local damagedur1 = 0.2
local damagedur2 = 0.5
local damagedur3 = 0.7
local damagedur4 = 1

if not inst.shield then
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
end 
	end    

	   inst:ListenForEvent("attacked", inst.expfn, owner)
	inst:ListenForEvent("newstate", stopusingshield, owner) 
	inst:ListenForEvent("blocked", OnBlocked, owner)
	end

    local function onunequipcrown(inst, owner)
	inst.healing1 = false

	inst.components.fueled:StopConsuming()
        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

            owner.AnimState:Show("HEAD")
            owner.AnimState:Hide("HEAD_HAIR")
	inst.shield = false
		if inst.consume then inst.consume:Cancel() inst.consume = nil end
	    if inst.healowner then inst.healowner:Cancel() inst.healowner = nil end
		   
inst:RemoveEventCallback("attacked", inst.expfn, owner)
inst:RemoveEventCallback("newstate", stopusingshield, owner) 
inst:RemoveEventCallback("blocked", OnBlocked, owner)
    end
 
 local function onuseshield(inst)
 if not inst.broken then
	inst.shield = true
	on_shield(inst)
local owner = inst.components.inventoryitem.owner
        if owner then
            owner.sg:GoToState("hide")
owner.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
        end
		elseif inst.broken then
		
		end
    end

local function offuseshield(inst)
   if inst.consume then inst.consume:Cancel() inst.consume = nil end
	off_shield(inst)
	inst.healing1 = false
	end

	
---------------bushhat end

---------------hat fn sim
	
local function fn(Sim)
	local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	
    MakeInventoryPhysics(inst)
    
    inst:AddTag("hat")
    inst:AddTag("metal")
	inst:AddTag("hide")
	inst:AddTag("waterproofer")
	
    inst.AnimState:SetBank("bushhat")
    inst.AnimState:SetBuild("hat_mprincess")

    inst.AnimState:PlayAnimation("anim")    
	
   inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
     inst.components.talker.colour = Vector3(1, 0.8, 0.95, 1)
    inst.components.talker.offset = Vector3(0,-500,0)
    inst.components.talker.symbol = "swap_object"        
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hat_mprincess.xml"
	inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
	inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
		  local player = GetPlayer()
if SaveGameIndex:IsModeShipwrecked() or player:HasTag("dlc2") then
         inst.DLC2 = true
		end			
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
	MakeInventoryFloatable(inst, "idle_water", "anim")	end 
   inst:AddComponent("armor")
	inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.11)
        inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable.dapperness = TUNING.DAPPERNESS_SMALL


     --   inst:AddTag("hide")
        inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/bushhat"
  	   
   inst:AddComponent("useableitem")
       inst.components.useableitem:SetOnUseFn(onuseshield)
       inst.components.useableitem:SetOnStopUseFn(offuseshield)
       inst.components.equippable:SetOnEquip( onequipcrown )
       inst.components.equippable:SetOnUnequip( onunequipcrown )
	   
	    
 -------------------------   
---resurrect
 --[[
 if GetWorld():IsCave() then
 if inst.out_cave then
 SaveGameIndex:DeregisterResurrector(inst)
inst:RemoveComponent("resurrector")
inst.out_cave = false
end
	inst.in_cave = true
	--SaveGameIndex:DeregisterResurrector(inst)
elseif not GetWorld():IsCave() then
	inst:AddComponent("resurrector")  
    inst.components.resurrector.active = true
	inst.components.resurrector.doresurrect = doresurrect2
	inst.components.resurrector.makeusedfn = makeused2
	inst.in_cave = false
	inst.out_cave = true
--	SaveGameIndex:RegisterResurrector(inst)
	end]]
	
	--inst.stored = true
	--inst.resurrect_on = true

	--inst.components.resurrector.active = false
	   inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(3, 3)
    inst.components.playerprox:SetOnPlayerNear(closee)
    inst.components.playerprox:SetOnPlayerFar(farr)
--	inst.check_resurrect_on = inst:DoPeriodicTask(0, check_resurrect_on)
	
       inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
       inst.components.fueled:InitializeFuelLevel(15000000)
       inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
		inst.components.fueled:StartConsuming()  
----------------------
  
    return inst
end
---------------------------------
return Prefab( "common/inventory/hat_mprincess", fn, assets ) 
