require "prefabutil"
local brain = require "brains/mushasmallbrain"
	

local WAKE_TO_FOLLOW_DISTANCE = 5
local SLEEP_NEAR_LEADER_DISTANCE = 2
local CRY_NEAR_LEADER_DISTANCE = 15

local assets =
{
	Asset("ANIM", "anim/musha_small.zip"),
	Asset("ANIM", "anim/musha_tall.zip"),
	Asset("ANIM", "anim/musha_tall2.zip"),
	Asset("ANIM", "anim/musha_tall3.zip"),
	Asset("ANIM", "anim/musha_tall4.zip"),
	Asset("ANIM", "anim/musha_tall5.zip"),
	Asset("ANIM", "anim/musha_ice.zip"),
    Asset("ANIM", "anim/hat_yamche.zip"),
	Asset("ANIM", "anim/hat_yamche_on.zip"),
	Asset("SOUND", "sound/tallbird.fsb"),
	
	Asset("IMAGE", "images/inventoryimages/musha_small.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teen.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr6.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr6.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp6.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp7.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rpice.tex"),

Asset("ATLAS", "images/inventoryimages/musha_small.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teen.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr6.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr6.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp6.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp7.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rpice.xml"),
}

local prefabs=
{
    "musha_small",
    "musha_teen",
    "musha_tall",
    "musha_tall2",
    "musha_tall3",
    "musha_tall4",
    "musha_tall5",
    "musha_rp1",
    "musha_rp2",
    "musha_rp3",
    "musha_rp4",
    "musha_rp5",
    "musha_rp6",
    "campfirefire",
	"coldfirefire_yamche",
}

local slotpos_rp = {}

for y = 4, 0, -1 do
    for x = 0, 3 do
        table.insert(slotpos_rp, Vector3(60*x-60*2+30, 60*y-60*2+2,0))
    end
end

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


local function ondeath(inst)
if inst:HasTag("aquatic") then
inst:RemoveTag("aquatic")
end
	if inst.components.container then
	inst.components.container:DropEverything() end
	--if inst.components.inventory and not inst.DLC2 then
	--inst.components.inventory:DropEverything() end
	
local dark2 = SpawnPrefab("statue_transition_2")
local pos = Vector3(inst.Transform:GetWorldPosition())
 if inst.ndead and not inst.ndeath then
 inst:Remove()
 end
 if inst.ndeath and inst.level1 then
local poo = SpawnPrefab("musha_egg")
 inst:Remove()
poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 		
 elseif inst.ndeath and inst.level2 then
local poo = SpawnPrefab("musha_egg")
 inst:Remove()
poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 		
 elseif inst.ndeath and inst.level3 then
local poo = SpawnPrefab("musha_eggs1")
 inst:Remove()
poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 		
 elseif inst.ndeath and inst.level4 then
local poo = SpawnPrefab("musha_eggs2")
 inst:Remove()
poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
 elseif inst.ndeath and inst.level5 then
local poo = SpawnPrefab("musha_eggs3")
 inst:Remove()
poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
 elseif inst.ndeath and inst.level6 then
local poo = SpawnPrefab("musha_egg1")
 inst:Remove()
poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
 elseif inst.ndeath and inst.level7 then
local poo = SpawnPrefab("musha_egg2")
 inst:Remove()
poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
 elseif inst.ndeath and inst.level8 then
local poo = SpawnPrefab("musha_egg3")
 inst:Remove()
poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 		
end
--if not inst.level1 then
 dark2.Transform:SetPosition(pos:Get())
--end
end

----------------
local function die(inst)
--[[if inst:HasTag("aquatic") then
inst:RemoveTag("aquatic")
end]]
--[[if inst.components.inventory then
local player = GetPlayer()
	if inst.pick1 then	
	player.working = false
	inst.drop = true
	inst.pick1 = false 
	inst.working_food = false
	end
inst.components.inventory:DropEverything()
end]]
		
--	if inst.components.container then
--	inst.components.container:DropEverything() end
	
inst.ndead = true
inst.ndeath = false
inst.components.health:DoDelta(-100000)
inst.fightn = false
--inst.components.health:Kill()
    --inst:Remove()
end
------------------


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
    -- if inst.Physics then
	--	RemovePhysicsColliders(inst)
    --end
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

inst.AnimState:PlayAnimation("debris")
-------
        dude.sg:GoToState("amulet_rebirth")
	    --dude.sg:GoToState("rebirth")	
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
			    dude.components.sanity:SetPercent(.9)
            end
          if dude.components.hunger then
                dude.components.hunger:SetPercent(.9)
            end
        if dude.components.playercontroller then
                dude.components.playercontroller:Enable(true)
            end
		if dude:HasTag("DLC2") then
		if dude.components.poisonable then
			dude.components.poisonable:Cure(inst) end
			end	
            inst:RemoveTag("busy")
            dude.components.health:SetInvincible(false)
	dude.Light:Enable(false)

 end)
	inst:Show()

 end)

--	if inst.components.inventory then
--	inst.components.inventory:DropEverything()
-- 	end
	if inst.components.container then
	inst.components.container:DropEverything() 
	end
	inst.ndeath = true
	inst.ndead = false

	if inst.components.sleeper:IsAsleep() then
	inst.components.sleeper:WakeUp() end
		inst.sg:GoToState("command")
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_GREETING_7)
	scheduler:ExecuteInTime(2.5, function() 
	inst.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_BYE_2) 
	inst.components.locomotor.walkspeed = 0
	scheduler:ExecuteInTime(3, function() inst.resurrect_yamche = true end) end)

SaveGameIndex:DeregisterResurrector(inst)
inst.resurrect_finish = true

--inst.components.health:DoDelta(-100000) 
--ondeath(inst)
   -- inst:Remove()
            end
----------------
local function level_inventory(inst,data)
if inst.components.inventory then
if inst.level1 then
inst.components.inventory.maxslots = 3
elseif inst.level2 then
inst.components.inventory.maxslots = 5
elseif inst.level3 then
inst.components.inventory.maxslots = 7
elseif inst.level4 then
inst.components.inventory.maxslots = 9
elseif inst.level5 then
inst.components.inventory.maxslots = 10
elseif inst.level6 then
inst.components.inventory.maxslots = 11
elseif inst.level7 then
inst.components.inventory.maxslots = 12
elseif inst.level8 then
inst.components.inventory.maxslots = 14
end end
end

local function stop_working(inst)
local player = GetPlayer()

if inst.growup_auto then
player.working = false
inst.pick1 = false
inst.working_food = false
inst.drop = true
inst.yamche = true

inst.stop_working = true
inst.im_ready = false
inst.components.health:SetInvincible(true)

--[[if player.DLC2 then
if inst.components.inventory then
inst.components.inventory:DropEverything(true)
inst:RemoveComponent("inventory")
end
if inst.components.container then
inst.components.container:Close()
inst.components.container.canbeopened = false
inst.components.container:DropEverything()
inst:RemoveComponent("container")
end
end]]
inst.components.growable:StartGrowing()
end

if inst.grow_up_yamchae then
if inst.components.container then
inst.components.container:Close()
inst.components.container.canbeopened = false
inst.components.container:DropEverything()
inst:RemoveComponent("container")
end
if inst.components.inventory then
--inst.components.inventory:DropEverything(true)
--inst:RemoveComponent("inventory")
end

inst.components.growable:StartGrowing()
inst.grow_up_yamchae = false
end

end
---------------------------
local function levelexp(inst,data)

	local max_exp = 999999999999999993000
	local exp = math.min(inst.level, max_exp)
	--local hunger_percent = inst.components.hunger:GetPercent()
	local health_percent = inst.components.health:GetPercent()


if inst.level8 then
	--inst.components.hunger.max = math.ceil (130 + exp* 1)
	inst.components.health.maxhealth = math.ceil (800 + exp* 1)
	inst.components.talker:Say(STRINGS.MUSHA_HEALTH_MAX.."\n".. (inst.level + 800))
	--inst:AddTag("cure1")
end

	if not inst.level8 then
--inst.components.talker:Say("NEXT:[Grow up]")

if inst.level >=0 and inst.level <9 and inst.level1 and not inst.baby then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 1\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/10")
if inst.grow_up_yamchae then
inst.sg:GoToState("command")
inst.grow_up_yamchae = false
end
elseif inst.level >9 and inst.level1 and not inst.baby then
			if inst.grow_up_yamchae then stop_working(inst) end
			if inst.growup_auto then stop_working(inst) end
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]") inst.im_ready = true 
elseif inst.level >=0 and inst.level <19 and inst.level2 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.."2\n[EXP]: ".. (inst.level).."/20")
if inst.grow_up_yamchae then
inst.sg:GoToState("command")
inst.grow_up_yamchae = false
end
	elseif inst.level >19 and inst.level2 then
    		 if inst.grow_up_yamchae then stop_working(inst) end
			 if inst.growup_auto then stop_working(inst) end
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]") inst.im_ready = true
elseif inst.level >=0 and inst.level <49 and inst.level3 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.."3\n[EXP]: ".. (inst.level).."/50")
if inst.grow_up_yamchae then
inst.sg:GoToState("command")
inst.grow_up_yamchae = false
end
	elseif inst.level >49 and inst.level3 then
    		 if inst.grow_up_yamchae then stop_working(inst) end
			 if inst.growup_auto then stop_working(inst) end
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]") inst.im_ready = true
elseif inst.level >=0 and inst.level <99 and inst.level4 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.."4\n[EXP]: ".. (inst.level).."/100")
if inst.grow_up_yamchae then
inst.sg:GoToState("command")
inst.grow_up_yamchae = false
end
	elseif inst.level >99 and inst.level4 then
    		 if inst.grow_up_yamchae then stop_working(inst) end
			 if inst.growup_auto then stop_working(inst) end
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]") inst.im_ready = true
elseif inst.level >=0 and inst.level <299 and inst.level5 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.."5\n[EXP]: ".. (inst.level).."/300")
if inst.grow_up_yamchae then
inst.sg:GoToState("command")
inst.grow_up_yamchae = false
end
elseif inst.level >299 and inst.level5 then
    		 if inst.grow_up_yamchae then stop_working(inst) end
			 if inst.growup_auto then stop_working(inst) end
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]") inst.im_ready = true
elseif inst.level >=0 and inst.level <399 and inst.level6 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.."6\n[EXP]: ".. (inst.level).."/400")
if inst.grow_up_yamchae then
inst.sg:GoToState("command")
inst.grow_up_yamchae = false
end
elseif inst.level >399 and inst.level6 then
    		 if inst.grow_up_yamchae then stop_working(inst) end
			 if inst.growup_auto then stop_working(inst) end
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]") inst.im_ready = true
elseif inst.level >=0 and inst.level <499 and inst.level7 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.."7\n[EXP]: ".. (inst.level).."/500")
if inst.grow_up_yamchae then
inst.sg:GoToState("command")
inst.grow_up_yamchae = false
end
elseif inst.level >499 and inst.level7 then
    		 if inst.grow_up_yamchae then stop_working(inst) end
			 if inst.growup_auto then stop_working(inst) end
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]") inst.im_ready = true

	end
	--inst.components.hunger:SetPercent(hunger_percent)
	inst.components.health:SetPercent(health_percent)
	end
end


local function growup_check(inst)	
inst.grow_up_yamchae_ready = false
levelexp(inst)
end

local smallllchance = 0.45
local normalchance = 0.75
local largechance = 1

local function onkilll(inst, data)
	local victim = data.victim
	    if not (victim:HasTag("prey") or
            victim:HasTag("veggie") or
            victim:HasTag("eyeplant") or
            victim:HasTag("insect") or			
            victim:HasTag("structure")) and victim.components.combat then
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
							  victim:HasTag("dragonfly")  ) and victim.components.combat then
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
		  if (victim:HasTag("prey") or victim:HasTag("insect") or victim:HasTag("frog")) and victim.components.combat then
			if math.random() < normalchance then
    				inst.level = inst.level + 1
					levelexp(inst)
					end					
			end
			end

local function resurrect_end(inst, data)
SaveGameIndex:DeregisterResurrector(inst)
        inst.components.resurrector.active = false
         inst:RemoveComponent("resurrector")
end


local function onpreload(inst, data)
	if data then
		if data.stay then
		inst.stay = data.stay
		end
		if data.level then
		inst.level = data.level
			levelexp(inst)
		end
		if data.yamche_leader then
		inst.yamche_leader = data.yamche_leader
		end
	if data and data.resurrect_end then
	resurrect_end(inst)
	end
		--[[if data.iceyamche then
		inst.iceyamche = data.iceyamche
		end
		if data.doctor then
		inst.doctor = data.doctor
		end]]
end
end

local function onsave(inst, data)
	data.stay = inst.stay
	data.level = inst.level
	data.yamche_leader = inst.yamche_leader
		if inst.resurrect_finish then
        data.resurrect_end = true
    end
	--data.iceyamche = inst.iceyamche
	--data.doctor = inst.doctor
end

------------

local function GetStatus(inst)
    --print("smallbird - GetStatus")
    if inst.components.hunger then
        if inst.components.hunger:IsStarving(inst) then
            --print("STARVING")
            return "STARVING"
        elseif inst.components.hunger:GetPercent() < .5 then
            --print("HUNGRY")
            return "HUNGRY"
        end
	end
end

local function OnFire(attacked, data)
if data and data.attacker and data.attacker.components.burnable and not data.attacker:HasTag("molebait") and data.attacker.components.health and not data.attacker.components.health:IsDead() and not data.attacker.burn then
			 data.attacker.components.burnable:IsBurning()
            data.attacker.components.burnable:Ignite(true)
			data.attacker.components.health:DoDelta(-80)
			data.attacker.burn = true
			end
		 
  if data.attacker.components.burnable and data.attacker.components.burnable:IsBurning() then
        data.attacker.components.burnable:Extinguish()
    end
    end
	
    local function cure1_proc(inst, data)
if inst.DLC then	
inst.components.health:SetAbsorptionAmount(1)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(1)
end
inst.components.health:DoDelta(100)
--inst:ListenForEvent("attacked", OnFire)
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
inst:DoTaskInTime(--[[Duration]] 12, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
if inst:IsValid() then
fx.kill_fx(fx)
if inst.DLC then	
if inst.peace then
inst.components.health:SetAbsorptionAmount(0.95)
elseif not inst.peace and not inst.fightn and not inst.active_hunt then
inst.components.health:SetAbsorptionAmount(0.5)
elseif not inst.peace and not inst.fightn and inst.active_hunt then
inst.components.health:SetAbsorptionAmount(0.35)
end
elseif not inst.DLC then
if inst.peace then
inst.components.health:SetAbsorbAmount(0.95)
elseif not inst.peace and not inst.fightn and not inst.active_hunt then
inst.components.health:SetAbsorbAmount(0.5)
elseif not inst.peace and not inst.fightn and inst.active_hunt then
inst.components.health:SetAbsorbAmount(0.35)
end
end
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_SHIELD_COOL)
--inst:RemoveEventCallback("attacked", OnFire)
inst:DoTaskInTime(--[[Cooldown]] 300, function() inst.shield_on = false end)
end end) 
 end 
--------------
------------

    local function heal_proc(inst, data)
	if not inst.components.health:IsDead() and inst.components.health:GetPercent() < .5  then
        inst:AddTag("forcefield")
        inst.components.health:DoDelta(10)
       -- inst.components.hunger:DoDelta(-1)
        local fx = SpawnPrefab("shock_fx2")
    inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 1, 1)
        fx.Transform:SetPosition(0, 0, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.active = true
        inst:DoTaskInTime(--[[Duration]] 1, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
           -- fx.kill_fx(fx)
            if inst:IsValid() then
                inst:RemoveTag("forcefield")
                inst:DoTaskInTime(--[[Cooldown]] 3, function() inst.active = false end)
            end
        end)
    end
end

local function tryproc(inst)
if not inst.active and inst.components.health:GetPercent() < .7  then
        --heal_proc(inst)
		   end
if not inst.shield_on and inst.components.health:GetPercent() < .2  then
            cure1_proc(inst)
elseif inst.shield_on and inst.components.health:GetPercent() < .2  and inst.components.health:GetPercent() > .1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_HEALTH_WARN1)
elseif inst.shield_on and inst.components.health:GetPercent() <= .1 then 
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_HEALTH_WARN2)	
    end end

	
	------baby----hat-----

local function OnDropped(inst,data)
	if inst.components.burnable and inst.components.burnable:IsBurning() then
	inst.escape_fire = false
	inst.components.burnable:Extinguish() 
	end
	
inst.equip_baby = false
inst.inventory_baby = false
local player = GetPlayer()
  -- inst.level1 = true
   inst.baby = false
   inst.hat = false

local pos = Vector3(GetPlayer().Transform:GetWorldPosition())
inst.Transform:SetPosition(pos:Get())
inst.sg:GoToState("walk")

inst.components.follower:SetLeader(player)
if player.components.leader:CountFollowers("phoenix") == 1 then
inst.yamche_leader = true inst.yamche_leader_tag = true end

	inst.stay = false
	--inst.fightn = false
	inst.peace = false
	inst.active_hunt = false
	inst.defense = false

if not GetClock():IsNight() then
	inst.Light:Enable(false)	
end

end

local function OnPutInInventory(inst)
	if inst:HasTag("aquatic") then
	inst:RemoveTag("aquatic")
	end
inst.inventory_baby = true

    --inst.components.growable:StopGrowing()
	inst.hat = true
    inst.baby = true
   
    inst.hat = false
	--inst:StopBrain()
	--inst.fightn = false
inst.peace = false
inst.active_hunt = false
inst.defense = false

inst.components.follower:SetLeader(nil)

--if inst.components.burnable and inst.components.burnable:IsBurning() then
--	inst.components.burnable:Extinguish() 
--	end
end

local function onyamche(inst, owner)

inst.equip_baby = true
inst.inventory_baby = false

inst.components.follower:SetLeader(nil)

--if inst.components.burnable and inst.components.burnable:IsBurning() then
--	inst.components.burnable:Extinguish() 
--	end
	
local player = GetPlayer()
	--inst.fightn = false
	inst.peace = false
	inst.hat = true
	player.working = false
	inst.pick1 = false
	inst.working_food = false
	inst.drop = true
	
--if not inst.DLC2 then
--[[if inst.components.inventory then 
inst.components.inventory:DropEverything(true)
	inst.item_max_full = false
	inst.item_1 = false 
end]]

--[[elseif inst.DLC2 then	
if inst.components.inventory then	
if not inst.warning_monkey then
inst:RemoveTag("aquatic")
end

inst.components.inventory:DropEverything(true)
	inst.check_inv = false
	inst.item_max_full = false
	inst.item_1 = false 
	inst.DLC2_reset = true	
	inst:RemoveComponent("inventory")
	inst:DoTaskInTime( 0, function() inst:AddComponent("inventory") level_inventory(inst) end)
	end
end]]
	
