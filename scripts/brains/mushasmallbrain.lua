require "behaviours/chaseandattack"
require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/follow"
require "behaviours/standstill"
require "behaviours/leash"
require "behaviours/panic"
require "behaviours/runaway"
require "behaviours/doaction"

local MIN_FOLLOW_DIST = 0
local MAX_FOLLOW_DIST = 9
--local TARGET_FOLLOW_DIST = (MAX_FOLLOW_DIST+MIN_FOLLOW_DIST)/2
local TARGET_FOLLOW_DIST = 3
--local GO_HOME_DIST = 1
local GO_HOME_DIST = 0

----
local MIN_FOLLOW_LEADER = 1
local MAX_FOLLOW_LEADER = 9
--local TARGET_FOLLOW_LEADER = (MAX_FOLLOW_LEADER+MIN_FOLLOW_LEADER)/2
local TARGET_FOLLOW_LEADER = 6
local LEASH_RETURN_DIST = 3.5
local LEASH_MAX_DIST = 5
----
local SEE_ENEMY_DIST = 4
local MAX_CHASE_TIME = 30
local TRADE_DIST = 20
local MAX_WANDER_DIST = 6
----
local SEE_ITEM_DIST = 9
local SEE_FOOD_DIST = 9
local TIME_BETWEEN_EATING = 10
local FIND_FOOD_HUNGER_PERCENT = 0.2 
local FIND_FOOD_HUNGER_PERCENT2 = 0.2

local START_RUN_DIST = 4
local STOP_RUN_DIST = 6

local KEEP_WORKING_DIST = 9
local SEE_WORK_DIST = 12

local function HasStateTags(inst, tags)
    for k,v in pairs(tags) do
        if inst.sg:HasStateTag(v) then
            return true
        end
    end
end

local function KeepWorkingAction(inst, actiontags)
    return inst.components.follower.leader and inst.components.follower.leader:GetDistanceSqToInst(inst) <= KEEP_WORKING_DIST*KEEP_WORKING_DIST and 
    HasStateTags(inst.components.follower.leader, actiontags)
end

local function StartWorkingCondition(inst, actiontags)
    return inst.components.follower.leader and not inst.pick1 and not inst.working_food and HasStateTags(inst.components.follower.leader, actiontags) and not HasStateTags(inst, actiontags)
end

--[[local function FindObjectToWorkAction(inst, action)
    if inst.sg:HasStateTag("working") then
        return 
    end
    local target = FindEntity(inst.components.follower.leader, SEE_WORK_DIST, function(item) return item.components.workable and item.components.workable.action == action end)
    if target then
        return BufferedAction(inst, target, action)
    end
end]]
local function FindObjectToWorkAction(inst, action)
    if inst.sg:HasStateTag("working") then
        return 
    end
    
    local target = nil
    local notags = {"FX", "NOCLICK", "DECOR","INLIMBO"}
    if action == ACTIONS.HACK then
        target = FindEntity(inst.components.follower.leader, SEE_WORK_DIST, function(item) return item.components.hackable end, nil, notags)
    else
        target = FindEntity(inst.components.follower.leader, SEE_WORK_DIST, function(item) return item.components.workable and item.components.workable.action == action end, nil, notags)
    end
    if target then
        --print(GetTime(), target)
        return BufferedAction(inst, target, action)
    end
end

local function IsHungry(inst)
    return inst.components.hunger and inst.components.hunger:GetPercent() < FIND_FOOD_HUNGER_PERCENT
end
local function IsHungry2(inst)
    return inst.components.hunger and inst.components.hunger:GetPercent() < FIND_FOOD_HUNGER_PERCENT2
end
local function Working_yamche(inst)
    return inst.working_food and not inst.item_max_full
end
local function Pick1(inst)
    return inst.pick1 
end
local function IsStarving(inst)
    return inst.components.hunger and inst.components.hunger:IsStarving()

