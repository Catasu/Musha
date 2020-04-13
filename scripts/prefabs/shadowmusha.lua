require "brains/shadowmushabrain"


local assets = 
{
    Asset("ANIM", "anim/musha_h.zip"),
	Asset("SOUND", "sound/maxwell.fsb"),
	Asset("SOUND", "sound/willow.fsb"),    
	Asset("ANIM", "anim/swap_pickaxe.zip"),
	Asset("ANIM", "anim/swap_axe.zip"),
	Asset("ANIM", "anim/swap_nightmaresword.zip"),
}

local prefabs = 
{

}

local items =
{
	AXE = "swap_axe",
	PICK = "swap_pickaxe",
    SWORD = "swap_nightmaresword"

}

local function onkilll(inst, data)
local smallllchance = 0.05
local normalchance = 0.1

local leader = inst.components.follower.leader
if inst.components.follower:IsNearLeader(20) then
	if leader and leader:HasTag("musha") and not leader:HasTag("playerghost") then
	
	local victim = data.victim
	   if not (victim:HasTag("prey") or
            victim:HasTag("veggie") or
            victim:HasTag("eyeplant") or
            victim:HasTag("insect") or			
            victim:HasTag("structure")) then
    --local delta = victim.components.combat.defaultdamage * 0.25
		   if math.random() < normalchance then
    				leader.level = leader.level + 1
 	leader.components.talker:Say(STRINGS.MUSHA_TALK_EXP_EXTRA.."\n".. (leader.level))		
  					end					
				end
		  if (victim:HasTag("prey") or
              victim:HasTag("insect") or			
            victim:HasTag("frog")) then
    --local delta = victim.components.combat.defaultdamage * 0.1
		   if math.random() < smallllchance then
    				leader.level = leader.level + 1
 	leader.components.talker:Say(STRINGS.MUSHA_TALK_EXP_EXTRA.."\n".. (leader.level))	
  
					end					
				end
			end
		
end 
end 
local function die(inst)
	inst.components.health:Kill()
end
local function leader_yamche(inst, data)
local player = GetPlayer()
if (inst:HasTag("animal") or player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating") or player:HasTag("aquatic")) then
            die(inst)
end
if inst:HasTag("DLC2") then	
    RemovePhysicsColliders(inst) end
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 20, {"yamche"})
for k,v in pairs(ents) do
 if not v.sleep_on and v.active_hunt and not v.peace and not v.defense then
inst.peace = false
inst.active_hunt = true
inst.defense = false
 if inst.yamche then
 inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_OFFENSE)
 SpawnPrefab("dr_hot_loop").Transform:SetPosition(inst:GetPosition():Get())
 inst.yamche = false
 end
 
 elseif not v.sleep_on and not v.active_hunt and v.peace and v.defense then
inst.peace = true
inst.active_hunt = false
inst.defense = true
 if inst.yamche then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_AVOID)
SpawnPrefab("dr_warm_loop_2").Transform:SetPosition(inst:GetPosition():Get())
 inst.yamche = false
 end
 
 elseif not v.sleep_on and not v.active_hunt and not v.peace and not v.defense then
inst.peace = false
inst.active_hunt = false
inst.defense = false
 if inst.yamche then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_DEFFENSE)
 SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())
  inst.yamche = false
 end
end
end 	
end

local function hound_hunt(inst)
if inst:HasTag("DLC") then
inst.DLC = true
end
    if not inst.active_hunt and not inst.peace then
	if inst.DLC then
inst.components.health:SetAbsorptionAmount(0.3)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.3)
end end
    local dist = 30
    if inst.active_hunt then
	if inst.DLC then
inst.components.health:SetAbsorptionAmount(0.2)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.2)
end
    return FindEntity(inst, dist, function(guy)
        return inst.components.combat:CanTarget(guy)
    end,
    nil,
     {"musha","player","wall","houndmound","structure","companion","yamche","beefalo","koalefant","pig","bee","rocky","bird","statue","character","abigail"})
	
 elseif not inst.active_hunt and inst.peace then
 inst.components.combat:SetTarget(nil)
 	if inst.DLC then
inst.components.health:SetAbsorptionAmount(0.6)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.6)
end
end 	
end
local function OnAttacked(inst, data)
	if data and data.attacker and data.attacker:HasTag("musha") then
		die(inst)
	end

    inst.components.combat:SuggestTarget(data.attacker)
    inst.components.combat:ShareTarget(data.attacker, 10, function(dude) return dude:HasTag("ghosthound") and not dude.components.health:IsDead() end, 5)

