require "brains/assasinbrain"
local brain = require "brains/assasinbrain"
require "stategraphs/SGassasin"

--local MakePlayerCharacter = require "prefabs/player_common"

local assets = 
{
    Asset("ANIM", "anim/assasin_webber.zip"),
	Asset("SOUND", "sound/wilson.fsb"),
		Asset("SOUND", "sound/woodie.fsb"),
	    Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/maxwell.fsb" ),
	    Asset( "ANIM", "anim/wilson_fx.zip" ),
  
	       Asset( "ANIM", "anim/beard.zip" ),	
		--Asset("ANIM", "anim/beard_silk.zip"),
		Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
		Asset("ANIM", "anim/swap_nightmaresword.zip"),
		Asset("ANIM", "anim/backpack.zip"),
		Asset("ANIM", "anim/armor_wood.zip"),
		Asset("ANIM", "anim/armor_grass.zip"),
		Asset("ANIM", "anim/armor_marble.zip"),
		Asset("ANIM", "anim/armor_slurper.zip"),
		Asset("ANIM", "anim/armor_ruins.zip"),
		Asset("ANIM", "anim/armor_slurtleshell.zip"),
		Asset("ANIM", "anim/swap_mushasword_base.zip"),
		Asset("ANIM", "anim/swap_mushasword_frost1.zip"),
		Asset("ANIM", "anim/swap_mushasword_frost2.zip"),
		Asset("ANIM", "anim/swap_mushasword_frost3.zip"),
		Asset("ANIM", "anim/swap_mushasword_frost1_boost.zip"),
		Asset("ANIM", "anim/swap_mushasword_frost2_boost.zip"),
		Asset("ANIM", "anim/swap_mushasword_frost3_boost.zip"),
}

local prefabs = 
{
}

local start_inv = 
{
}

local items =
{
	AXE = "swap_axe",
	PICK = "swap_pickaxe",
	SWORD = "swap_nightmaresword",
    SWORD1 = "swap_mushasword_base",
	SWORD2 = "swap_mushasword_frost1",
	SWORD3 = "swap_mushasword_frost2",
	SWORD4 = "swap_mushasword_frost1_boost",
	SWORD5 = "swap_mushasword_frost2_boost",
	SWORD6 = "swap_mushasword_frost3_boost",
	BODY = "swap_backpack",
	BODY1 = "armor_grass",
	BODY2 = "armor_wood",
	BODY3 = "armor_marble",
	BODY4 = "armor_slurper",
	BODY5 = "armor_ruins",
	BODY6 = "armor_slurtleshell",
	
}