end
local function ShouldStandStill(inst)
    return inst.components.hunger and inst.components.hunger:IsStarving() and inst:HasTag("never")
end
local function CanStandStill(inst)
    return inst.components.hunger and inst.components.hunger:IsStarving() and inst.fightn2 and inst:HasTag("never")
end

local function CanSeeFood(inst)
    local target = FindEntity(inst, SEE_FOOD_DIST, function(item) return inst.components.eater:CanEat(item) and (not item:HasTag("no_edible") and not item:HasTag("citypossession")) end)
 
    if target then
        --print("CanSeeFood", inst.name, target.name)
    end
    return target
end
local function FindFoodAction(inst)
    local target = CanSeeFood(inst)
    if target then
        return BufferedAction(inst, target, ACTIONS.EAT)
    end
    end
	
local ValidFoodsToPick_f = { "green_fruit", "berries", "cave_banana", "carrot", "red_cap", "blue_cap", "green_cap",
 ------- 
"corn", "pumpkin", "eggplant", "durian", "pomegranate", "dragonfruit", "cactus_meat", "watermelon", "smallmeat", "smallmeat_dried", "monstermeat", "monstermeat_dried", "humanmeat_dried", "meat", "meat_dried",
 ---cook 
 "dragonpie", "waffles", "ratatouille", "fruitmedley", "monsterlasagna", "frogglebunwich", "pumpkincookie", "pumpkincookie", "honeyham", "meatballs", "wetgoop", "stuffedeggplant", "taffy", "honeynuggets", "turkeydinner", "fishsticks", "jammypreserves", "fishtacos", "butterflymuffin", "perogies", "kabobs", "bonestew", "baconeggs", "mandrakesoup", 
 -------------- SW
 "sweet_potato", "seaweed", 
 --------------pork
 "radish", "asparagus", "aloe", 
 
 }
 
 local ValidFoodsToPick = { "green_fruit", "berries", "cave_banana", "carrot", "red_cap", "blue_cap", "green_cap", 
 ------- 
 "corn", "pumpkin", "eggplant", "durian", "pomegranate", "dragonfruit", "cactus_meat", "watermelon", "smallmeat", "smallmeat_dried", "monstermeat", "monstermeat_dried", "humanmeat", "humanmeat_dried", "meat", "meat_dried", "cutgrass", "twigs", "cutreeds", 
"coffe_beans_raw", "coffe_beans", "cutwheat", "tee", "tee_g", "tee_m", "tee_s", "tee_r", "tee_r2",
 ---cook 
 "dragonpie", "waffles", "ratatouille", "fruitmedley", "monsterlasagna", "frogglebunwich", "pumpkincookie", "pumpkincookie", "honeyham", "meatballs", "wetgoop", "stuffedeggplant", "taffy", "honeynuggets", "turkeydinner", "fishsticks", "jammypreserves", "fishtacos", "butterflymuffin", "perogies", "kabobs", "bonestew", "baconeggs", "mandrakesoup", 
 -------------- 
 "sweet_potato", "seaweed", 
 --------------pork
 "radish", "asparagus", "aloe", 
 }

