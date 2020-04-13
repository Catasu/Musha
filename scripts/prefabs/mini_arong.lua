

local assets=
{
	Asset("SOUND", "sound/beefalo.fsb"),
	Asset("SOUND", "sound/wilson.fsb"),
	Asset("ANIM", "anim/arong_basic.zip"),
	Asset("ANIM", "anim/arong_actions.zip"),
    Asset("ANIM", "anim/beefalo_actions_domestic.zip"),
	Asset("ANIM", "anim/beefalo_actions_quirky.zip"),
 	Asset("ANIM", "anim/arong_baby_build.zip"),
	Asset("ANIM", "anim/arong_mini1_build.zip"),
	Asset("ANIM", "anim/arong_mini2_build.zip"),
	Asset("ANIM", "anim/arong_mini3_build.zip"),
	Asset("ANIM", "anim/arong_mini4_build.zip"),
	Asset("ANIM", "anim/arong_mini4_v_build.zip"),
	Asset("ANIM", "anim/arong_grow1_v_build.zip"),
	Asset("ANIM", "anim/arong_grow1_build.zip"),
    Asset("ANIM", "anim/beefalo_fx.zip"),
	Asset("IMAGE", "images/inventoryimages/arongbaby.tex"),
	Asset("ATLAS", "images/inventoryimages/arongbaby.xml"),
	Asset("IMAGE", "images/inventoryimages/mini_arong.tex"),
	Asset("ATLAS", "images/inventoryimages/mini_arong.xml"),
	Asset("IMAGE", "images/inventoryimages/mini_arong2.tex"),
	Asset("ATLAS", "images/inventoryimages/mini_arong2.xml"),
	Asset("IMAGE", "images/inventoryimages/grow_arong.tex"),
	Asset("ATLAS", "images/inventoryimages/grow_arong.xml"),
	 Asset("ANIM", "anim/hat_house.zip"),
}


local sounds =
{
    walk = "dontstarve/creatures/beefalo_baby/walk",
    grunt = "dontstarve/creatures/beefalo_baby/grunt",
    yell = "dontstarve/creatures/beefalo_baby/yell",
    swish = "dontstarve/creatures/beefalo_baby/tail_swish",
    curious = "dontstarve/creatures/beefalo_baby/curious",
    angry = "dontstarve/creatures/beefalo_baby/angry",
	eating = "dontstarve/wilson/eat", "eating"
}

local brain = require "brains/miniarongbrain"

local lootdrop = {"beefalowool","beefalowool","cutgrass","cutgrass",}

local slotpos_6 = {}

for y = 3, 0, -1 do
    for x = 0, 3 do
        table.insert(slotpos_6, Vector3(60*x-60*2+30, 60*y-60*2+30,0))
    end
end

local slotpos_5 = {}

for y = 3, 0, -1 do
    for x = 0, 2 do
        table.insert(slotpos_5, Vector3(75*x-75*2+75, 60*y-60*2+32,0))
    end
end

local slotpos_4 = {}

for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(slotpos_4, Vector3(80*x-80*2+80, 80*y-80*2+80,0))
    end
end

local slotpos_3 = {}

for y = 2, 0, -1 do
    for x = 0, 1 do
        table.insert(slotpos_3, Vector3(80*x-80*2+78, 80*y-80*2+80,0))
    end
end

local slotpos_2 = {}

for y = 1, 0, -1 do
    for x = 0, 1 do
        table.insert(slotpos_2, Vector3(80*x-80*2+78, 80*y-80*2+80,0))
    end
end

local slotpos_1 = {}

for y = 1, 0, -1 do
        table.insert(slotpos_1, Vector3(74*y-74*2+70, 0))

end


local function stop_working(inst)
local player = GetPlayer()
player.working = false
inst.pick1 = false
inst.working_food = false
inst.drop = true
inst.yamche = true
inst.growup = true

inst.components.growable:StartGrowing()	
inst.SoundEmitter:KillSound("eating")

	--inst.level = 0
	
end

---------------------------
local function summontime(inst,data)
local max_time = 100
local cur_time = math.min(inst.time, max_time)
end

local function levelexp(inst,data)

	local max_exp = 999999999999999993000
	local exp = math.min(inst.level, max_exp)
	--local hunger_percent = inst.components.hunger:GetPercent()
	local health_percent = inst.components.health:GetPercent()

--if not inst.no_growup then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_EXP.."\n".. (inst.level))

	if inst.lv6 then
	--inst.components.hunger.max = math.ceil (150 + exp* 1)
	inst.components.health.maxhealth = math.ceil (600 + exp* 1)
	inst.components.talker:Say(STRINGS.MUSHA_HEALTH_MAX.."\n".. (inst.level + 600))
	
	elseif not inst.lv6 then
if inst.level >=0 and inst.level <19 and inst.lv1 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 1\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/20")
elseif inst.level >19 and inst.lv1 then
    		inst.growup = true stop_working(inst)
	--inst.components.talker:Say("[Grow up]")
elseif inst.level >=0 and inst.level <39 and inst.lv2 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 2\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/40")
	elseif inst.level >39 and inst.lv2 then
    		inst.growup = true stop_working(inst)
	--inst.components.talker:Say("[Grow up]")
elseif inst.level >=0 and inst.level <79 and inst.lv3 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 3\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/80")
	elseif inst.level >79 and inst.lv3 then
    		inst.growup = true stop_working(inst)
	--inst.components.talker:Say("[Grow up]")
elseif inst.level >=0 and inst.level <159 and inst.lv4 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 4\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/160")
	elseif inst.level >159 and inst.lv4 then
    		inst.growup = true stop_working(inst)
	--inst.components.talker:Say("[Grow up]")
elseif inst.level >=0 and inst.level <339 and inst.lv5 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 5\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/340")
elseif inst.level >339 and inst.lv5 then
    		inst.growup = true stop_working(inst)
	--inst.components.talker:Say("[Grow up]")
	end
end		
	inst.components.health:SetPercent(health_percent)
	end
--end
--end

local smallllchance = 0.45
local normalchance = 0.75
local largechance = 1