local function ondeath(inst, data)
local player = GetPlayer()
if player.level >=0 and player.level <125  then --1
   if math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("silk")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
     elseif math.random() < 0.2 then
		local poo = SpawnPrefab("goldnugget")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("bluegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("glowdust")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
	end
elseif 	player.level >=125 and player.level <640  then	--2
   if math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("bluegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("redgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("glowdust")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
	end
elseif 	player.level >=640 and player.level <1340  then	--3
  if math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("bluegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("redgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("glowdust")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())
    elseif math.random() < 0.1 then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.1 then
		local poo = SpawnPrefab("yellowgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())			
	end
elseif 	player.level >=1340 and player.level <2290  then	--4
 if math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
     elseif math.random() < 0.2 then
		local poo = SpawnPrefab("bluegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("redgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("glowdust")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())
    elseif math.random() < 0.15 then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.1 then
		local poo = SpawnPrefab("yellowgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.1 then
		local poo = SpawnPrefab("greengem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())			
    elseif math.random() < 0.1 then
		local poo = SpawnPrefab("orangegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())					
	end
elseif 	player.level >=2290 and player.level <4200  then	--5
 if math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
     elseif math.random() < 0.2 then
		local poo = SpawnPrefab("bluegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("redgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("glowdust")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.15 then
		local poo = SpawnPrefab("yellowgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.15 then
		local poo = SpawnPrefab("greengem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())			
    elseif math.random() < 0.1 then
		local poo = SpawnPrefab("orangegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())					
	end
elseif 	player.level >=4200 and player.level <7000  then	--6
			  if math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("bluegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("redgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("glowdust")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.15 then
		local poo = SpawnPrefab("yellowgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.15 then
		local poo = SpawnPrefab("greengem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())			
    elseif math.random() < 0.15 then
		local poo = SpawnPrefab("orangegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())					
	end  
elseif 	player.level >=7000 then	-- 7
	    if math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("beardhair")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("bluegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("redgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("glowdust")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("yellowgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("greengem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())			
    elseif math.random() < 0.2 then
		local poo = SpawnPrefab("orangegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())					
	end
end

local dark2 = SpawnPrefab("statue_transition_2")
local pos = Vector3(inst.Transform:GetWorldPosition())
local player = GetPlayer()
 		if math.random() < 0.2 then
player.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_WIN1)
elseif math.random() < 0.2  then
player.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_WIN2)
elseif math.random() < 0.2  then
player.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_WIN3)
elseif math.random() < 0.2  then
player.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_WIN4)
else
player.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_WIN5)
end
end

	
local function lightning(inst)
if inst.components.health:GetPercent() < 0.6 then 
local random = 0.2
if math.random() < random and not inst.webber_lightning then
inst.webber_lightning = true
inst.bloom = true
end
	
end end


local function OnRanger(inst, data)
local other = data.target
 if other and inst.ranger2 and inst.webber_lightning then
           SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
        --other.components.health:DoDelta(-30)
		if math.random() < 0.2 then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE1)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE2)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE3)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE4)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE5)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE6)
else
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE7)

end
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" ) 
	inst.ranger2 = false inst.webber_lightning = false
--inst.components.combat:SetRange(2)	
end
end

function Power_check(inst, data)
if inst.webber_lightning and not inst.ranger2 then -- and inst.components.health:GetPercent() >=0.4 then 
inst.ranger2 = true
--inst.components.combat:SetRange(12)
end
if inst.bloom then
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
--inst.components.talker:Say("[Lightning -On]")
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.bloom = false
end
end


local function cure1_proc(inst, data)
if inst.DLC then	
inst.components.health:SetAbsorptionAmount(1)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(1)
end
--inst.components.health:DoDelta(50)
local fx = SpawnPrefab("forcefieldfxx")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
fx.Transform:SetScale(0.7, 0.7, 0.7)
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
inst.shield_on = true
inst.sg:GoToState("talk")
if math.random() < 0.2 then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE1)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE2)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE3)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE4)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE5)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE6)
else
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_BATTLE7)
end
inst:DoTaskInTime(--[[Duration]] 12, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
if inst:IsValid() then
fx.kill_fx(fx)
if inst.DLC then	
inst.components.health:SetAbsorptionAmount(0.5)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.5)
end

inst:DoTaskInTime(--[[Cooldown]] 300, function() inst.shield_on = false end)
end end) 
 end 
 
  local function EquipHead(inst, item)
 if item then
      inst.AnimState:OverrideSymbol("swap_hat", item, "swap_hat")
        inst.AnimState:Show("HAT")
        inst.AnimState:Hide("HAT_HAIR")
        inst.AnimState:Hide("HAIR_NOHAT")
        inst.AnimState:Hide("HAIR")
            inst.AnimState:Hide("HEAD")
            inst.AnimState:Show("HEAD_HAIR")
end
end

 local function EquipArmor(inst, item)
 if item then
	inst.AnimState:OverrideSymbol("swap_body", item, "swap_body")
end
end

local function EquipItem(inst, item)
	if item then
	    inst.AnimState:OverrideSymbol("swap_object", item, "swap_nightmaresword")
	    inst.AnimState:Show("ARM_carry") 
	    inst.AnimState:Hide("ARM_normal")
			
			
	end
end

 local function Hiding(inst) 
 	local fx = SpawnPrefab("statue_transition_2")
	fx.Transform:SetScale(1.5,1.5, 1.5)
	fx.Transform:SetPosition(inst:GetPosition():Get())
	inst.components.combat:SetTarget(nil)
	end

local function HideInShadow(inst)
local player = GetPlayer()
if player.components.health:IsDead() and not inst.player_die then
inst.player_die = true
inst.sg:GoToState("talk")
inst.components.locomotor:Stop()
--inst:DoTaskInTime( 3, function() inst.sg:GoToState("idle") end)
	if math.random() < 0.2 then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_WIN1)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_WIN2)
elseif math.random() < 0.2  then
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_WIN3)
else
inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_WIN4)
	end
