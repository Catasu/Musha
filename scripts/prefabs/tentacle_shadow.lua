require "stategraphs/SGtentacle"

local assets=
{
    Asset("ANIM", "anim/tentacle_arm.zip"),
    Asset("ANIM", "anim/tentacle_arm_black_build.zip"),
    Asset("SOUND", "sound/tentacle.fsb"),
}

local prefabs =
{
}

SetSharedLootTable( 'tentacle_shadow',
{
   
})

local function OnHitfreeze(inst, data)
local other = data.target
     if other and other.components.freezable then
        other.components.freezable:AddColdness(0.6)	
		other.components.freezable:SpawnShatterFX()
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
    end
    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
    end
end

local function dead(inst, data)
if inst.components.hunger.current < 1 then
	inst.components.health:DoDelta(-1000)
	local fx = SpawnPrefab("statue_transition")
	fx.Transform:SetScale(0.45, 0.45, 0.45)
	fx.Transform:SetPosition(inst:GetPosition():Get()) 
		inst:Remove()
	end
end

local function ghound_update(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 9, {"player"})
for k,v in pairs(ents) do
v.components.leader:AddFollower(inst)
end end 

	
local function hound_hunt(inst)
     local dist = 4
    return FindEntity(inst, dist, function(guy)
        return inst.components.combat:CanTarget(guy)
    end,
    nil,
      {"musha","player","wall","houndmound","structure","companion","yamche","beefalo","koalefant","arongb","pig","bee","rocky","bird","statue","character","abigail"})
	 	
end
local function IsAlive(guy)
    return not guy.components.health:IsDead()
end
local function pirate_tentacle(inst)
  	  
	   return FindEntity(inst, 4,
            IsAlive,
            { "_combat", "_health" },-- see entityscript.lua
            { "musha","player","wall","companion","yamche","beefalo","koalefant","arongb","pig","rocky","bird","statue","character","abigail","smashable","veggie", "prey", "INLIMBO","shadowminion" },
            { "tallbird", "monster", "epic" }
        )
		
	 	
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


local function shouldKeepTarget(inst, target)
    return target ~= nil
        and target:IsValid()
        and target.entity:IsVisible()
        and target.components.health ~= nil
        and not target.components.health:IsDead()
        and target:IsNear(inst, TUNING.TENTACLE_STOPATTACK_DIST)
end

local function OnAttacked(inst, data)
    if data.attacker == nil then
        return
    end

    local current_target = inst.components.combat.target

    if current_target == nil then
        --Don't want to handle initiating attacks here;
        --We only want to handle switching targets.
        return
    elseif current_target == data.attacker then
        --Already targeting our attacker, just update the time
        inst._last_attacker = current_target
        inst._last_attacked_time = GetTime()
        return
    end

    local time = GetTime()
    if inst._last_attacker == current_target and
        inst._last_attacked_time + TUNING.TENTACLE_ATTACK_AGGRO_TIMEOUT >= time then
        --Our target attacked us recently, stay on it!
        return
    end

    --Switch to new target
    inst.components.combat:SetTarget(data.attacker)
    inst._last_attacker = data.attacker
    inst._last_attacked_time = time
	
	if data.attacker:HasTag("player") then
inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
	end

end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddPhysics()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    
     inst.Physics:SetCylinder(0.25, 2)

    inst.Transform:SetScale(0.5, 0.5, 0.5)
    inst.AnimState:SetMultColour(1, 1, 1, 0.5)

    inst.AnimState:SetBank("tentacle_arm")
    inst.AnimState:SetBuild("tentacle_arm_black_build")
    inst.AnimState:PlayAnimation("idle", true)
	
   	inst:AddTag("companion")
    inst:AddTag("shadow")
    inst:AddTag("notarget")
    inst:AddTag("noattack")
	inst:AddTag("NOCLICK")
		
    inst:AddComponent("follower")
	
 --------------------
       
	
    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(100)
    inst:AddComponent("hunger")
	inst.components.hunger:SetMax(90)
 inst.components.hunger:SetRate(1)

 
    inst:AddComponent("combat")
    inst.components.combat:SetRange(2.8)
    inst.components.combat:SetDefaultDamage(5)
    inst.components.combat:SetAttackPeriod(TUNING.TENTACLE_ATTACK_PERIOD)
    --inst.components.combat:SetRetargetFunction(GetRandomWithVariance(1, 0.3), retargetfn)
    --inst.components.combat:SetKeepTargetFunction(shouldKeepTarget)
	inst.components.combat.playerdamagepercent = 0
    MakeLargeFreezableCharacter(inst)

	inst:ListenForEvent("onhitother", OnHitfreeze)
	inst:ListenForEvent("hungerdelta", dead)
    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	--inst:ListenForEvent("newcombattarget", OnNewTarget)
	   --inst.components.combat:SetRetargetFunction(0.5, hound_hunt)
	   inst.components.combat:SetRetargetFunction(GetRandomWithVariance(1, 0.5), pirate_tentacle)
	   inst.components.combat:SetKeepTargetFunction(shouldKeepTarget)
	inst:ListenForEvent("hungerdelta", ghound_update)
    inst.components.lootdropper:SetChanceLootTable('tentacle_shadow')

    inst:SetStateGraph("SGtentacle")

    inst:ListenForEvent("attacked", OnAttacked)

    return inst
end

--------------
return Prefab( "marsh/monsters/tentacle_shadow", fn, assets, prefabs) 