local function onkilll(inst, data)
	local victim = data.victim
	    if not (victim:HasTag("prey") or
            victim:HasTag("veggie") or
            victim:HasTag("eyeplant") or
            victim:HasTag("insect") or			
            victim:HasTag("structure")) then
		   if math.random() < normalchance then
					inst.level = inst.level + 1
 					if victim:HasTag("spider1x") or victim:HasTag("hound1x") then
					--inst.level = inst.level + 1
					elseif victim:HasTag("spider2x") or victim:HasTag("hound2x") then
					--inst.level = inst.level + 1
						if math.random() < 0.1 then
					SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("exp").Transform:SetPosition(victim:GetPosition():Get())
					--SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
					end	
					elseif victim:HasTag("spider3x") or victim:HasTag("hound3x") then
					--inst.level = inst.level + 2
						if math.random() < 0.15 then
					SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("exp").Transform:SetPosition(victim:GetPosition():Get())
					--SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
					end
					elseif victim:HasTag("spider4x") or victim:HasTag("hound4x") then
					--inst.level = inst.level + 3
						if math.random() < 0.2 then
					SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("exp").Transform:SetPosition(victim:GetPosition():Get())
					--SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
					end
					end 
					levelexp(inst)
					end
					end
		 if (victim:HasTag("epic") or victim:HasTag("deerclops") or 
			 victim:HasTag("bearger") or victim:HasTag("moose") or 
							  victim:HasTag("dragonfly")  ) then
					if victim:HasTag("small_giant1x") then
					inst.level = inst.level + 5
					inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_EPIC.."\n [EXP] + 5 ")

					elseif victim:HasTag("small_giant2x") then
					inst.level = inst.level + 10
					inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_EPIC.."\n [EXP] + 10 ")
											if math.random() < 0.2 then
					SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
											elseif math.random() < 0.02 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("purplegem").Transform:SetPosition(victim:GetPosition():Get())
					end
					elseif victim:HasTag("small_giant3x") then
					inst.level = inst.level + 15
					inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_EPIC.."\n [EXP] + 15 ")
											if math.random() < 0.3 then
					SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
											elseif math.random() < 0.05 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("purplegem").Transform:SetPosition(victim:GetPosition():Get())
					end
					elseif victim:HasTag("small_giant4x") then
					inst.level = inst.level + 20
					inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_EPIC.."\n [EXP] + 20 ")
											if math.random() < 0.4 then
					SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
											elseif math.random() < 0.1 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("amulet").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("purplegem").Transform:SetPosition(victim:GetPosition():Get())
					end
					elseif victim:HasTag("giant1x") then
					inst.level = inst.level + 10
					inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_GIANT.."\n [EXP] + 10 ")
					SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
						if math.random() < 0.2 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("amulet").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
					end
					elseif victim:HasTag("giant2x") then
					inst.level = inst.level + 20
					inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_GIANT.."\n [EXP] + 20 ")
					SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("redgem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
						if math.random() < 0.5 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("bluegem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
						elseif math.random() < 0.15 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("amulet").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("purplegem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
						elseif math.random() < 0.05 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("mandrake").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
					end
					elseif victim:HasTag("giant3x") then
					inst.level = inst.level + 30
					inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_GIANT.."\n [EXP] + 30 ")
					SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("redgem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("bluegem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
						if math.random() < 0.5 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("amulet").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("purplegem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
						elseif math.random() < 0.3 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("greengem").Transform:SetPosition(victim:GetPosition():Get())		
					SpawnPrefab("purplegem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
						elseif math.random() < 0.2 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("mandrake").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
					end
					elseif victim:HasTag("giant4x") then
					inst.level = inst.level + 40
					inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_GIANT.."\n [EXP] + 40 ")
					SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("redgem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("bluegem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("purplegem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("amulet").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
					if math.random() < 0.7 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("amulet").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("purplegem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("greengem").Transform:SetPosition(victim:GetPosition():Get())	
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())					
						elseif math.random() < 0.6 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("purplegem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("yellowgem").Transform:SetPosition(victim:GetPosition():Get())	
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
						elseif math.random() < 0.5 then
					SpawnPrefab("glowdust").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("orangegem").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("mandrake").Transform:SetPosition(victim:GetPosition():Get())
					SpawnPrefab("goldnugget").Transform:SetPosition(victim:GetPosition():Get())
					end
					end 
					levelexp(inst)
  					end					
		  if (victim:HasTag("prey") or victim:HasTag("insect") or victim:HasTag("frog")) then
			if math.random() < normalchance then
    				inst.level = inst.level + 1
					levelexp(inst)
					end					
			end
			end

local function ondeath(inst)
local dark2 = SpawnPrefab("statue_transition_2")
local pos = Vector3(inst.Transform:GetWorldPosition())
local poo = SpawnPrefab("musha_egg_arong")
dark2.Transform:SetPosition(pos:Get())
if inst.components.container then
inst.components.container:DropEverything() 
	end 
if inst.components.inventory then 
inst.components.inventory:DropEverything(true)
end	
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
end
	
------------------   
----------hat-----

local function OnDropped(inst,data)
inst.picked = false
local player = GetPlayer()
if (player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating")) then
inst.SoundEmitter:PlaySound("dontstarve/creatures/beefalo_baby/yell")
inst.SoundEmitter:PlaySound("dontstarve/wilson/harvest_berries")
SpawnPrefab("splash_water_drop").Transform:SetPosition(inst:GetPosition():Get())		
SpawnPrefab("splash_footstep").Transform:SetPosition(inst:GetPosition():Get())
inst:DoTaskInTime( 0.5, function() player.components.inventory:GiveItem(inst) end)
else
   inst:RemoveTag("hat")
inst.peace = false
inst.active_hunt = false
inst.defense = false
inst.hat = false
local pos = Vector3(player.Transform:GetWorldPosition())
inst.Transform:SetPosition(pos:Get())
--inst.sg:GoToState("run")
--inst.components.follower:SetLeader(player)
inst.following = true
inst.staying = false
inst.sleep_on = false
inst.sleeping = false
--inst:RemoveComponent("inventoryitem")
--inst:RemoveComponent("equippable")

--inst.components.machine:TurnOff()
if inst.components.container then
inst.components.container:Close()
inst.components.container.canbeopened = true	
end
end
end

local function OnPutInInventory(inst)
    inst.components.growable:StopGrowing()
	inst.picked = true
	if not inst.hat then
	--inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x0)")
	end
	inst.hat = true
     inst:RemoveTag("hat")
	
inst.peace = false
inst.active_hunt = false
inst.defense = false
if inst.light_on then
inst.components.machine:TurnOff()
end

if inst.components.container then
inst.components.container:Close()
inst.components.container.canbeopened = false	
end
--stop working
local player = GetPlayer()
	inst.fightn = false
	inst.peace = false
	
	player.working = false
	inst.pick1 = false
	inst.working_food = false
	inst.drop = true
	

end


local function onarong(inst, owner)
if inst.components.container then
inst.components.container.canbeopened = true
end
	inst.hat = true

	    owner.AnimState:OverrideSymbol("swap_hat", "hat_house", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

end

    local function offarong(inst, owner)

        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

    end
	

local function taunting(inst, data)
local leader = inst.components.follower.leader
--[[if inst.yamche_leader and leader and not (inst.peace and inst.active_hunt and inst.defense) and inst.components.health:GetPercent() >= .3 and leader.components.health:GetPercent() >= .5 then

	local x,y,z = inst.Transform:GetWorldPosition()	
	local enemy = TheSim:FindEntities(x, y, z, 8)
	for k,v in pairs(enemy) do
	if v and v.components.combat and leader.components.combat.target == v then
		if not ( v:HasTag("shadowcreature") or v:HasTag("butterfly") or v:HasTag("bird")) then
		v.components.combat.target = inst
		inst.components.combat.target = v		
		SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("dr_hot_loop").Transform:SetPosition(v:GetPosition():Get())
		inst.sg:GoToState("grow_up_pop")
			if not inst.components.health:IsDead() then
			inst.components.health:DoDelta(1)
			end
		end
	end
	end
end]]
if inst.yamche_leader and leader and not (inst.peace and inst.active_hunt and inst.defense) and inst.components.health:GetPercent() >= .3 and leader.components.health:GetPercent() < .5 then
	local x,y,z = inst.Transform:GetWorldPosition()	
	local enemy = TheSim:FindEntities(x, y, z, 8)
	for k,v in pairs(enemy) do
	if v and v.components.combat and v.components.combat.target == leader then
		if not ( v:HasTag("shadowcreature") or v:HasTag("butterfly") or v:HasTag("bird") or v:HasTag("prey") or v:HasTag("companion") or v:HasTag("player") or v:HasTag("character")) then
		v.components.combat.target = inst	
		inst.components.locomotor:StopMoving()
		inst.sg:GoToState("grow_up_pop")
		SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("dr_hot_loop").Transform:SetPosition(v:GetPosition():Get())
			if not inst.components.health:IsDead() then
			inst.components.health:DoDelta(8)
			end
		end
	end
	end
end 

end	
	----------------------------
	
local function FollowGrownArong(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 20, {"arong"})
for k,v in pairs(ents) do
    if v.components.leader and not (inst.mount or v.mount) then
        v.components.leader:AddFollower(inst)
		elseif v.mount and v.components.leader:AddFollower(inst) then
		inst.components.follower:SetLeader(nil)
		elseif v.components.rideable and v.components.rideable:GetRider() ~= nil then
		inst.components.follower:SetLeader(nil)
    end
end 
end

local function InShadow(inst, data)
local x,y,z = inst.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 15)
for k,v in pairs(ents) do
if inst.sleep_on and v.components.combat and v.components.combat.target == inst and not (v:HasTag("berrythief") or v:HasTag("prey") or v:HasTag("bird") or v:HasTag("butterfly")) then
		v.components.combat.target = nil
 end
 end end
 
local function OnRanger(inst, data)
local rangechance = 0.1
local rangechance2 = 0.75
local other = data.target

 if other and inst.ranger2 and inst.yamche_lightning then
        SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-20)
		inst.components.health:DoDelta(-5)
		inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_COST.." -5")
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not inst.light_on then inst.AnimState:SetBloomEffectHandle( "" ) end
	inst.ranger2 = false inst.yamche_lightning = false
inst.components.combat:SetRange(2, 3)	end

    if other and not inst.lv1 and not inst.ranger3 and not inst.ranger2 and math.random() < rangechance then
inst.ranger2 = true 
	local sparks = SpawnPrefab("sparks")
	--inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
	local pos = Vector3(inst.Transform:GetWorldPosition())
	sparks.Transform:SetPosition(pos:Get())
	--inst.components.talker:Say("Full charged [Lightning Strike]")
	
 inst.components.combat:SetRange(10,13)
 
    elseif other and not inst:HasTag("level1") and inst.ranger3 and not inst.ranger2 and math.random() < rangechance2 then
inst.ranger2 = true 
	local sparks = SpawnPrefab("sparks")
	--inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
	local pos = Vector3(inst.Transform:GetWorldPosition())
	sparks.Transform:SetPosition(pos:Get())
	--inst.components.talker:Say("Full charged [Lightning Strike]")
	
 inst.components.combat:SetRange(10,13)
 
    elseif other and inst.lv2 and inst.ranger2 then
            SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-10)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not inst.light_on then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    elseif other and inst.lv3 and inst.ranger2 then
            SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-20)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not inst.light_on then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    elseif other and inst.lv4 and inst.ranger2 then
            SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-30)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not inst.light_on then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    elseif other and inst.lv5 and inst.ranger2 then
            SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-40)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not inst.light_on then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    elseif other and inst.lv6 and inst.ranger2 then
            SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-50)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not inst.light_on then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    end
	    if other and other.components.freezable and inst.light_on then
        other.components.freezable:AddColdness(0.2)
		    other.components.freezable:SpawnShatterFX()
				end