inst:DoTaskInTime(3, function() inst.hide = true end)
inst:DoTaskInTime(0.5, function() inst:Remove() end)
end
 if inst.hiding then
 	Hiding(inst) 
	inst.hide = true
	inst.components.health:SetInvincible(true)
	inst:AddTag("hiding")
	inst:DoTaskInTime(2, function() inst:RemoveTag("hiding")
	inst.sneak_attack = true
	inst.components.health:SetInvincible(false) end)
	inst.hiding = false
	end
 if inst.hide then	
 inst:AddTag("notarget")
 		if inst.pop then 
		inst.pop = false
		local fx = SpawnPrefab("statue_transition_2")
fx.Transform:SetScale(1.5,1.5, 1.5)
fx.Transform:SetPosition(inst:GetPosition():Get())
				end
	inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.4)
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.4)	
inst.components.colourtweener:StartTween({0,0,0,0}, 0)
 elseif not inst.hide then
 inst:RemoveTag("notarget")
		if not inst.pop then 
		inst.pop = true
		local fx = SpawnPrefab("statue_transition_2")
fx.Transform:SetScale(1.5,1.5, 1.5)
fx.Transform:SetPosition(inst:GetPosition():Get())
				end
 inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED )
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED )	
		inst.components.colourtweener:StartTween({1,1,1,1}, 0) 
end
	end
	
local function OnAttacked(inst, data)
inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
if math.random() < 0.2 and not inst.hiding then
 inst.hiding = true
Hiding(inst)
end
if inst.sneak_attack then
inst.hide = false
inst.sneak_attack = false
Hiding(inst)
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED )
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED )	
	inst.components.colourtweener:StartTween({1,1,1,1}, 0) 	
	inst:RemoveTag("notarget")
end
HideInShadow(inst)
    inst.components.combat:SuggestTarget(data.attacker)
    inst.components.combat:ShareTarget(data.attacker, 3, function(dude) return dude:HasTag("spider") and not dude.components.health:IsDead() end, 5)

end

local function OnHitfreeze(inst, data)
local other = data.target
if inst.hide or inst.sneak_attack then 
	if inst.DLC then
            local fx2 = SpawnPrefab("groundpoundring_fx")
	 	  fx2.Transform:SetScale(0.6, 0.6, 0.6)
	  	  fx2.Transform:SetPosition(other:GetPosition():Get())
		  end
	if other and other.components.freezable then
        other.components.freezable:AddColdness(2)
        other.components.freezable:SpawnShatterFX()
	end 
	inst.sneak_attack = false 
	inst.hide = false 
	Hiding(inst)
	inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED )
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED )	
	inst.components.colourtweener:StartTween({1,1,1,1}, 0) 	
	inst:RemoveTag("notarget")
end

if math.random() < 0.2 and not inst.hiding and not inst.sneak_attack then
 inst.hiding = true
 end

   local pos = other:GetPosition()
    if other and other.components.freezable then
        other.components.freezable:AddColdness(0.1)
        other.components.freezable:SpawnShatterFX()
	elseif other and other.components.freezable and math.random() < 0.2 then
        other.components.freezable:AddColdness(1)
        other.components.freezable:SpawnShatterFX()
		if inst.DLC then
            local fx2 = SpawnPrefab("groundpoundring_fx")
	 	  fx2.Transform:SetScale(0.6, 0.6, 0.6)
	  	  fx2.Transform:SetPosition(other:GetPosition():Get())
		  end
    end
end

local function tryproc(inst)
if not inst.shield_on and inst.components.health:GetPercent() < .1  then
            cure1_proc(inst)
    end end
	

local function assasin_hunt(inst)
    local dist = 40
    return FindEntity(inst, dist, function(guy)
            return ( guy:HasTag("musha") or guy:HasTag("yamche") or guy:HasTag("companion") )
			 and guy.components.health
                and not guy.components.health:IsDead()
                and inst.components.combat:CanTarget(guy)
        end)
		end

local function Onhunt(inst, target)
    return inst.components.combat:CanTarget(target)
end
	
local function on_close(inst)

end 

local function far(inst)
inst.components.combat:SuggestTarget(GetPlayer())
end
	