local ValidItems = {
 "goldnugget", "rocks", "cutstone", "nitre", "flint", "thulecite", "thulecite_pieces", "marble", "redgem", "purplegem", "bluegem", "yellowgem", "greengem", "orangegem",    "log", "boards", "cutgrass", "dug_berrybush","dug_berrybush2", "dug_coffeebush","dug_grass", "rope", "twigs", "dug_sapling", "gears", "spidergland", "healingsalve", "mosquitosack", "silk", "spidereggsack", "ash", "poop", "guano", "charcoal", "beefalowool", "cutreeds", "houndstooth", "ice", "stinger", "livinglog", "lightbulb", "slurper_pelt", "honeycomb", "arrowm",
 "turf_road", "turf_rocky", "turf_forest", "turf_marsh", "turf_grass", "turf_savanna", "turf_dirt", "turf_woodfloor", "turf_carpetfloor", "turf_checkerfloor", "turf_cave", "turf_fungus", "turf_fungus_red", "turf_fungus_green", "turf_sinkhole", "turf_underrock", "turf_mud", 
  "walrus_tusk", "houndstooth", "wormlight_lesser", "wormlight", "nightmarefuel", "manrabbit_tail", "beardhair", "trinket_1", "trinket_2", "trinket_3", "trinket_4", "trinket_5", "trinket_6", "trinket_7", "trinket_8", "trinket_9", "trinket_10", "trinket_11", "trinket_12", "coontail", "tentaclespots", "beefalowool", "horn", "feather_robin", "feather_robin_winter", "feather_crow", "boneshard", "transistor",   "boomerang", "goose_feather", "drumstick", 
  "bearger_fur", "dragon_scales", "pigskin", --"acorn", "pinecone",
   "cutwheat",  "dug_wheat",
 --sw 
"coral", "bamboo", "dug_bambootree", "vine", "dug_bush_vine", "limestone", "obsidian", "palmleaf", "snakeoil", "snakeskin", "messagebottle", "messagebottleempty", "fabric",
"turf_jungle","turf_swamp","turf_volcano","turf_tidalmarsh","turf_meadow", "doydoyfeather",
 "hail_ice","sand",
 "coconut",
 "coffe_beans_raw", "coffe_beans", "cutwheat", "tee", "tee_g", "tee_m", "tee_s", "tee_r", "tee_r2",
  "dug_coffebush", "dug_tee_tree", "dug_wheat",
  --------------pork
 "gold_dust", "iron", "alloy", "oinc", "oinc10", 
 
}
	
local function ItemIsInList(item, list)
    for k,v in pairs(list) do
        if v == item or k == item then
            return true
        end
    end
end

	
local function Item_1(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return (ItemIsInList( item.prefab , ValidItems)) and (not item:HasTag("no_edible") and not item:HasTag("citypossession")) end)
    if target and not inst.item_max_full then end
    return target
end	
local function Item_2(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return inst.components.eater:CanEat(item) and (not item:HasTag("no_edible") and not item:HasTag("citypossession")) end)
    if target and not inst.item_max_full then end
    return target
end	

local function Find_Item_1(inst)
    local target = Item_1(inst)
	if target and not inst.item_max_full then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
local function Find_Item_2(inst)
    local target = Item_2(inst)
	if target and not inst.item_max_full then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end


local function EatFoodAction(inst)

    local target = nil

    --[[if inst.sg:HasStateTag("busy") or 
    (inst.components.inventory and inst.components.inventory:IsFull()) or
    math.random() < 0.75 then
        return
    end]]

    if inst.components.container and inst.components.eater then

        target = inst.components.container:FindItem(function(item) return inst.components.eater:CanEat(item) end)
	
        if target then return BufferedAction(inst,target,ACTIONS.EAT) end
    end

    local pt = inst:GetPosition()
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, SEE_FOOD_DIST)  

    if not target then
        for k,item in pairs(ents) do
            if item.components.pickable and item.components.pickable.caninteractwith and item.components.pickable:CanBePicked()
            and (ItemIsInList(item.components.pickable.product, ValidFoodsToPick_f) or item.prefab == "worm") and (not item:HasTag("aquatic")) and (not inst:HasTag("fire")) and (not item:HasTag("no_edible") and not item:HasTag("citypossession"))  then
                target = item
                break
            end
        end
    end

    if target then
        return BufferedAction(inst, target, ACTIONS.PICK)
    end

      if not target then
        for k,item in pairs(ents) do
            if item.components.crop and item.components.crop:IsReadyForHarvest() and not GetPlayer().No_crop and (not item:HasTag("aquatic")) and (not inst:HasTag("fire")) and (not item:HasTag("no_edible") and not item:HasTag("citypossession"))   then
                target = item
                break
            end
        end
    end

    if target then
        return BufferedAction(inst, target, ACTIONS.HARVEST)
    end

    if inst.components.combat.target then
        return
    end
    end

	
