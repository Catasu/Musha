local Widget = require "widgets/widget"
local HealthBadge = require "widgets/healthbadge"

local MushaStatusDisplays = Class(Widget, function(self, owner)
    Widget._ctor(self, "Status")
    self.owner = owner

    self.heart = self:AddChild(HealthBadge(owner))
    --self.heart:SetPosition(25,20,0)
    self.heart:SetPosition(-75,80,0)
    self.heart:SetScale(0.70)
       	
    self:FollowMouseConstrained()
    self:StartUpdating()
	self:UpdateValues()
end)

function MushaStatusDisplays:UpdateValues()
	
    self.heart:SetPercent(self.owner.components.health:GetPercent(), self.owner.components.health.maxhealth, self.owner.components.health:GetPenaltyPercent())
end

function MushaStatusDisplays:OnUpdate()

	local target = nil

	local ents = TheInput:GetAllEntitiesUnderMouse()
	for k,v in pairs(ents) do
		if v:HasTag("mushab") and v.Transform then
			target = v
			break
		elseif v.valkyrieh and v:HasTag("mushabv") and v.Transform then
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

function MushaStatusDisplays:UpdatePosition(x,y)
    self:SetPosition(x+75,y-10,0)
end

function MushaStatusDisplays:FollowMouseConstrained()
    if not self.followhandler then
        self.followhandler = TheInput:AddMoveHandler(function(x,y) self:UpdatePosition(x,y) end)
        local pos = TheInput:GetScreenPosition()
        self:UpdatePosition(pos.x, pos.y)
    end
end



function MushaStatusDisplays:HealthDelta(data)
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

return MushaStatusDisplays