--yamche hat	
    --inst.components.growable:StopGrowing()
	--inst:StopBrain()
  
   
    inst.baby = true
    inst.hat = true
	inst.drop = true
	inst.pick1 = false
	inst.working_food = false
	inst.peace = true
	inst.active_hunt = false
	inst.defense = true

     owner.AnimState:OverrideSymbol("swap_hat", "hat_yamche", "swap_hat")
     owner.AnimState:Show("HAT")
     -- owner.AnimState:Show("HAT_HAIR")
     owner.AnimState:Hide("HAIR_NOHAT")
     owner.AnimState:Show("HAIR")

    end

    local function offyamche(inst, owner)
	inst.equip_baby = false
	--inst.Light:Enable(false)
	
        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

    end
	
------------------ adult hat  

	
local function Dropped_cave(inst,data)
	if inst.components.burnable and inst.components.burnable:IsBurning() then
	inst.escape_fire = false
	inst.components.burnable:Extinguish() 
	end
	
inst.house = false
inst.inventory_baby = false
if inst.components.inventoryitem ~= nil then
inst:RemoveComponent("inventoryitem")
end
if inst.components.follower.leader and inst.components.container and not inst.stop_working then
inst.components.container.canbeopened = true	
end

inst.picked = false
inst.icon = false

local pos = Vector3(GetPlayer().Transform:GetWorldPosition())
inst.Transform:SetPosition(pos:Get())
inst.sg:GoToState("walk")
inst.stay = false

--[[if not inst.components.staycommand then
inst:AddComponent("staycommand") end
inst.components.staycommand:SetStaying(false)]]
local player = GetPlayer()
inst.components.follower:SetLeader(player)
if player.components.leader:CountFollowers("phoenix") == 1 then
inst.yamche_leader = true inst.yamche_leader_tag = true end

end

local function OnPutInInventory_cave(inst,data)

inst.house = true
inst.components.follower:SetLeader(nil)
if not inst.warning_monkey and inst:HasTag("aquatic") then
inst:RemoveTag("aquatic")
end
if not inst.components.follower.leader and inst.components.container then
inst.components.container:Close()
inst.components.container.canbeopened = false	
end

--[[if inst.components.inventory then
	if inst.pick1 then	
	inst.pick1 = false
	inst.drop = true
	inst.working_food = false
	inst.components.inventory:DropEverything(true)
	inst.check_inv = false
	inst.item_max_full = false
	inst.item_1 = false 
	end
end]]
inst.Light:Enable(false)
inst.picked = true	
end

local function onyamche_house(inst, owner)

	if inst.components.equippable then
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY
	end
--[[if inst.components.inventory then
	inst.pick1 = false
	inst.drop = true
	inst.working_food = false
	inst.components.inventory:DropEverything(true)
	inst.check_inv = false
	inst.item_max_full = false
	inst.item_1 = false 
end]]
if inst.components.container and not inst.stop_working then
inst.components.container.canbeopened = true	
end
	inst.house = true
	inst.components.follower:SetLeader(nil)

	    owner.AnimState:OverrideSymbol("swap_hat", "hat_house", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
	     
	end

local function offyamche_house(inst, owner)
	--inst.house = false
        owner.AnimState:Hide("HAT")
        --owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
     end
	 
local function cave_near(inst, data)

if GetPlayer().components.health:IsDead() and inst.resurrect_on then
inst.resurrect_on = false
inst.resurrect_activate = true
if not inst:HasTag("notarget") then
inst:AddTag("notarget")
end
end
--local leader = inst.components.follower.leader
if not inst.level1 and not inst.baby and not inst.warning_eyeplant and not inst.warning_monkey then

if inst.components.inventoryitem ~= nil and inst.components.equippable and not inst.icon and not inst.pick_me_up then
inst.icon = true
local inv_name = inst.prefab
	inst.components.inventoryitem.atlasname = "images/inventoryimages/"..inv_name..".xml"
 	
elseif inst.stay and inst.components.inventoryitem ==nil and not inst.picked and not inst.warning_monkey then
if not inst.pick_me_up then

--inst.sg:GoToState("command") 
inst.pick_me_up = true
end
inst:AddComponent("inventoryitem")
	if inst.DLC2 then
	if not inst.components.waterproofer then
	inst:AddComponent("waterproofer")
	end
	
	end
--inst.components.inventoryitem.cangoincontainer = false
local inv_name = inst.prefab
	inst.components.inventoryitem.atlasname = "images/inventoryimages/"..inv_name..".xml"
	inst.components.inventoryitem:SetOnDroppedFn(Dropped_cave)
	inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory_cave)
	if not inst.components.equippable then
	inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable:SetOnEquip(onyamche_house)
    inst.components.equippable:SetOnUnequip(offyamche_house)
	end
elseif not inst.stay and inst.components.inventoryitem and not inst.picked then
inst:RemoveComponent("inventoryitem")
inst:RemoveComponent("equippable")
inst.pick_me_up = false
	end
end

	-----------------------------equip--hat
if inst.level1 and not inst.warning_eyeplant and not inst.warning_monkey then
	if inst.components.inventoryitem == nil then
    inst:AddComponent("inventoryitem")
	if inst.DLC2 then
	if not inst.components.waterproofer then
	inst:AddComponent("waterproofer")
	end
	
	end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
	end
	if not inst.components.equippable then
	inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable:SetOnEquip(onyamche)
    inst.components.equippable:SetOnUnequip(offyamche)
		if not inst.DLC2 then
		inst.components.equippable.walkspeedmult = 1.25
		elseif inst.DLC2 then
		inst.components.equippable.walkspeedmult = 0.25
		end
	end
	if not inst.components.insulator then
    inst.components.insulator.insulation = TUNING.INSULATION_MED
	end
end	

end

-------------

local function on_wakeup(inst, data)

if inst.sleep_on or inst.campfire or inst.sleep_f and not inst.sleeping then 
inst.components.hunger:SetRate(0)
	inst.sleeping = true
else
	if not inst.sleep_on and not inst.campfire and not inst.sleep_f and inst.sleeping then
		inst.sleeping = false
	inst.components.hunger:SetRate(15/TUNING.TEENBIRD_STARVE_TIME)
	end
end

local player = GetPlayer()
local leader = inst.components.follower.leader
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 5, {"musha"})
for k,v in pairs(ents) do

if not inst.campfire then
if v.components.leader:IsFollower(inst) --[[and inst.components.staycommand:IsCurrentlyStaying() == false]] and v.sleep_on or v.tiny_sleep then
	if not inst.yamche_wing then
		inst.sleep_f = true end
elseif not v.sleep_on and not player.tiny_sleep and inst.sleep_f then
		inst.sleep_f = false
	inst.components.sleeper:WakeUp()
end

if inst.sleep_on and not inst.hat and not inst.house and not inst.inventory_baby then

local random2 = 0.2
if math.random() < random2 then
inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_GREETING_1)
elseif math.random() < random2 then
inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_GREETING_2)
elseif math.random() < random2 then
inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_GREETING_3)
elseif math.random() < random2 then
inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_GREETING_4)
elseif math.random() < random2 then
inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_GREETING_5)
elseif math.random() < random2 then
inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_GREETING_6)
elseif math.random() < random2 then
inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_GREETING_7)
elseif math.random() < random2 then
inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_GREETING_8)
elseif math.random() < random2 then
inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_GREETING_9)
end
inst.onsleep = false
 end end 
end

if (GetWorld().components.interiorspawner and GetWorld().components.interiorspawner.current_interior) then
	
	if inst.equip_baby and inst.components.inventoryitem and inst.components.inventoryitem.owner then 
	local owner = inst.components.inventoryitem.owner
		owner.AnimState:OverrideSymbol("swap_hat", "hat_yamche_on", "swap_hat")
			owner.AnimState:Show("HAT")
			owner.AnimState:Hide("HAIR_NOHAT")
			owner.AnimState:Show("HAIR")
			
		if inst.components.hunger:GetPercent() > .9 then
    inst.entity:AddLight()
	inst.Light:SetRadius(2.3)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		elseif inst.components.hunger:GetPercent() <= .9 and inst.components.health:GetPercent() >= .5  then
	inst.entity:AddLight()
	inst.Light:SetRadius(2)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		elseif inst.components.hunger:GetPercent() <= .5 and inst.components.health:GetPercent() >= .25  then
	inst.entity:AddLight()
	inst.Light:SetRadius(1.5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		elseif inst.components.hunger:GetPercent() < .25 then
    inst.SoundEmitter:PlaySound("dontstarve/creatures/smallbird/chirp") 
    inst.entity:AddLight()
	inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		elseif inst.components.hunger.current <= 1 then
	--inst.components.hunger:SetRate(0)
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_FOOOOD)
    inst.SoundEmitter:PlaySound("dontstarve/creatures/smallbird/chirp") 
    inst.entity:AddLight()
	inst.Light:SetRadius(0.5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		end
	else	
		if inst.inventory_baby then
	   inst.entity:AddLight()
	inst.Light:SetRadius(.1)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)	
	
		elseif not inst.inventory_baby then
	   inst.entity:AddLight()
	inst.Light:SetRadius(.3)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		end
	end	
else
 if inst.level1 or inst.baby then
 
 	if inst.equip_baby and (GetClock():IsNight() or GetWorld():IsCave()) then 
		local owner = inst.components.inventoryitem.owner
		if owner then
		owner.AnimState:OverrideSymbol("swap_hat", "hat_yamche_on", "swap_hat")
			owner.AnimState:Show("HAT")
			owner.AnimState:Hide("HAIR_NOHAT")
			owner.AnimState:Show("HAIR")
		end
		if inst.components.hunger:GetPercent() > .9 then
    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		elseif inst.components.hunger:GetPercent() <= .9 and inst.components.health:GetPercent() >= .75  then
	inst.entity:AddLight()
	inst.Light:SetRadius(2.7)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		elseif inst.components.hunger:GetPercent() <= .7 and inst.components.health:GetPercent() >= .5  then
	inst.entity:AddLight()
	inst.Light:SetRadius(2.4)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		elseif inst.components.hunger:GetPercent() <= .5 and inst.components.health:GetPercent() >= .25  then
    inst.entity:AddLight()
	inst.Light:SetRadius(2)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		elseif inst.components.hunger:GetPercent() < .25 then
    inst.SoundEmitter:PlaySound("dontstarve/creatures/smallbird/chirp") 
    inst.entity:AddLight()
	inst.Light:SetRadius(1.5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		elseif inst.components.hunger.current <= 1 then
	--inst.components.hunger:SetRate(0)
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_FOOOOD)
    inst.SoundEmitter:PlaySound("dontstarve/creatures/smallbird/chirp") 
    inst.entity:AddLight()
	inst.Light:SetRadius(0.5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		end
		
	else	
		
		if inst.equip_baby and not GetClock():IsNight() and not GetWorld():IsCave() then
			local owner = inst.components.inventoryitem.owner
			if owner then
			owner.AnimState:OverrideSymbol("swap_hat", "hat_yamche", "swap_hat")
			owner.AnimState:Show("HAT")
			owner.AnimState:Hide("HAIR_NOHAT")
			owner.AnimState:Show("HAIR")
			end
		end
		if inst.inventory_baby then
	   inst.entity:AddLight()
	inst.Light:SetRadius(.1)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)	
	
		elseif not inst.inventory_baby then
	   inst.entity:AddLight()
	inst.Light:SetRadius(.3)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(185/255,175/255,170/255)
		end
	end
	
	
	
end 
end
end

local function anti_eyes(inst)
if inst.warning_eyeplant then 
inst:DoTaskInTime( 15, function() 
inst.warning_eyeplant = false
end)
end
end

local function anti_thief(inst)
if inst.components.inventory then		
inst.components.inventory.nosteal = true
end

inst:DoTaskInTime( 15, function() 
inst.warning_frog = false 
end)
if inst.warning_monkey then 
inst:DoTaskInTime( 15, function() 
inst.warning_monkey = false 
if not inst.stay and inst.components.container and not inst.stop_working then 
inst.components.container.canbeopened = true
end end)
end
end 


--[[local function taunting(inst, data)
local x,y,z = inst.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 8)
for k,v in pairs(ents) do
if not inst.peace and not inst.active_hunt and not inst.defense and inst.components.health:GetPercent() >= .2 and inst.components.health:GetPercent() >= .2 and GetPlayer().components.health:GetPercent() < .8 then
if v and v.components.combat and v.components.combat.target == GetPlayer() and not (v:HasTag("structure") or v:HasTag("giant4x") or v:HasTag("giant1x") or v:HasTag("giant2x") or v:HasTag("giant3x") or v:HasTag("berrythief") or v:HasTag("prey") or v:HasTag("bird") or v:HasTag("butterfly") or not v:HasTag("companion")) then
		v.components.combat.target = inst		
		inst.sg:GoToState("taunt")
		SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())
		if not v.components.health:IsDead() then
		SpawnPrefab("dr_hot_loop").Transform:SetPosition(v:GetPosition():Get())
		end
		if not inst.components.health:IsDead() then
		inst.components.health:DoDelta(6)
		end
 end end  end
end]]

local function taunting(inst, data)
local leader = inst.components.follower.leader
if inst.yamche_leader and leader and not inst.peace and not inst.active_hunt and not inst.defense and inst.components.health:GetPercent() >= .25 then
if leader.components.health:GetPercent() >= .5 and leader.components.health:GetPercent() < .95 then

	local x,y,z = inst.Transform:GetWorldPosition()	
	local enemy = TheSim:FindEntities(x, y, z, 8)
	for k,v in pairs(enemy) do
	if v and v.components.combat and v.components.health and not v.components.health:IsDead() and v.entity:IsVisible() and leader.components.combat.target == v then
	if not v:HasTag("shadowcreature") and not v:HasTag("butterfly") and not v:HasTag("bird") and not v:HasTag("prey") and not v:HasTag("structure") and not v:HasTag("thorny") then
		v.components.combat.target = inst
		inst.components.combat.target = v		
		--inst.taunting = true
		SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("dr_hot_loop").Transform:SetPosition(v:GetPosition():Get())
		inst.sg:GoToState("command")
			if not inst.components.health:IsDead() then
			inst.components.health:DoDelta(1)
			end
		end
	end
	end
 
elseif leader.components.health:GetPercent() < .5 then
	local x,y,z = inst.Transform:GetWorldPosition()	
	local enemy = TheSim:FindEntities(x, y, z, 8)
	for k,v in pairs(enemy) do
	if v and v.components.combat and v.components.combat.target == leader then
		if not ( v:HasTag("shadowcreature") or v:HasTag("butterfly") or v:HasTag("bird") or v:HasTag("prey") or v:HasTag("companion") or v:HasTag("player") or v:HasTag("character")) then
		v.components.combat.target = inst	
		--inst.taunting = true
		SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("dr_hot_loop").Transform:SetPosition(v:GetPosition():Get())
		inst.sg:GoToState("taunt")
			if not inst.components.health:IsDead() then
			inst.components.health:DoDelta(5)
			end
		end
	end
	end
end 
end

local frog = FindEntity(inst, 10, function(target) 
	return target:HasTag("frog") or (target.components.combat and target.components.combat.target == inst) end)
if not frog and not inst.stay and not inst.stop_working and inst.components.container and not inst.components.container.canbeopened then 
inst.components.container.canbeopened = true
end

end

local function Peace_yamche(inst)

if inst.hat or inst.house then
    
local owner = inst.components.inventoryitem.owner
if owner ~= nil and not owner:HasTag("musha") and owner.components.inventory then
	inst.escape_fire = true
        inst.components.burnable:Ignite()
		inst:DoPeriodicTask(2, function() 
		if owner.components.burnable and not owner.components.burnable:IsBurning() and inst.escape_fire then
		owner.components.health:DoDelta(-20) 
		
        elseif inst.components.health and not inst.components.health:IsDead() then
            if inst.level1 then
            local poo = SpawnPrefab("musha_egg")
        poo.Transform:SetPosition(inst.Transform:GetWorldPosition())    
            die(inst) end
            if inst.level2 then
            local poo = SpawnPrefab("musha_eggs1")
        poo.Transform:SetPosition(inst.Transfo2rm:GetWorldPosition())    
            die(inst) end
            if inst.level3 then
            local poo = SpawnPrefab("musha_eggs2")
        poo.Transform:SetPosition(inst.Transform:GetWorldPosition())    
            die(inst) end
            if inst.level4 then
            local poo = SpawnPrefab("musha_eggs3")
        poo.Transform:SetPosition(inst.Transform:GetWorldPosition())    
            die(inst) end
            if inst.level5 then
            local poo = SpawnPrefab("musha_egg1")
        poo.Transform:SetPosition(inst.Transform:GetWorldPosition())    
            die(inst) end
            if inst.level6 then
            local poo = SpawnPrefab("musha_egg2")
        poo.Transform:SetPosition(inst.Transfo2rm:GetWorldPosition())    
            die(inst) end
            if inst.level7 then
            local poo = SpawnPrefab("musha_egg3")
        poo.Transform:SetPosition(inst.Transform:GetWorldPosition())    
            die(inst) end
            if inst.level8 then
            local poo = SpawnPrefab("musha_egg8")
        poo.Transform:SetPosition(inst.Transform:GetWorldPosition())    
            die(inst) end
        end
		end) 
end


else
local x,y,z = inst.Transform:GetWorldPosition()
local frog = TheSim:FindEntities(x,y,z, 3, {"frog"})
for k,v in pairs(frog) do
local random = 0.1
if not inst.warning_frog then
inst.warning_frog = true
if inst.components.container then 
inst.components.container.canbeopened = false
end
inst.sg:GoToState("command")

end
anti_thief(inst)
end

--if not inst.level1 then
local x,y,z = inst.Transform:GetWorldPosition()
local monkey = TheSim:FindEntities(x,y,z, 4, {"monkey"})
for k,v in pairs(monkey) do

if v and not inst:HasTag("aquatic") then
inst:AddTag("aquatic")
end 
	
if not inst.warning_monkey then
inst.warning_monkey = true
if v and inst.components.sleeper:IsAsleep() then
	inst.components.sleeper:WakeUp()
end
if inst.level1 and inst.components.inventoryitem ~= nil then
	inst:RemoveComponent("inventoryitem")
elseif not inst.level1 and inst.stay and inst.components.inventoryitem ~= nil then
	inst:RemoveComponent("inventoryitem")
end

if inst.components.container then 
inst.components.container.canbeopened = false
end
inst.sg:GoToState("command")
end
anti_thief(inst)
end

local x,y,z = inst.Transform:GetWorldPosition()
local monkey = TheSim:FindEntities(x,y,z, 3, {"piko"})
for k,v in pairs(monkey) do

if v and not inst:HasTag("aquatic") then
inst:AddTag("aquatic")
end 
	
if not inst.warning_monkey then
inst.warning_monkey = true
if v and inst.components.sleeper:IsAsleep() then
	inst.components.sleeper:WakeUp()
end
if inst.level1 and inst.components.inventoryitem ~= nil then
	inst:RemoveComponent("inventoryitem")
elseif not inst.level1 and inst.stay and inst.components.inventoryitem ~= nil then
	inst:RemoveComponent("inventoryitem")