end
local function ondeath(inst)
local dropchance1 = 0.15
local dropchance2 = 0.4
local dropchance3 = 0.7
	inst.components.sanityaura.penalty = 0
	local player = GetPlayer()
	if player then
		player.components.sanity:RecalculatePenalty()

 if inst:HasTag("b1") and math.random() < dropchance1 then
local poo = SpawnPrefab("nightmarefuel")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
 elseif inst:HasTag("b1") and math.random() < dropchance1 then
local poo = SpawnPrefab("beardhair")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
 elseif inst:HasTag("b2") and math.random() < dropchance2 then
local poo = SpawnPrefab("beardhair")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
 elseif inst:HasTag("b2") and math.random() < dropchance2 then
local poo = SpawnPrefab("beardhair")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
 elseif inst:HasTag("b3") and math.random() < dropchance3 then
local poo = SpawnPrefab("beardhair")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
 elseif inst:HasTag("b3") and math.random() < dropchance3 then
local poo = SpawnPrefab("beardhair")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
 elseif inst:HasTag("b3") and math.random() < dropchance2 then
local poo = SpawnPrefab("exp")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		

end
end
end

local function EquipItem(inst, item)
	if item then
	    inst.AnimState:OverrideSymbol("swap_object", item, item)
	    inst.AnimState:Show("ARM_carry") 
	    inst.AnimState:Hide("ARM_normal")
	end
end

local function resume(inst, time)
    if inst.death then
        inst.death:Cancel()
        inst.death = nil
    end
    inst.death = inst:DoTaskInTime(time, die)
end

local function onsave(inst, data)
    data.timeleft = (inst.lifetime - inst:GetTimeAlive())
end

local function KeepTarget(isnt, target)
    return target and target:IsValid()
end

local function onload(inst, data)
    if data.timeleft then
        inst.lifetime = data.timeleft
        if inst.lifetime > 0 then
            resume(inst, inst.lifetime)
        else
            die(inst)
        end
    end
end

local function entitydeathfn(inst, data)
    if data.inst:HasTag("player") then
        inst:DoTaskInTime(math.random(), function() inst.components.health:Kill() end)
    end
end

local function OnHitfreeze(inst, data)
local other = data.target
   local pos = other:GetPosition()
    if other and other.components.freezable then
        other.components.freezable:AddColdness(0.1)
        other.components.freezable:SpawnShatterFX()
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
    end
    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
    end
end

-------------

local function dead(inst, data)
if inst.components.hunger:GetPercent() < 1 and inst.components.hunger:GetPercent() >= 0.9 then
    inst.Transform:SetScale(1.1, 1.1, 1.1)
	inst.components.health:StartRegen(1, 1)
    inst.components.combat:SetDefaultDamage(60)

elseif inst.components.hunger:GetPercent() < 0.9 and inst.components.hunger:GetPercent() >= 0.8 then
    inst.Transform:SetScale(0.95, 0.95, 0.95)
	inst.components.health:StartRegen(1, 2)
    inst.components.combat:SetDefaultDamage(55)

elseif inst.components.hunger:GetPercent() < 0.8 and inst.components.hunger:GetPercent() >= 0.7 then
    inst.Transform:SetScale(0.85, 0.85, 0.85)
	inst.components.health:StartRegen(1, 2.5)
    inst.components.combat:SetDefaultDamage(50)

elseif inst.components.hunger:GetPercent() < 0.7 and inst.components.hunger:GetPercent() >= 0.6 then
    inst.Transform:SetScale(0.75, 0.75, 0.75)
	inst.components.health:StartRegen(1, 3)
    inst.components.combat:SetDefaultDamage(45)

elseif inst.components.hunger:GetPercent() < 0.6 and inst.components.hunger:GetPercent() >= 0.5 then
    inst.Transform:SetScale(0.65, 0.65, 0.65)
	inst.components.health:StartRegen(1, 3.5)
    inst.components.combat:SetDefaultDamage(40)

elseif inst.components.hunger:GetPercent() < 0.5 and inst.components.hunger:GetPercent() >= 0.1 then
    inst.Transform:SetScale(0.6, 0.6, 0.6)
	inst.components.health:StartRegen(1, 4)
    inst.components.combat:SetDefaultDamage(35)
    inst:AddTag("b1")

elseif inst.components.hunger:GetPercent() < 0.1 and inst.components.hunger.current > 0 then
    inst.Transform:SetScale(0.55, 0.55, 0.55)
	inst.components.health:StartRegen(1, 5)
    inst.components.combat:SetDefaultDamage(30)
    inst:AddTag("b2")
    inst:RemoveTag("b1")

elseif inst.components.hunger.current == 0 then
	inst.components.health:StartRegen(0, 0)
    inst:AddTag("b3")
    inst:RemoveTag("b1")
    inst:RemoveTag("b2")
            die(inst)

end
end

