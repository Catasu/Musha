require "stategraphs/SGtentacle"

local assets=
{
	Asset("ANIM", "anim/tentacle.zip"),
    Asset("SOUND", "sound/tentacle.fsb"),
}

local prefabs =
{
    "monstermeat",
    "tentaclespike",
    "tentaclespots",
}

SetSharedLootTable( 'tentacle_frost',
{
   -- {'ice', 0.2},
})


local function onkilll(inst, data)
local tynychance = 0.05
local smallllchance = 0.1
local smallchance = 0.2
local normalchance = 0.3
local largechance = 0.7
local player = GetPlayer()
	if data.cause == inst.prefab and not data.inst:HasTag("companion") then
                if math.random() < normalchance and data.inst:HasTag("prey") then
        			player.level = player.level + 1
	player.components.talker:Say("Extra [EXP](+1) \n".. (player.level))
	--levelexp(player)	
	elseif math.random() < largechance and not data.inst:HasTag("prey") and not data.inst:HasTag("eyeplant") and not data.inst:HasTag("insect") then
    				player.level = player.level + 1
	player.components.talker:Say("Extra [EXP](+1) \n".. (player.level))
	elseif math.random() < tynychance and data.inst:HasTag("insect") then
    				player.level = player.level + 1
	player.components.talker:Say("Extra [EXP](+1) \n".. (player.level))
	elseif math.random() < smallllchance and data.inst:HasTag("eyeplant") then
    				player.level = player.level + 1
	player.components.talker:Say("Extra [EXP](+1) \n".. (player.level))
	elseif math.random() < smallllchance and data.inst:HasTag("arm") then
    				player.level = player.level + 1
	player.components.talker:Say("Extra [EXP](+1) \n".. (player.level))

    			 end
		          end
			end

local function ghound_update(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 9, {"player"})
for k,v in pairs(ents) do
v.components.leader:AddFollower(inst)
end end 
local function retargetfn(inst)
    		local dist = 20
		return FindEntity(inst, dist, function(guy)
        return inst.components.combat:CanTarget(guy)
    end,
    nil,
      {"musha","player","wall","houndmound","structure","companion","yamche","beefalo","koalefant","arongb","pig","bee","rocky","bird","statue","character","abigail","smashable","veggie","shadowminion"})
	end
	local function OnNewTarget(inst, data)
local other = data.target
    if data.target and data.target:HasTag("player") then
	return
elseif other and other:HasTag("player") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()

end
end
local function IsAlive(guy)
    return not guy.components.health:IsDead()
end
local function pirate_tentacle(inst)
  	  
	   return FindEntity(inst, 15,
            IsAlive,
            { "_combat", "_health" },-- see entityscript.lua
            { "musha","player","wall","companion","yamche","beefalo","koalefant","arongb","pig","rocky","bird","statue","character","abigail","smashable","veggie", "prey", "INLIMBO","shadowminion" },
            { "tallbird", "monster", "epic" }
        )
		
	 	
end

--[[local function shouldKeepTarget(inst, target)
    if target and target:IsValid() and target.components.health and not target.components.health:IsDead() then
        local distsq = target:GetDistanceSqToInst(inst)
        return distsq < TUNING.TENTACLE_STOPATTACK_DIST*TUNING.TENTACLE_STOPATTACK_DIST
    else
        return false
    end
end]]
local function shouldKeepTarget(inst, target)
    return target ~= nil
        and target:IsValid()
        and target.entity:IsVisible()
        and target.components.health ~= nil
        and not target.components.health:IsDead()
        and target:IsNear(inst, TUNING.TENTACLE_STOPATTACK_DIST)
end

local function OnHitfreeze(inst, data)
local other = data.target
    if other and other.components.freezable then
        other.components.freezable:AddColdness(1)
        other.components.freezable:SpawnShatterFX()
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
    end
    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
    end
end

local function ondeath(inst)
--	inst.components.sanityaura.penalty = 0
	local player = GetPlayer()
	--if player then
	--	player.components.sanity:RecalculatePenalty()
local fx = SpawnPrefab("statue_transition")
	local pos = Vector3(inst.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())

end
--end

local function dead(inst, data)
if inst.components.hunger:GetPercent() <= 1 and inst.components.hunger:GetPercent() > 0.98 then
	inst.components.talker:Say("99%")	
elseif inst.components.hunger:GetPercent() <= 0.9 and inst.components.hunger:GetPercent() > 0.88 then	
	inst.components.talker:Say("90%")	
elseif inst.components.hunger:GetPercent() <= 0.79 and inst.components.hunger:GetPercent() > 0.78 then	
	inst.components.talker:Say("80%")	