end
if inst.components.container then 
inst.components.container.canbeopened = false
end
inst.sg:GoToState("command")
end
anti_thief(inst)
end

local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z,6, {"eyeplant"})
for k,v in pairs(ents) do
if v and not inst.warning_eyeplant then
inst.warning_eyeplant = true
if inst.components.sleeper:IsAsleep() then
	inst.components.sleeper:WakeUp()
end
if inst.level1 and inst.components.inventoryitem ~= nil then
	inst:RemoveComponent("inventoryitem")
elseif not inst.level1 and inst.stay and inst.components.inventoryitem ~= nil then
	inst:RemoveComponent("inventoryitem")
end
inst.sg:GoToState("command")
anti_eyes(inst)
end
end

end

local player = GetPlayer()
local leader = inst.components.follower.leader

if inst.yamche then
if math.random() < 0.5 then
inst.sg:GoToState("cry")
else
inst.sg:GoToState("command")
end
inst.components.talker.fontsize = 24
if inst.components.inventory then
level_inventory(inst)
end
if inst.yamche and inst.active_hunt and not inst.peace and not inst.defense then
SpawnPrefab("dr_hot_loop").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.yamche and not inst.active_hun and inst.peace and inst.defense then
SpawnPrefab("dr_warm_loop_2").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.yamche and not inst.active_hunt and not inst.peace and not inst.defense then
SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())
end
if inst:HasTag("notarget") then
inst:RemoveTag("notarget")
end
inst.yamche = false
inst.armor = false
if inst.components.sleeper:IsAsleep() then
inst.components.sleeper:WakeUp()
end end

if not leader then
--[[if inst.yamche_wing then
	if inst.sleep_on then
	inst.sleep_on = false
	end
else
	if not inst.sleep_on then
	inst.sleep_on = true
	end
end]]
if not inst:HasTag("notarget") then
inst:AddTag("notarget")
end

else
if inst.yamche and inst:HasTag("notarget") and not leader:HasTag("shadows") then
inst:RemoveTag("notarget")
end

end

if inst.components.hunger.current == 0 then
inst.components.hunger:DoDelta(5)
end 

if inst.sleeper and inst.together then

--[[local random = 0.2
if math.random() < random then
inst.components.talker:Say("[Musha !]")
elseif math.random() < random then
inst.components.talker:Say("[I follow you]")
elseif math.random() < random then
inst.components.talker:Say("[I miss you]")
elseif math.random() < random then
inst.components.talker:Say("[I see you]")
elseif math.random() < random then
inst.components.talker:Say("[Musha choose me]")
elseif math.random() < random then
inst.components.talker:Say("[I love Musha]")
elseif math.random() < random then
inst.components.talker:Say("[ Toruk makto ]")
end]]
inst.sleeper = false
end 

if inst.components.sleeper:IsAsleep() then
inst.onsleep = true inst.sleeper = true end

if inst.components.follower and not inst.components.follower.leader and not inst.resurrect_yamche and not inst.yamche_wing then
if not inst.sleepn then
inst.peace = true
inst.active_hunt = false
inst.defense = true
elseif inst.sleepn then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_SLEEPY.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(0)")
		inst.sleepn = false		end

if not inst.yamche_wing then
inst.sleep_on = true end
if inst.sleep_on then
inst.peace = true
inst.active_hunt = false
inst.defense = true
end

elseif inst.components.follower.leader and not player.sleep_on and not inst.campfire then

if inst.sleep_on then
inst.peace = false
inst.active_hunt = false
inst.defense = false
inst.sleep_on = false
end
end

if player:HasTag("no_sacrifice")then
        inst.no_resurrect = true
		end
	
if inst.resurrect_yamche and not inst.no_resurrect then
if inst.components.sleeper:IsAsleep() then
inst.components.sleeper:WakeUp() end
inst.peace = false
inst.sleep_on =false
	inst.ndeath = true
	inst.ndead = false
inst.components.health:DoDelta(-10000)
end
	
local leader = inst.components.follower.leader
if inst.components.follower.leader and inst.follow and not inst.active_hunt then
inst.components.combat:GiveUp()
end 
if inst.peace and not inst.active_hunt and inst.DLC and not inst.shield_on then
inst.components.combat:GiveUp()
inst.components.health:SetAbsorptionAmount(0.95)
if not inst.armor then
 
inst.armor = true end
end
if inst.peace and not inst.active_hunt and not inst.DLC and not inst.shield_on then
inst.components.combat:GiveUp()
inst.components.health:SetAbsorbAmount(0.95)
if not inst.armor then

inst.armor = true end
end
if not inst.peace and not inst.active_hunt and inst.DLC and not inst.shield_on then
inst.components.health:SetAbsorptionAmount(0.6)
if not inst.armor then

inst.armor = true end
end
if not inst.peace and not inst.active_hunt and not inst.DLC and not inst.shield_on then
inst.components.health:SetAbsorbAmount(0.6)
if not inst.armor then

inst.armor = true end
end 
if not inst.peace and inst.active_hunt and inst.DLC and not inst.shield_on then
inst.components.health:SetAbsorptionAmount(0.4)
if not inst.armor then

inst.armor = true end
end
if not inst.peace and inst.active_hunt and not inst.DLC and not inst.shield_on then
inst.components.health:SetAbsorbAmount(0.4)
if not inst.armor then

inst.armor = true end
end 
end

local function splash_on(inst)
	if inst.splash_on and not inst.hat and not inst.house then
	
local yamchaep = inst:GetPosition()
local ground = GetWorld().Map:GetTileAtPoint(yamchaep.x, yamchaep.y, yamchaep.z)
if not (ground == GROUND.ROAD and ground == GROUND.ROCKY and ground == GROUND.FOREST and ground == GROUND.MARSH and ground == GROUND.GRASS and ground == GROUND.SAVANNA and ground == GROUND.DIRT and ground == GROUND.WOODFLOOR and ground == GROUND.CARPET and ground == GROUND.CHECKER and ground == GROUND.CAVE and ground == GROUND.FUNGUS and ground == GROUND.FUNGUSRED and ground == GROUND.FUNGUSGREEN and ground == GROUND.SINKHOLE and ground == GROUND.UNDERROCK and ground == GROUND.MUD and ground == GROUND.DECIDUOUS and ground == GROUND.DESERT_DIRT and ground == GROUND.BEACH and ground == GROUND.JUNGLE and ground == GROUND.SWAMP and ground == GROUND.VOLCANO and ground == GROUND.ASH and ground == GROUND.MAGMAFIELD and ground == GROUND.TIDALMARSH and ground == GROUND.MEADOW and ground == GROUND.SNAKESKIN and ground == GROUND.PIGRUINS and ground == GROUND.RAINFOREST and ground == GROUND.DEEPRAINFOREST and ground == GROUND.LAWN and ground == GROUND.GASJUNGLE and ground == GROUND.SUBURB and ground == GROUND.FIELDS and ground == GROUND.FOUNDATION and ground == GROUND.COBBLEROAD ) then
	
    local x, y, z = inst.Transform:GetWorldPosition()
    x, y, z = inst.Transform:GetWorldPosition()
    if inst.components.floatable ~= nil then
        inst.components.floatable:OnHitWater()
        local fx = SpawnPrefab("splash_water_drop")
		inst.SoundEmitter:PlaySound( "dontstarve_DLC002/common/boat_paddle")
	if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
	end
        fx.Transform:SetScale(0.8, 0.8, 0.8)
        fx.Transform:SetPosition(x, y, z)	
		inst.splash_on = false 
SpawnPrefab("splash_footstep").Transform:SetPosition(inst:GetPosition():Get())
	end 
end	
	end
end

local function yamche_wing(inst)

local player = GetPlayer()
if not player.crazy and inst.components.follower and inst.components.follower.leader then
inst.components.follower.canaccepttarget = true
elseif player.crazy and inst.components.follower and inst.components.follower.leader then
inst.components.follower.canaccepttarget = false
end

local leader = inst.components.follower.leader
if not inst.sleep_on and not inst.dismissal_leader and inst.components.follower.leader and not leader.yamche_leader then
if not inst.yamche_leader_tag then
	if leader.components.leader:CountFollowers("phoenix") == 1 then
player.yamche_leader = true
inst.yamche_leader = true
inst.yamche_leader_tag = true
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_LEADER)
	end
end
elseif inst.dismissal_leader and inst.components.follower.leader and inst.yamche_leader then
if inst.yamche_leader_tag then
player.yamche_leader = false
inst.yamche_leader = false
inst.yamche_leader_tag = false

end 
end

if not leader then
if inst.yamche_leader_tag then
player.yamche_leader = false
inst.yamche_leader = false
inst.yamche_leader_tag = false

end 
elseif leader then
if inst.yamche_leader and not inst.yamche_leader_tag then
if leader.components.leader:CountFollowers("phoenix") == 1 then
inst.yamche_leader_tag = true
player.yamche_leader = true
end
end 
end

if inst.DLC2_reset then

if not inst.sleep_on and not inst.campfire and not inst.sleep_f then
inst.components.hunger:SetRate(15/TUNING.TEENBIRD_STARVE_TIME)
end
inst.DLC2_reset = false	
	end

if not GetWorld():IsCave() then
if GetClock():IsNight() then
		if inst.components.follower and inst.components.follower.leader == nil then
			inst.sleep_on = true
		end
	inst.Light:Enable(true)
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
else
		--[[if inst.components.follower and inst.components.follower.leader ~= nil then
			inst.sleep_on = false
		end]]
	local interiorSpawner = GetWorld().components.interiorspawner
	if interiorSpawner and interiorSpawner.current_interior then
		inst.Light:Enable(true)
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
	else
		inst.Light:Enable(false)
		inst.AnimState:SetBloomEffectHandle( "" )
	end
end
elseif GetWorld():IsCave() then
	if not inst.house then
	inst.Light:Enable(true)
	end
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
end


if inst.yamche_wing then
	if not inst.house or inst.hat then
		if inst.components.burnable and inst.components.burnable:IsBurning() then
		inst.components.burnable:Extinguish() 
		end
	end	
--or inst.sg:HasStateTag("attack") or inst.sg:HasStateTag("hit")
	if inst.sg:HasStateTag("idle") or inst.sg:HasStateTag("idle_blink") or inst.sg:HasStateTag("taunt") or inst.sg:HasStateTag("open") or inst.sg:HasStateTag("close") or inst.sg:HasStateTag("hit") or inst.sg:HasStateTag("eat") or inst.sg:HasStateTag("attack2") or inst.sg:HasStateTag("sleep") or inst.sg:HasStateTag("idle_peep") or inst.sg:HasStateTag("cry") or inst.sg:HasStateTag("mine") or inst.sg:HasStateTag("chop") or inst.sg:HasStateTag("throw") or inst.sg:HasStateTag("action") or inst.sg:HasStateTag("walk_stop") or inst.sg:HasStateTag("run_stop") or inst.sg:HasStateTag("animover") then
inst.sg:GoToState("walk") 
inst.splash_on = true
	end 
	if inst.sg:HasStateTag("walk") or inst.sg:HasStateTag("walk_start") or inst.sg:HasStateTag("run_start") or inst.sg:HasStateTag("walk") or inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("running") then 
inst.splash_on = true
	end
	if inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
	end
	if inst.components.freezable:IsFrozen() then
        inst.components.freezable:Unfreeze()
    end	
	
splash_on(inst)	
end

end
		

local ValidItems = {
 "goldnugget", "rocks", "cutstone", "nitre", "flint", "thulecite", "thulecite_pieces", "marble", "redgem", "purplegem", "bluegem", "yellowgem", "greengem", "orangegem",    "log", "boards", "cutgrass", "dug_grass", "rope", "twigs", "dug_sapling", "gears", "spidergland", "healingsalve", "mosquitosack", "silk", "spidereggsack", "ash", "poop", "guano", "charcoal", "beefalowool", "cutreeds", "houndstooth", "ice", "stinger", "livinglog", "lightbulb", "slurper_pelt", "honeycomb", "arrowm",
 "turf_road", "turf_rocky", "turf_forest", "turf_marsh", "turf_grass", "turf_savanna", "turf_dirt", "turf_woodfloor", "turf_carpetfloor", "turf_checkerfloor", "turf_cave", "turf_fungus", "turf_fungus_red", "turf_fungus_green", "turf_sinkhole", "turf_underrock", "turf_mud", 
  "walrus_tusk", "houndstooth", "wormlight_lesser", "wormlight", "nightmarefuel", "manrabbit_tail", "beardhair", "trinket_1", "trinket_2", "trinket_3", "trinket_4", "trinket_5", "trinket_6", "trinket_7",  "trinket_8", "trinket_9", "trinket_10", "trinket_11", "trinket_12",  "coontail", "tentaclespots", "beefalowool", "horn", "feather_robin", "feather_robin_winter", "feather_crow", "boneshard", "transistor",   "boomerang", "goose_feather", "drumstick", 
  "bearger_fur", "dragon_scales", 
  "acorn", "pinecone",
 --sw 
"coconut", "coral", "bamboo", "dug_bambootree", "vine", "dug_bush_vine", "limestone", "hail_ice", "obsidian", "palmleaf", "snake_poison", "snake_skin", "messagebottle", "messagebottleempty", "fabric", 
}
	
local function ItemIsInList(item, list)
    for k,v in pairs(list) do
        if v == item or k == item then
            return true
        end
    end
end
	
local function Take_order(inst)

if inst.components.follower and inst.components.follower.leader then
if inst.components.follower:IsNearLeader(3) then
	if not inst.focus_leader then
	inst.focus_leader = true
	end
else
	if inst.focus_leader then
	inst.focus_leader = false
	end
end
end

if inst.components.follower and inst.components.follower.leader then
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 6, {"musha"})
for k,v in pairs(ents) do
if v.crazy and not inst.crazy_dist and not inst.stop_working then
inst.crazy_dist = true
--inst.components.health:SetInvincible(true)
elseif not v.crazy and inst.crazy_dist and not inst.stop_working then
inst.crazy_dist = false
--inst.components.health:SetInvincible(false)
end
if inst.components.follower.leader and v.components.leader:IsFollower(inst) and v.crazy and not inst.stop_working and not inst.peace then
inst.peace = true
inst.active_hunt = false
inst.defense = true
end
if v.components.leader:IsFollower(inst) and v:HasTag("beefalo") and not inst:HasTag("beefalo") then 
inst:AddTag("beefalo")
elseif v.components.leader:IsFollower(inst) and not v:HasTag("beefalo") and inst:HasTag("beefalo") then 
inst:RemoveTag("beefalo")
end
--[[if inst.components.follower.leader and v.components.leader:IsFollower(inst) and v:HasTag("spiderwhisperer") and not inst:HasTag("monster") then 
inst:AddTag("monster")
elseif inst.components.follower.leader and v.components.leader:IsFollower(inst) and not v:HasTag("spiderwhisperer") and inst:HasTag("monster") then 
inst:RemoveTag("monster")
end]]
end
end

local player = GetPlayer()

if inst.DLC2 or SaveGameIndex:IsModeShipwrecked() then
if inst.components.poisonable and inst:HasTag("poison") then
inst.components.poisonable:Cure(inst)
end end

if inst.level1 and inst.pick1 then

inst.item_max_full = true
			inst.pick1 = false
			inst.droping = false
			inst.working_food = false
			inst.drop = true
elseif inst.components.container ~=nil and not inst.sg:HasStateTag("open") and not inst.level1 then 

if inst.components.container:IsFull() then 
	if not inst.item_max_full then 
		inst.item_max_full = true
		if inst.pick1 then
			inst.item_1 = true
	if not inst.sleep_on and not inst.campfire and not inst.sleep_f then
	inst.components.hunger:SetRate(90/TUNING.TEENBIRD_STARVE_TIME)
	end

			if not inst.item_1 then 
			--inst.sg:GoToState("command")
			inst.item_1 = true
			end
		if not inst.light_on then
		inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV_FULL.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x1)")
		elseif inst.light_on then
		inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV_FULL.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_LIGHT.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x5)")
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
		inst.components.hunger:SetRate(15/TUNING.TEENBIRD_STARVE_TIME)
		end
	end
end
end

end

local function InShadow(inst, data)
local x,y,z = inst.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 8)
for k,v in pairs(ents) do
--inst.sleep_on 
if v.components.health and not v.components.health:IsDead() and v.components.combat and v.components.combat.target == inst and not (v:HasTag("berrythief") or v:HasTag("prey") or v:HasTag("bird") or v:HasTag("butterfly")) then
		v.components.combat.target = nil		
 end
 end  end
 
local function on_close(inst)
local player = GetPlayer()
inst.follow = false
inst.components.locomotor.pathcaps = { ignorecreep = false }
--player:AddTag("yamche") 
if player:HasTag("spiderwhisperer") and not inst:HasTag("spider") then
inst:AddTag("spider") 
elseif not player:HasTag("spiderwhisperer") and inst:HasTag("spider") then
inst:RemoveTag("spider") 
end
inst:AddTag("closea") 

if inst.components.follower and inst.components.follower.leader then
inst.MiniMapEntity:SetIcon( "" )
end
--end
local danger = FindEntity(inst, 3, function(target) 
	return target:HasTag("monster") or (target.components.combat and target.components.combat.target == inst) end)
if not inst.campfire then
if inst.pick1 then
inst.components.locomotor.walkspeed = 8
elseif not inst.pick1 then
if danger then
inst.components.locomotor.walkspeed = 8
else
inst.components.locomotor.walkspeed = 6
end  
end
end

    if player:HasTag("houndmound") then
 inst:AddTag("houndmound") 
    elseif not player:HasTag("houndmound") then
inst:RemoveTag("houndmound") 
    elseif player:HasTag("shadows") then
inst:AddTag("notarget") 
    elseif not player:HasTag("shadows") then
inst:RemoveTag("notarget") 
end
end 

local function far(inst)
local player = GetPlayer()
inst.follow = true

inst.components.locomotor.pathcaps = { ignorecreep = true }
--inst:RemoveTag("character")
	if inst.level1 then
inst.MiniMapEntity:SetIcon( "musha_small.tex" )
	elseif not inst.level1 then
inst.MiniMapEntity:SetIcon( "musha_teen.tex" )	
	end

inst:RemoveTag("closea") 

if inst.campfire and inst.components.follower and inst.components.follower.leader and not inst.escape_fire then
	if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
    end
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_CAMPFIRE_OFF)
inst.campfire = false
if inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
end 
end

if (player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating") or player:HasTag("aquatic")) then
inst.components.locomotor.walkspeed = 18
else

inst.components.locomotor.walkspeed = 15


end


end

-----------------------
local function onignite(inst)
if inst.hat then
if not inst.level1 and inst.components.burnable:IsBurning() and not inst.escape_fire then
    inst.components.burnable:Extinguish()
	inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_CAMPFIRE_OFF)
end
elseif not inst.hat and not inst.house then
local player = GetPlayer()
InShadow(inst)
inst.sg:GoToState("sleep")
inst.campfire = true
inst.sleep_on = true
if not inst.iceyamche then 
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_CAMPFIRE_ON.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_FIRE_WARM)
elseif inst.iceyamche then 
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_CAMPFIRE_ON.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_FIRE_COLD)
end
	  