end

local function OnHitfreeze(inst, data)
local other = data.target
   local pos = other:GetPosition()
   if inst.ranger3 then
    inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	GetClock():DoLightningLighting(.9)
	SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
	SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	SpawnPrefab("sparks").Transform:SetPosition(other:GetPosition():Get())
    if other and other.components.freezable then
	inst:DoTaskInTime(0.5, function()  SpawnPrefab("lightning_blue").Transform:SetPosition(other:GetPosition():Get())
        other.components.freezable:AddColdness(0.5)
		    other.components.freezable:SpawnShatterFX()
				end)
				end
	elseif other and other.components.freezable and inst.ranger2 then
		inst:DoTaskInTime(0.5, function()  SpawnPrefab("lightning_blue").Transform:SetPosition(other:GetPosition():Get())
        other.components.freezable:AddColdness(0.5)
		    other.components.freezable:SpawnShatterFX()
			end)
	--if inst.DLC or inst.DLC2 then	
  	local fx2 = SpawnPrefab("groundpoundring_fx")
	 	  fx2.Transform:SetScale(0.4, 0.4, 0.4)
	  	  fx2.Transform:SetPosition(other:GetPosition():Get())
			--end
			
	elseif other and other:HasTag("player") then
	inst.components.combat:SetTarget(nil)
	inst.components.combat:GiveUp()
    end

    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
    end
end

function Hunt_check(inst, data)
if inst.active_hunt then
--inst.components.playerprox:SetDist(4, 5)
local random = 0.15
if math.random() < random and not inst.yamche_lightning then
inst.yamche_lightning = true
inst.bloom = true
end	end

if inst.yamche_lightning and inst.components.health:GetPercent() >=0.4 then 
inst.ranger2 = true
inst.components.combat:SetRange(10,13)
if inst.bloom then
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
--inst.components.talker:Say("[Lightning -On]")
--inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
--inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
inst.bloom = false
end
elseif inst.yamche_lightning and inst.components.health:GetPercent() <0.4 then
--scheduler:ExecuteInTime(3, function() inst.components.talker:Say("[Not enough cost]")end)
inst.yamche_lightning = false
end end

local function Sparkshield_heal(inst, attacked, data) 
if not inst.components.health:IsDead() then
inst.components.health:DoDelta(5)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
end end

local function on_sparkshield( attacked, data)
	if data.attacker.components.health and not data.attacker:HasTag("thorny") then
            data.attacker.components.health:DoDelta(-8)
SpawnPrefab("sparks").Transform:SetPosition(data.attacker:GetPosition():Get())
end end


local function resist(inst, data)

	if not inst.light_on and inst.components.hunger:GetPercent() > 0.1 and inst.components.health:GetPercent() < 0.2 then
	inst.components.machine:TurnOn()
	end

if inst.components.health:GetPercent() <= 1 and  inst.components.health:GetPercent() > 0.7 then
        inst.components.freezable.wearofftime = 1.5

elseif inst.components.health:GetPercent() <= 0.7 and  inst.components.health:GetPercent() > 0.5 then
        inst.components.freezable.wearofftime = 0.5

elseif inst.components.health:GetPercent() <= 0.5 and  inst.components.health:GetPercent() > 0.2 then
        inst.components.freezable.wearofftime = 0.25

elseif inst.components.health:GetPercent() <= 0.2 then
        inst.components.freezable.wearofftime = 0
end
end

function Power_check(inst, data)
local player = GetPlayer()
if not player.crazy and inst.components.follower and inst.components.follower.leader then
inst.components.follower.canaccepttarget = true
elseif player.crazy and inst.components.follower and inst.components.follower.leader then
inst.components.follower.canaccepttarget = false
end

--valkyrie arong

local danger = FindEntity(inst, 15, function(target) 
	return target:HasTag("monster") or (target.components.combat and target.components.combat.target == inst) end)
local in_battle = FindEntity(inst, 2, function(target) 
	return target:HasTag("monster") or (target.components.combat and target.components.combat.target == inst) end)
if (inst.lv5 or inst.lv6) and not danger and not inst.in_battle then
inst.valkyrie = false
elseif (inst.lv5 or inst.lv6) and in_battle and inst.components.health:GetPercent() <= 0.85 then
inst.valkyrie = true
end

--[[if inst.active_hunt then
inst.valkyrie = true
elseif not inst.active_hunt then
inst.valkyrie = false
end]]

-- valkyrie shield
	if inst.lv6 and inst.valkyrie then	
		if not inst.changed then
	inst.components.locomotor:StopMoving()
	inst.sg:GoToState("grow_up_pop")
	inst.AnimState:SetBuild("arong_grow1_v_build")
	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
	local scale = 0.55
    inst.Transform:SetScale(scale, scale, scale)
		inst.changed = true
		inst:ListenForEvent("attacked", on_sparkshield)
		inst:ListenForEvent("attacked", Sparkshield_heal)
		end
	elseif inst.lv6 and not inst.valkyrie then	
		if inst.changed then
	inst.sg:GoToState("grow_up_pop")
	--inst.AnimState:SetBuild("arong_grow1_build")
	inst.AnimState:SetBuild("arong_mini4_build")
	local scale = 0.45
    inst.Transform:SetScale(scale, scale, scale)
	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
			inst.changed = false
			inst:RemoveEventCallback("attacked", on_sparkshield)
			inst:RemoveEventCallback("attacked", Sparkshield_heal)
		end
	end
		if inst.lv5 and inst.valkyrie then	
		if not inst.changed then
	inst.components.locomotor:StopMoving()
	inst.sg:GoToState("grow_up_pop")
	inst.AnimState:SetBuild("arong_mini4_v_build")
	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		inst.changed = true
		inst:ListenForEvent("attacked", Sparkshield_heal)
		end
	elseif inst.lv5 and not inst.valkyrie then	
		if inst.changed then
	inst.sg:GoToState("grow_up_pop")
	inst.AnimState:SetBuild("arong_mini4_build")
	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
			inst.changed = false
			inst:RemoveEventCallback("attacked", Sparkshield_heal)
		end
	end

	if inst.components.health:GetPercent() >= .5 then
    inst.components.combat:SetAttackPeriod(2)
	inst.ranger3 = false
	if not inst.yamche_lightning then
	inst.components.combat:SetRange(2, 3)
	end
	elseif inst.components.health:GetPercent() < .5 then
	inst.components.combat:SetAttackPeriod(6)
	inst.ranger3 = true 
	inst.components.combat:SetRange(10,13)
	end
end 
   
  
  
local function CanShareTarget(dude)
    return dude:HasTag("yamche") or dude:HasTag("ghosthound")
       -- and not dude:IsInLimbo()
        and not (dude.components.health:IsDead() or dude.components.health:GetPercent() <= .5)
end
 
local function yamche_hunt(inst)
    local dist = 15
    if inst.active_hunt then
    return FindEntity(inst, dist, function(guy)
        return inst.components.combat:CanTarget(guy)
    end,
    nil,
    {"musha","player","wall","houndmound","structure","companion","yamche","beefalo","koalefant","pig","bee","butterfly","rocky","bird","statue","character","abigail"})
	end
 --if not inst.active_hunt then
end 	

local function KeepTarget(isnt, target)
    return target and target:IsValid() and not target:HasTag("player")
	
end
--[[
local function KeepTarget(inst, target)
  return inst.components.combat:CanTarget(target)
  end]]

local function OnNewTarget(inst, data)
 local other = data.target
    if other and other:HasTag("player") then
	return
	
elseif inst.sleep_on then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()

end
end

 local function OnAttacked(inst, data)
inst.components.combat:SuggestTarget(data.attacker)
inst.components.combat:ShareTarget(data.attacker, 8, CanShareTarget, 5)
-- inst.components.combat:ShareTarget(data.attacker, 3, function(dude) return dude:HasTag("musha") or dude:HasTag("companion")  and not dude.components.health:IsDead() end, 5)
 if data.attacker and data.attacker:HasTag("player") then
 inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
end end

local function leader_yamche(inst, data)

local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 20, {"yamche"})
for k,v in pairs(ents) do

 if v.yamche_leader and not v.sleep_on and v.active_hunt and not v.peace and not v.defense then
inst.peace = false
inst.active_hunt = true
inst.defense = false
 if inst.order then
 inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_OFFENSE)
 SpawnPrefab("dr_hot_loop").Transform:SetPosition(inst:GetPosition():Get())
 inst.order = false
 end
 
 elseif v.yamche_leader and not v.sleep_on and not v.active_hunt and v.peace and v.defense then
inst.peace = true
inst.active_hunt = false
inst.defense = true
inst.components.combat:GiveUp()
 if inst.order then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_AVOID)
