require "brains/ghosthoundbrain"
local brain = require "brains/ghosthoundbrain"
--local trace = function() end
local HOUND_NEAR_LEADER_DISTANCE = 20
local assets=
{
	Asset("ANIM", "anim/ghosthound.zip"),
	Asset("SOUND", "sound/hound.fsb"),
}

local prefabs =
{
}
SetSharedLootTable( 'ghosth',
{
  
})

local WAKE_TO_FOLLOW_DISTANCE = 5
local SLEEP_NEAR_HOME_DISTANCE = 10
local SHARE_TARGET_DIST = 30
local HOME_TELEPORT_DIST = 30
--

local function growhound(inst, data)
local player = GetPlayer()
     if player:HasTag("level1") then
    inst.components.combat:SetDefaultDamage(10)
     elseif player:HasTag("level2") then
    inst.components.combat:SetDefaultDamage(11)
     elseif player:HasTag("level3") then
    inst.components.combat:SetDefaultDamage(12)
     elseif player:HasTag("level4") then
    inst.components.combat:SetDefaultDamage(13)
     elseif player:HasTag("level5") then
    inst.components.combat:SetDefaultDamage(14)
     elseif player:HasTag("level6") then
    inst.components.combat:SetDefaultDamage(15)
     elseif player:HasTag("level7") then
    inst.components.combat:SetDefaultDamage(16)
     elseif player:HasTag("level8") then
    inst.components.combat:SetDefaultDamage(17)
     elseif player:HasTag("level9") then
    inst.components.combat:SetDefaultDamage(18)
     elseif player:HasTag("level10") then
    inst.components.combat:SetDefaultDamage(19)
     elseif player:HasTag("level11") then
    inst.components.combat:SetDefaultDamage(20)
     elseif player:HasTag("level12") then
    inst.components.combat:SetDefaultDamage(21)
     elseif player:HasTag("level13") then
    inst.components.combat:SetDefaultDamage(22)
     elseif player:HasTag("level14") then
    inst.components.combat:SetDefaultDamage(23)
     elseif player:HasTag("level15") then
    inst.components.combat:SetDefaultDamage(24)
     elseif player:HasTag("level16") then
    inst.components.combat:SetDefaultDamage(25)
     elseif player:HasTag("level17") then
    inst.components.combat:SetDefaultDamage(26)
     elseif player:HasTag("level18") then
    inst.components.combat:SetDefaultDamage(27)
     elseif player:HasTag("level19") then
    inst.components.combat:SetDefaultDamage(28)
     elseif player:HasTag("level20") then
    inst.components.combat:SetDefaultDamage(29)
     elseif player:HasTag("level21") then
    inst.components.combat:SetDefaultDamage(30)
     elseif player:HasTag("level22") then
    inst.components.combat:SetDefaultDamage(31)
     elseif player:HasTag("level23") then
    inst.components.combat:SetDefaultDamage(32)
     elseif player:HasTag("level24") then
    inst.components.combat:SetDefaultDamage(33)
     elseif player:HasTag("level25") then
    inst.components.combat:SetDefaultDamage(34)
     elseif player:HasTag("level26") then
    inst.components.combat:SetDefaultDamage(35)
     elseif player:HasTag("level27") then
    inst.components.combat:SetDefaultDamage(36)
     elseif player:HasTag("level28") then
    inst.components.combat:SetDefaultDamage(37)
     elseif player:HasTag("level29") then
    inst.components.combat:SetDefaultDamage(38)
     elseif player:HasTag("level30") then
    inst.components.combat:SetDefaultDamage(40)
end
end

local function ondeath(inst)
SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
end 
local function die(inst)
	inst.components.health:Kill()