inst.components.locomotor.walkspeed = 0
player.components.health.fire_damage_scale = 0
 if not inst.components.cooker then
        inst:AddComponent("cooker")
			end
 end 
 end

local function onextinguish(inst)
local player = GetPlayer()
inst.campfire = false 
inst.components.locomotor.walkspeed = 6
    if inst.components.fueled then
        inst.components.fueled:InitializeFuelLevel(0)
    end
if not player:HasTag("Valkyrieh") then
player.components.health.fire_damage_scale = 1
end
 if inst.components.cooker then
        inst:RemoveComponent("cooker")
			end
end


local function cooked(inst)

	local container = inst.components.container

	if not inst.iceyamche then
		for i = 1, container:GetNumSlots() do
	        local item = container:GetItemInSlot(i)
	     	if item then 
	     		local replacement = nil 
				if item.components.cookable or item.prefab == "log" then 
				inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") 
						local fx = SpawnPrefab("collapse_small")
					local pos = Vector3(inst.Transform:GetWorldPosition())
					fx.Transform:SetScale(0.5, 0.5, 0.5)
				fx.Transform:SetPosition(pos:Get())
				end
				
		     	if item.components.cookable then 
		     		replacement = item.components.cookable:GetProduct()
		     	elseif item.prefab == "log" then 
		     		replacement = "charcoal"
		     	--[[elseif item.components.burnable and not item.prefab == "log" then 
		     		replacement = "ash"		]]			
		     	end  
		     	if replacement then 
	     			local stacksize = 1 
	     			if item.components.stackable then 
	     				stacksize = item.components.stackable:StackSize()
	     			end 
	     			local newprefab = SpawnPrefab(replacement)
	     			if newprefab.components.stackable then 
	     				newprefab.components.stackable:SetStackSize(stacksize)
	     			end 
	     			container:RemoveItemBySlot(i)
	     			item:Remove()
	     			container:GiveItem(newprefab, i)
	     		end 
		     end 
		end 
		return false 
	end 
	--[[if inst.iceyamche then
		for i = 1, container:GetNumSlots() do
	        local item = container:GetItemInSlot(i)
	     	if item then 
	     		local replacement = nil 
				if item.prefab == "watermelon" or item.prefab == "butter" or item.prefab == "cave_banana" then 
				inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") 
						local fx = SpawnPrefab("collapse_small")
					local pos = Vector3(inst.Transform:GetWorldPosition())
					fx.Transform:SetScale(0.5, 0.5, 0.5)
				fx.Transform:SetPosition(pos:Get())
				end
				
		     	if item.prefab == "watermelon" then 
		     		replacement = "watermelonicle"
				elseif item.prefab == "butter" then 
		     		replacement = "icecream"
				elseif item.prefab == "cave_banana" then 
		     		replacement = "bananapop"	
						     	end  
		     	if replacement then 
	     			local stacksize = 1 
	     			if item.components.stackable then 
	     				stacksize = item.components.stackable:StackSize()
	     			end 
	     			local newprefab = SpawnPrefab(replacement)
	     			if newprefab.components.stackable then 
	     				newprefab.components.stackable:SetStackSize(stacksize)
	     			end 
	     			container:RemoveItemBySlot(i)
	     			item:Remove()
	     			container:GiveItem(newprefab, i)
	     		end 
		     end 
		end 
		return false 
	end ]]
	end

	local function OnClose(inst) 
if not inst.warning_monkey then
	if inst:HasTag("aquatic") then
	inst:RemoveTag("aquatic")
	end
end
--local player = GetPlayer()
--if inst.DLC2 then 
cooked(inst)
--end
if not inst.components.health:IsDead() then
inst.opening = false
	if inst.DLC2 or SaveGameIndex:IsModeShipwrecked() then
	if inst.components.inventory then 
	inst.components.inventory.acceptitems = true 
	--inst.components.inventory.acceptitems = false 	
	end
	end
	if not inst.components.inventory then
	 	--inst:AddComponent("inventory") level_inventory(inst)   

	end
	if not inst.yamche_wing then
	inst.sg:GoToState("close")
    end
	
if inst.iceyamche then
	local inv = inst.components.container 
    for i = 1, inv:GetNumSlots() do
        local item = inv:GetItemInSlot(i)
		if item and item.components.perishable then 
	--local fresh = item.components.perishable:GetPercent()
	item.components.perishable:StopPerishing()
		end
	end	
end
	
end
end
 
local function OnOpen(inst)
inst.campfire = false
if not inst.warning_monkey then
	if inst:HasTag("aquatic") then
	inst:RemoveTag("aquatic")
	end
end
if not inst.components.health:IsDead() then
inst.sg:GoToState("open")
inst.opening = true
local player = GetPlayer()
	
if inst.components.follower and inst.components.follower.leader ~= nil then
	if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
		inst.sleep_on = false
    end
end	
		if not inst.iceyamche then	
	inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
	elseif inst.iceyamche then	
	inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
		end
if inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
end
if inst.components.freezable:IsFrozen() then
        inst.components.freezable:Unfreeze()
    end
end 
end

local function itemtest(inst, item, slot)
	--if not item:HasTag("tstone") then
	if not item:HasTag("nothing") then
			return true
end
end

local function PhoenixSanityAura(inst, observer)
	if inst.components.hunger:GetPercent() < .5 then
		return 0
	elseif inst.components.hunger:GetPercent() > .5 then
			return TUNING.SANITYAURA_TINY

	elseif inst.components.hunger:GetPercent() > .9 then
			return TUNING.SANITYAURA_SMALL
	end

	if inst.components.follower and inst.components.follower.leader == observer then
		--return TUNING.SANITYAURA_TINY
		return 0
	end
	
	return 0
end
local function ShouldWakeUp(inst)
--DefaultWakeTest(inst)
--inst.light_on
    --return not inst.sleep_on 
end
local function ShouldSleep(inst)
--DefaultSleepTest(inst)
    return (inst.campfire or inst.sleep_on or inst.sleep_f) --[[and not inst.components.hunger:IsStarving(inst)]]
end
--[[
local function ShouldWakeUp(inst)
    return DefaultWakeTest(inst) or inst.components.hunger:IsStarving(inst) or not inst.components.follower:IsNearLeader(WAKE_TO_FOLLOW_DISTANCE)
end
local function ShouldSleep(inst)
    return DefaultSleepTest(inst) and not inst.components.hunger:IsStarving(inst) and inst.components.follower:IsNearLeader(SLEEP_NEAR_LEADER_DISTANCE)
end]]


local function CanEatTest(inst, item)
    --print("smallbird - CanEatTest", inst.name, item.components.edible.foodtype, item, item.prefab)
    local canEat = (item.components.edible.foodtype == "SEEDS") or (item.prefab == "berries")
    --print("   canEat?", canEat)

	if not item:HasTag("spoiled") then
			return true

   -- return canEat
end
end

local function ShouldAcceptItem(inst, item)

    --print("smallbird - ShouldAcceptItem", inst.name, item.name)
    if item.components.edible and inst.components.hunger and inst.components.eater then
        return not inst.sg:HasStateTag("open") and inst.components.eater:CanEat(item) and inst.components.hunger:GetPercent() <= 0.9
    end
end

local function OnGetItemFromPlayer(inst, giver, item)
    --print("smallbird - OnGetItemFromPlayer")

 		   if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
    end

    --I eat food
    if item.components.edible then

        if inst.components.combat.target and inst.components.combat.target == giver then
            inst.components.combat:SetTarget(nil)
		elseif giver.components.leader then
		inst.SoundEmitter:PlaySound("dontstarve/creatures/smallbird/scratch_ground")
		--giver.components.leader:AddFollower(inst)
        end
        if inst.components.eater:Eat(item) then
		inst.sg:GoToState("eating")
        end
    end
end

local function yamche_campfire(inst)
if not inst.components.burnable then
inst:AddComponent("burnable")
end
if not inst.iceyamche then 
   inst.components.burnable:AddBurnFX("campfirefire", Vector3(0,.9,0) )  

 	inst:ListenForEvent("onextinguish", onextinguish)
    inst:ListenForEvent("onignite", onignite)

    inst:AddComponent("fueled")
    inst.components.fueled.maxfuel = TUNING.FIREPIT_FUEL_MAX
    inst.components.fueled.accepting = true

	inst.components.fueled.bonusmult = 2
    inst.components.fueled:SetSections(6)
    inst.components.fueled.ontakefuelfn = function() inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") end
   inst.components.fueled:SetUpdateFn( function()
        if GetSeasonManager() and GetSeasonManager():IsRaining() then
            inst.components.fueled.rate = 1 + TUNING.FIREPIT_RAIN_RATE*GetSeasonManager():GetPrecipitationRate()
        else
            inst.components.fueled.rate = 1
        end
        
        if inst.components.burnable and inst.components.fueled then
            inst.components.burnable:SetFXLevel(inst.components.fueled:GetCurrentSection(), inst.components.fueled:GetSectionPercent())
        end
    end)
        
    inst.components.fueled:SetSectionCallback( function(section)
        if section == 0 then
            inst.components.burnable:Extinguish() 
        else
            if not inst.components.burnable:IsBurning() then
                inst.components.burnable:Ignite()
            end
            
            inst.components.burnable:SetFXLevel(section, inst.components.fueled:GetSectionPercent())
            
        end
    end)
        
  
	
else
    inst.components.burnable:AddBurnFX("coldfirefire_yamche", Vector3(0,0.5,0) )

  	inst:ListenForEvent("onextinguish", onextinguish)
    inst:ListenForEvent("onignite", onignite)

    inst:AddComponent("fueled")
    inst.components.fueled.maxfuel = TUNING.FIREPIT_FUEL_MAX
    inst.components.fueled.accepting = true

	inst.components.fueled.bonusmult = 2
    inst.components.fueled:SetSections(6)
    inst.components.fueled.ontakefuelfn = function() inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") end
   inst.components.fueled:SetUpdateFn( function()
        if GetSeasonManager() and GetSeasonManager():IsRaining() then
            inst.components.fueled.rate = 1 + TUNING.FIREPIT_RAIN_RATE*GetSeasonManager():GetPrecipitationRate()
        else
            inst.components.fueled.rate = 1
        end
        
        if inst.components.burnable and inst.components.fueled then
            inst.components.burnable:SetFXLevel(inst.components.fueled:GetCurrentSection(), inst.components.fueled:GetSectionPercent())
        end
    end)
        
    inst.components.fueled:SetSectionCallback( function(section)
        if section == 0 then
            inst.components.burnable:Extinguish() 
        else
            if not inst.components.burnable:IsBurning() then
                inst.components.burnable:Ignite()
            end
            
            inst.components.burnable:SetFXLevel(section, inst.components.fueled:GetSectionPercent())
            
        end
    end)
	
end
end

local poopchance2 = 0.65
local poopchance = 0.45
local rebackchance = 0.25
local tynychance = 0.15
local tynyychance = 0.1
local eggchance = 1.0

local function OnEat(inst, food)
--if not inst.no_growup then
if inst.iceyamche then
 if food.prefab == "glowdust" then
	local inv = inst.components.container 
    for i = 1, inv:GetNumSlots() do
        local item = inv:GetItemInSlot(i)
		if item and item.components.perishable then 
			 item.components.perishable:SetPercent(1)
	local fresh = item.components.perishable:GetPercent()
		end
	end	
end
end
if not inst.warning_monkey then
	if inst:HasTag("aquatic") then
	inst:RemoveTag("aquatic")
	end
end

if (food.prefab == "icecream" or food.prefab =="watermelonicle") and not inst.iceyamche then
inst.changed = true

inst.iceyamche = true

inst:RemoveComponent("burnable")
	yamche_campfire(inst)
--if not inst:HasTag("fridge") then
--inst:AddTag("fridge")
--end
inst.doctor = false
if inst.changed then
inst.changed = false
SpawnPrefab("lightning_blue").Transform:SetPosition(inst.Transform:GetWorldPosition())
  	SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get())
	SpawnPrefab("green_leaves").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.sg:GoToState("walk")
end
inst.AnimState:SetBuild("musha_ice")

elseif food.prefab == "hotchili" and inst.iceyamche then
inst.changed = true


inst.iceyamche = false
inst:RemoveComponent("burnable")
	yamche_campfire(inst)
--inst:RemoveTag("fridge")
if inst.changed then
inst.changed = false
SpawnPrefab("lightning_blue").Transform:SetPosition(inst.Transform:GetWorldPosition())
  	SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get())
	SpawnPrefab("green_leaves").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.sg:GoToState("walk")
end

if math.random() < 0.25 then
inst.AnimState:SetBuild("musha_small")
inst.doctor = true
elseif math.random() < 0.5 then
inst.AnimState:SetBuild("musha_teen")
inst.doctor = false
elseif math.random() < 0.5 then
inst.AnimState:SetBuild("musha_tall")
inst.doctor = false
elseif math.random() < 0.5 then
inst.AnimState:SetBuild("musha_tall2")
inst.doctor = false
elseif math.random() < 0.5 then
inst.AnimState:SetBuild("musha_tall3")
inst.doctor = false
elseif math.random() < 0.25 then
inst.AnimState:SetBuild("musha_tall4")
inst.doctor = false
elseif math.random() < 0.25 then
inst.AnimState:SetBuild("musha_tall5")
inst.doctor = false
else
inst.AnimState:SetBuild("musha_tall")
inst.doctor = false
end
end

--if not food:HasTag("icecream") and not food:HasTag("hotchili") then
if food.prefab == "mandrakesoup" then 
	inst.level = inst.level + 80
	levelexp(inst)
inst.components.hunger:DoDelta(150)
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_EXP.." + 80 ")

else
	
	if food.components.edible and food.components.edible.hungervalue >= 75 or food.components.edible.healthvalue >= 40 then
		inst.level = inst.level + 3
		levelexp(inst)
	elseif food.components.edible and food.components.edible.hungervalue < 75 and food.components.edible.hungervalue >= 40 then
		inst.level = inst.level + 2
		levelexp(inst)	
	elseif food.components.edible and food.components.edible.hungervalue < 40 and food.components.edible.hungervalue >= 25 then
		inst.level = inst.level + 1
		levelexp(inst)	
	elseif food.components.edible and food.components.edible.hungervalue < 25 and food.components.edible.hungervalue >= 12 and math.random() < 0.5 then
		inst.level = inst.level + 1
		levelexp(inst)		
	elseif food.components.edible and food.components.edible.hungervalue < 12 and food.components.edible.hungervalue >= 9 and math.random() < 0.25 then
		inst.level = inst.level + 1
		levelexp(inst)			
	elseif food.components.edible and food.components.edible.hungervalue < 9 and math.random() < 0.1 then
		inst.level = inst.level + 1
		levelexp(inst)			
		end
end	

    -- food heal
    if inst:HasTag("companion") then
        inst.components.health:DoDelta(inst.components.health.maxhealth * .05, nil, food.prefab)
        inst.components.combat:SetTarget(nil)
    else
        inst.components.health:DoDelta(inst.components.health.maxhealth, nil, food.prefab)
    end
    -- VEGGIE -- MEAT -- SEEDS
	
	inst:DoTaskInTime(1, function()
	
    if food.components.edible and food.components.edible.foodtype == "MEAT" then
	
	local fx = SpawnPrefab("poopcloud")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(0.7, 0.7, 0.7)
    if math.random() < poopchance then
		local poo = SpawnPrefab("guano")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5) 		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("poop")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("spoiled_food")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("spoiled_food")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("ash")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < tynyychance then
		local poo = SpawnPrefab("musha_spore")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
	end
	end

    if food.components.edible and food.components.edible.hungervalue > 141 and food.components.edible.healthvalue > 91 then
inst.components.health:DoDelta(400)
    if math.random() < poopchance then
		local poo = SpawnPrefab("orangegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("greengem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("yellowgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		

	end
	

    elseif food.components.edible and food.components.edible.hungervalue > 145 or food.components.edible.healthvalue > 49 then
inst.components.health:DoDelta(500)
    if math.random() < rebackchance then
		local poo = SpawnPrefab("goldnugget")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("redgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("bluegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("thulecite")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		

	end
	

    elseif food.components.edible and food.components.edible.hungervalue > 59 or food.components.edible.healthvalue > 29 or food.components.edible.sanityvalue > 14 then
inst.components.health:DoDelta(300)
    if math.random() < rebackchance then
		local poo = SpawnPrefab("goldnugget")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)	
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("wormlight")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("lightbulb")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("lightbulb")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("thulecite_pieces")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		

	end
	

    elseif food.components.edible and food.components.edible.hungervalue > 24 or food.components.edible.healthvalue > 9 or food.components.edible.sanityvalue > 4 then
inst.components.health:DoDelta(100)
    if math.random() < rebackchance then
		local poo = SpawnPrefab("poop")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("Charcoal")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("rottenegg")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)	
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("lightbulb")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("wormlight")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("houndstooth")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		

	end
	end

    if food.components.edible and food.components.edible.foodtype == "VEGGIE" then
	local fx = SpawnPrefab("poopcloud")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(0.5, 0.5, 0.5)
	
    if math.random() < poopchance then
		local poo = SpawnPrefab("seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)	
   elseif math.random() < poopchance then
		if inst.DLC2 then
		local poo = SpawnPrefab("coffeebeans") 
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)
				end
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("carrot_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("pumpkin_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("dragonfruit_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("pomegranate_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("corn_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("durian_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("eggplant_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)	
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("wormlight")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("ash")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
	end
	end

    if food.components.edible and food.components.edible.foodtype == "SEEDS" then
	local fx = SpawnPrefab("poopcloud")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(0.2, 0.2, 0.2)
    if math.random() < poopchance then
		local poo = SpawnPrefab("ash")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) poo.Transform:SetScale(0.5, 0.5, 0.5)		
	end
	end
	
end)	
	
if food and food.components.edible and (food.components.edible.healthvalue == 99 or food.prefab == "CRISTAL") and inst.level1 then
		local poo = SpawnPrefab("musha_egg")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
            die(inst)
    --inst:Remove()

end
if food and food.components.edible and (food.components.edible.healthvalue == 99 or food.prefab == "CRISTAL") and inst.level2 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_eggs1")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
            die(inst)
    --inst:Remove()
    end
end
if food and food.components.edible and (food.components.edible.healthvalue == 99 or food.prefab == "CRISTAL") and inst.level3 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_eggs2")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
            die(inst)
    --inst:Remove()
end
end
if food and food.components.edible and (food.components.edible.healthvalue == 99 or food.prefab == "CRISTAL") and inst.level4 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_eggs3")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
            die(inst)
    --inst:Remove()
    end
end
if food and food.components.edible and (food.components.edible.healthvalue == 99 or food.prefab == "CRISTAL") and inst.level5 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_egg1")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
            die(inst)
    --inst:Remove()
    end
end
if food and food.components.edible and (food.components.edible.healthvalue == 99 or food.prefab == "CRISTAL") and inst.level6 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_egg2")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
            die(inst)
    --inst:Remove()
    end
end
if food and food.components.edible and (food.components.edible.healthvalue == 99 or food.prefab == "CRISTAL") and inst.level7 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_egg3")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
            die(inst)
    --inst:Remove()
    end
end
if food and food.components.edible and (food.components.edible.healthvalue == 99 or food.prefab == "CRISTAL") and inst.level8 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_egg8")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition()) 	
            die(inst)
    --inst:Remove()
    end
end


----------	
	
--end
end
--end

local function OnRefuseItem(inst, item)
    inst.sg:GoToState("refuse")
    if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
end
end

local function FollowPlayer(inst)
	local player = GetPlayer()
	if player and player.components.leader then
		player.components.leader:AddFollower(inst)
	end
end

local function SetTeenAttackDefault(inst)

end

local function SetTeenAttackPeck(inst)
 
end

local function OnNewTarget(inst, data)
    --print("teenbird - OnNewTarget", data.target, inst.components.follower.leader)
    if data.target and data.target:HasTag("player") then
	return 

end
end
	
local function hunting(inst)
if inst.active_hunt then
local random = 0.1
if math.random() < random then
inst.yamche_lightning = true
end
if not inst.active_hunt then
end	
end end

local function yamche_hunt(inst)
    local dist = 20
    if inst.active_hunt then
    return FindEntity(inst, dist, function(guy)
        return inst.components.combat:CanTarget(guy)
    end,
    nil,
    {"musha","player","wall","houndmound","structure","companion","yamche","beefalo","koalefant","pig","bee","rocky","bird","statue","character","abigail","smashable","veggie","catcoon"})
	end

end
 	

local function leader_yamche(inst, data)

--Checklevel
    if inst.yamcheinfo and inst.level1 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 1\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/10\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..": 0")
	if inst.level > 10 then
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]")
	end
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level2 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 2\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/20\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..": 2")
	if inst.level > 20 then
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]")
	end
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level3 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 3\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/50\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..": 4")
	if inst.level > 50 then
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]")
	end
	inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level4 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 4\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/100\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..": 6")
	if inst.level > 100 then
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]")
	end
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level5 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 5\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/300\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..": 9")
	if inst.level > 300 then
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]")
	end
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level6 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 6\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/400\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..": 12")
	if inst.level > 400 then
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]")
	end
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level7 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 7\n"..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level).."/500\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..": 16")
	if inst.level > 500 then
	inst.components.talker:Say(STRINGS.MUSHA_YAMCHE_CHECK_GROW.."\n[ U ]")
	end
	inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level8 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.." 8\n"..STRINGS.MUSHA_HEALTH_MAX.."\n".. (inst.level + 800).."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_INV..": 20")
    inst.yamcheinfo = false 