SpawnPrefab("dr_warm_loop_2").Transform:SetPosition(inst:GetPosition():Get())
 inst.order = false
 end
 
 elseif v.yamche_leader and not v.sleep_on and not v.active_hunt and not v.peace and not v.defense then
inst.peace = false
inst.active_hunt = false
inst.defense = false
 if inst.order then
  inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_DEFFENSE)
 SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())
  inst.order = false
  
end 
end 
end 

if not inst.sg:HasStateTag("eating") then
inst.SoundEmitter:KillSound("eating")
end	
end
--[[
local function leader_yamche(inst, data)
local player = GetPlayer()
if player.components.leader:IsFollower(inst) and not inst.yamche_leader then

local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 20, {"yamche_leader"})
for k,v in pairs(ents) do
 if v.yamche_leader and not v.sleep_on and v.active_hunt and not v.peace and not v.defense then
inst.peace = false
inst.active_hunt = true
inst.defense = false
  
 elseif v.yamche_leader and not v.sleep_on and not v.active_hunt and v.peace and v.defense then
inst.peace = true
inst.active_hunt = false
inst.defense = true
 
 elseif v.yamche_leader and not v.sleep_on and not v.active_hunt and not v.peace and not v.defense then
inst.peace = false
inst.active_hunt = false
inst.defense = false
 
end end end
end]]

local function hound_hunt(inst)

if inst.components.follower.leader and inst.follow and not inst.active_hunt then
inst.components.combat:GiveUp()
end 

    if inst.active_hunt then 
	if inst.DLC then
inst.components.health:SetAbsorptionAmount(0.6)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.6)
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
inst.components.health:SetAbsorptionAmount(0.95)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.95)
end 

    elseif not inst.active_hunt and not inst.peace then
	if inst.DLC then
inst.components.health:SetAbsorptionAmount(0.7)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0.7)
end end

end 	

local function flower_shield(inst, attacked, data) 
 if not inst.components.health:IsDead() and not inst.DLC then
    if inst.components.health:GetPercent() >= .8 then
	SpawnPrefab("dr_warm_loop_1").Transform:SetPosition(inst:GetPosition():Get())	
    elseif inst.components.health:GetPercent() < .8 and inst.components.health:GetPercent() >= .6 then
	SpawnPrefab("dr_warm_loop_2").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.components.health:GetPercent() < .6 and inst.components.health:GetPercent() >= .4 then
	SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.components.health:GetPercent() < .4 then
	SpawnPrefab("dr_hot_loop").Transform:SetPosition(inst:GetPosition():Get())
	end
elseif not inst.components.health:IsDead() and inst.DLC then
    if inst.components.health:GetPercent() >= .8 then
	SpawnPrefab("green_leaves").Transform:SetPosition(inst:GetPosition():Get())	
    elseif inst.components.health:GetPercent() < .8 and inst.components.health:GetPercent() >= .6 then
	SpawnPrefab("yellow_leaves").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.components.health:GetPercent() < .6 and inst.components.health:GetPercent() >= .4 then
	SpawnPrefab("orange_leaves").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.components.health:GetPercent() < .4 then
	SpawnPrefab("red_leaves").Transform:SetPosition(inst:GetPosition():Get())
	end	end
 end

--[[local ValidItems = {
 "goldnugget", "rocks", "cutstone", "nitre", "flint", "thulecite", "thulecite_pieces", "marble", "redgem", "purplegem", "bluegem", "yellowgem", "greengem", "orangegem",    "log", "boards", "cutgrass", "dug_grass", "rope", "twigs", "dug_sapling", "gears", "spidergland", "healingsalve", "mosquitosack", "silk", "spidereggsack", "ash", "poop", "guano", "charcoal", "beefalowool", "cutreeds", "houndstooth", "ice", "stinger", "livinglog", "lightbulb", "slurper_pelt", "honeycomb",
 "turf_road", "turf_rocky", "turf_forest", "turf_marsh", "turf_grass", "turf_savanna", "turf_dirt", "turf_woodfloor", "turf_carpetfloor", "turf_checkerfloor", "turf_cave", "turf_fungus", "turf_fungus_red", "turf_fungus_green", "turf_sinkhole", "turf_underrock", "turf_mud", 
  "walrus_tusk", "houndstooth", "wormlight_lesser", "wormlight", "nightmarefuel", "manrabbit_tail", "beardhair", "trinket_1", "trinket_2", "trinket_3", "trinket_4", "trinket_5", "trinket_6", "trinket_7",  "trinket_8", "trinket_9", "trinket_10", "trinket_11", "trinket_12",  "coontail", "tentaclespots", "beefalowool", "horn", "feather_robin", "feather_robin_winter", "feather_crow", "boneshard", "transistor",   "boomerang", "goose_feather", "drumstick", 
  "bearger_fur", "dragon_scales", 
  "acorn", "pinecone",

"coconut", "coral", "bamboo", "dug_bambootree", "vine", "dug_bush_vine", "limestone", "hail_ice", "obsidian", "palmleaf", "snake_poison", "snake_skin", "messagebottle", "messagebottleempty", "fabric", 
}
	
local function ItemIsInList(item, list)
    for k,v in pairs(list) do
        if v == item or k == item then
            return true
        end
    end
end]]
	
local function Take_order(inst)
local player = GetPlayer()

if inst.DLC2 or SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
if inst.components.poisonable and inst:HasTag("poison") then
inst.components.poisonable:Cure(inst)
end end

if inst.components.container ~=nil and not inst.sg:HasStateTag("open") then 

if inst.components.container:IsFull() then 
	if not inst.item_max_full then 
		inst.item_max_full = true
		if inst.pick1 then
			inst.item_1 = true
	if not inst.sleep_on and not inst.campfire and not inst.sleep_f then
	--inst.components.hunger:SetRate(0.015)
	end

			if not inst.item_1 then 
			--inst.sg:GoToState("command")
			inst.item_1 = true
			end
		if not inst.light_on then
		inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV_FULL.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x1)")
		inst.components.hunger:SetRate(0.1)
		elseif inst.light_on then
		inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV_FULL.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_LIGHT.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x5)")
		inst.components.hunger:SetRate(2)
		end
			inst.pick1 = false
			inst.droping = false
			inst.working_food = false
			inst.drop = true
		end
	end
	
else 
	if inst.item_max_full then 
		inst.item_max_full = false
		if not inst.sleep_on and not inst.campfire and not inst.sleep_f then
		inst.components.hunger:SetRate(0.1)
		end
	end
end
end

end

local function on_close(inst)
local player = GetPlayer()
local leader = inst.components.follower.leader
inst.follow = false
inst.player_near = true
--player:AddTag("yamche") 
if player:HasTag("spiderwhisperer") and not inst:HasTag("spider") then
inst:AddTag("spider") 
elseif not player:HasTag("spiderwhisperer") and inst:HasTag("spider") then
inst:RemoveTag("spider") 

end
if not inst.pick1 and not inst.working_food then
    inst.components.locomotor.walkspeed = 3
    inst.components.locomotor.runspeed = 16
	end

if not player.components.health:IsDead() and not inst.staying and leader and leader.components.leader:CountFollowers("arongb") == 0 then
inst.components.follower:SetLeader(player)
inst.following = true
inst.staying = false


elseif not player.components.health:IsDead() and not inst.staying and leader and leader.components.leader:CountFollowers("arongb") > 1 then
inst.components.follower:SetLeader(nil)
inst.following = false
inst.staying = true
end

if not inst.sleep_on then
inst.MiniMapEntity:SetIcon( "" )
end
inst.follow = false
inst.components.locomotor.pathcaps = { ignorecreep = false }
end
 
local function on_far(inst)
inst:RemoveTag("character")
inst.player_near = false
if not inst.pick1 and not inst.working_food then
   inst.components.locomotor.walkspeed = 4
   inst.components.locomotor.runspeed = 16
   end
	
local leader = inst.components.follower.leader
--[[]]
if leader == nil and not inst.following then
inst.components.follower:SetLeader(nil)
inst.following = false
inst.staying = true
end
--]]
if leader and (leader.sg:HasStateTag("rowing") or leader.sg:HasStateTag("sailing") or leader.sg:HasStateTag("sail") or leader.sg:HasStateTag("row") or leader.sg:HasStateTag("boating")) then
inst.SoundEmitter:PlaySound("dontstarve/creatures/beefalo_baby/yell")
inst.components.follower:SetLeader(nil)
inst.following = false
inst.staying = true
end
	if inst.lv1 or inst.baby then
inst.MiniMapEntity:SetIcon( "arongbaby.tex" )
	elseif inst.lv2 then
inst.MiniMapEntity:SetIcon( "mini_arong.tex" )	
	elseif inst.lv3 or inst.lv4 or inst.lv5 then
inst.MiniMapEntity:SetIcon( "mini_arong2.tex" )	
	elseif inst.lv6 then
inst.MiniMapEntity:SetIcon( "grow_arong.tex" )	
	end
	