local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	local sound = inst.entity:AddSoundEmitter()

	inst.Transform:SetFourFaced(inst)

    MakeCharacterPhysics(inst, 1, .5) 
 	
	anim:SetBank("wilson")
	anim:SetBuild("assasin_webber")
	anim:PlayAnimation("idle")

    anim:Hide("ARM_carry")
    anim:Hide("hat")
    anim:Hide("hat_hair")

    inst:AddTag("scarytoprey")
 
	--inst.soundsname = "webber"
	inst.talker_path_override = "dontstarve/characters/"

	inst:AddTag("spiderwhisperer")
	inst:AddTag("monster")
	--inst:AddTag("hostile")
--	inst:AddTag("NOCLICK")
	inst:AddTag("assasin")
	inst:AddTag("small_giant4x")
	inst:AddTag("spider")
	
local player = GetPlayer()
if player:HasTag("DLC") or inst:HasTag("DLC2") then
         inst.DLC = true
		end
		
	--inst.components.eater.monsterimmune = true
	
			    inst:AddComponent("talker")
    inst.components.talker.fontsize = 30
    inst.components.talker.colour = Vector3(1, 0.6, 0.75, 1)
	inst.Transform:SetScale(1.1,1.1,1.1)
			inst.hurtsoundoverride = "wilson"
		inst.talker_path_override = "wilson"
	
	inst:AddComponent("colourtweener")
	--inst.components.colourtweener:StartTween({.1,.1,.1,.1}, 0)
	
	inst:DoTaskInTime(2, function() inst.hide = true end)
	
	
	inst:DoTaskInTime(600, function() inst.sg:GoToState("talk") 
	inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_HIDE) inst.hide = true
	inst:DoTaskInTime(1.5, function()  SpawnPrefab("lightning2").Transform:SetPosition(inst:GetPosition():Get())
	inst:DoTaskInTime(0.25, function() SpawnPrefab("lightning2").Transform:SetPosition(inst:GetPosition():Get()) 
	inst:Remove() 	
	end) end) end)
	
	
		inst:AddComponent("locomotor")
	inst.components.locomotor.triggerscreep = false	
	

    inst:AddComponent("combat")
    --inst.components.combat.playerdamagepercent = 1
    inst.components.combat.hiteffectsymbol = "torso"
    inst.components.combat:SetRetargetFunction(0, assasin_hunt)
	inst.components.combat:SetKeepTargetFunction(Onhunt)
	inst.components.combat:SetAttackPeriod(3)
    inst.components.combat:SetRange(2, 3)
	inst.components.combat.playerdamagepercent = .5
 
 inst:AddComponent("leader")
 --inst:AddComponent("follower")
 
	   inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(7, 8)
    inst.components.playerprox:SetOnPlayerNear(on_close)
    inst.components.playerprox:SetOnPlayerFar(far)

	   inst:AddComponent("health")
	
	--inst.components.hunger:SetMax(200)
	--inst.components.sanity:SetMax(TUNING.WEBBER_SANITY)
	inst.components.health:StartRegen(1, 5)

	inst:AddComponent("inventory")
   inst.components.inventory.dropondeath = false
    inst:AddComponent("beard")
	   inst.components.beard.prize = "beardhair"
	   
	    inst.items = items
    inst.equipfn = EquipItem
	inst.equipfn2 = EquipArmor
	EquipItem(inst)
	EquipArmor(inst)
	local player = GetPlayer()
	
	--if player:HasTag("musha") then
if player.level >=0 and player.level <125  then --1
	inst.equipfn(inst, inst.items["SWORD1"])
	inst.equipfn2(inst, inst.items["BODY"])
	 inst.components.combat:SetDefaultDamage(20)
	inst.components.health:SetMaxHealth(500)
		inst.AnimState:OverrideSymbol("beard", "beard", "beard_short")
elseif 	player.level >=125 and player.level <640  then	--2
	inst.equipfn(inst, inst.items["SWORD1"])
	inst.equipfn2(inst, inst.items["BODY1"])
	inst.components.combat:SetDefaultDamage(30)
	inst.components.health:SetMaxHealth(1000)
	inst.AnimState:OverrideSymbol("beard", "beard", "beard_short")
	if inst.DLC then	
inst.components.health:SetAbsorptionAmount(0.15)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.15)
end
elseif 	player.level >=640 and player.level <1340  then	--3
	inst.equipfn(inst, inst.items["SWORD2"])
	inst.equipfn2(inst, inst.items["BODY2"])	
	inst.components.combat:SetDefaultDamage(45)
	inst.components.health:SetMaxHealth(1500)
	inst.AnimState:OverrideSymbol("beard", "beard", "beard_medium")
	if inst.DLC then	