end

local player = GetPlayer()
if player.components.leader:IsFollower(inst) and not inst.yamche_leader then

local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 20, {"phoenix"})
for k,v in pairs(ents) do
if v.yamche_leader_tag then
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
end
end

local function Onhunt(inst, target)
    return inst.components.combat:CanTarget(target)
end

local function mistake_hit(inst)
if not inst.components.follower.leader then
inst:DoTaskInTime(6, function()

	local x,y,z = inst.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x,y,z, 20, {"musha"})
	for k,v in pairs(ents) do
	if inst.components.sleeper:IsAsleep() then
    inst.components.sleeper:WakeUp() end
	if not v.components.health:IsDead() then
		v.components.talker:Say("Come on, Yamche !")
		inst.components.follower:SetLeader(v)
		v.components.leader:AddFollower(inst)
inst.stay = false
inst.sleepn = false 
inst.fightn = false
inst.peace = true
inst.active_hunt = false
inst.defense = true

	end	
	end
end)
end
end

local function OnAttacked(inst, data)

	if inst.components.burnable and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
	
if data.attacker and data.attacker:HasTag("musha") then
inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
inst.components.follower:SetLeader(nil)

inst.peace = true
inst.active_hunt = false
inst.defense = true
		inst.stay = true
		inst.yamche_leader = false
		inst.yamche_leader_tag = false

mistake_hit(inst)
end
if inst.sleep_on then
InShadow(inst)
end
if inst.resurrect_activate then
InShadow(inst)
end

    inst.components.combat:SuggestTarget(data.attacker)
    inst.components.combat:ShareTarget(data.attacker, 3, function(dude) return (dude:HasTag("ghosthound") or dude:HasTag("yamche")) and not dude.components.health:IsDead() end, 5)

end

local function OnRanger(inst, data)
local rangechance = 0.1
local rangechance2 = 0.75
local other = data.target
		
 if other and inst.ranger2 and inst.yamche_lightning then
 local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(inst:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0 )
		end 
           SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-30)
		inst.components.health:DoDelta(-10)
		inst.components.talker:Say("[Health] Cost: -10")
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "" ) end
	inst.ranger2 = false inst.yamche_lightning = false
inst.components.combat:SetRange(2, 3)	end

    if other and not inst.level1 and not inst.ranger3 and not inst.ranger2 and math.random() < rangechance then
inst.ranger2 = true 
	local sparks = SpawnPrefab("sparks")
	--inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
	local pos = Vector3(inst.Transform:GetWorldPosition())
	sparks.Transform:SetPosition(pos:Get())
	--inst.components.talker:Say("Full charged [Lightning Strike]")
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
	
 inst.components.combat:SetRange(10,13)
 
    elseif other and not inst.level1 and inst.ranger3 and not inst.ranger2 and math.random() < rangechance2 then
inst.ranger2 = true 
	local sparks = SpawnPrefab("sparks")
	--inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
	local pos = Vector3(inst.Transform:GetWorldPosition())
	sparks.Transform:SetPosition(pos:Get())
	--inst.components.talker:Say("Full charged [Lightning Strike]")
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
 inst.components.combat:SetRange(10,13)
 
    elseif other and inst.level2 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-10)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    elseif other and inst.level3 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-20)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    elseif other and inst.level4 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-30)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    elseif other and inst.level5 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-40)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    elseif other and inst.level6 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-50)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    elseif other and inst.level7 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-60)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)
    elseif other and inst.level8 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-100)
            SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "" ) end
inst.ranger2 = false 
 inst.components.combat:SetRange(2, 3)

    end
end


function Power_check(inst, data)
if inst.yamche_lightning and inst.components.health:GetPercent() > 0.3 then 
inst.ranger2 = true
inst.components.combat:SetRange(10,13)
if inst.bloom then
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.components.talker:Say("[Lightning -On]")
--inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
inst.bloom = false
end
elseif inst.yamche_lightning and inst.components.health:GetPercent() < 0.3 then
--scheduler:ExecuteInTime(3, function() inst.components.talker:Say("[Not enough cost]")end)
inst.yamche_lightning = false
end end
 

local function ranger_c(inst)
if inst.components.health:GetPercent() < .3 then
--inst.ranger2 = true 
inst.ranger3 = true 
inst.components.combat:SetRange(10,13)
elseif inst.components.health:GetPercent() >= .3 then
inst.ranger3 = false
inst.components.combat:SetRange(2, 3)
end end


local function OnHitfire(inst, data)
local firechance = 0.4
local other = data.target
   local pos = other:GetPosition()
  
    if other and other.components.burnable and not other:HasTag("slurtlehole") and not other:HasTag("structure") and not inst:HasTag("darkyamche") and not inst.iceyamche then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-10)
    elseif other and other.components.burnable and not other:HasTag("slurtlehole") and not other:HasTag("structure") and not inst.iceyamche and inst.ranger2 then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-40)
	local fx2 = SpawnPrefab("groundpoundring_fx")
	 	  fx2.Transform:SetScale(0.4, 0.4, 0.4)
	  	  fx2.Transform:SetPosition(other:GetPosition():Get())
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
    end
	
if not inst.iceyamche and not inst:HasTag("green") then
 if  inst.level1 then
 other.components.health:DoDelta(-4)
 elseif  inst.level2 then
other.components.health:DoDelta(-8)
 elseif  inst.level3 then
other.components.health:DoDelta(-12)
 elseif  inst.level4 then
other.components.health:DoDelta(-16)
 elseif  inst.level5 then
other.components.health:DoDelta(-20)
 elseif  inst.level6 then
other.components.health:DoDelta(-24)
 elseif  inst.level7 then
other.components.health:DoDelta(-28)
 elseif  inst.level8 then
other.components.health:DoDelta(-32)
end
elseif inst.iceyamche or inst:HasTag("green") then
 if  inst.level1 then
 other.components.health:DoDelta(-2)
 elseif  inst.level2 then
other.components.health:DoDelta(-4)
 elseif  inst.level3 then
other.components.health:DoDelta(-6)
 elseif  inst.level4 then
other.components.health:DoDelta(-8)
 elseif  inst.level5 then
other.components.health:DoDelta(-10)
 elseif  inst.level6 then
other.components.health:DoDelta(-12)
 elseif  inst.level7 then
other.components.health:DoDelta(-14)
 elseif  inst.level8 then
other.components.health:DoDelta(-16)
end	
	end
    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
    end
end

local function flower_shield(inst, attacked, data) 
if not inst.components.health:IsDead() and not inst.DLC then
    if inst.components.health:GetPercent() >= .7 then
	SpawnPrefab("dr_warm_loop_1").Transform:SetPosition(inst:GetPosition():Get())	
    elseif inst.components.health:GetPercent() < .7 and inst.components.health:GetPercent() >= .5 then
	SpawnPrefab("dr_warm_loop_2").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.components.health:GetPercent() < .5 and inst.components.health:GetPercent() >= .3 then
	SpawnPrefab("dr_warmer_loop").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.components.health:GetPercent() < .3 then
	SpawnPrefab("dr_hot_loop").Transform:SetPosition(inst:GetPosition():Get())
	end
elseif not inst.components.health:IsDead() and inst.DLC then
    if inst.components.health:GetPercent() >= .7 then
	SpawnPrefab("green_leaves").Transform:SetPosition(inst:GetPosition():Get())	
    elseif inst.components.health:GetPercent() < .7 and inst.components.health:GetPercent() >= .5 then
	SpawnPrefab("yellow_leaves").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.components.health:GetPercent() < .5 and inst.components.health:GetPercent() >= .3 then
	SpawnPrefab("orange_leaves").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.components.health:GetPercent() < .3 then
	SpawnPrefab("red_leaves").Transform:SetPosition(inst:GetPosition():Get())
	end	end
end

local function OnHitfreeze(inst, data)
local freezechance = 0.4
local other = data.target
   local pos = other:GetPosition()
    if other and other.components.freezable and inst.iceyamche then
        other.components.freezable:AddColdness(0.5)
        other.components.freezable:SpawnShatterFX()
		
			local prefab = "icespikes_fx_"..math.random(1,4)
			local fx = SpawnPrefab(prefab)
			local shards = math.random(0.4,0.5)
			fx.Transform:SetScale(shards, shards, shards)
			fx.Transform:SetPosition(other:GetPosition():Get())
elseif other and other.components.freezable and inst.iceyamche and inst.ranger2 then
        other.components.freezable:AddColdness(3)
        other.components.freezable:SpawnShatterFX()
		local prefab = "icespikes_fx_"..math.random(1,4)
			local fx = SpawnPrefab(prefab)
			local shards = math.random(1,1.2)
			fx.Transform:SetScale(shards, shards, shards)
			fx.Transform:SetPosition(other:GetPosition():Get())
			
  	local fx2 = SpawnPrefab("groundpoundring_fx")
	 	  fx2.Transform:SetScale(0.4, 0.4, 0.4)
	  	  fx2.Transform:SetPosition(other:GetPosition():Get())
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()

    end

    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
    end
end

local function OnHitvampire(inst, data)
local other = data.target
if not (other:HasTag("smashable")) then
--[[inst:HasTag("darkyamche")]]
 if other and inst.vampire and inst.vampire_on then
        SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        inst.components.health:DoDelta(10)

    end
end
end





local function resist(inst, data)

if inst.components.health:GetPercent() < 0.25 and not inst.vampire then
            inst.vampire = SpawnPrefab( "debuff_bloodlp" )
			inst.vampire.Transform:SetScale(0.3, 0.3, 0.3)
            local follower = inst.vampire.entity:AddFollower()
            follower:FollowSymbol( inst.GUID, "head", 0, -130, 2 )
			inst.vampire_on = true
			inst:DoTaskInTime(30, function() if inst.vampire then
			inst.vampire_on = false
			inst.vampire:Remove() inst.vampire = nil end end)
end	
if inst.components.health:GetPercent() >= 0.9 and inst.vampire then
			inst.vampire:Remove()
			inst.vampire_on = false
			inst.vampire = nil
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

local function updatestats(inst, data)

	if inst.components.health:GetPercent() < 0.2 then
	
if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
    --inst:ListenForEvent("attacked", OnFire)

elseif inst.components.health:GetPercent() >= 0.2 then
   -- inst:RemoveEventCallback("attacked", OnFire)

elseif inst.components.health:GetPercent() >= 0.2 and not inst.ranger2 then


end

if inst.components.health:GetPercent() >= .3 and not inst.iceyamche then

			--
if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "" ) end
    			
    
	if not inst.yamche_wing then
    inst.components.combat:SetAttackPeriod(0.8)
	elseif inst.yamche_wing then
	inst.components.combat:SetAttackPeriod(3.2)
	end
		elseif inst.components.health:GetPercent() >= .3 and inst.iceyamche then
    			
			--
    
	if not inst.yamche_wing then
    inst.components.combat:SetAttackPeriod(0.8)
	elseif inst.yamche_wing then
	inst.components.combat:SetAttackPeriod(3.2)
	end

		elseif inst.components.health:GetPercent() < .3 and not inst.iceyamche then
    			

    --inst:ListenForEvent("attacked", Onfreeze)

	if not inst.yamche_wing then
    inst.components.combat:SetAttackPeriod(2.4)
	elseif inst.yamche_wing then
	inst.components.combat:SetAttackPeriod(5)
	end
	elseif inst.components.health:GetPercent() < .3 and inst.iceyamche then
    			

    

	if not inst.yamche_wing then
    inst.components.combat:SetAttackPeriod(2.4)
	elseif inst.yamche_wing then
	inst.components.combat:SetAttackPeriod(5)
	end
end
end

local function GetPeepChance(inst)
    local peep_percent = 0.1
    if inst.components.hunger then
        if inst.components.hunger:IsStarving() then
            peep_percent = .4
	--inst.components.talker:Say("Kkyuuu! Koo Koo!")
        elseif inst.components.hunger:GetPercent() < .1 then
            peep_percent = 0.3
	--inst.components.talker:Say("Kku! Koo Koo!")
        elseif inst.components.hunger:GetPercent() < .3 then
            peep_percent = 0.1
	--inst.components.talker:Say("Kku! Koo!")
        elseif inst.components.hunger:GetPercent() < .5 then
            peep_percent = 0.1
	inst.components.talker:Say("Kku!")
        elseif inst.components.health:GetPercent() < .2 then
            peep_percent = 0.4
	--inst.components.talker:Say("PPu! Poo! Poo!")
        elseif inst.components.health:GetPercent() < .4 then
            peep_percent = 0.15
	--inst.components.talker:Say("PPu! Poo!")
        elseif inst.components.health:GetPercent() < .6 then
            peep_percent = 0.1
	inst.components.talker:Say("Poo!")

        end
    end
    return peep_percent
end

local function GetCryChance(inst, data)
    local cry_percent = 0
	local player = GetPlayer()
if inst.components.follower:IsNearLeader(CRY_NEAR_LEADER_DISTANCE) then

if not inst.fightn and inst.components.hunger:GetPercent() > .2 and player.components.health:GetPercent() <= .2 and not player.sleep_on then
            cry_percent = .05
	inst.components.talker:Say("Ccuure!!!")
        player.components.health:DoDelta(20)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-10)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)
		if inst:HasTag("green") then
		player.components.health:DoDelta(10)
		if player:HasTag("DLC2") then
		if player.components.poisonable then
		inst.components.talker:Say("Poison Ccuure!\n[Green]")
			player.components.poisonable:Cure(inst) 
				end
			end	
		end	
		
elseif not inst.fightn and inst.components.hunger:GetPercent() > .3 and player.components.health:GetPercent() > .2 and player.components.health:GetPercent() <= .3 and not player.sleep_on then
            cry_percent = .04
	inst.components.talker:Say("Ccuure!!")
        player.components.health:DoDelta(10)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-7)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)
		if inst:HasTag("green") then
		player.components.health:DoDelta(10)
		if player:HasTag("DLC2") then
		if player.components.poisonable then
		inst.components.talker:Say("Poison Ccuure!\n[Green]")
			player.components.poisonable:Cure(inst) 
				end
			end	
		end	
		
elseif not inst.fightn and inst.components.hunger:GetPercent() > .5 and player.components.health:GetPercent() > .3 and player.components.health:GetPercent() <= .5 and not player.sleep_on then
            cry_percent = .01
	inst.components.talker:Say("Ccuure!")
        player.components.health:DoDelta(5)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-4)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)	
		if inst:HasTag("green") then
		player.components.health:DoDelta(10)
		if player:HasTag("DLC2") then
		if player.components.poisonable then
		inst.components.talker:Say("Poison Ccuure!\n[Green]")
			player.components.poisonable:Cure(inst) 
				end
			end	
		end	
		
elseif inst.fightn and inst.components.hunger:GetPercent() > .2 and player.components.health:GetPercent() <= .2 and not player.sleep_on then
            cry_percent = 1
	inst.components.talker:Say("Ccuure!!!")
        player.components.health:DoDelta(20)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-10)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)
			if inst:HasTag("green") then
		player.components.health:DoDelta(10)
		if player:HasTag("DLC2") then
		if player.components.poisonable then
		inst.components.talker:Say("Poison Ccuure!\n[Green]")
			player.components.poisonable:Cure(inst) 
				end
			end	
		end	
		
elseif inst.fightn and inst.components.hunger:GetPercent() > .3 and player.components.health:GetPercent() > .2 and player.components.health:GetPercent() <= .5 and not player.sleep_on then
            cry_percent = .95
	inst.components.talker:Say("Ccuure!!")
        player.components.health:DoDelta(10)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-7)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)
		if inst:HasTag("green") then
		player.components.health:DoDelta(10)
		if player:HasTag("DLC2") then
		if player.components.poisonable then
		inst.components.talker:Say("Poison Ccuure!\n[Green]")
			player.components.poisonable:Cure(inst) 
				end
			end	
		end	
		
elseif inst.fightn and inst.components.hunger:GetPercent() > .5 and player.components.health:GetPercent() > .5 and player.components.health:GetPercent() <= .8 and not player.sleep_on then
            cry_percent = .9
	inst.components.talker:Say("Ccuure!")
        player.components.health:DoDelta(5)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-4)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)	
			if inst:HasTag("green") then
		player.components.health:DoDelta(10)
		if player:HasTag("DLC2") then
		if player.components.poisonable then
		inst.components.talker:Say("Poison Ccuure!\n[Green]")
			player.components.poisonable:Cure(inst) 
				end
			end	
		end	
		