end
local function dead(inst, data)
local leader = inst.components.follower.leader
--if inst.components.follower:IsNearLeader(HOUND_NEAR_LEADER_DISTANCE) then
if inst.components.hunger:GetPercent() <= 1 and inst.components.hunger:GetPercent() >= 0.9 then
    inst.Transform:SetScale(0.33, 0.33, 0.33)
	--inst.components.combat:SetDefaultDamage(60)
 elseif inst.components.hunger:GetPercent() < 0.9 and inst.components.hunger:GetPercent() >= 0.7 then
    inst.Transform:SetScale(0.3, 0.3, 0.3)
 elseif inst.components.hunger:GetPercent() < 0.8 and inst.components.hunger:GetPercent() >= 0.7 then
    inst.Transform:SetScale(0.28, 0.28, 0.28)
elseif inst.components.hunger:GetPercent() < 0.7 and inst.components.hunger:GetPercent() >= 0.6 then
    inst.Transform:SetScale(0.27, 0.27, 0.27)
 elseif inst.components.hunger:GetPercent() < 0.6 and inst.components.hunger:GetPercent() >= 0.5 then
    inst.Transform:SetScale(0.26, 0.26, 0.26)
elseif inst.components.hunger:GetPercent() < 0.5 and inst.components.hunger:GetPercent() >= 0.1 then
    inst.Transform:SetScale(0.25, 0.25, 0.25)
elseif inst.components.hunger:GetPercent() < 0.1 and inst.components.hunger.current > 0  then
    inst.Transform:SetScale(0.22, 0.22, 0.22)
elseif inst.components.hunger.current == 0 then
if inst.components.follower:IsNearLeader(HOUND_NEAR_LEADER_DISTANCE) then
SpawnPrefab("splash").Transform:SetPosition(leader:GetPosition():Get())
leader.components.health:DoDelta(10)
end
            die(inst)
end
end



local function onkilll(inst, data)
local smallllchance = 0.05
local normalchance = 0.1

local leader = inst.components.follower.leader
if inst.components.follower:IsNearLeader(HOUND_NEAR_LEADER_DISTANCE) then
	if leader and leader:HasTag("musha") and not leader:HasTag("playerghost") then
	
	local victim = data.victim
	   if not (victim:HasTag("prey") or
            victim:HasTag("veggie") or
            victim:HasTag("eyeplant") or
            victim:HasTag("insect") or			
            victim:HasTag("structure")) and victim.components.combat then
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


local function leader_yamche(inst, data)
local player = GetPlayer()
if not player.crazy and inst.components.follower and inst.components.follower.leader then
inst.components.follower.canaccepttarget = true
elseif player.crazy and inst.components.follower and inst.components.follower.leader then
inst.components.follower.canaccepttarget = false
end

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
if inst.components.follower.leader and inst.follow and not inst.active_hunt then
inst.components.combat:GiveUp()
end 

    if inst.active_hunt then 
	if inst.DLC then
inst.components.health:SetAbsorptionAmount(0.15)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.15)
end
     local dist = 30
     return FindEntity(inst, dist, function(guy)
     return inst.components.combat:CanTarget(guy)
    end,
    nil,
   {"musha","player","wall","houndmound","structure","companion","yamche","beefalo","koalefant","pig","bee","rocky","bird","statue","character","abigail"})

elseif inst.peace and not inst.active_hunt then
inst.components.combat:GiveUp()
 	if inst.DLC then
inst.components.health:SetAbsorptionAmount(0.6)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.6)
end 

    elseif not inst.active_hunt and not inst.peace then
	if inst.DLC then
inst.components.health:SetAbsorptionAmount(0.3)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.3)
end end
  

end 	


local function ShouldWakeUp(inst)
    return not inst.stop
end

local function ShouldSleep(inst)
    return inst.stop
end

		
local function Onfreeze(attacked, data)
        if data and data.attacker and data.attacker.components.freezable and not data.attacker:HasTag("musha") then
            data.attacker.components.freezable:AddColdness(0.2)
            data.attacker.components.freezable:SpawnShatterFX()
        end end

local function onclose(inst)
local leader = inst.components.follower.leader
if inst.components.follower:IsNearLeader(HOUND_NEAR_LEADER_DISTANCE) then
inst.components.locomotor.runspeed = 10
inst.follow = false
end end