if leader then
inst.follow = true
end
if inst.follow and leader and not inst.sg:HasStateTag("running") then
   if inst.components.sleeper:IsAsleep() then
      inst.sg:GoToState("wake")
	  end
inst.sleep_on = false
inst.sleeping = false
inst.sg:GoToState("run")
end
if not inst.active_hunt then
inst.components.combat:GiveUp()
end

inst.components.locomotor.pathcaps = { ignorecreep = true }
end


local function OnOpen(inst)
inst.openc = true

if not inst.components.health:IsDead() then

	inst.components.combat:SetTarget(nil)
	inst.components.combat:GiveUp()
if not inst.components.sleeper:IsAsleep() then
inst.sg:GoToState("pleased")
elseif inst.components.sleeper:IsAsleep() then
inst.sg:GoToState("shaved")
end
inst.SoundEmitter:PlaySound("dontstarve/wilson/harvest_berries")
inst.opening = true
local player = GetPlayer()
	
	

if inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
end
if inst.components.freezable:IsFrozen() then
        inst.components.freezable:Unfreeze()
    end
end 
end 

local function OnClose(inst) 
inst.openc = false
    if not inst.components.health:IsDead() then

inst.opening = true
--[[	if inst.components.inventory and (inst.DLC2 or SaveGameIndex:IsModeShipwrecked()) then 
	inst.components.inventory.acceptitems = true 
	
	end]]


inst.SoundEmitter:PlaySound("dontstarve/wilson/harvest_berries")
    if inst.AnimState:IsCurrentAnimation("alert_idle") then
        inst.AnimState:PlayAnimation("alert_pre") end
	if not inst.components.sleeper:IsAsleep() then
inst.sg:GoToState("refuse")
elseif inst.components.sleeper:IsAsleep() then
inst.sg:GoToState("shaved")
end
	end
		end
 

local function on_follow(inst, data)

local player = GetPlayer()
local leader = inst.components.follower.leader
if not inst.sleep_on and leader and not leader.yamche_leader and leader.components.leader:CountFollowers("phoenix") == 0 then
if not inst.yamche_leader_tag then
player.yamche_leader = true
inst.yamche_leader = true
inst.yamche_leader_tag = true
if leader:HasTag("musha") then
	if leader.components.leader:CountFollowers("yamcheb") > 1 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_LEADER)
	end
end
	end
elseif not inst.sleep_on and leader and leader.yamche_leader and leader.components.leader:CountFollowers("phoenix") >= 1 then
if inst.yamche_leader_tag then
leader.yamche_leader = false
inst.yamche_leader = false
inst.yamche_leader_tag = false
if player:HasTag("musha") then
--inst.components.talker:Say("[Leader]\n(Off)")
end
	end
end 

if not leader then
if inst.yamche_leader_tag then
player.yamche_leader = false
inst.yamche_leader = false
inst.yamche_leader_tag = false
--inst.components.talker:Say("[Leader]\n(Off)")
end end

if inst.components.follower.leader then
inst.arong_follow = true
elseif not inst.components.follower.leader then
inst.arong_follow = false
end
--[[local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 15, {"musha"})
for k,v in pairs(ents) do 
if inst.components.follower.leader and not v.sleep_on and not v.tiny_sleep then
  if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp() end
end 
end]]
if inst.yamche then
--inst.order = true
if inst.components.sleeper:IsAsleep() then
inst.components.sleeper:WakeUp() end
if inst.following then
inst.sg:GoToState("flatulate")
inst.SoundEmitter:PlaySound("dontstarve/creatures/beefalo_baby/tail_swish")
inst.SoundEmitter:PlaySound("dontstarve/creatures/beefalo_baby/curious")
elseif inst.staying then
inst.sg:GoToState("bellow")
elseif not inst.following and not inst.staying then
inst.sg:GoToState("bellow")
end
if inst.active_hunt then
 	SpawnPrefab("dr_hot_loop").Transform:SetPosition(inst:GetPosition():Get())	
elseif inst.peace or inst.defense then	
	SpawnPrefab("dr_warm_loop_2").Transform:SetPosition(inst:GetPosition():Get())	
elseif not inst.active_hunt and not inst.peace and not inst.defense then	
	SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())	
end	
inst.yamche = false
end
if inst.sleep_on then
if not inst:HasTag("notarget") then
InShadow(inst) 
inst:AddTag("notarget")
inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
end
elseif not inst.sleep_on then
inst:RemoveTag("notarget")
end

--Checklevel
    if inst.yamcheinfo and inst.lv1 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 1\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/20\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..":  2")
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.lv2 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 2\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/40\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..":  4")
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.lv3 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 3\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/80\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..":  6")
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.lv4 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 4\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/160\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..":  9")
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.lv5 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 5\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/340\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..":  12")
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.lv6 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 6\n[Health]: ".. (inst.level + 600).."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..":  16")
    inst.yamcheinfo = false 

end

-- nature arong
--[[local x,y,z = inst.Transform:GetWorldPosition()
local light1 = TheSim:FindEntities(x,y,z, 20, {"musha_light"})
for k,v in pairs(light1) do
if v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("musha_light") == 0 then
inst.components.leader:AddFollower(v)
end end]]
--[[
local x,y,z = inst.Transform:GetWorldPosition()
local grass = TheSim:FindEntities(x,y,z, 3, {"greenygrass"})
for k,v in pairs(grass) do
if not v.changed then
	if not SaveGameIndex:IsModeShipwrecked() then
v.entity:AddAnimState():SetBuild("grassgreen_build")
	end
SpawnPrefab("pine_needles").Transform:SetPosition(v:GetPosition():Get())
v.changed = true
end
end]]
end 

local function onspawnfn(inst, spawn)
if not inst.sleeping and not inst.sg:HasStateTag("busy") then
 inst.sg:GoToState("pleased")
 inst.SoundEmitter:PlaySound("dontstarve/creatures/beefalo_baby/curious")
 end
	end
	
local function eatingsound(inst)
 if inst.sg:HasStateTag("graze") then
  inst.SoundEmitter:PlaySound("dontstarve/wilson/eat", "eating")
	end
end

local function OnEat(inst, food)
  --inst.sg:GoToState("eat")
  inst.SoundEmitter:KillSound("eating")
  inst.sg:GoToState("graze")
  inst.SoundEmitter:PlaySound("dontstarve/wilson/eat", "eating")
  inst.components.hunger:DoDelta(5)
  --inst.SoundEmitter:PlaySound("dontstarve/creatures/beefalo_baby/grunt")

 if inst.components.hunger:GetPercent() >= 0.99 and not inst.light_on then
	
 	 inst.components.hunger:DoDelta(-200) 
	 local fx = SpawnPrefab("poopcloud")
	fx.Transform:SetScale(0.45, 0.45, 0.45)
	fx.Transform:SetPosition(inst:GetPosition():Get())
	
		inst.level = inst.level + 1
			levelexp(inst)
--if inst.components.follower.leader == nil then
 if math.random() < 0.25 then
local grass = SpawnPrefab("grass")
local scale = 0.6
grass.Transform:SetScale(scale, scale, scale)
onspawnfn(inst)
	if not inst.DLC and not inst.DLC2 then
inst:DoTaskInTime( 1, function() 
grass.Transform:SetPosition(inst:GetPosition():Get()) 
SpawnPrefab("pine_needles").Transform:SetPosition(grass:GetPosition():Get()) 
grass.AnimState:PlayAnimation("grow") end)
	elseif inst.DLC or inst.DLC2 then
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(1,4), 6, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
inst:DoTaskInTime( 1, function() if offset then
grass.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
SpawnPrefab("pine_needles").Transform:SetPosition(grass:GetPosition():Get()) 
grass.AnimState:PlayAnimation("grow") end end)
	end
	else
 
	local fx2 = SpawnPrefab("small_puff")
	fx2.Transform:SetScale(0.4, 0.4, 0.4)
	fx2.Transform:SetPosition(inst:GetPosition():Get())
	
 	local poo = SpawnPrefab("poop")
	poo.Transform:SetScale(0.45, 0.45, 0.45)
	poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
	end
--end	
end

if food.components.edible.hungervalue >= 150 and food.components.edible.healthvalue >= 100 then 
	inst.level = inst.level + 100
	levelexp(inst)
inst.components.talker:Say(" !!!!!!!!!! ")
end

    -- food heal
    if inst.components.health then
        inst.components.health:DoDelta(inst.components.health.maxhealth * .05, nil, food.prefab)
        inst.components.combat:SetTarget(nil)
     end
 end	
		
local function ShouldAcceptItem(inst, item)
	if item.components.edible and inst.components.hunger and inst.components.eater then
        return not inst.hat and inst.components.eater:CanEat(item) --[[and inst.components.hunger:GetPercent() <= 0.9]] and not inst.growup
    end
end

local function OnGetItemFromPlayer(inst, giver, item)
    if inst.components.eater:CanEat(item) then
        inst.components.eater:Eat(item)
    end
end