inst.components.health:SetAbsorptionAmount(0.25)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.25)
end	
elseif 	player.level >=1340 and player.level <2290  then	--4
	inst.equipfn(inst, inst.items["SWORD3"])
	inst.equipfn2(inst, inst.items["BODY3"])	
	inst.components.combat:SetDefaultDamage(60)
	inst.components.health:SetMaxHealth(2000)
	inst:AddTag("giant1x")
	inst.AnimState:OverrideSymbol("beard", "beard", "beard_medium")
	if inst.DLC then	
inst.components.health:SetAbsorptionAmount(0.35)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.35)
end		
elseif 	player.level >=2290 and player.level <4200  then	--5
	inst.equipfn(inst, inst.items["SWORD4"])
	inst.equipfn2(inst, inst.items["BODY4"])	
inst.components.combat:SetDefaultDamage(75)	
	inst.components.health:SetMaxHealth(2500)
	inst:AddTag("giant1x")
       inst.AnimState:OverrideSymbol("beard", "beard", "beard_medium")
	if inst.DLC then	
inst.components.health:SetAbsorptionAmount(0.4)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.4)
end		   
elseif 	player.level >=4200 and player.level <7000  then	--6
	inst.equipfn(inst, inst.items["SWORD5"])
	inst.equipfn2(inst, inst.items["BODY5"])		
	inst.components.combat:SetDefaultDamage(90)
	inst.components.health:SetMaxHealth(3000)
	inst:AddTag("giant1x")
       inst.AnimState:OverrideSymbol("beard", "beard", "beard_long")
	if inst.DLC then	
inst.components.health:SetAbsorptionAmount(0.45)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.45)
end			   
elseif 	player.level >=7000 then	-- 7
	inst.equipfn(inst, inst.items["SWORD6"])
	inst.equipfn2(inst, inst.items["BODY6"])		
	inst.components.combat:SetDefaultDamage(105)
	inst.components.health:SetMaxHealth(4000)
	inst:AddTag("giant2x")
       inst.AnimState:OverrideSymbol("beard", "beard", "beard_long")
	if inst.DLC then	
inst.components.health:SetAbsorptionAmount(0.5)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.5)
end		   
	end
inst:ListenForEvent("death", ondeath)

	    inst.procfn = function() tryproc(inst) end
        inst:ListenForEvent("attacked", inst.procfn)
		inst:ListenForEvent("attacked", OnAttacked)
		inst:ListenForEvent("onhitother", OnHitfreeze)
		inst.hideinshadow = inst:DoPeriodicTask(12, function() inst.hiding = true inst.sneak_attack = true HideInShadow(inst) end)
		--inst.hunt = inst:DoPeriodicTask(8, lightning)
		--inst.Power_check = inst:DoPeriodicTask(1, Power_check)
	    --inst:ListenForEvent("onhitother", OnRanger)
  
   
	--[[
    inst.components.beard.insulation_factor = TUNING.WEBBER_BEARD_INSULATION_FACTOR
    inst.components.beard.onreset = function()
        inst.AnimState:ClearOverrideSymbol("beard")
    end
    inst.components.beard.prize = "silk"

    
	local beard_days = {3, 6, 9}
	local beard_bits = {1, 3, 6}
    
    inst.components.beard:AddCallback(beard_days[1], function()
        inst.AnimState:OverrideSymbol("beard", "beard_silk", "beardsilk_short")
        inst.components.beard.bits = beard_bits[1]
    end)
    
    inst.components.beard:AddCallback(beard_days[2], function()
        inst.AnimState:OverrideSymbol("beard", "beard_silk", "beardsilk_medium")
        inst.components.beard.bits = beard_bits[2]
    end)
    
    inst.components.beard:AddCallback(beard_days[3], function()
        inst.AnimState:OverrideSymbol("beard", "beard_silk", "beardsilk_long")
        inst.components.beard.bits = beard_bits[3]
    end)
	]]
	inst:SetBrain(brain)
	inst:SetStateGraph("SGassasin")
	
		return inst
end
return Prefab("common/assasin_webber", fn, assets, prefabs)
--return MakePlayerCharacter("assasin_webber", prefabs, assets, custom_init, start_inv) 