local function far(inst)
local leader = inst.components.follower.leader
if inst.components.follower:IsNearLeader(HOUND_NEAR_LEADER_DISTANCE) then
inst.components.locomotor.runspeed = 18
inst.follow = true
end end

local function ghound_update(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 10, {"musha"})
for k,v in pairs(ents) do
if inst.ghound and not inst.components.follower.leader then
v.components.leader:AddFollower(inst)
inst.components.hunger:SetRate(100/TUNING.TEENBIRD_STARVE_TIME)
elseif not inst.ghound then
inst.components.follower:SetLeader(nil)
inst.components.hunger:SetRate(0/TUNING.TEENBIRD_STARVE_TIME)
end end end

local function onusehound(inst, data)
if not inst.ghound then
inst.Light:Enable(true)
inst.ghound = true
inst.sg:GoToState("taunt")
--inst.components.talker:Say("Follow\nSummon time(start)")
inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
inst.stop = false
if inst.components.sleeper:IsAsleep() then
inst.components.sleeper:WakeUp()
end 
end  end

local function offusehound(inst, data)
if inst.ghound then
inst.Light:Enable(false)
inst.ghound = false
inst.components.locomotor.runspeed = 3
inst.sg:GoToState("hit")
--inst.components.talker:Say("Stop\nSummon time(stop)")
inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
inst.stop = true
inst.peace = false
inst.active_hunt = false
inst.defense = false
end 
end 

local function OnHitvampire(inst, data)
--local vampirechance = 0.2
local other = data.target
   --local pos = other:GetPosition()
if other and other.components.health then
   --SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        inst.components.health:DoDelta(5)
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
    end
end

local function OnNewTarget(inst, data)
local other = data.target
    if data.target and data.target:HasTag("musha") then
	return
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()

end
end


local function retargetfn(inst)
    local dist = TUNING.HOUND_TARGET_DIST
        -- dist = TUNING.HOUND_FOLLOWER_TARGET_DIST
        if inst.components.combat.target == inst.components.follower.leader then
            inst.components.combat:SetTarget(nil)
        end
        inst.components.follower:SetLeader(nil)
end

local function KeepTarget(isnt, target)
    return target and target:IsValid()
end


local function OnAttacked(inst, data)
	if data.attacker and data.attacker:HasTag("musha") or data.attacker:HasTag("player") then
	--inst.components.machine:TurnOff()
	inst.components.combat:SetTarget(nil)
	inst.components.combat:GiveUp()
	inst.components.follower:SetLeader(nil)
    end
    inst.components.combat:SuggestTarget(data.attacker)
    inst.components.combat:ShareTarget(data.attacker, 10, function(dude) return dude:HasTag("ghosthound") and not dude.components.health:IsDead() end, 6)
end

local function fnghost()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    local physics = inst.entity:AddPhysics()
	local sound = inst.entity:AddSoundEmitter()
	local shadow = inst.entity:AddDynamicShadow()
	shadow:SetSize( 1.5, 0.6 )
    inst.Transform:SetFourFaced()
	
    inst:AddTag("scarytoprey")
    --inst:AddTag("hound")
    --inst:AddTag("houndmound")
    inst:AddTag("companion")
    inst:AddTag("notraptrigger")
    --inst:AddTag("character")
    inst:AddTag("yamcheb")
	inst:AddTag("ghosthound")
    --inst:AddTag("noauradamage")
	inst:AddTag("trader")

local player = GetPlayer()
if player:HasTag("DLC")then
	inst.DLC = true
		end
if player:HasTag("DLC2")then
	inst.DLC2 = true
		end		
if inst:HasTag("DLC2") or SaveGameIndex:IsModeShipwrecked() then
         inst.DLC2 = true
		end	