elseif inst.fightn and inst.components.hunger:GetPercent() > .8 and player.components.health:GetPercent() > .8 and player.components.health:GetPercent() < 1 and not player.sleep_on then
            cry_percent = .5
	inst.components.talker:Say("Ccuure!")
        player.components.health:DoDelta(5)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-4)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)		
		if inst:HasTag("green") then
		player.components.health:DoDelta(10)
		if player:HasTag("DLC2") then
		if player.components.poisonable then
		inst.components.talker:Say("Poison Ccuure!\n[Green]")
			player.components.poisonable:Cure(inst) 
				end
			end	
		end	
		
		elseif inst.fightn and inst.components.hunger:GetPercent() > .2 and inst.components.health:GetPercent() < .3 and not player.sleep_on then
            cry_percent = .9
	inst.components.talker:Say("Kkuure!")
        --player.components.health:DoDelta(5)
        --player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(30)
        inst.components.hunger:DoDelta(-4)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
 		if inst:HasTag("green") then
		player.components.health:DoDelta(10)
		if player:HasTag("DLC2") then
		if player.components.poisonable then
		inst.components.talker:Say("Poison Ccuure!\n[Green]")
			player.components.poisonable:Cure(inst) 
				end
			end	
		end	
		
    end
    end
    return cry_percent
end

local function OnHealthDelta(inst, data)
if inst.sleep_on or inst.campfire or inst.sleep_f then 
inst.components.health:StartRegen(2, 1)


elseif not inst.sleep_on and not inst.campfire and not inst.sleep_f then
if inst.components.health:GetPercent() >= .3 then
inst.components.health:StartRegen(1, 30)
elseif inst.components.health:GetPercent() < .3 then 
inst.components.health:StartRegen(1, 2)
end
end
end

local function onspawnfn(inst, spawn)
if not inst.sleep_on then
 inst.sg:GoToState("command")
end 
 SpawnPrefab("sparklefx").Transform:SetPosition(inst:GetPosition():Get())
 SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
end
local function sleep_heal(inst)
if inst.yamche_wing then
inst.yamche_lightning = true
end
if inst.sleep_on and inst.components.health:GetPercent() < 1 then
inst.components.health:DoDelta(1)
end
end

---growup yamche

local function SetTeen(inst)
    --print("smallbird - SetTeen")
	if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
    inst.sg:GoToState("growup") inst.dismissal_leader = true -- calls back to SpawnTeen
	InShadow(inst)
	
end

local function SpawnTeen(inst)
    --print("smallbird - SpawnTeen")
local random = 0.2
local last = 1.0

    if math.random() < random then
    local musha_0 = SpawnPrefab("musha_teen")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_teenice")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("walk")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_teenr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("walk")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_teenr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("walk")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_teenr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("walk")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_teenr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("walk")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_teenice")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("walk")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_teenr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("walk")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_teenr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("walk")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_teenr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("walk")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_0 = SpawnPrefab("musha_teen")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)

    elseif math.random() < random then
    local musha_0 = SpawnPrefab("musha_teen")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_teenr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("walk")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_teenr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("walk")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_teenr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("walk")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_teenr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("walk")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_teenice")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("walk")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_teenr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("walk")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_teenr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("walk")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_teenr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("walk")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    else
    local musha_0 = SpawnPrefab("musha_teen")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)

    end
inst.stop_working = false
inst.components.health:SetInvincible(false)
            die(inst)
    --inst:Remove()

    end

local function SetAdult(inst)
    --print("smallbird - SetAdult")
if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
inst.sg:GoToState("growup") inst.dismissal_leader = true -- calls back to SpawnAdult
InShadow(inst)
end

local function SpawnAdult(inst)
    --print("smallbird - SpawnAdult")
local random = 0.2
local last = 1.0

    if math.random() < random then
 local musha_0 = SpawnPrefab("musha_tall")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrice")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("walk")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("walk")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("walk")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("walk")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("walk")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
else
 local musha_0 = SpawnPrefab("musha_tall")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
end

inst.stop_working = false
inst.components.health:SetInvincible(false)
            die(inst)
    --inst:Remove()

    end

local function SetAdult2(inst)
    --print("smallbird - SetAdult")
if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
inst.sg:GoToState("growup") inst.dismissal_leader = true -- calls back to SpawnAdult
InShadow(inst)
end

local function SpawnAdult2(inst)

local random = 0.2
local last = 1.0

    if math.random() < random then
    local musha_0 = SpawnPrefab("musha_tall2")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrice")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("walk")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallrr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("walk")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallrr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("walk")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallrr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("walk")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallrr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("walk")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrr5")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("walk")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    else
    local musha_0 = SpawnPrefab("musha_tall2")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
end

inst.stop_working = false
inst.components.health:SetInvincible(false)
            die(inst)
    --inst:Remove()

    end
local function SetAdult3(inst)
    --print("smallbird - SetAdult")
if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
inst.sg:GoToState("growup") inst.dismissal_leader = true -- calls back to SpawnAdult
InShadow(inst)
end

local function SpawnAdult3(inst)

local random = 0.2
local last = 1.0

    if math.random() < random then
    local musha_0 = SpawnPrefab("musha_tall3")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrrice")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("walk")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallrrr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("walk")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallrrr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("walk")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallrrr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("walk")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallrrr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("walk")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrrr5")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("walk")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrrice")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("walk")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    else
    local musha_0 = SpawnPrefab("musha_tall3")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
end

inst.stop_working = false
inst.components.health:SetInvincible(false)
            die(inst)
    --inst:Remove()

    end
local function SetAdult4(inst)
    --print("smallbird - SetAdult")
if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
inst.sg:GoToState("growup") inst.dismissal_leader = true -- calls back to SpawnAdult
InShadow(inst)
end

local function SpawnAdult4(inst)
local random = 0.2
local last = 1.0

    if math.random() < random then
    local musha_0 = SpawnPrefab("musha_tall4")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_7 = SpawnPrefab("musha_tallrrrrice")
    musha_7.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_7.sg:GoToState("walk")
musha_7.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallrrrr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("walk")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallrrrr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("walk")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallrrrr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("walk")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallrrrr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("walk")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrrrr5")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("walk")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrrr6")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("walk")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_7 = SpawnPrefab("musha_tallrrrrice")
    musha_7.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_7.sg:GoToState("walk")
musha_7.components.follower:SetLeader(inst.components.follower.leader)
   else
    local musha_0 = SpawnPrefab("musha_tall4")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
end

inst.stop_working = false
inst.components.health:SetInvincible(false)
            die(inst)
    --inst:Remove()

    end
local function SetAdult5(inst)
    --print("smallbird - SetAdult")
if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
inst.sg:GoToState("growup") inst.dismissal_leader = true -- calls back to SpawnAdult
InShadow(inst)
end


local function SpawnAdult5(inst)
local random = 0.2
local last = 1.0
    if math.random() < random then
    local musha_0 = SpawnPrefab("musha_tall5")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_7 = SpawnPrefab("musha_tallrrrrrice")
    musha_7.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_7.sg:GoToState("walk")
musha_7.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallrrrrr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("walk")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallrrrrr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("walk")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallrrrrr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("walk")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallrrrrr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("walk")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrrrrr5")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("walk")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrrrr6")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("walk")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_7 = SpawnPrefab("musha_tallrrrrrice")
    musha_7.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_7.sg:GoToState("walk")
musha_7.components.follower:SetLeader(inst.components.follower.leader)
    else
    local musha_0 = SpawnPrefab("musha_tall5")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("walk")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
end


inst.stop_working = false
inst.components.health:SetInvincible(false)
            die(inst)
    --inst:Remove()

    end

local function SetAdult6(inst)
    --print("smallbird - SetAdult")
if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end
inst.sg:GoToState("growup") inst.dismissal_leader = true -- calls back to SpawnAdult
InShadow(inst)
end

local function SpawnAdult6(inst)
	local dark1 = SpawnPrefab("statue_transition")
	local dark2 = SpawnPrefab("statue_transition_2")
	local pos = Vector3(inst.Transform:GetWorldPosition())

    local musha_tall6= SpawnPrefab("musha_egg8")
    musha_tall6.Transform:SetPosition(inst.Transform:GetWorldPosition())
dark1.Transform:SetPosition(pos:Get())
dark2.Transform:SetPosition(pos:Get())
 
	--if inst.components.container then
	--inst.components.container:DropEverything() end
	--if inst.components.inventory and not inst.DLC2 then 
	--inst.components.inventory:DropEverything() end

	inst.stop_working = false
inst.components.health:SetInvincible(false)
            die(inst)
    --inst:Remove()

    end

--time
--(lv2)
local function GetTeenGrowTime(inst)
	return 1
end
--(lv3)
local function GetTallGrowTime(inst)
	return 1
	--return 1400
end
--(lv4)
local function GetTall2GrowTime(inst)
	return 1
	--return 2200
end
--(lv5)
local function GetTall3GrowTime(inst)
	return 1
	--return 3000
end
--(lv6)
local function GetTall4GrowTime(inst)
	return 1
	--return 3800
end
--(lv7)
local function GetTall5GrowTime(inst)
	return 1
	--return 4600
end
--(RP)
local function GetTall6GrowTime(inst)
	return 1
	--return 4600
end

--[[
local function GetTallGrowTime(inst)
	return TUNING.TEENBIRD_GROW_TIME
end
]]--

local function create_common(inst)
    --print("smallbird - create_common")
	--inst = inst or CreateEntity()
	
    inst:AddTag("yamche")
    inst:AddTag("yamcheb")
    inst:AddTag("companion")
   -- inst:AddTag("character")
    
    inst:AddTag("scarytoprey")
   -- inst:AddTag("noauradamage")
   -- --inst:AddTag("fridge")
   -- inst:AddTag("nocool")
   inst:AddTag("lowcool")
inst:AddTag("amphibious")

--inst:AddTag("peck_attack")
inst:AddTag("notraptrigger")
inst:AddTag("phoenix")

    inst.entity:AddMiniMapEntity()
	--inst.entity:AddMiniMapEntity():SetPriority( 5 )
	--inst.MiniMapEntity:SetIcon( "musha_small.tex" )
	inst.MiniMapEntity:SetIcon( "musha_teen.tex" )

	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()

	inst.entity:AddLight()
	inst.Light:SetColour(185/255,175/255,170/255)
	inst.entity:AddLightWatcher() 
	
local player = GetPlayer()
if --[[player:HasTag("DLC") or]] player.components.moisture then
	inst.DLC = true
		end
if --[[player:HasTag("DLC2") or]] SaveGameIndex:IsModeShipwrecked() or player.components.poisonable then
	inst.DLC2 = true
if inst.DLC2 then
	if not inst.components.waterproofer then
	inst:AddComponent("waterproofer")
	end
	
end
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
 if player.no_growup then
 inst.no_growup = true
 end
 
 
 		if inst.DLC2 then
	MakeAmphibiousCharacterPhysics(inst, 10, .25)
	--MakePoisonableCharacter(inst)
		elseif not inst.DLC2 then
 	MakeCharacterPhysics(inst, 10, .25)
 
		end
	
	--MakePoisonableCharacter(inst)
--[[	
   MakeCharacterPhysics(inst, 10, .25)
    inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(GetWorldCollision())
    inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)
	inst.Physics:CollidesWith(COLLISION.WAVES)
	inst.Physics:SetCylinder(.5, 1)
]]
    inst.Transform:SetFourFaced()

	
	inst:SetBrain(brain)	

    inst.userfunctions = 
    {
        FollowPlayer = FollowPlayer,
        GetPeepChance = GetPeepChance,
        GetCryChance = GetCryChance,
        SpawnTeen = SpawnTeen,
        SpawnAdult = SpawnAdult,
        SpawnAdult2 = SpawnAdult2,
        SpawnAdult3 = SpawnAdult3,
        SpawnAdult4 = SpawnAdult4,
        SpawnAdult5 = SpawnAdult5,
        SpawnAdult6 = SpawnAdult6,

    }
	
    --("   order")

---name
    inst:AddComponent("named")
	--if not inst.level1 then
    inst.components.named.possiblenames = STRINGS.PHOENIXS
    inst.components.named:PickNewName()
	--[[elseif inst.level1 then
    inst.components.named.possiblenames = STRINGS.BABY
    inst.components.named:PickNewName()
			end]]
    inst:AddComponent("sanityaura")
    inst.components.sanityaura.aurafn = PhoenixSanityAura
--------------------
inst:AddComponent("inspectable")
--------------------
    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(9, 9)
    inst.components.playerprox:SetOnPlayerNear(on_close)
    inst.components.playerprox:SetOnPlayerFar(far)

    ------------------------------------------
    inst:AddComponent("health")
	inst.components.health.fire_damage_scale = 0
	inst.components.health.canmurder = false
	inst:ListenForEvent("healthdelta", OnHealthDelta)
	inst.components.health:StartRegen(1, 10)

    inst:AddComponent("hunger")
	inst.components.hunger:SetRate(15/TUNING.TEENBIRD_STARVE_TIME)	   
	
    inst:AddComponent("combat")
	updatestats(inst)
	 
    inst.components.combat.playerdamagepercent = 0
	inst:ListenForEvent("attacked", OnAttacked)
    inst.Peaceful = inst:DoPeriodicTask(0.1, Peace_yamche)   
	
	inst.leader_yamche = inst:DoPeriodicTask(0.5, leader_yamche)   
	inst.hunt = inst:DoPeriodicTask(5, hunting)
	inst.icebox = inst:DoPeriodicTask(5, function()
	
	local leader = inst.components.follower.leader
	if leader == nil and not inst.sleep_on then
	inst.sleep_on = true
	end
	
	if inst.iceyamche and inst.components.container ~= nil then
	local inv = inst.components.container 
    for i = 1, inv:GetNumSlots() do
        local item = inv:GetItemInSlot(i)
		if item and item.components.perishable then 
		item.components.perishable:StopPerishing()
		end
	end	
	end
	end)
	
    inst.components.combat:SetRetargetFunction(1, yamche_hunt)
    inst.components.combat:SetKeepTargetFunction(Onhunt)

        inst.procfn = function() tryproc(inst) end
        inst:ListenForEvent("attacked", inst.procfn)
		inst.taunting = inst:DoPeriodicTask(8,taunting)
		
inst.on_shard_reflect = function(attacked, data)
if not inst:HasTag("fa_poison") then
if data.attacker and not data.attacker:HasTag("thorny") and not data.attacker:HasTag("shadowcreature") and data.attacker.components.health then

 if inst.components.health:GetPercent() <= .5 and not inst.components.health:IsDead() and math.random() < 0.35 then
	SpawnPrefab("shock_fx2").Transform:SetPosition(inst:GetPosition():Get())
	inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        inst.components.health:DoDelta(5)
		end

if not inst.iceyamche and inst.components.health:GetPercent() < .3 then
	if data.attacker and data.attacker.components.freezable then
	local prefab = "icespikes_fx_"..math.random(1,4)
    local fx = SpawnPrefab(prefab)
    local shards = math.random(0.7,0.8)
 	fx.Transform:SetScale(shards, shards, shards)
	fx.Transform:SetPosition(data.attacker:GetPosition():Get())

            data.attacker.components.freezable:AddColdness(0.4)
            data.attacker.components.freezable:SpawnShatterFX()
    end 
elseif not inst.iceyamche and inst.components.health:GetPercent() >= .3 then
	if data.attacker and data.attacker.components.burnable and not data.attacker:HasTag("thorny") and not data.attacker:HasTag("shadowcreature") and math.random() < 0.25 then
            data.attacker.components.burnable:IsBurning()
            data.attacker.components.health:DoDelta(-10)
            data.attacker.components.burnable:Ignite(true)
    end 

elseif inst.iceyamche and inst.components.health:GetPercent() < .3 then
	if data.attacker and data.attacker.components.freezable then
	local prefab = "icespikes_fx_"..math.random(1,4)
    local fx = SpawnPrefab(prefab)
    local shards = math.random(0.7,0.8)
 	fx.Transform:SetScale(shards, shards, shards)
	fx.Transform:SetPosition(data.attacker:GetPosition():Get())

            data.attacker.components.freezable:AddColdness(0.35)
            data.attacker.components.freezable:SpawnShatterFX()
    end 
elseif inst.iceyamche and inst.components.health:GetPercent() >= .3 then
	if data.attacker and data.attacker.components.freezable then
	local prefab = "icespikes_fx_"..math.random(1,4)
    local fx = SpawnPrefab(prefab)
    local shards = math.random(0.7,0.8)
 	fx.Transform:SetScale(shards, shards, shards)
	fx.Transform:SetPosition(data.attacker:GetPosition():Get())

            data.attacker.components.freezable:AddColdness(0.5)
            data.attacker.components.freezable:SpawnShatterFX()
    end 
end	

if inst.shield_on and data.attacker and not data.attacker:HasTag("molebait") then
SpawnPrefab("lightning2").Transform:SetPosition(data.attacker:GetPosition():Get())
            data.attacker.components.health:DoDelta(-60)
end   

	if data.attacker.components.burnable and data.attacker.components.burnable:IsBurning() then
        data.attacker.components.burnable:Extinguish()
    end
end	
end	
end
	
inst:ListenForEvent("attacked", inst.on_shard_reflect, inst)		
		
		
--inst:ListenForEvent("hungerdelta", Checklevel)
inst:ListenForEvent("healthdelta", resist)
inst:ListenForEvent("healthdelta", ranger_c)
inst:ListenForEvent("hungerdelta", on_wakeup)

    inst:ListenForEvent("onhitother", OnHitfire)
    inst:ListenForEvent("onhitother", OnHitfreeze)
    inst:ListenForEvent("onhitother", OnHitvampire)
    inst:ListenForEvent("onhitother", OnRanger)
	inst:ListenForEvent("hungerdelta", Power_check)
    inst:ListenForEvent("death", ondeath)
    inst:ListenForEvent("attacked", flower_shield)
	inst.growup_check = inst:DoPeriodicTask(1, function() if inst.grow_up_yamchae_ready then growup_check(inst) end end)

inst:DoTaskInTime(2, function()	
if inst.components.follower.leader ~= nil then
inst.ndeath = true
inst.ndead = false
--inst.peace = false
--inst.active_hunt = false
--inst.defense = false
end end)
    inst.components.inspectable.getstatus = GetStatus

    inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
    inst.components.locomotor.walkspeed = 6
    inst.components.locomotor.runspeed = 9
 

    inst:AddComponent("follower")
	--inst.components.follower.canaccepttarget = true

-------
 --[[if ACTIONS.STAYORDER~= nil then
    inst:AddComponent("staycommand")
    	end]]
-------
    inst:AddComponent("talker")
    inst.components.talker.fontsize = 24
	inst.components.talker.offset = Vector3(0,-800,0)
    inst.components.talker.colour = Vector3(0.75, 0.85, 1, 1)

    inst:AddComponent("eater")