local function Working_food(inst)

     local target = nil
    if target and inst.working_food then
        return BufferedAction(inst, target, ACTIONS.PICKUP)
    end
    	
      local pt = inst:GetPosition()
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, SEE_FOOD_DIST)  

      if not target then
        for k,item in pairs(ents) do
            if item.components.pickable and item.components.pickable.caninteractwith and item.components.pickable:CanBePicked()
            and (ItemIsInList(item.components.pickable.product, ValidFoodsToPick) or item.prefab == "worm") and (not item:HasTag("aquatic")) and (not inst:HasTag("fire")) and (not item:HasTag("no_edible") and not item:HasTag("citypossession"))   then
                target = item
                break
            end  end  end

    if target then
        return BufferedAction(inst, target, ACTIONS.PICK)
    end
    
    if not target then
        for k,item in pairs(ents) do
            if item.components.crop and item.components.crop:IsReadyForHarvest() and not GetPlayer().No_crop and (not item:HasTag("aquatic")) and (not inst:HasTag("fire")) and (not item:HasTag("no_edible") and not item:HasTag("citypossession"))   then
                target = item
                break
			--[[elseif item.components.dryer and item.components.dryer:IsDone() and (not item:HasTag("aquatic")) and (not inst:HasTag("fire")) and (not item:HasTag("no_edible") and not item:HasTag("citypossession"))   then
                target = item
				break]]
			elseif inst.DLC and item.components.stewer and item.components.stewer:IsDone() and (not item:HasTag("aquatic")) and (not inst:HasTag("fire")) and (not item:HasTag("no_edible") and not item:HasTag("citypossession"))   then
                target = item
				break
            end
        end
    end

    if target then
        return BufferedAction(inst, target, ACTIONS.HARVEST)
    end
	
    if inst.components.combat.target then
        return
    end
end
	


local function GetTraderFn(inst)
    return (inst.components.follower.leader and inst.components.trader:IsTryingToTradeWithMe(inst.components.follower.leader)) and inst.components.follower.leader or nil
end

local function KeepTraderFn(inst, target)
    return inst.components.trader:IsTryingToTradeWithMe(target)
end

local function BattleCommand(inst, target)
    return inst.peace and not inst.components.trader:IsTryingToTradeWithMe(target)

end

local function warning_eyeplant(inst, target)
    return inst:HasTag("level1") and not inst.warning_eyeplant

end

local function BabyRunAway(inst, target)
    return inst.level1 and inst.components.follower.leader and not inst.components.trader:IsTryingToTradeWithMe(target)
end

local function ShouldStopCommand(inst, target)
    return inst.sleep_on 
end

------

local function focus_leader(inst)
    return inst.components.follower ~= nil and inst.focus_leader and inst.components.follower.leader or nil 
end

local function GetLeader(inst)
    return inst.components.follower ~= nil and not inst.opening and not inst.crazyness and inst.components.follower.leader or nil 
end

local function crazyness(inst)
    return inst.components.follower ~= nil and inst.crazyness and inst.components.follower.leader or nil
end
--[[
local function GetStayPos(inst)
	return inst.components.staycommand.locations["stayspot"]
end

local function GetWanderPoint(inst)
	if inst.components.staycommand and inst.components.staycommand:IsCurrentlyStaying() then
		return GetStayPos(inst)
	else
		local target = GetLeader(inst) or GetPlayer()
   		if target then
        		return target:GetPosition()
    		end
	end
end
local function ShouldGoHome(inst)
    local homePos = inst.components.staycommand.locations["stayspot"]
    local myPos = Vector3(inst.Transform:GetWorldPosition() )

    return (homePos and distsq(homePos, myPos) > GO_HOME_DIST)
end

local function GoHomeAction(inst)
    local homePos = inst.components.staycommand.locations["stayspot"]
    if homePos then
        return BufferedAction(inst, nil, ACTIONS.GOHOME, nil, homePos, nil, 2.2)
    end
end
]]