elseif inst.components.hunger:GetPercent() <= 0.69 and inst.components.hunger:GetPercent() > 0.68 then	
	inst.components.talker:Say("70%")	
elseif inst.components.hunger:GetPercent() <= 0.59 and inst.components.hunger:GetPercent() > 0.58 then	
	inst.components.talker:Say("60%")	
elseif inst.components.hunger:GetPercent() <= 0.49 and inst.components.hunger:GetPercent() > 0.48 then	
	inst.components.talker:Say("50%")	
elseif inst.components.hunger:GetPercent() <= 0.39 and inst.components.hunger:GetPercent() > 0.38 then	
	inst.components.talker:Say("40%")		
elseif inst.components.hunger:GetPercent() <= 0.29 and inst.components.hunger:GetPercent() > 0.28 then	
	inst.components.talker:Say("30%")		
elseif inst.components.hunger:GetPercent() <= 0.19 and inst.components.hunger:GetPercent() > 0.18 then	
	inst.components.talker:Say("20%")		
elseif inst.components.hunger:GetPercent() <= 0.09 and inst.components.hunger:GetPercent() > 0.08 then	
	inst.components.talker:Say("10%")		
elseif inst.components.hunger.current < 1 then
	inst.components.health:DoDelta(-1000)
SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get())
end
end

local function on_close(inst)
inst.close = true
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"musha"})
for k,v in pairs(ents) do
if inst.close and not inst.components.follower.leader and v:HasTag("musha") then
v.components.leader:AddFollower(inst)
end 
end
end
local function on_far(inst)
inst.close = false
local leader = inst.components.follower.leader
--[[if not inst.limited and inst. inst.components.follower.leader and leader:HasTag("musha") then
inst.components.follower:SetLeader(nil)
end]] 
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddPhysics()
    inst.Physics:SetCylinder(0.25,2)
    
    inst.AnimState:SetBank("tentacle")
    inst.AnimState:SetBuild("tentacle_frost")
    inst.AnimState:PlayAnimation("idle")
 	inst.entity:AddSoundEmitter()

  --  inst:AddTag("monster")    
    --inst:AddTag("hostile")
    --inst:AddTag("wet")
    --inst:AddTag("WORM_DANGER")
    inst:AddTag("companion")
    inst:AddTag("yamcheb")
	inst:AddTag("frost_tentacle")
	inst:AddTag("character")
    inst.Transform:SetScale(0.65, 0.65, 0.65)

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(500)
    	inst:AddComponent("colourtweener")
	inst.components.colourtweener:StartTween({1,1,1,.85}, 0)
			    inst:AddComponent("talker")
    inst.components.talker.fontsize = 21
    inst.components.talker.colour = Vector3(20, 20, 100, 1)
    inst:AddComponent("hunger")
	inst.components.hunger:SetMax(500)
 inst:ListenForEvent("death", ondeath)
local player = GetPlayer()
  --     inst:AddComponent("sanityaura")
  --  inst.components.sanityaura.penalty = 10
	
      --  player.components.sanity:RecalculatePenalty()
		
     inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(25, 25)
    inst.components.playerprox:SetOnPlayerNear(on_close)
    inst.components.playerprox:SetOnPlayerFar(on_far)
	
    inst:AddComponent("combat")
    inst.components.combat:SetRange(TUNING.TENTACLE_ATTACK_DIST)
    --inst.components.combat:SetDefaultDamage(TUNING.TENTACLE_DAMAGE)
    inst.components.combat:SetDefaultDamage(20)
inst.components.combat.playerdamagepercent = 0
    inst.components.combat:SetAttackPeriod(TUNING.TENTACLE_ATTACK_PERIOD)
    inst.components.combat:SetRetargetFunction(GetRandomWithVariance(2, 0.5), retargetfn)
	--inst.components.combat:SetRetargetFunction(GetRandomWithVariance(2, 0.5), pirate_tentacle)
    inst.components.combat:SetKeepTargetFunction(shouldKeepTarget)
	
     inst:ListenForEvent("newcombattarget", OnNewTarget)
	  inst:ListenForEvent("hungerdelta", ghound_update)
	
    MakeLargeFreezableCharacter(inst)

        inst:AddComponent("follower")
    
        inst:ListenForEvent("onhitother", OnHitfreeze)
inst:ListenForEvent("hungerdelta", dead)
  --  inst:ListenForEvent("entity_death", function(wrld, data) onkilll(inst, data) end, GetWorld())

    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetChanceLootTable('tentacle_frost')
    
    inst:SetStateGraph("SGtentacle")

    return inst
end

return Prefab( "marsh/monsters/tentacle_frost", fn, assets, prefabs) 
