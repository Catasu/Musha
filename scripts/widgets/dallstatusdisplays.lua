local Widget = require "widgets/widget"
local HealthBadge = require "widgets/healthbadge"
local HungerBadge = require "widgets/hungerbadge"
--local SanityBadge = require "widgets/sanitybadge"

local DallStatusDisplays = Class(Widget, function(self, owner)
    Widget._ctor(self, "Status")
    self.owner = owner

    self.stomach = self:AddChild(HungerBadge(owner))
    --self.stomach:SetPosition(-25,20,0)
    self.stomach:SetPosition(-50,120,0)

    self.stomach:SetScale(0.75)

    self.heart = self:AddChild(HealthBadge(owner))
    --self.heart:SetPosition(25,20,0)
    self.heart:SetPosition(-100,120,0)
    self.heart:SetScale(0.75)
       
    --self.inst:ListenForEvent("healthdelta", function(inst, data)  self:HealthDelta(data) end, self.owner)
    --self.inst:ListenForEvent("hungerdelta", function(inst, data) self:HungerDelta(data) end, self.owner)
	
    self:FollowMouseConstrained()
    self:StartUpdating()
	self:UpdateValues()
end)

function DallStatusDisplays:UpdateValues()
	
    self.stomach:SetPercent(self.owner.components.hunger:GetPercent(), self.owner.components.hunger.max)
    self.heart:SetPercent(self.owner.components.health:GetPercent(), self.owner.components.health.maxhealth, self.owner.components.health:GetPenaltyPercent())
end

function DallStatusDisplays:OnUpdate()

	local target = nil

	local ents = TheInput:GetAllEntitiesUnderMouse()
	for k,v in pairs(ents) do
		if v:HasTag("dall") and v.Transform then
			target = v
			break
		end
	end
	
	if (target) then
		self:Show()
		self.owner = target
		local pos = TheInput:GetScreenPosition()
		self:UpdatePosition(pos.x, pos.y)
	else
		self.owner = GetPlayer()
		self:Hide()
	end
	
	self:UpdateValues()
end

function DallStatusDisplays:UpdatePosition(x,y)
    self:SetPosition(x+75,y-10,0)
end

function DallStatusDisplays:FollowMouseConstrained()
    if not self.followhandler then
        self.followhandler = TheInput:AddMoveHandler(function(x,y) self:UpdatePosition(x,y) end)
        local pos = TheInput:GetScreenPosition()
        self:UpdatePosition(pos.x, pos.y)
    end
end



function DallStatusDisplays:HealthDelta(data)
	self.heart:SetPercent(data.newpercent, self.owner.components.health.maxhealth,self.owner.components.health:GetPenaltyPercent()) 
	
	if data.oldpercent > .33 and data.newpercent <= .33 then
		self.heart:StartWarning()
	else
		self.heart:StopWarning()
	end
	
	if not data.overtime then
		if data.newpercent > data.oldpercent then
			self.heart:PulseGreen()
			TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/health_up")
		elseif data.newpercent < data.oldpercent then
			TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/health_down")
			self.heart:PulseRed()
		end
	end
end

function DallStatusDisplays:HungerDelta(data)
	self.stomach:SetPercent(data.newpercent, self.owner.components.hunger.max)

	if data.newpercent <= 0 then
		self.stomach:StartWarning()
	else
		self.stomach:StopWarning()
	end
	
	if not data.overtime then
		if data.newpercent > data.oldpercent then
			self.stomach:PulseGreen()
			TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/hunger_up")
		elseif data.newpercent < data.oldpercent then
			TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/hunger_down")
			self.stomach:PulseRed()
		end
	end
	
end

return DallStatusDisplays