local function OnRefuseItem(inst, item)
    inst.sg:GoToState("refuse")
    if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
    end
end


local function Eating(inst)
local danger = FindEntity(inst, 6, function(target) 
                return (target:HasTag("monster") and not target:HasTag("player") and not inst:HasTag("spiderwhisperer"))
                    or (target:HasTag("monster") and not target:HasTag("player") and inst:HasTag("spiderwhisperer") and not target:HasTag("spider"))
                    or (target:HasTag("pig") and not target:HasTag("player") and inst:HasTag("spiderwhisperer"))
                    or (target.components.combat and target.components.combat.target == inst) end)
if danger then
		--inst.components.talker:Say("[Monster !]")			
elseif not danger and not inst.sleeping and not inst.hat and not inst.pick1 and not inst.working_food and not inst.sg:HasStateTag("attack") and not inst.sg:HasStateTag("hit") and not inst.sg:HasStateTag("moving") and not inst.sg:HasStateTag("running") then

local Arong = inst:GetPosition()
local turf = GetWorld().Map:GetTileAtPoint(Arong.x, Arong.y, Arong.z)
if turf == GROUND.FOREST or turf == GROUND.GRASS or turf == GROUND.SAVANNA or turf == GROUND.DECIDUOUS or turf == GROUND.JUNGLE or turf == GROUND.MEADOW or turf == GROUND.RAINFOREST or turf == GROUND.DEEPRAINFOREST or turf == GROUND.LAWN or turf == GROUND.GASJUNGLE or turf == GROUND.FIELDS or turf == GROUND.FUNGUS or turf == GROUND.FUNGUSRED or turf == GROUND.FUNGUSGREEN or turf == GROUND.SUBURB then
--inst.components.talker:Say("[Yam]") 
inst.sg:GoToState("graze_empty") 
inst.components.hunger:DoDelta(5) 
inst.graze = true 
--inst.sg:GoToState("graze_empty")
if inst.no_food then
inst.components.talker:Say(STRINGS.MUSHA_ARONG_CHECK_FOOD)
inst.sg:GoToState("flatulate") 
inst.no_food = false
end
--[[elseif not turf == GROUND.FOREST and not turf == GROUND.GRASS and not turf == GROUND.SAVANNA and not turf == GROUND.DECIDUOUS and not turf == GROUND.JUNGLE then]]
else	
inst.graze = false
inst.no_food = true
if math.random() < 0.5 then
inst.sg:GoToState("badfood")
inst:DoTaskInTime( 2, function() inst.sg:GoToState("refuse") end)	
elseif math.random() < 0.6 then
inst.sg:GoToState("badfood")
inst:DoTaskInTime( 2, function() inst.sg:GoToState("regurgitate") end)
	end	
end
if inst.components.follower.leader == nil and inst.components.hunger:GetPercent() >= .99 and not inst.light_on then
	 	 inst.components.hunger:DoDelta(-100) 
		inst.level = inst.level + 1
			levelexp(inst)
			
	 if math.random() < 0.5 then
local grass = SpawnPrefab("grass")
local scale = 0.45
grass.Transform:SetScale(scale, scale, scale)
onspawnfn(inst)
	if not inst.DLC and not inst.DLC2 then
inst:DoTaskInTime( 1, function() 
grass.Transform:SetPosition(inst:GetPosition():Get()) 
SpawnPrefab("pine_needles").Transform:SetPosition(grass:GetPosition():Get()) 
grass.AnimState:PlayAnimation("grow") end)
	elseif inst.DLC or inst.DLC2 then
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(1,4), 6, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
inst:DoTaskInTime( 1, function() if offset then
grass.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
SpawnPrefab("pine_needles").Transform:SetPosition(grass:GetPosition():Get()) 
grass.AnimState:PlayAnimation("grow") end end)
	end
	else
 
	local fx2 = SpawnPrefab("small_puff")
 	local fx = SpawnPrefab("poopcloud")
	fx2.Transform:SetScale(0.3, 0.3, 0.3)
	fx2.Transform:SetPosition(inst:GetPosition():Get())
	fx.Transform:SetScale(0.4, 0.4, 0.4)
	fx.Transform:SetPosition(inst:GetPosition():Get())
 	local poo = SpawnPrefab("poop")
	poo.Transform:SetScale(0.45, 0.45, 0.45)
	poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
	inst.sg:GoToState("shake")
	end
end	
end
end

local function summon_light(inst, data)

local spore = SpawnPrefab("musha_fern2")
--[[if inst.DLC or inst.DLC2 then]]

if inst.components.follower.leader and not inst.sleeping and not inst.sg:HasStateTag("busy") and not inst.sg:HasStateTag("attack") and not inst.sg:HasStateTag("hit") and not inst.sg:HasStateTag("moving") and not inst.sg:HasStateTag("running") and not inst.sg:HasStateTag("eating") then
		inst.sg:GoToState("pleased")
		
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(1,1), 1, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
	spore.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
	
	--end	
end
--[[if not inst.DLC and not inst.DLC2 then
		if inst.components.follower.leader and not inst.sleeping and not inst.sg:HasStateTag("busy") and not inst.sg:HasStateTag("attack") and not inst.sg:HasStateTag("hit") and not inst.sg:HasStateTag("moving") and not inst.sg:HasStateTag("running") and not inst.sg:HasStateTag("eating") then
		inst.sg:GoToState("pleased")
	spore.Transform:SetPosition(inst:GetPosition():Get())
		end
end]]

end

local function Sleeping(inst)
if inst.find_food then
Eating(inst)
inst.find_food = false
end
 local leader = inst.components.follower.leader
if leader == nil and inst.sleep_on and inst.components.hunger:GetPercent() >= .1 and GetClock():IsNight() then
inst.sleeping = true
	end
if leader == nil and inst.sleep_on and not GetClock():IsDay() then
inst.sleeping = true
	end
if leader == nil and inst.sleep_on and GetClock():IsDay() then
if inst.components.health:GetPercent() < .5 then
inst.sleeping = true
elseif inst.components.health:GetPercent() > .5 then
inst.sleeping = false
end
end
if not inst.sleep_on and leader then
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 4, {"musha"})
	for k,v in pairs(ents) do
if v.sleep_on or v.tiny_sleep then
inst.sleeping = true
elseif not v.sleep_on and not v.tiny_sleep then
inst.sleeping = false 
inst.sleep_on = false
end	
	end
end
if inst.hat then
inst.components.hunger:SetRate(0)
elseif not inst.hat then
if inst.sleeping then
inst.components.health:StartRegen(2, 1)
inst.components.hunger:SetRate(0)
elseif not inst.sleeping then
if not inst.light_on then
if inst.components.health:GetPercent() >= .3 then
if not inst.lv6 then
inst.components.health:StartRegen(1, 30)
elseif inst.lv6 then
inst.components.health:StartRegen(1, 10)
end
elseif inst.components.health:GetPercent() < .3 then
inst.components.health:StartRegen(1, 1)
end
elseif inst.light_on then 
inst.components.health:StartRegen(2, 1)
end
if not inst.light_on then
inst.components.hunger:SetRate(0.1)
end
end
end

end

	
local function ystarve(inst, data)
if inst.light_on and inst.components.hunger:GetPercent() < 0.1 then
inst.components.machine:TurnOff()
end

if not inst.light_on then
inst.Light:Enable(false)
elseif inst.light_on and inst.components.hunger:GetPercent() > 0 then
inst.Light:Enable(true)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
	if inst.components.hunger:GetPercent() >= .8 then
    inst.entity:AddLight()
	inst.Light:SetRadius(2.5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
	elseif inst.components.hunger:GetPercent() < .8 and inst.components.hunger:GetPercent() >= .5 then
    inst.entity:AddLight()
	inst.Light:SetRadius(2.3)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)	
	elseif inst.components.hunger:GetPercent() < .5 and inst.components.hunger:GetPercent() >= .25 then
    inst.entity:AddLight()
	inst.Light:SetRadius(2.1)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)		
	elseif inst.components.hunger:GetPercent() < .25 and inst.components.hunger:GetPercent() >= .1 then
    inst.entity:AddLight()
	inst.Light:SetRadius(1.9)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
	elseif inst.components.hunger:GetPercent() < .1 and inst.components.hunger:GetPercent() > 0 then
    inst.entity:AddLight()
	inst.Light:SetRadius(0.8)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)	
	end
elseif inst.light_on and inst.components.hunger:GetPercent() <= 0 then
inst.Light:Enable(false)
inst.components.machine:TurnOff()
end
end

 local function onuseyamche(inst, data)
--inst.picked = true
inst.SoundEmitter:PlaySound("dontstarve/common/minerhatAddFuel")
inst.light_on = true
ystarve(inst)
if not inst.lv6 then
inst.sg:GoToState("bellow")
end
inst.components.hunger:SetRate(2)
--Light(On)\nHealth regen Up\nHungry speed UP
inst.components.talker:Say(STRINGS.MUSHA_ARONG_BOOSTER)