inst.components.eater:SetCanEatTestFn(CanEatTest)
    inst.components.eater:SetOmnivore()
	inst.components.eater.strongstomach = true

    --[[ 
	inst:AddComponent("machine")
    inst.components.machine.turnonfn = onuseyamche
    inst.components.machine.turnofffn = offuseyamche
    inst.components.machine.cooldowntime = 0
	]]
	
	--inst.components.eater:SetElemental()
    --inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", }
	
		--inst:AddComponent("inventory") 
		--level_inventory(inst) 
		if inst.DLC2 then
	if not inst.components.waterproofer then
	inst:AddComponent("waterproofer")
	end
	
		end
--[[inst.inventoryset =	function(inst,data)
if inst.components.inventory then
if inst.level1 then
inst.components.inventory.maxslots = 3
elseif inst.level2 then
inst.components.inventory.maxslots = 5
elseif inst.level3 then
inst.components.inventory.maxslots = 7
elseif inst.level4 then
inst.components.inventory.maxslots = 9
elseif inst.level5 then
inst.components.inventory.maxslots = 10
elseif inst.level6 then
inst.components.inventory.maxslots = 11
elseif inst.level7 then
inst.components.inventory.maxslots = 12
elseif inst.level8 then
inst.components.inventory.maxslots = 14
end end
end]]
		
		--inst:AddComponent("playeractionpicker")
if inst.DLC or inst.DLC2 or SaveGameIndex:IsModeShipwrecked() then
	--inst.components.inventory:IsWaterproof()
end	
		
	
	if inst.DLC2 then
	--inst.components.inventory.nosteal = true
	--inst.components.inventory.acceptitems = true 
	end
	--inst.components.inventory.maxslots = 6
		
    inst.components.eater:SetOnEatFn(OnEat)

    inst:AddComponent("sleeper")
    inst.components.sleeper:SetResistance(4)
    inst.components.sleeper.testperiod = GetRandomWithVariance(4, 1)
    inst.components.sleeper:SetSleepTest(ShouldSleep)
    inst.components.sleeper:SetWakeTest(ShouldWakeUp)
    inst:AddComponent("freezable")
    inst.components.freezable:SetResistance(6)

    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader.onrefuse = OnRefuseItem
		 
    inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("glowdust")
	inst.components.periodicspawner:SetOnSpawnFn(onspawnfn)
    inst.components.periodicspawner:SetRandomTimes(450, 900)
  --  inst.components.periodicspawner:SetDensityInRange(20, 2)
  --  inst.components.periodicspawner:SetMinimumSpacing(3)
    inst.components.periodicspawner:Start()

--------------------------------------------------------------------------
    inst.Take_order = inst:DoPeriodicTask(1, Take_order) 
	inst.yamche_wing = inst:DoPeriodicTask(0.5,yamche_wing )
inst.yamche_wing = false	
inst:DoPeriodicTask(2.5, function() 
	
	local owner = inst.components.follower.leader
	if owner ~= nil then
	local yamchaep = inst:GetPosition()
	local ground = GetWorld().Map:GetTileAtPoint(yamchaep.x, yamchaep.y, yamchaep.z)	
	if (owner.sg:HasStateTag("rowing") or owner.sg:HasStateTag("sailing") or owner.sg:HasStateTag("sail") or owner.sg:HasStateTag("row") or owner.sg:HasStateTag("boating") or owner:HasTag("aquatic")) then
	inst.yamche_wing = true
	else	
		if inst.yamche_wing then
			inst.yamche_wing = false
		end
	end	 
	elseif owner == nil and inst.yamche_wing then
	inst.yamche_wing = false
	end
end)
	
if not inst.level1 and not inst.baby then
inst:AddComponent("inventoryitem") 
inst:AddComponent("equippable")
		if inst.DLC2 then
	if not inst.components.waterproofer then
	inst:AddComponent("waterproofer")
	end
		end
	if inst.level1 then
	inst.components.inventoryitem:ChangeImageName("musha_small")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
	elseif inst.level2 then
	inst.components.inventoryitem:ChangeImageName("musha_teen")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_teen.xml"
	elseif inst.level3 then
	inst.components.inventoryitem:ChangeImageName("musha_tall")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall.xml"	
	elseif inst.level4 then
	inst.components.inventoryitem:ChangeImageName("musha_tall2")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall2.xml"	
	elseif inst.level5 then
	inst.components.inventoryitem:ChangeImageName("musha_tall3")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall3.xml"	
	elseif inst.level6 then
	inst.components.inventoryitem:ChangeImageName("musha_tall4")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall4.xml"	
	elseif inst.level7 then
	inst.components.inventoryitem:ChangeImageName("musha_tall5")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"	
	elseif inst.level8 then
	inst.components.inventoryitem:ChangeImageName("musha_rp3")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_rp3.xml"	
	end 
	--[[local inv_name = inst.prefab
	inst.components.inventoryitem.atlasname = "images/inventoryimages/"..inv_name..".xml" ]]
	
	if inst.components.inventoryitem ~= nil and inst.components.equippable then 
	--inst.components.inventoryitem.cangoincontainer = false
	inst.components.inventoryitem:SetOnDroppedFn(Dropped_cave)
	inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory_cave)
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable:SetOnEquip(onyamche_house)
    inst.components.equippable:SetOnUnequip(offyamche_house)
	
end
end
	
inst.cave_near = inst:DoPeriodicTask(0, cave_near )

inst:DoTaskInTime(1, function()
local leader = inst.components.follower.leader
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 20, {"musha"})
for k,v in pairs(ents) do
if --[[not v.im_ready and]] not v.campfire then
if inst.components.follower and not inst.components.follower.leader and v.components.leader:CountFollowers("phoenix") == 0 and not inst.hat then
if inst.components.sleeper:IsAsleep() then
inst.components.sleeper:WakeUp()
end
	if not inst.campfire then	
	inst.yamche = true
	end
v.components.leader:AddFollower(inst)
inst.components.follower:SetLeader(v)
	--[[if not inst.components.staycommand then
	inst:AddComponent("staycommand") 
	end
	inst.components.staycommand:SetStaying(false)]]
	inst.stay = false
	inst.peace = false
	inst.active_hunt = false
	inst.defense = false
	inst.sleep_f = false
	inst.sleep_on = false
	
	if inst.components.container then 
	inst.components.container.canbeopened = true
	end
	if v.components.leader:CountFollowers("phoenix") == 1 then
	inst.yamche_leader = true inst.yamche_leader_tag = true 
	end

end

local leader = inst.components.follower.leader
if inst.components.follower.leader == nil and v.components.leader:CountFollowers("phoenix") > 1 --[[and inst.components.staycommand]] and not inst.hat and not inst.house then
inst.sleep_on = true
inst.stay = true
--[[inst.components.staycommand:SetStaying(true)
inst.components.staycommand:RememberStayPos("stayspot", Point(inst.Transform:GetWorldPosition()))]]
end

end
end
end)

--[[
if inst.level1 or inst.baby then
 
    inst:AddComponent("inventoryitem")
	inst:AddComponent("equippable")
	
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onyamche)
    inst.components.equippable:SetOnUnequip(offyamche)
	inst:AddComponent("insulator")
    inst.components.insulator.insulation = TUNING.INSULATION_MED
	
	if not inst.DLC2 then
  inst.components.equippable.walkspeedmult = 1.25
	elseif inst.DLC2 then
  inst.components.equippable.walkspeedmult = 0.25

 	end
end
]]

--------------------------------------------------------------------------

    --inst:AddComponent("lootdropper")

	--fire
	--inst:AddComponent("propagator")
    -----------------------
    inst:AddComponent("burnable")
	yamche_campfire(inst)
--[[if not inst.iceyamche then 
   inst.components.burnable:AddBurnFX("campfirefire", Vector3(0,.9,0) )  

 	inst:ListenForEvent("onextinguish", onextinguish)
    inst:ListenForEvent("onignite", onignite)

    inst:AddComponent("fueled")
    inst.components.fueled.maxfuel = TUNING.FIREPIT_FUEL_MAX
    inst.components.fueled.accepting = true

	inst.components.fueled.bonusmult = 2
    inst.components.fueled:SetSections(6)
    inst.components.fueled.ontakefuelfn = function() inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") end
   inst.components.fueled:SetUpdateFn( function()
        if GetSeasonManager() and GetSeasonManager():IsRaining() then
            inst.components.fueled.rate = 1 + TUNING.FIREPIT_RAIN_RATE*GetSeasonManager():GetPrecipitationRate()
        else
            inst.components.fueled.rate = 1
        end
        
        if inst.components.burnable and inst.components.fueled then
            inst.components.burnable:SetFXLevel(inst.components.fueled:GetCurrentSection(), inst.components.fueled:GetSectionPercent())
        end
    end)
        
    inst.components.fueled:SetSectionCallback( function(section)
        if section == 0 then
            inst.components.burnable:Extinguish() 
        else
            if not inst.components.burnable:IsBurning() then
                inst.components.burnable:Ignite()
            end
            
            inst.components.burnable:SetFXLevel(section, inst.components.fueled:GetSectionPercent())
            
        end
    end)
        
  
	
else
    inst.components.burnable:AddBurnFX("coldfirefire_yamche", Vector3(0,0.5,0) )

  	inst:ListenForEvent("onextinguish", onextinguish)
    inst:ListenForEvent("onignite", onignite)

    inst:AddComponent("fueled")
    inst.components.fueled.maxfuel = TUNING.FIREPIT_FUEL_MAX
    inst.components.fueled.accepting = true

	inst.components.fueled.bonusmult = 2
    inst.components.fueled:SetSections(6)
    inst.components.fueled.ontakefuelfn = function() inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") end
   inst.components.fueled:SetUpdateFn( function()
        if GetSeasonManager() and GetSeasonManager():IsRaining() then
            inst.components.fueled.rate = 1 + TUNING.FIREPIT_RAIN_RATE*GetSeasonManager():GetPrecipitationRate()
        else
            inst.components.fueled.rate = 1
        end
        
        if inst.components.burnable and inst.components.fueled then
            inst.components.burnable:SetFXLevel(inst.components.fueled:GetCurrentSection(), inst.components.fueled:GetSectionPercent())
        end
    end)
        
    inst.components.fueled:SetSectionCallback( function(section)
        if section == 0 then
            inst.components.burnable:Extinguish() 
        else
            if not inst.components.burnable:IsBurning() then
                inst.components.burnable:Ignite()
            end
            
            inst.components.burnable:SetFXLevel(section, inst.components.fueled:GetSectionPercent())
            
        end
    end)
	
end	]]

--see you

-------------------------------------------
if not inst.no_resurrect and not inst.level1 and not inst.level1 then
inst:AddComponent("resurrector")
inst.components.resurrector.doresurrect = doresurrect2
inst.components.resurrector.active = false
end
-------------------------------------------
inst.sleep_heal = inst:DoPeriodicTask(0.5,sleep_heal)

    --print("base- create_common END")

inst:ListenForEvent( "healthdelta", updatestats)

	inst:AddComponent("characterspecific")
    inst.components.characterspecific:SetOwner("musha")

	inst.level = 0
    --inst:ListenForEvent("entity_death", function(wrld, data) onkilll(inst, data) end, GetWorld())
	inst:ListenForEvent("killed", onkilll)
	inst:ListenForEvent("levelup", levelexp)
	
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

    return inst
end

-----------start create birds grow

local function create_smallbird()
    --print("smallbird - create_smallbird")

	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    MakeInventoryPhysics(inst, 1,1)

    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
-------------------------------------
	--inst:AddComponent("characterspecific")
    --inst.components.characterspecific:SetOwner("musha")
	
	inst:AddTag("green")   
    
	--inst:AddTag("light")
	inst.level1 = true

	-----------------------------equip--hat
		
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
	
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)

	inst:AddComponent("equippable")
    inst:AddComponent("insulator")

    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.insulator.insulation = TUNING.INSULATION_MED
       inst.components.equippable:SetOnEquip(onyamche)
       inst.components.equippable:SetOnUnequip(offyamche)


local player = GetPlayer()
if player:HasTag("DLC")then
	inst.DLC = true
		end
if player:HasTag("DLC2")then
	inst.DLC2 = true
		end		
		
if not inst.DLC2 then
  inst.components.equippable.walkspeedmult = 1.25
elseif inst.DLC2 then
  inst.components.equippable.walkspeedmult = 0.25
  end
  
------------------------
--[[
    inst.entity:AddLight()
	inst.Light:SetRadius(.3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    inst.Light:SetColour(10/255,125/255,125/255)
	]]
	---
-----------------------
 
-------------------------------------

    create_common(inst)


    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_small_DLC2")
	else
	inst:SetStateGraph("SGmusha_small")
	end	
    inst.Transform:SetScale(0.4, 0.4, 0.4)

	inst.DynamicShadow:SetSize( 0.8, .3 )
    --
        

    
	inst.components.health:SetMaxHealth(100)

    inst.components.hunger:SetMax(50)
    --inst.components.hunger:SetRate(TUNING.SMALLBIRD_HUNGER * 1.2 /TUNING.SMALLBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(10)

    --inst:AddComponent("lootdropper")({"glowdust"})

  -- inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP", }

    local growth_stages = {
        {name="small", time = GetTeenGrowTime, fn = function() end },
        {name="tall", fn = SetTeen}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_smallbird END")
	return inst
end

-----musha_teen
local function create_teen_smallbird()
    --print("smallbird - create_teen_smallbird")

    local inst = CreateEntity()

    
	

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose   
	inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    

    inst.entity:AddLight()
	inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(15/255,125/255,125/255)
	


-------------------------------------

   
   

inst.level2 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_teen_DLC2")
	else
	inst:SetStateGraph("SGmusha_teen")
	end
	

    inst.Transform:SetScale(0.45, 0.45, 0.45)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --  --  MakeSmallPropagator(inst)
	
	MakeSmallFreezableCharacter(inst, "head")
        inst.components.health:SetMaxHealth(200)

        inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end
-------------

-----musha_teenr1
local function create_teenr1_smallbird()
    --print("smallbird - create_teen_smallbird")

    local inst = CreateEntity()

    
	

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

inst:AddTag("green")
-------------------------------------
    

    inst.entity:AddLight()
	inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(15/255,125/255,125/255)
	
-----------------------


-------------------------------------
	
   
   

inst.level2 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_teen_DLC2")
	else
	inst:SetStateGraph("SGmusha_teen")
	end


    inst.Transform:SetScale(0.45, 0.45, 0.45)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(200)

        inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


-----musha_teenr2
local function create_teenr2_smallbird()
    --print("smallbird - create_teen_smallbird")

    local inst = CreateEntity()

    
	

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    

    inst.entity:AddLight()
	inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(15/255,125/255,125/255)
	
-----------------------
 

-------------------------------------

	
    
   

inst.level2 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_teen_DLC2")
	else
	inst:SetStateGraph("SGmusha_teen")
	end


    inst.Transform:SetScale(0.45, 0.45, 0.45)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(200)

        inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


-----musha_teenr3
local function create_teenr3_smallbird()
    --print("smallbird - create_teen_smallbird")

    local inst = CreateEntity()

    
	

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    

    inst.entity:AddLight()
	inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(15/255,125/255,125/255)
	
-----------------------


-------------------------------------

 	
    
   

inst.level2 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_teen_DLC2")
	else
	inst:SetStateGraph("SGmusha_teen")
	end


    inst.Transform:SetScale(0.45, 0.45, 0.45)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(200)

        inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


-----musha_teenr4
local function create_teenr4_smallbird()
    --print("smallbird - create_teen_smallbird")

    local inst = CreateEntity()

    
	

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    

    inst.entity:AddLight()
	inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(15/255,125/255,125/255)
	
-----------------------
  

-------------------------------------

 	
    
   

inst.level2 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_teen_DLC2")
	else
	inst:SetStateGraph("SGmusha_teen")
	end


    inst.Transform:SetScale(0.45, 0.45, 0.45)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(200)

        inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

-----musha_teenr5
local function create_teenice_smallbird()
    --print("smallbird - create_teen_smallbird")

    local inst = CreateEntity()

    
	

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    

    inst.entity:AddLight()
	inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(15/255,125/255,125/255)
	
-----------------------
  

-------------------------------------
	
    
   

inst.level2 = true
inst.iceyamche = true

--inst:AddTag("fridge")

	create_common(inst)
--inst:ListenForEvent("attacked", Onfreeze)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_teen_DLC2")
	else
	inst:SetStateGraph("SGmusha_teen")
	end


    inst.Transform:SetScale(0.45, 0.45, 0.45)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(200)
    

        inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end




-----musha tall

local function create_tall_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    
	

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    



--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

    inst.entity:AddLight()
	inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(25/255,125/255,125/255)
	
-----------------------
 

-------------------------------------

 	
    
   
   


inst.level3 = true



create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall")
	end


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  
        

 --   MakeSmallPropagator(inst)
 
	inst.components.health:SetMaxHealth(300)

        inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallr1_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    
	

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

inst:AddTag("green")
-------------------------------------
    



--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

    inst.entity:AddLight()
	inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(25/255,125/255,125/255)
	
-----------------------
 

-------------------------------------

	
    
   
   


inst.level3 = true



create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall")
	end


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  
        

 --   MakeSmallPropagator(inst)
    --    
	inst.components.health:SetMaxHealth(300)

        inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end
local function create_tallr2_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    
	

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    



--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

    inst.entity:AddLight()
	inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(25/255,125/255,125/255)
	
-----------------------
  
-------------------------------------

	
    
   
   


inst.level3 = true



create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall")
	end


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  
        

 --   MakeSmallPropagator(inst)
    --  
	inst.components.health:SetMaxHealth(300)

        inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end
local function create_tallr3_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    
	

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    



--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

    inst.entity:AddLight()
	inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(25/255,125/255,125/255)
	
-----------------------
  
-------------------------------------

	
    
   
   


inst.level3 = true



create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall")
	end


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  
        

 --   MakeSmallPropagator(inst)
    --   
	inst.components.health:SetMaxHealth(300)

        inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end
local function create_tallr4_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    
	

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    



--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

    inst.entity:AddLight()
	inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(25/255,125/255,125/255)
	
-----------------------
  

-------------------------------------

    
	
    
   
   


inst.level3 = true



create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall")
	end


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  
        

 --   MakeSmallPropagator(inst)
    --    
	inst.components.health:SetMaxHealth(300)

        inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end
local function create_tallrice_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    
	

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    



--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

    inst.entity:AddLight()
	inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(25/255,125/255,125/255)
	
-----------------------


-------------------------------------

    
	
    
   
   


inst.level3 = true
inst.iceyamche = true

--inst:AddTag("fridge")
create_common(inst)
--inst:ListenForEvent("attacked", Onfreeze)

    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall")
	end


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  
        

 --   MakeSmallPropagator(inst)
    --
        

    inst.components.health:SetMaxHealth(300)

        inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

--------musha_tall2

local function create_tall2_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(100/255,25/255,25/255)
	
-----------------------
 

-------------------------------------

    
    
   
   
   



inst.level4 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall2_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall2")
	end


    inst.Transform:SetScale(0.55, 0.55, 0.55)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 ) --   MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(400)

        inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(25)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


local function create_tallrr1_teen()
    --print("tallbird -  create_tall2_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
inst:AddTag("green")
-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(100/255,25/255,25/255)
	
-----------------------
  

-------------------------------------

    
	
    
   
   
   



inst.level4 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall2_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall2")
	end


    inst.Transform:SetScale(0.55, 0.55, 0.55)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 ) --   MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(400)

        inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(25)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrr2_teen()
    --print("tallbird -  create_tall2_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(100/255,25/255,25/255)
	
-----------------------
  

-------------------------------------

  	
    
   
   
   



inst.level4 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall2_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall2")
	end


    inst.Transform:SetScale(0.55, 0.55, 0.55)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 ) --   MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(400)

        inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(25)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrr3_teen()
    --print("tallbird -  create_tall2_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(100/255,25/255,25/255)
	
-----------------------
  

-------------------------------------

  
    
   
   
   



inst.level4 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall2_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall2")
	end


    inst.Transform:SetScale(0.55, 0.55, 0.55)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 ) --   MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(400)

        inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(25)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrr4_teen()
    --print("tallbird -  create_tall2_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(100/255,25/255,25/255)
	
-----------------------
 

-------------------------------------

    	
    
   
   
   



inst.level4 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall2_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall2")
	end


    inst.Transform:SetScale(0.55, 0.55, 0.55)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 ) --   MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(400)

        inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(25)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


local function create_tallrrice_teen()
    --print("tallbird -  create_tall2_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    


 

    inst.entity:AddLight()
	inst.Light:SetRadius(1.3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(100/255,25/255,25/255)
	
-----------------------
  

-------------------------------------

	
    
   
   
   



inst.level4 = true
inst.iceyamche = true

--inst:AddTag("fridge")
create_common(inst)
--inst:ListenForEvent("attacked", Onfreeze)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall2_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall2")
	end


    inst.Transform:SetScale(0.55, 0.55, 0.55)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 ) --   MakeSmallPropagator(inst)
    
        

    inst.components.health:SetMaxHealth(400)

        inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(25)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end



local function create_tallrr5_teen()
    --print("tallbird -  create_tall2_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall4")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(100/255,25/255,25/255)
	
-----------------------
 
-------------------------------------

 	
    
   
   
   



inst.level4 = true


   
create_common(inst)   
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall2_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall2")
	end


    inst.Transform:SetScale(0.55, 0.55, 0.55)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 ) --   MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(400)

        inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(25)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


------musha tall3

local function create_tall3_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.7)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(120/255,120/255,20/255)
	
-----------------------
 

-------------------------------------

  	
    
   
   
   




inst.level5 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall3_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall3")
	end


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(500)

        inst.components.hunger:SetMax(90)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(30)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
    --inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


------musha tall3

local function create_tallrrr1_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
inst:AddTag("green")
-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.7)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(120/255,120/255,20/255)
	
