require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/chaseandattack"
require "behaviours/panic"
require "behaviours/follow"
require "behaviours/attackwall"

local ShadowMushaBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

--Images will help chop, mine and fight.

local MIN_FOLLOW_DIST = 1
local TARGET_FOLLOW_DIST = 2
local MAX_FOLLOW_DIST = 6
local GO_HOME_DIST = 2

local START_FACE_DIST =6
local KEEP_FACE_DIST = 8

local KEEP_WORKING_DIST = 10
local SEE_WORK_DIST = 15

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
    return inst.components.follower.leader and HasStateTags(inst.components.follower.leader, actiontags) and not HasStateTags(inst, actiontags)
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

local function ShouldStopCommand(inst, target)
    return inst:HasTag("animal") 
end

local function GetLeader(inst)
    return inst.components.follower.leader 
end

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

local function GetFaceTargetFn(inst)
    local target = GetClosestInstWithTag("player", inst, START_FACE_DIST)
    if target and not target:HasTag("notarget") then
        return target
    end
end

local function KeepFaceTargetFn(inst, target)
    return inst:IsNear(target, KEEP_FACE_DIST) and not target:HasTag("notarget")
end

function ShadowMushaBrain:OnStart()
    local root = PriorityNode(
    {
        ChaseAndAttack(self.inst, 10),
                  
        WhileNode(function() return StartWorkingCondition(self.inst, {"chopping", "prechop"}) and 
        KeepWorkingAction(self.inst, {"chopping", "prechop"}) end, "keep chopping",
            DoAction(self.inst, function() return FindObjectToWorkAction(self.inst, ACTIONS.CHOP) end)),

        WhileNode(function() return StartWorkingCondition(self.inst, {"mining", "premine"}) and 
        KeepWorkingAction(self.inst, {"mining", "premine"}) end, "keep mining",                   
            DoAction(self.inst, function() return FindObjectToWorkAction(self.inst, ACTIONS.MINE) end)),
		WhileNode(function() return StartWorkingCondition(self.inst, {"hacking", "prehack"}) and 
        KeepWorkingAction(self.inst, {"hacking", "prehack"}) end, "keep hacking",                   
            DoAction(self.inst, function() return FindObjectToWorkAction(self.inst, ACTIONS.HACK) end)),
--[[
     SequenceNode{
            ConditionNode(function() return self.inst:HasTag("defense") and self.inst:HasTag("closea") and not self.inst:HasTag("fara") and self.inst.components.combat.target ~= nil end, "HasTarget"),
            WaitNode(math.random()*.9),
            ChaseAndAttack(self.inst, 5),
        },

  RunAway(self.inst, "epic", 9, 15, function(target) return ShouldStopCommand(self.inst, target) end ),
  RunAway(self.inst, "monster", 6, 12, function(target) return ShouldStopCommand(self.inst, target) end ),
  RunAway(self.inst, "insect", 6, 12, function(target) return ShouldStopCommand(self.inst, target) end ),
  RunAway(self.inst, "animal", 5, 11, function(target) return ShouldStopCommand(self.inst, target) end ),
  RunAway(self.inst, "guard", 4, 10, function(target) return ShouldStopCommand(self.inst, target) end ),
]]--

          RunAway(self.inst, "crazy", 3, 4),
         
	IfNode(function() 
		if self.inst.components.follower.leader ~= nil and self.inst.components.staycommand and self.inst.components.staycommand:IsCurrentlyStaying() == false then
				self.inst:RemoveTag("animal")
				self.inst:AddTag("defense")
				self.inst:RemoveTag("shadow")
				self.inst:RemoveTag("shadowcreature")
			return true
		elseif self.inst.components.follower.leader ~= nil and not self.inst.components.staycommand then
			return true
		end
		end, "has leader",	
      		  Follow(self.inst, GetLeader, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST)),

        IfNode(function() return GetLeader(self.inst) end, "has leader",            
            FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn )),


IfNode(function() 
		
		if self.inst.components.follower.leader ~= nil and self.inst.components.staycommand and self.inst.components.staycommand:IsCurrentlyStaying() == true then
				self.inst:AddTag("animal")
				self.inst:RemoveTag("defense")
				self.inst:AddTag("shadow")
				self.inst:AddTag("shadowcreature")

self.inst.components.combat:GiveUp()
			return true
		end
		end, "has leader",	
		WhileNode(function() return ShouldGoHome(self.inst) end, "ShouldGoHome",
            		DoAction(self.inst, GoHomeAction, "Go Home", true ))),  

---------

--[[
        Follow(self.inst, GetLeader, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
        IfNode(function() return GetLeader(self.inst) end, "has leader",            
            FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn )),
]]--

    }, .25)
    

    self.bt = BT(self.inst, root)    
end

return ShadowMushaBrain