if inst.lv6 and not inst.valkyrie then	
	inst.components.locomotor:StopMoving()
	inst.sg:GoToState("grow_up_pop")
	inst.AnimState:SetBuild("arong_grow1_build")
	local scale = 0.55
    inst.Transform:SetScale(scale, scale, scale)
	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())

elseif inst.lv6 and inst.valkyrie then	
	inst.sg:GoToState("grow_up_pop")
	inst.AnimState:SetBuild("arong_grow1_v_build")
	local scale = 0.55
    inst.Transform:SetScale(scale, scale, scale)
	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())

end
end 

-----------
local function offuseyamche(inst, data)
inst.SoundEmitter:PlaySound("dontstarve/common/minerhatOut")
inst.Light:Enable(false)
inst.light_on = false
inst.AnimState:SetBloomEffectHandle( "" )
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_LIGHT_OFF.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x1)")
inst.components.hunger:SetRate(0.1)

if not inst.lv6 then
inst.sg:GoToState("shake")
end

if inst.lv6 and not inst.valkyrie and inst.components.health:GetPercent() > 0.85 then	
	inst.components.locomotor:StopMoving()
	inst.sg:GoToState("grow_up_pop")
	inst.AnimState:SetBuild("arong_mini4_build")
	local scale = 0.45
    inst.Transform:SetScale(scale, scale, scale)
	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
end

end

local function pickup_arong(inst, data)
local leader = inst.components.follower.leader
if leader == nil and inst.components.inventoryitem == nil and not inst.components.equippable then
	inst:AddComponent("inventoryitem") 
	inst.components.inventoryitem.atlasname = "images/inventoryimages/mini_arong.xml"
	inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
	inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
	--inst.components.inventory.acceptitems = false 
	inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onarong)
    inst.components.equippable:SetOnUnequip(offarong) 
	
elseif leader and inst.components.inventoryitem ~= nil and inst.components.equippable then	
    inst:RemoveComponent("inventoryitem")
	inst:RemoveComponent("equippable")
end end


local function summon_apple(inst, data)

local danger = FindEntity(inst, 10, function(target) 
	return target:HasTag("monster") or (target.components.combat and target.components.combat.target == inst) end)
if inst.player_near and not danger and not inst.sleeping and not inst.hat and not inst.pick1 and not inst.working_food and not inst.sg:HasStateTag("attack") and not inst.sg:HasStateTag("hit") and not inst.sg:HasStateTag("moving") and not inst.sg:HasStateTag("running") then
if inst.time >= 100 then
local apple = SpawnPrefab("green_apple_plant")
onspawnfn(inst)
inst.time = inst.time - 100
	if not inst.DLC and not inst.DLC2 then
inst:DoTaskInTime( 1, function() 
apple.Transform:SetPosition(inst:GetPosition():Get()) 
SpawnPrefab("pine_needles").Transform:SetPosition(apple:GetPosition():Get()) 
apple.AnimState:PlayAnimation("grow") end)
	elseif inst.DLC or inst.DLC2 then
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(1,3), 3, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
inst:DoTaskInTime( 1, function() if offset then
apple.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
SpawnPrefab("green_leaves").Transform:SetPosition(apple:GetPosition():Get()) 
apple.AnimState:PlayAnimation("grow") end end)
	end		
end end 
end	  

local function time_check(inst, data)
if not inst.hat then
inst.time = inst.time + 0.25
if inst.time >= 100 then
summon_apple(inst)
end end
end	

local function ShouldWakeUp(inst)
--DefaultWakeTest(inst)
	return not inst.sleeping
end
local function ShouldSleep(inst)
--DefaultSleepTest(inst)
    return inst.sleeping 
end

local function Grow(inst)
    if inst.components.sleeper:IsAsleep() then
        inst.growUpPending = true
        inst.sg:GoToState("wake")
    else
        inst.sg:GoToState("grow_up")
    end
end

local function GetGrowTime()
    --return GetRandomWithVariance(TUNING.BABYBEEFALO_GROW_TIME.base, TUNING.BABYBEEFALO_GROW_TIME.random)
	return 1  
end

local function SetBaby(inst)
inst.components.growable:StopGrowing()
    local scale = 0.16
    inst.Transform:SetScale(scale, scale, scale)
	inst.growup = false
	inst.baby = true
	inst.lv1 = true
	--inst.components.combat:SetDefaultDamage(10)
	--inst.components.health:SetMaxHealth(100)
	
	
	--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_1)

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    
	inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------
end

local function SetLV1(inst)
inst.components.growable:StopGrowing()
    local scale = 0.2
    inst.Transform:SetScale(scale, scale, scale)
	inst.growup = false
	inst.baby = true
	inst.lv1 = true
	inst.components.combat:SetDefaultDamage(10)
	inst.components.health:SetMaxHealth(100)
	
	
	--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_1)

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    
	inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------
end

local function SetLV2(inst)
inst.AnimState:SetBuild("arong_mini1_build")
inst.components.growable:StopGrowing()
    local scale = 0.25
    inst.Transform:SetScale(scale, scale, scale)
	inst.growup = false
	
   inst.baby = false
   inst.lv1 = false
   inst.lv2 = true
   inst.components.combat:SetDefaultDamage(15)
   inst.components.health:SetMaxHealth(200)
   
   
 	--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_2)

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    
	inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------
end

local function SetLV3(inst)
inst.AnimState:SetBuild("arong_mini2_build")
inst.components.growable:StopGrowing()
    local scale = 0.3
    inst.Transform:SetScale(scale, scale, scale)
	inst.growup = false
	
	inst.baby = false
	inst.lv1 = false
	inst.lv2 = false
    inst.lv3 = true
	inst.components.combat:SetDefaultDamage(20)
	inst.components.health:SetMaxHealth(300)
	
	
		--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_3)

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    
	inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------
end

local function SetLV4(inst)
inst.AnimState:SetBuild("arong_mini3_build")
inst.components.growable:StopGrowing()
local scale = 0.35
    inst.Transform:SetScale(scale, scale, scale)
	inst.growup = false
	
	inst.baby = false
	inst.lv1 = false
	inst.lv2 = false
	inst.lv3 = false
	inst.lv4 = true
	inst.components.combat:SetDefaultDamage(25)
	inst.components.health:SetMaxHealth(400)
	
	
		--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_4)

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    
	inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160

end

local function SetLV5(inst)
inst.AnimState:SetBuild("arong_mini4_build")
inst.SoundEmitter:KillSound("eating")
inst.components.growable:StopGrowing()
local scale = 0.4
    inst.Transform:SetScale(scale, scale, scale)
	inst.growup = false

	inst.baby = false
	inst.lv1 = false
	inst.lv2 = false
	inst.lv3 = false	
	inst.lv4 = false
	inst.lv5 = true
	inst.components.combat:SetDefaultDamage(30)
	inst.components.health:SetMaxHealth(500)
	
	
	
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_5)

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose   
	inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160


end

local function SetLV6(inst)
inst.SoundEmitter:KillSound("eating")
inst.components.growable:StopGrowing()
local scale = 0.45
    inst.Transform:SetScale(scale, scale, scale)
	inst.growup = false

	inst.baby = false
	inst.lv1 = false
	inst.lv2 = false
	inst.lv3 = false	
	inst.lv4 = false	
	inst.lv5 = false
	inst.lv6 = true

	--inst.AnimState:SetBuild("arong_grow1_build")
	inst.AnimState:SetBuild("arong_mini4_build")
	inst.components.combat:SetDefaultDamage(35)
	inst.components.health:SetMaxHealth(600)
	
	
	
   --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_6)

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    
	inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160


end

--[[
    local grown = SpawnPrefab("arong")
    grown.Transform:SetPosition(inst.Transform:GetWorldPosition() )
    grown.Transform:SetRotation(inst.Transform:GetRotation() )
    grown.sg:GoToState("grow_up_pop")
	 inst:Remove()	]]
	 
local growth_stages =
{
    {name="Baby", time = GetGrowTime, fn = SetBaby},
	{name="LV_1", time = GetGrowTime, fn = SetLV1, growfn = Grow},
    {name="LV_2", time = GetGrowTime, fn = SetLV2, growfn = Grow},
    {name="LV_3", time = GetGrowTime, fn = SetLV3, growfn = Grow},
	{name="LV_4", time = GetGrowTime, fn = SetLV4, growfn = Grow},
	{name="LV_5", time = GetGrowTime, fn = SetLV5, growfn = Grow},
	{name="LV_6", time = GetGrowTime, fn = SetLV6, growfn = Grow},
}
 
local function onpreload(inst, data)
	if data then
		if data.level then
		inst.level = data.level
			levelexp(inst)
		end
		if data.time then
		inst.time = data.time
			summontime(inst)
		end	
		if data.yamche_leader then
		inst.yamche_leader = data.yamche_leader
		end
		if data.picked then
		inst.picked = data.picked
		end
	end