if inst.DLC then
inst:AddComponent("waterproofer")
inst.components.waterproofer.effectiveness = 0
end		
if inst.DLC2 or SaveGameIndex:IsModeShipwrecked() then
MakePoisonableCharacter(inst)
	inst:AddComponent("floatable")
	inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0
 end
 
 		if inst.DLC2 then
		--MakeAmphibiousGhostPhysics(inst, 1, .5)
		MakeAmphibiousCharacterPhysics(inst, 1, .5)
		elseif not inst.DLC2 then
    	MakeCharacterPhysics(inst, 1, .5)
		end
  
    anim:SetBank("hound")
    anim:SetBuild("ghosthound")
    anim:PlayAnimation("idle")
    inst:AddComponent("locomotor") 
    inst.components.locomotor.pathcaps = { ignorecreep = true }
    inst.components.locomotor.runspeed = TUNING.HOUND_SPEED
    inst:SetStateGraph("SGdogs")

    local brain = require "brains/ghosthoundbrain"
    inst:SetBrain(brain)
	
	
    inst.entity:AddLight()
	inst.Light:SetRadius(.3)
    inst.Light:SetFalloff(.5)
    inst.Light:SetIntensity(.3)
    inst.Light:SetColour(50/255,50/255,50/255)
	inst.Light:Enable(true)
	
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
			    inst:AddComponent("talker")
    inst.components.talker.fontsize = 23
    inst.components.talker.colour = Vector3(20, 20, 100, 1)
inst.Transform:SetScale(0.3, 0.3, 0.3)

  
    inst:AddComponent("locomotor") 
    inst.components.locomotor.pathcaps = { ignorecreep = true }
    inst.components.locomotor.runspeed = TUNING.HOUND_SPEED
    inst:SetStateGraph("SGdogs")
   
    inst:SetBrain(brain)
	
	inst:AddComponent("follower")
	
	offusehound(inst)
	inst.stop = false
    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(100)
    inst:AddComponent("hunger")
	inst.components.hunger:SetMax(100)
--inst.components.health:SetAbsorptionAmount(0.5)
inst.components.hunger:SetRate(0/TUNING.TEENBIRD_STARVE_TIME)					
    inst:AddComponent("inspectable")
  
    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(7, 7)
    inst.components.playerprox:SetOnPlayerNear(onclose)
    inst.components.playerprox:SetOnPlayerFar(far)
	
    inst:AddComponent("combat")
    inst.components.combat:SetDefaultDamage(TUNING.HOUND_DAMAGE*1.25)
    inst.components.combat:SetAttackPeriod(TUNING.ICEHOUND_ATTACK_PERIOD)
    inst.components.combat.playerdamagepercent = 0
	
	    inst:AddComponent("sleeper")
    inst.components.sleeper:SetResistance(0)
    inst.components.sleeper:SetSleepTest(ShouldSleep)
    inst.components.sleeper:SetWakeTest(ShouldWakeUp)
	
    -- inst:AddComponent("machine")
   -- inst.components.machine.turnonfn = onusehound
  --  inst.components.machine.turnofffn = offusehound
  --  inst.components.machine.cooldowntime = 0
	
	inst.ghound = true

    inst.components.combat:SetAttackPeriod(2)
  --  inst.components.combat:SetKeepTargetFunction(KeepTarget)
    inst:ListenForEvent("newcombattarget", OnNewTarget)
	
    inst.components.combat:SetRetargetFunction(1, hound_hunt)
	inst:DoPeriodicTask(0.3, leader_yamche)
	inst:ListenForEvent("attacked", OnAttacked)
	inst:ListenForEvent("death", ondeath)
	dead(inst)
	inst:ListenForEvent("hungerdelta", dead)
	inst:ListenForEvent("hungerdelta", ghound_update)
	inst:ListenForEvent("attacked", Onfreeze)
	inst:ListenForEvent("attacked", OnAttacked)
	inst:ListenForEvent("onhitother", OnHitvampire)
	
     inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetChanceLootTable('ghosth')
     
	--inst:ListenForEvent("killed", onkilll)
	
	inst:DoPeriodicTask(0.3, function()
	if inst.followdog then
	inst.followdog = false
	inst.stop = false
	onusehound(inst)
	inst.components.machine:TurnOn()
	ghound_update(inst)
	end
	end)
	
    return inst
end


return Prefab ( "ghosthound2", fnghost, assets, prefabs) 