-----------------------
  
-------------------------------------

   	
    
   
   
   




inst.level5 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall3_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall3")
	end


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(500)

        inst.components.hunger:SetMax(90)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(30)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
    --inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

------musha tall3

local function create_tallrrr2_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.7)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(120/255,120/255,20/255)
	
-----------------------
  

-------------------------------------

    	
    
   
   
   




inst.level5 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall3_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall3")
	end


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(500)

        inst.components.hunger:SetMax(90)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(30)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
    --inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

------musha tall3

local function create_tallrrr3_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.7)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(120/255,120/255,20/255)
	
-----------------------
  

-------------------------------------

   	
    
   
   
   




inst.level5 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall3_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall3")
	end


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(500)

        inst.components.hunger:SetMax(90)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(30)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
    --inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

------musha tall3

local function create_tallrrr4_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.7)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(120/255,120/255,20/255)
	
-----------------------
 

-------------------------------------

    
	
    
   
   
   




inst.level5 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall3_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall3")
	end


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(500)

        inst.components.hunger:SetMax(90)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(30)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
    --inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

------musha tall3

local function create_tallrrrice_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.7)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(120/255,120/255,20/255)
	
-----------------------
 

-------------------------------------

    
	
    
   
   
   




inst.level5 = true
inst.iceyamche = true

--inst:AddTag("fridge")
create_common(inst)
--inst:ListenForEvent("attacked", Onfreeze)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall3_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall3")
	end


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(500)
    

        inst.components.hunger:SetMax(90)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(30)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
    --inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


local function create_tallrrr5_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall4")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(1.7)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(120/255,120/255,20/255)
	
-----------------------
 
-------------------------------------

    
	
    
   
   
   




inst.level5 = true


create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall3_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall3")
	end


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )  --  MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(500)

        inst.components.hunger:SetMax(90)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(30)
--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
    --inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


-----------musha_tall4

local function create_tall4_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall4")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(2.1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(200/255,190/255,15/255)
	
-----------------------
  

-------------------------------------

    
	
    






inst.level6 = true


inst:RemoveTag("darkyamche") 
create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall4_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall4")
	end


    inst.Transform:SetScale(0.65, 0.65, 0.65)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)    
   -- MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(600)

        inst.components.hunger:SetMax(100)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(35)

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
   -- inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end


local function create_tallrrrr1_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
inst:AddTag("green")
-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(2.1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(200/255,190/255,15/255)
	
-----------------------
  

-------------------------------------

    
	
    






inst.level6 = true


inst:RemoveTag("darkyamche") 
create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall4_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall4")
	end


    inst.Transform:SetScale(0.65, 0.65, 0.65)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)    
   -- MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(600)

        inst.components.hunger:SetMax(100)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(35)

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
   -- inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrrrr2_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(2.1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(200/255,190/255,15/255)
	
-----------------------
-------------------------------------

    
	
    






inst.level6 = true


inst:RemoveTag("darkyamche") 
create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall4_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall4")
	end


    inst.Transform:SetScale(0.65, 0.65, 0.65)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)    
   -- MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(600)

        inst.components.hunger:SetMax(100)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(35)

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
   -- inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrrrr3_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(2.1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(200/255,190/255,15/255)
	
-----------------------
   

-------------------------------------

    
	
    






inst.level6 = true


inst:RemoveTag("darkyamche") 
create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall4_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall4")
	end


    inst.Transform:SetScale(0.65, 0.65, 0.65)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)    
   -- MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(600)

        inst.components.hunger:SetMax(100)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(35)

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
   -- inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrrrr4_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(2.1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(200/255,190/255,15/255)
	
-----------------------
 

-------------------------------------

    
	
    






inst.level6 = true


inst:RemoveTag("darkyamche") 
create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall4_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall4")
	end


    inst.Transform:SetScale(0.65, 0.65, 0.65)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)    
   -- MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(600)

        inst.components.hunger:SetMax(100)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(35)

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
   -- inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrrrr5_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(2.1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(200/255,190/255,15/255)
	
-----------------------
 

-------------------------------------

    
	
    






inst.level6 = true


inst:RemoveTag("darkyamche") 
create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall4_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall4")
	end


    inst.Transform:SetScale(0.65, 0.65, 0.65)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)    
   -- MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(600)

        inst.components.hunger:SetMax(100)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(35)

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
   -- inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end


local function create_tallrrrrice_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(2.1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(200/255,190/255,15/255)
	
-----------------------
  

-------------------------------------

    
	
    






inst.level6 = true
inst.iceyamche = true

--inst:AddTag("fridge")
inst:RemoveTag("darkyamche") 
create_common(inst)
--inst:ListenForEvent("attacked", Onfreeze)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall4_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall4")
	end


    inst.Transform:SetScale(0.65, 0.65, 0.65)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)    
   -- MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(600)
    

        inst.components.hunger:SetMax(100)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(35)

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
   -- inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrrrr6_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall5")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(2.1)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(200/255,190/255,15/255)
	
-----------------------
  

-------------------------------------

    
	
    






inst.level6 = true


inst:AddTag("darkyamche") 
create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall4_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall4")
	end


    inst.Transform:SetScale(0.65, 0.65, 0.65)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)    
   -- MakeSmallPropagator(inst)
        inst.components.health:SetMaxHealth(600)

        inst.components.hunger:SetMax(100)


	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(35)

--("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160
---
   -- inst.components.eater:SetOmnivore()
	--inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

--------musha_5
-------Level7 phoenix state

local function create_tall5_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall5")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
 

-------------------------------------

    
	
    

     inst.level7 = true inst.level7 = true


inst:AddTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall5_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall5")
	end


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)


    
        inst.components.health:SetMaxHealth(700)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr1_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end

inst:AddTag("green")

-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
  

-------------------------------------

    
	
    

     inst.level7 = true inst.level7 = true


inst:RemoveTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall5_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall5")
	end


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)


    
        inst.components.health:SetMaxHealth(700)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr2_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
  

-------------------------------------

    
	
    

     inst.level7 = true inst.level7 = true


inst:RemoveTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall5_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall5")
	end


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)


    
        inst.components.health:SetMaxHealth(700)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr3_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
  

-------------------------------------

    
	
    

     inst.level7 = true inst.level7 = true


inst:RemoveTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall5_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall5")
	end


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)


    
        inst.components.health:SetMaxHealth(700)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr4_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
 
-------------------------------------

    
	
    

     inst.level7 = true inst.level7 = true


inst:RemoveTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall5_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall5")
	end


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)


    
        inst.components.health:SetMaxHealth(700)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr5_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
  

-------------------------------------

    
	
    

     inst.level7 = true inst.level7 = true


inst:RemoveTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall5_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall5")
	end


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)


    
        inst.components.health:SetMaxHealth(700)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrrice_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
  

-------------------------------------

    
	
    

     inst.level7 = true inst.level7 = true
inst.iceyamche = true

--inst:AddTag("fridge")
inst:RemoveTag("darkyamche") 
create_common(inst)
--inst:ListenForEvent("attacked", Onfreeze)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall5_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall5")
	end


   inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)


    
        inst.components.health:SetMaxHealth(700)
    

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr6_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall4")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
  
-------------------------------------

    
	
    

     inst.level7 = true inst.level7 = true


inst:RemoveTag("darkyamche") 
 
create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall5_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall5")
	end


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)


    
        inst.components.health:SetMaxHealth(700)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end



-------Level8 phoenix state

local function create_rp1_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end


inst:AddTag("green")
-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
 

-------------------------------------

    
	
    

   
     inst.level8 = true



inst:RemoveTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall6_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall6")
	end


    inst.Transform:SetScale(0.75, 0.75, 0.75)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)


    
        inst.components.health:SetMaxHealth(800)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_rp)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_rp
    inst.components.container.widgetanimbank = "ui_chester_shadow_3x4"
    inst.components.container.widgetanimbuild = "ui_chester_musha_3x4"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end


local function create_rp2_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
-------------------------------------

    
	
    

   
     inst.level8 = true



inst:RemoveTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall6_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall6")
	end


    inst.Transform:SetScale(0.75, 0.75, 0.75)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)


    
        inst.components.health:SetMaxHealth(800)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_rp)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_rp
    inst.components.container.widgetanimbank = "ui_chester_shadow_3x4"
    inst.components.container.widgetanimbuild = "ui_chester_shadow_3x4"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

local function create_rp3_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
-------------------------------------

    
	
    

   
     inst.level8 = true



inst:RemoveTag("darkyamche") 
create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall6_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall6")
	end


    inst.Transform:SetScale(0.75, 0.75, 0.75)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)


    
        inst.components.health:SetMaxHealth(800)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_rp)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_rp
    inst.components.container.widgetanimbank = "ui_chester_shadow_3x4"
    inst.components.container.widgetanimbuild = "ui_chester_shadow_3x4"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

local function create_rp4_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
------------------------------------------------------------

    
	
    

   
     inst.level8 = true



inst:RemoveTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall6_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall6")
	end


    inst.Transform:SetScale(0.75, 0.75, 0.75)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)


    
        inst.components.health:SetMaxHealth(800)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_rp)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_rp
    inst.components.container.widgetanimbank = "ui_chester_shadow_3x4"
    inst.components.container.widgetanimbuild = "ui_chester_shadow_3x4"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

local function create_rp5_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
-------------------------------------

    
	
    

   
     inst.level8 = true



inst:RemoveTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall6_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall6")
	end


    inst.Transform:SetScale(0.75, 0.75, 0.75)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)


    
        inst.components.health:SetMaxHealth(800)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_rp)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_rp
    inst.components.container.widgetanimbank = "ui_chester_shadow_3x4"
    inst.components.container.widgetanimbuild = "ui_chester_shadow_3x4"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

local function create_rp6_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall4")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
-------------------------------------

    
	
    

   
     inst.level8 = true



inst:RemoveTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall6_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall6")
	end


     inst.Transform:SetScale(0.75, 0.75, 0.75)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)


    
        inst.components.health:SetMaxHealth(800)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_rp)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_rp
    inst.components.container.widgetanimbank = "ui_chester_shadow_3x4"
    inst.components.container.widgetanimbuild = "ui_chester_shadow_3x4"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

-------------

local function create_rp7_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall5")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
-------------------------------------

    
	
    

   
     inst.level8 = true



inst:AddTag("darkyamche") 

create_common(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall6_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall6")
	end


    inst.Transform:SetScale(0.75, 0.75, 0.75)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)


    
        inst.components.health:SetMaxHealth(800)

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_rp)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_rp
    inst.components.container.widgetanimbank = "ui_chester_shadow_3x4"
    inst.components.container.widgetanimbuild = "ui_chester_shadow_3x4"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

-------------

local function create_rpice_teen()
    --print("tallbird -  create_tall_teen")

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")
--if not GetClock():IsNight() then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end



-------------------------------------
    




    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.55)
    inst.Light:SetIntensity(.75)
    --inst.Light:SetColour(225/255,200/255,75/255)
	
-----------------------
-------------------------------------

    
	
    

   
     inst.level8 = true

inst.iceyamche = true

--inst:AddTag("fridge")
inst:RemoveTag("darkyamche") 
create_common(inst)
--inst:ListenForEvent("attacked", Onfreeze)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
	inst:SetStateGraph("SGmusha_tall6_DLC2")
	else
	inst:SetStateGraph("SGmusha_tall6")
	end


    inst.Transform:SetScale(0.75, 0.75, 0.75)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)


    
        inst.components.health:SetMaxHealth(800)
    

        inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)

	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(40)
    --("   container")
    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos_rp)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose    inst.components.container.widgetslotpos = slotpos_rp
    inst.components.container.widgetanimbank = "ui_chester_shadow_3x4"
    inst.components.container.widgetanimbuild = "ui_chester_shadow_3x4"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetOmnivore()
--	inst.components.eater:SetElemental()
inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)    ----inst:AddComponent("lootdropper")({"musha_egg"})

    --inst:AddComponent("lootdropper")({"glowdust"})

    --inst.components.eater:SetCanEatTestFn(CanEatTest)
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

-------------

return Prefab( "musha_small", create_smallbird, assets, prefabs),

	   Prefab( "musha_teen", create_teen_smallbird, assets),
	   Prefab( "musha_teenr1", create_teenr1_smallbird, assets),
	   Prefab( "musha_teenr2", create_teenr2_smallbird, assets),
	   Prefab( "musha_teenr3", create_teenr3_smallbird, assets),
	   Prefab( "musha_teenr4", create_teenr4_smallbird, assets),
	   Prefab( "musha_teenice", create_teenice_smallbird, assets),

	   Prefab( "musha_tall", create_tall_teen, assets) ,
	   Prefab( "musha_tallr1", create_tallr1_teen, assets) ,
	   Prefab( "musha_tallr2", create_tallr2_teen, assets) ,
	   Prefab( "musha_tallr3", create_tallr3_teen, assets) ,
	   Prefab( "musha_tallr4", create_tallr4_teen, assets) ,
	   Prefab( "musha_tallrice", create_tallrice_teen, assets) ,

 	   Prefab( "musha_tall2", create_tall2_teen, assets), 
 	   Prefab( "musha_tallrr1", create_tallrr1_teen, assets), 
 	   Prefab( "musha_tallrr2", create_tallrr2_teen, assets), 
 	   Prefab( "musha_tallrr3", create_tallrr3_teen, assets), 
 	   Prefab( "musha_tallrr4", create_tallrr4_teen, assets), 
 	   Prefab( "musha_tallrr5", create_tallrr5_teen, assets), 
 	   Prefab( "musha_tallrrice", create_tallrrice_teen, assets), 

	   Prefab( "musha_tall3", create_tall3_teen, assets), 
 	   Prefab( "musha_tallrrr1", create_tallrrr1_teen, assets), 
 	   Prefab( "musha_tallrrr2", create_tallrrr2_teen, assets), 
 	   Prefab( "musha_tallrrr3", create_tallrrr3_teen, assets), 
 	   Prefab( "musha_tallrrr4", create_tallrrr4_teen, assets), 
 	   Prefab( "musha_tallrrr5", create_tallrrr5_teen, assets), 
 	   Prefab( "musha_tallrrrice", create_tallrrrice_teen, assets), 

	   Prefab( "musha_tall4", create_tall4_teen, assets), 
 	   Prefab( "musha_tallrrrr1", create_tallrrrr1_teen, assets), 
 	   Prefab( "musha_tallrrrr2", create_tallrrrr2_teen, assets), 
 	   Prefab( "musha_tallrrrr3", create_tallrrrr3_teen, assets), 
 	   Prefab( "musha_tallrrrr4", create_tallrrrr4_teen, assets), 
 	   Prefab( "musha_tallrrrr5", create_tallrrrr5_teen, assets), 
 	   Prefab( "musha_tallrrrr6", create_tallrrrr6_teen, assets), 
 	   Prefab( "musha_tallrrrrice", create_tallrrrrice_teen, assets), 

	   Prefab( "musha_tall5", create_tall5_teen, assets), 
	   Prefab( "musha_tallrrrrr1", create_tallrrrrr1_teen, assets), 
 	   Prefab( "musha_tallrrrrr2", create_tallrrrrr2_teen, assets), 
 	   Prefab( "musha_tallrrrrr3", create_tallrrrrr3_teen, assets), 
 	   Prefab( "musha_tallrrrrr4", create_tallrrrrr4_teen, assets), 
 	   Prefab( "musha_tallrrrrr5", create_tallrrrrr5_teen, assets), 
 	   Prefab( "musha_tallrrrrr6", create_tallrrrrr6_teen, assets), 
 	   Prefab( "musha_tallrrrrrice", create_tallrrrrrice_teen, assets), 

	   Prefab( "musha_rp1", create_rp1_teen, assets), 
	   Prefab( "musha_rp2", create_rp2_teen, assets), 
	   Prefab( "musha_rp3", create_rp3_teen, assets), 
	   Prefab( "musha_rp4", create_rp4_teen, assets), 
	   Prefab( "musha_rp5", create_rp5_teen, assets), 
	   Prefab( "musha_rp6", create_rp6_teen, assets), 
	   Prefab( "musha_rp7", create_rp7_teen, assets), 
	   Prefab( "musha_rpice", create_rpice_teen, assets)