local function GetHome(inst)
    return inst.components.homeseeker ~= nil and inst.components.homeseeker.home or nil
end

local function GetHomePos(inst)
    local home = GetHome(inst)
    return home and home:GetPosition(GetReturnPos)
end

local mushasmallbrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)
--------------

--------------
function mushasmallbrain:OnStart()
    local root = 
-- Panic(self.inst)),
--		

    PriorityNode({
            --[[WhileNode(function() return self.inst.components.health:GetPercent() < 0.50 end, "LowHealth", StandStill(self.inst, CanStandStill, Follow(self.inst, function() return self.inst.components.follower.leader end, 1, 2, 3 ))),]]
			--[[ 
		WhileNode( function() return self.inst.components.health:GetPercent() < 0.5 and self.inst.components.combat.target == nil or not self.inst.components.combat:InCooldown() end, "AttackMomentarily", ChaseAndAttack(self.inst, 8,12)),
        WhileNode( function() return self.inst.components.combat.target and self.inst.components.combat:InCooldown() end, "Dodge",
                    RunAway(self.inst, function() return self.inst.components.combat.target and self.inst.components.health:GetPercent() < 0.5 end, 3, 7)),
					]]
			WhileNode( function() return self.inst.components.health:GetPercent() < 0.3 and self.inst.components.combat.target == nil or not self.inst.components.combat:InCooldown() end, "AttackMomentarily", ChaseAndAttack(self.inst, 8,12)),			
			WhileNode( function() return self.inst.components.health:GetPercent() < 0.3 and self.inst.components.combat.target and self.inst.components.combat:InCooldown() end, "Dodge", RunAway(self.inst, function() return self.inst.components.combat.target end, 3, 7)),
					
    --RunAway(self.inst, function(guy) return guy:HasTag("yamche") and guy.components.combat and guy.components.combat.target == self.inst end, 3, 7 ),			
					
ChaseAndAttack(self.inst, 8,10),

			
        FaceEntity(self.inst, GetTraderFn, KeepTraderFn),
        -- when starving prefer finding food over fighting

        SequenceNode{
            ConditionNode(function() return IsStarving(self.inst) and CanSeeFood(self.inst) end, "SeesFoodToEat"),
            ParallelNodeAny {
                WaitNode(math.random()*.4),
                PriorityNode {
                    StandStill(self.inst, ShouldStandStill),
                    Follow(self.inst, function() return self.inst.components.follower.leader end, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
                },
            },
            DoAction(self.inst, function() return FindFoodAction(self.inst) end),
        },
      

  
  RunAway(self.inst, "insect", 1, 2, function(target) return ShouldStopCommand(self.inst, target) end ),
  RunAway(self.inst, "animal", 5, 11, function(target) return ShouldStopCommand(self.inst, target) end ),
  RunAway(self.inst, "guard", 4, 10, function(target) return ShouldStopCommand(self.inst, target) end ),
  RunAway(self.inst, "hostile", 6, 9, function(target) return ShouldStopCommand(self.inst, target) end ),
  RunAway(self.inst, "eyeplant", 6, 9, function(target) return warning_eyeplant(self.inst, target) end ),
  RunAway(self.inst, "monster", 1, 1, function(target) return BattleCommand(self.inst, target) end ),
  RunAway(self.inst, "epic", 5, 5, function(target) return BattleCommand(self.inst, target) end ),
  RunAway(self.inst, "guard", 2, 3, function(target) return BattleCommand(self.inst, target) end ),
  RunAway(self.inst, "hostile", 6, 9, function(target) return BattleCommand(self.inst, target) end ),
        --RunAway(self.inst, "crazy", 3, 6),
   
        WhileNode(function() return StartWorkingCondition(self.inst, {"chopping", "prechop"}) and 
        KeepWorkingAction(self.inst, {"chopping", "prechop"}) end, "keep chopping",
            DoAction(self.inst, function() return FindObjectToWorkAction(self.inst, ACTIONS.CHOP) end)),

        WhileNode(function() return StartWorkingCondition(self.inst, {"mining", "premine"}) and 
        KeepWorkingAction(self.inst, {"mining", "premine"}) end, "keep mining",                   
            DoAction(self.inst, function() return FindObjectToWorkAction(self.inst, ACTIONS.MINE) end)),    
		WhileNode(function() return StartWorkingCondition(self.inst, {"hacking", "prehack"}) and 
        KeepWorkingAction(self.inst, {"hacking", "prehack"}) end, "keep hacking",                   
            DoAction(self.inst, function() return FindObjectToWorkAction(self.inst, ACTIONS.HACK) end)),
			
--RunAway(self.inst, "player", 2, 2, function(target) return BabyRunAway(self.inst, target) end ),

      SequenceNode{
            ConditionNode(function() return IsHungry(self.inst) and CanSeeFood(self.inst) end, "SeesFoodToEat"),
            ParallelNodeAny {
                WaitNode(1 + math.random()*1),
              --[[  PriorityNode {
                    StandStill(self.inst, ShouldStandStill),
                    Follow(self.inst, function() return self.inst.components.follower.leader end, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),},]]
            },
            DoAction(self.inst, function() return FindFoodAction(self.inst) end),},
		
	   WhileNode(function() return IsHungry2(self.inst) end, "Should Eat",
            DoAction(self.inst, EatFoodAction)),
			
		
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_2(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.25),DoAction(self.inst, function(item) return Find_Item_2(self.inst) end),},},			
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_1(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.25),DoAction(self.inst, function(item) return Find_Item_1(self.inst) end),},},
		
		SequenceNode{
		ConditionNode(function() return Working_yamche(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(1 + math.random()*2),DoAction(self.inst, function() return Working_food(self.inst) end),},},
		        
-----------
--[[		
	IfNode(function() 
		if self.inst.components.follower.leader ~= nil and self.inst.components.staycommand and self.inst.components.staycommand:IsCurrentlyStaying() == false then
				self.inst.sleep_on = false
				self.inst.together = true
				
			return true
		elseif self.inst.components.follower.leader ~= nil and not self.inst.components.staycommand then
			return true
		end
		end, "has leader",	
		Follow(self.inst, GetLeader, MIN_FOLLOW_LEADER, TARGET_FOLLOW_LEADER, MAX_FOLLOW_LEADER),
		FaceEntity(self.inst, GetLeader, GetLeader)),

IfNode(function() 
		
		if self.inst.components.follower.leader ~= nil and self.inst.components.staycommand and self.inst.components.staycommand:IsCurrentlyStaying() == true then
				self.inst.pick1 = false
				self.inst.working_food = false
				self.inst.drop = true
				self.inst.sleepn = true
				self.inst.sleep_on = true
				self.inst.active_hunt = false
				self.inst.defense = false
				self.inst.together = false
				
self.inst.components.combat:GiveUp()
			return true
		end
		end,	
		WhileNode(function() return ShouldGoHome(self.inst) end, "ShouldGoHome", DoAction(self.inst, GoHomeAction, "Go Home", true ))
	
					),  
]]
---------
		
  		Follow(self.inst, GetLeader, 0, 3, 6),
		Follow(self.inst, crazyness, 2, 8, 15),
		
        FaceEntity(self.inst, focus_leader, focus_leader),
		FaceEntity(self.inst, crazyness, crazyness),		
       
		Wander(self.inst, function() if self.inst.components.follower.leader and not self.inst.opening then 
		return Vector3(self.inst.components.follower.leader.Transform:GetWorldPosition()) 
		end end, MAX_FOLLOW_DIST- 1, {minwalktime=.5, randwalktime=.5, minwaittime=6, randwaittime=3}),
		
		
	

    },.25)
    self.bt = BT(self.inst, root)
 end
return mushasmallbrain