end

local function onsave(inst, data)
	data.level = inst.level
	data.time = inst.time
	data.yamche_leader = inst.yamche_leader
	data.picked = inst.picked
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
   
    inst.Transform:SetSixFaced()
    inst.Transform:SetScale(0.18, 0.18, 0.18)

    inst.DynamicShadow:SetSize(1.5, 1)

    inst.AnimState:SetBank("beefalo")
    inst.AnimState:SetBuild("arong_baby_build")
    inst.AnimState:PlayAnimation("idle_loop", true)
	
 	    inst.entity:AddMiniMapEntity()
	inst.entity:AddMiniMapEntity():SetPriority( 4 )
	--inst.MiniMapEntity:SetIcon( "arongbaby.tex" )

    inst.entity:AddLight()
	inst.Light:SetRadius(0.8)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)	
	
    inst:AddTag("beefalo")
    
    inst:AddTag("yamche")
	inst:AddTag("companion")
    inst:AddTag("notraptrigger")
	inst:AddTag("scarytoprey")	
	inst:AddTag("arongb")
	--inst:AddTag("arongbaby")
	inst:AddTag("yamcheb")
	--inst:AddTag("ghosthound")
	--inst:AddTag("working_slave")
	inst:AddTag("amphibious")
	
local player = GetPlayer()
if player.components.moisture then
         inst.DLC = true
end
if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then 
inst.DLC = true
inst.DLC2 = true
end		

   -- inst:AddTag("herdmember")

    MakeCharacterPhysics(inst, 25, .25)

-------
    inst:AddComponent("insulator")
	
	
	inst:AddComponent("playeractionpicker")
if inst.DLC or inst.DLC2 or SaveGameIndex:IsModeShipwrecked() then
	inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0
end
if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then 
	MakePoisonableCharacter(inst)
end

	    inst:AddComponent("talker")
    inst.components.talker.fontsize = 24
	inst.components.talker.offset = Vector3(0,-800,0)
    inst.components.talker.colour = Vector3(0.65, 0.8, 0.9, 1)
	---name
    inst:AddComponent("named")
    inst.components.named.possiblenames = STRINGS.ARONG
    inst.components.named:PickNewName()
	
    inst.sounds = sounds
		
    inst:AddComponent("eater")
	local Vegetarian_Arong = {"VEGGIE", "SEEDS", "WOOD"}
	inst.components.eater.foodprefs = Vegetarian_Arong
    --inst.components.eater:SetVegetarian()
    inst.components.eater:SetOnEatFn(OnEat)
	
	inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader.onrefuse = OnRefuseItem
    inst.components.trader.deleteitemonaccept = false

inst.peace = false
inst.active_hunt = false
inst.defense = false
	inst.time = 0
	inst.level = 0
	
   inst:AddComponent("health")
	inst.components.health.canmurder = false
    inst.components.health:SetMaxHealth(100)
    inst:AddComponent("hunger")
    inst.components.hunger:SetMax(300)
	inst.components.hunger:SetPercent(0.5)
    inst.components.hunger:SetRate(0.015)
	
   inst:AddComponent("combat")
 
    inst.components.combat.hiteffectsymbol = "beefalo_body"
    inst.components.combat:SetDefaultDamage(10)
	--inst.components.combat:SetRetargetFunction(1, yamche_hunt)
	inst.components.combat:SetRetargetFunction(1, hound_hunt)
	inst:DoPeriodicTask(0, leader_yamche)
	inst.Take_order = inst:DoPeriodicTask(0.25, Take_order)   
    inst.components.combat:SetKeepTargetFunction(KeepTarget)
	inst:ListenForEvent("newcombattarget", OnNewTarget)
	inst.components.combat.playerdamagepercent = 0
	inst:ListenForEvent("attacked", OnAttacked)
	inst:ListenForEvent("attacked", flower_shield)
    inst:ListenForEvent("onhitother", OnRanger)
	inst:ListenForEvent("onhitother", OnHitfreeze)
	inst:ListenForEvent("healthdelta", resist)
	--inst:ListenForEvent("hungerdelta", )
	inst.Hunt_check = inst:DoPeriodicTask(5, Hunt_check)
	inst.Power_check = inst:DoPeriodicTask(0, Power_check)

	inst.time_check = inst:DoPeriodicTask(30, time_check)
	--[[inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("apple_berry")
	inst.components.periodicspawner:SetRandomTimes(450, 900)
	inst.components.periodicspawner:SetOnSpawnFn(summon_apple)
    inst.components.periodicspawner:Start()]]
	
	inst.Eating = inst:DoPeriodicTask(30, Eating)
	inst.find_food = true	
	inst.Sleeping = inst:DoPeriodicTask(3, Sleeping)
	inst:ListenForEvent("hungerdelta", ystarve)
	
    inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetLoot(lootdrop)
    inst:AddComponent("inspectable")
 
    inst:AddComponent("sleeper")
    inst.components.sleeper:SetResistance(2)
 	inst.components.sleeper.testperiod = GetRandomWithVariance(4, 1)
    inst.components.sleeper:SetSleepTest(ShouldSleep)
    inst.components.sleeper:SetWakeTest(ShouldWakeUp)
	
  --  inst:AddComponent("knownlocations")
  --  inst:AddComponent("herdmember")
  inst:AddComponent("leader")
  inst:AddComponent("follower")
inst:AddComponent("playeractionpicker")
inst:AddComponent("inventoryitem") 
inst.components.inventoryitem.atlasname = "images/inventoryimages/mini_arong.xml"
inst:AddComponent("equippable")
	inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
	inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
	
	inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onarong)
    inst.components.equippable:SetOnUnequip(offarong) 

	inst.pickup_arong = inst:DoPeriodicTask(0, pickup_arong)
	
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(9, 9)
    inst.components.playerprox:SetOnPlayerNear(on_close)
    inst.components.playerprox:SetOnPlayerFar(on_far)
	
	inst:AddComponent("machine")
    inst.components.machine.turnonfn = onuseyamche
    inst.components.machine.turnofffn = offuseyamche
	inst.components.machine.cooldowntime = 0

--------------------
--[[	
local leader = inst.components.follower.leader
if inst.components.follower.leader then
inst.sleep_on = false
end]] 
--[[
    inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("musha_spore")
    inst.components.periodicspawner:SetRandomTimes(100, 200)
	--inst.components.periodicspawner:SetRandomTimes(2, 4) --test
	inst.components.periodicspawner:SetOnSpawnFn(onspawnfn)
    inst.components.periodicspawner:Start()
	]]

    inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable.growonly = true
    inst.components.growable:SetStage(1)
    --inst.components.growable:StartGrowing() 
	inst.components.growable:StopGrowing()

	if inst.lv1 or inst.baby then
inst.MiniMapEntity:SetIcon( "arongbaby.tex" )
	elseif inst.lv2 then
inst.MiniMapEntity:SetIcon( "mini_arong.tex" )	
	elseif inst.lv3 or inst.lv4 or inst.lv5 then
inst.MiniMapEntity:SetIcon( "mini_arong2.tex" )	
	elseif inst.lv6 then
inst.MiniMapEntity:SetIcon( "grow_arong.tex" )	
	end
	
inst.gasfn = function(attacked, data)
local other = data.attacker 
    if data and data.attacker and data.attacker.components.sleeper and inst.components.health:GetPercent() <= .3 then
            data.attacker.components.sleeper:AddSleepiness(5, 30)
	SpawnPrefab("small_puff").Transform:SetPosition(other:GetPosition():Get())
       end end
    inst:ListenForEvent("attacked", inst.gasfn, inst)
	inst.taunting = inst:DoPeriodicTask(10,taunting)
	inst:ListenForEvent("death", ondeath)
    MakeMediumBurnableCharacter(inst, "beefalo_body")
    MakeMediumFreezableCharacter(inst, "beefalo_body")
	
    inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
    inst.components.locomotor.walkspeed = 3
    inst.components.locomotor.runspeed = 16
	
inst:DoPeriodicTask(3, function()
	if GetClock():IsNight() then
	summon_light(inst)
	end
end)
   -- inst:ListenForEvent("entity_death", function(wrld, data) onkilll(inst, data) end, GetWorld())
	inst:ListenForEvent("killed", onkilll)
	inst:ListenForEvent("levelup", levelexp)
	
	inst.OnPreLoad = onpreload
	inst.OnSave = onsave
	
    -- inst:DoTaskInTime(1, FollowGrownBeefalo)
	inst.on_follow = inst:DoPeriodicTask(0.1, on_follow)  
	--inst.FollowGrownBeefalo = inst:DoPeriodicTask(1, FollowGrownArong)  
    inst:SetBrain(brain)
    inst:SetStateGraph("SGMiniArong")
	if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGMiniArong_DLC2")
	else
	inst:SetStateGraph("SGMiniArong")
	end	

    return inst
end

return Prefab("mini_arong", fn, assets)