local function onclose(inst)
local player = GetPlayer()
inst:AddTag("closea") 
inst:RemoveTag("fara") 
	inst.components.locomotor.walkspeed = 4
    inst.components.locomotor.runspeed = 6
player.components.leader:AddFollower(inst)

end

local function far(inst)

inst:RemoveTag("closea") 
inst:AddTag("fara") 
	inst.components.locomotor.walkspeed = 8
    inst.components.locomotor.runspeed = 10
inst.components.combat:GiveUp()

end

local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	local sound = inst.entity:AddSoundEmitter()

	inst.Transform:SetFourFaced(inst)
	
local player = GetPlayer()
if player:HasTag("DLC2")then
         inst.DLC2 = true
		end		
if inst:HasTag("DLC2") or SaveGameIndex:IsModeShipwrecked() then
         inst.DLC2 = true
		end	
    	if inst.DLC2 then
		MakeAmphibiousGhostPhysics(inst, 1, .5)
		--MakeAmphibiousCharacterPhysics(inst, 1, .5)
		elseif not inst.DLC2 then
    	MakeCharacterPhysics(inst, 1, .5)
		end
 	
	anim:SetBank("wilson")
	anim:SetBuild("musha_h")
	anim:PlayAnimation("idle")

    anim:Hide("ARM_carry")
    anim:Hide("hat")
    anim:Hide("hat_hair")

    inst:AddTag("scarytoprey")
    --inst:AddTag("NOCLICK")
    inst:AddTag("yamcheb")
    inst:AddTag("character")
inst:AddTag("companion")
 	inst:AddTag("ghosthound")
  
			    inst:AddComponent("talker")
    inst.components.talker.fontsize = 23
    inst.components.talker.colour = Vector3(70, 70, 70, 1)
	inst.Transform:SetScale(0.8, 0.8, 0.8)

	inst:AddComponent("colourtweener")
	inst.components.colourtweener:StartTween({1,1,1,.7}, 0)
    --inst.Transform:SetScale(0.7, 0.7, 0.7)

	inst:AddComponent("locomotor")
    --inst.components.locomotor:SetSlowMultiplier( 0.6 )

    inst.components.locomotor.pathcaps = { ignorecreep = true }
   -- inst.components.locomotor.runspeed = TUNING.SHADOWWAXWELL_SPEED

    inst:AddComponent("combat")
    inst.components.combat.playerdamagepercent = 0
    inst.components.combat.hiteffectsymbol = "torso"
    -- inst.components.combat:SetRetargetFunction(1, Retarget)
    inst.components.combat:SetKeepTargetFunction(KeepTarget)
    inst.components.combat:SetAttackPeriod(TUNING.SHADOWWAXWELL_ATTACK_PERIOD)
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(TUNING.SHADOWWAXWELL_DAMAGE)
--40
    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(150)
inst.components.health.nofadeout = true
inst:ListenForEvent("attacked", OnAttacked)
 inst:ListenForEvent("death", ondeath)
    inst:AddComponent("hunger")
	inst.components.hunger:SetMax(500)
	inst.components.hunger:SetRate(0.5)
	inst:AddComponent("inventory")
   inst.components.inventory.dropondeath = false
local player = GetPlayer()

   inst:AddComponent("sanityaura")
    inst.components.sanityaura.penalty = 20
        player.components.sanity:RecalculatePenalty()
    inst.components.combat:SetRetargetFunction(1, hound_hunt)
	inst:DoPeriodicTask(0.3, leader_yamche)
--------------------
        inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(9, 10)
    inst.components.playerprox:SetOnPlayerNear(onclose)
    inst.components.playerprox:SetOnPlayerFar(far)
-------------------
-------
 if ACTIONS.STAYORDER~= nil then
    inst:AddComponent("staycommand")
    	end
-------

    inst.items = items
    inst.equipfn = EquipItem

 --   inst.lifetime = TUNING.SHADOWWAXWELL_LIFETIME
--    inst.death = inst:DoTaskInTime(inst.lifetime, die)

   -- inst.OnSave = onsave
   -- inst.OnLoad = onload
dead(inst)
inst:ListenForEvent("hungerdelta", dead)
  
	--inst:ListenForEvent("killed", onkilll)
    inst:ListenForEvent("onhitother", OnHitfreeze)


    EquipItem(inst)

    inst:ListenForEvent("entity_death", function(world, data) entitydeathfn(inst, data) end, GetWorld())

    inst:AddComponent("follower")

	local brain = require"brains/shadowmushabrain"
	inst:SetBrain(brain)
	if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGshadowmusha_DLC2")
	else
	inst:SetStateGraph("SGshadowmusha")
	end

	return inst
end

return Prefab("common/shadowmusha", fn, assets, prefabs)