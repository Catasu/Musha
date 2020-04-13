local SpawnPrefab = GLOBAL.SpawnPrefab
local GetPlayer = GLOBAL.GetPlayer
local Vector3 = GLOBAL.Vector3
local GetWorld = GLOBAL.GetWorld
local GetTime = GLOBAL.GetTime

local require = GLOBAL.require
local Cookable = require "components/cookable"
local Crop = require "components/crop"
local Harvestable = require "components/harvestable"
local Pickable = require "components/pickable"
local Stewer = require "components/stewer"


function Cookable:GetProduct()
    local prefab = nil 
    if self.product then 
        prefab = self.product
        if type(self.product) == "function" then
            prefab = self.product(self.inst)
        end
    end 
    return prefab
end 
AddComponentPostInit("cookable", Cookable)


--[[function Crop:Harvest(harvester)
    if self.matured or self.withered then
        local product = nil
        if self.grower and self.grower:HasTag("fire") or self.inst:HasTag("fire") then
            local temp = SpawnPrefab(self.product_prefab)
            if temp.components.cookable and temp.components.cookable.product then
                product = SpawnPrefab(temp.components.cookable.product)
            else
                product = SpawnPrefab("seeds_cooked")
            end
            temp:Remove()
        else
            product = SpawnPrefab(self.product_prefab)
        end

        if product then
					if GetPlayer().components.moisture and not GetPlayer().components.poisonable then
					local targetMoisture = 0

                    if self.inst.components.moisturelistener then
                        targetMoisture = self.inst.components.moisturelistener:GetMoisture()
                    elseif self.inst.components.moisture then
                        targetMoisture = self.inst.components.moisture:GetMoisture()
                    else
                        targetMoisture = GetWorld().components.moisturemanager:GetWorldMoisture()
                    end
                    
                    product.targetMoisture = targetMoisture
                    product:DoTaskInTime(2*FRAMES, function()
                        if product.components.moisturelistener then 
                            product.components.moisturelistener.moisture = product.targetMoisture
                            product.targetMoisture = nil
                            product.components.moisturelistener:DoUpdate()
                        end
                    end)
				
                    elseif GLOBAL.SaveGameIndex:IsModeShipwrecked() or GetPlayer().components.poisonable then
					self.inst:ApplyInheritedMoisture(product)
					end
        end
		
		if harvester ~= nil and not harvester:HasTag("yamcheb") and not harvester:HasTag("critter") and harvester.components.inventory then
        harvester.components.inventory:GiveItem(product)
		elseif harvester ~= nil and (harvester:HasTag("yamcheb") or harvester:HasTag("critter")) and harvester.components.container then
        harvester.components.container:GiveItem(product)
		end
		
        ProfileStatsAdd("grown_"..product.prefab) 
        
        self.matured = false
        self.withered = false
        self.inst:RemoveTag("withered")
        self.growthpercent = 0
        self.product_prefab = nil

        if self.grower then
            self.grower.components.grower:RemoveCrop(self.inst)
            self.grower = nil
        end
        
        return true
    end
end
AddComponentPostInit("crop",Crop)]]


--[[function Harvestable:Harvest(picker)
    if self:CanBeHarvested() then
        local produce = self.produce
        self.produce = 0
        
        if self.onharvestfn then
            self.onharvestfn(self.inst, picker, produce)
        end
        
        if picker ~= nil and not picker:HasTag("yamcheb") and not picker:HasTag("critter") and picker.components.inventory and self.product then
	        picker:PushEvent("harvestsomething", {object = self.inst})
            for i = 1, produce, 1 do
                local loot = SpawnPrefab(self.product)
                if loot then
				
                    if GetPlayer().components.moisture and not GetPlayer().components.poisonable then
					local targetMoisture = 0

                    if self.inst.components.moisturelistener then
                        targetMoisture = self.inst.components.moisturelistener:GetMoisture()
                    elseif self.inst.components.moisture then
                        targetMoisture = self.inst.components.moisture:GetMoisture()
                    else
                        targetMoisture = GetWorld().components.moisturemanager:GetWorldMoisture()
                    end
                    
                    loot.targetMoisture = targetMoisture
                    loot:DoTaskInTime(2*FRAMES, function()
                        if loot.components.moisturelistener then 
                            loot.components.moisturelistener.moisture = loot.targetMoisture
                            loot.targetMoisture = nil
                            loot.components.moisturelistener:DoUpdate()
                        end
                    end)
				
                    elseif GLOBAL.SaveGameIndex:IsModePorkland() or GLOBAL.SaveGameIndex:IsModeShipwrecked() or GetPlayer().components.poisonable then
					self.inst:ApplyInheritedMoisture(loot)
					end
                    picker.components.inventory:GiveItem(loot)
                end
            end
		elseif picker ~= nil and (picker:HasTag("yamcheb") or picker:HasTag("critter")) and picker.components.container and self.product then
	        picker:PushEvent("harvestsomething", {object = self.inst})
            for i = 1, produce, 1 do
                local loot = SpawnPrefab(self.product)
                if loot then
				
					if GetPlayer().components.moisture and not GetPlayer().components.poisonable then
					local targetMoisture = 0

                    if self.inst.components.moisturelistener then
                        targetMoisture = self.inst.components.moisturelistener:GetMoisture()
                    elseif self.inst.components.moisture then
                        targetMoisture = self.inst.components.moisture:GetMoisture()
                    else
                        targetMoisture = GetWorld().components.moisturemanager:GetWorldMoisture()
                    end
                    
                    loot.targetMoisture = targetMoisture
                    loot:DoTaskInTime(2*FRAMES, function()
                        if loot.components.moisturelistener then 
                            loot.components.moisturelistener.moisture = loot.targetMoisture
                            loot.targetMoisture = nil
                            loot.components.moisturelistener:DoUpdate()
                        end
                    end)
				
                    elseif GLOBAL.SaveGameIndex:IsModePorkland() or GLOBAL.SaveGameIndex:IsModeShipwrecked() or GetPlayer().components.poisonable then
					self.inst:ApplyInheritedMoisture(loot)
					end
                    picker.components.container:GiveItem(loot)
                end
            end
        end
        self:StartGrowing()
        return true
    end
end
AddComponentPostInit("harvestable",Harvestable)]]--


--[[function Pickable:Pick(picker)
    if self.canbepicked and self.caninteractwith then

		if self.transplanted then
			if self.cycles_left ~= nil then
				self.cycles_left = self.cycles_left - 1
			end
		end

		if self.shouldwither then
			if self.protected_cycles ~= nil then
				self.protected_cycles = self.protected_cycles - 1
			end
		end
		
		local loot = nil
        if picker ~= nil and not picker:HasTag("yamcheb") and not picker:HasTag("critter") and picker.components.inventory and self.product then
            loot = SpawnPrefab(self.product)

            if loot then
	            if self.numtoharvest > 1 and loot.components.stackable then
	            	loot.components.stackable:SetStackSize(self.numtoharvest)	            	
	            end

				if GetPlayer().components.moisture and not GetPlayer().components.poisonable then
					local targetMoisture = 0

                    if self.inst.components.moisturelistener then
                        targetMoisture = self.inst.components.moisturelistener:GetMoisture()
                    elseif self.inst.components.moisture then
                        targetMoisture = self.inst.components.moisture:GetMoisture()
                    else
                        targetMoisture = GetWorld().components.moisturemanager:GetWorldMoisture()
                    end
                    
                    loot.targetMoisture = targetMoisture
                    loot:DoTaskInTime(2*FRAMES, function()
                        if loot.components.moisturelistener then 
                            loot.components.moisturelistener.moisture = loot.targetMoisture
                            loot.targetMoisture = nil
                            loot.components.moisturelistener:DoUpdate()
                        end
                    end)
				
                    elseif GLOBAL.SaveGameIndex:IsModePorkland() or GLOBAL.SaveGameIndex:IsModeShipwrecked() or GetPlayer().components.poisonable then
					self.inst:ApplyInheritedMoisture(loot)
					end

		        picker:PushEvent("picksomething", {object = self.inst, loot= loot})
                picker.components.inventory:GiveItem(loot, nil, Vector3(TheSim:GetScreenPos(self.inst.Transform:GetWorldPosition())))
            end
			elseif picker ~= nil and (picker:HasTag("yamcheb") or picker:HasTag("critter")) and picker.components.container and self.product then
            loot = SpawnPrefab(self.product)

            if loot then
	            if self.numtoharvest > 1 and loot.components.stackable then
	            	loot.components.stackable:SetStackSize(self.numtoharvest)	            	
	            end
				if GetPlayer().components.moisture and not GetPlayer().components.poisonable then
					local targetMoisture = 0

                    if self.inst.components.moisturelistener then
                        targetMoisture = self.inst.components.moisturelistener:GetMoisture()
                    elseif self.inst.components.moisture then
                        targetMoisture = self.inst.components.moisture:GetMoisture()
                    else
                        targetMoisture = GetWorld().components.moisturemanager:GetWorldMoisture()
                    end
                    
                    loot.targetMoisture = targetMoisture
                    loot:DoTaskInTime(2*FRAMES, function()
                        if loot.components.moisturelistener then 
                            loot.components.moisturelistener.moisture = loot.targetMoisture
                            loot.targetMoisture = nil
                            loot.components.moisturelistener:DoUpdate()
                        end
                    end)
				
                    elseif GLOBAL.SaveGameIndex:IsModePorkland() or GLOBAL.SaveGameIndex:IsModeShipwrecked() or GetPlayer().components.poisonable then
					self.inst:ApplyInheritedMoisture(loot)
					end
		        picker:PushEvent("picksomething", {object = self.inst, loot= loot})
                picker.components.container:GiveItem(loot, nil, Vector3(TheSim:GetScreenPos(self.inst.Transform:GetWorldPosition())))
            end
        end
        
        if self.onpickedfn then
            self.onpickedfn(self.inst, picker, loot)
        end
        
        self.canbepicked = false
        self.hasbeenpicked = true
        
        if not self.paused and not self.withered and self.baseregentime and (self.cycles_left == nil or self.cycles_left > 0) then
        	self.regentime = self.baseregentime * self:GetGrowthMod() --if GetSeasonManager():IsSpring() then self.regentime = self.baseregentime * TUNING.SPRING_GROWTH_MODIFIER end
			self.task = self.inst:DoTaskInTime(self.regentime, OnRegen, "regen")
			self.targettime = GetTime() + self.regentime
		end
        
        self.inst:PushEvent("picked", {picker = picker, loot = loot, plant = self.inst})
    end
end
AddComponentPostInit("pickable",Pickable)--]]  


--[[function Stewer:Harvest( harvester )
	if self.done then
		if self.onharvest then
			self.onharvest(self.inst)
		end
		self.done = nil
		if self.product then
			if harvester and harvester.components.inventory and not harvester:HasTag("yamcheb") and not harvester:HasTag("critter") then
				local loot = nil
				if self.product ~= "spoiledfood" then
					loot = SpawnPrefab(self.product)

					if loot and loot.components.perishable then
						loot.components.perishable:SetPercent( self.product_spoilage)
						loot.components.perishable:LongUpdate(GetTime() - self.targettime)
						loot.components.perishable:StartPerishing()
					end
				else
					loot = SpawnPrefab("spoiled_food")
				end
				
				if loot then                    
                    loot.targetMoisture = 0
					loot:DoTaskInTime(2*FRAMES, function()
						if loot.components.moisturelistener then 
							loot.components.moisturelistener.moisture = loot.targetMoisture
							loot.targetMoisture = nil
							loot.components.moisturelistener:DoUpdate()
						end
					end)
					harvester.components.inventory:GiveItem(loot, nil, Vector3(TheSim:GetScreenPos(self.inst.Transform:GetWorldPosition())))
				end
			elseif harvester and harvester.components.container and (harvester:HasTag("yamcheb") or harvester:HasTag("critter")) then
				local loot = nil
				if self.product ~= "spoiledfood" then
					loot = SpawnPrefab(self.product)

					if loot and loot.components.perishable then
						loot.components.perishable:SetPercent( self.product_spoilage)
						loot.components.perishable:LongUpdate(GetTime() - self.targettime)
						loot.components.perishable:StartPerishing()
					end
				else
					loot = SpawnPrefab("spoiled_food")
				end
				
				if loot then                    
                    loot.targetMoisture = 0
					loot:DoTaskInTime(2*FRAMES, function()
						if loot.components.moisturelistener then 
							loot.components.moisturelistener.moisture = loot.targetMoisture
							loot.targetMoisture = nil
							loot.components.moisturelistener:DoUpdate()
						end
					end)
					harvester.components.container:GiveItem(loot, nil, Vector3(TheSim:GetScreenPos(self.inst.Transform:GetWorldPosition())))
				end
			end
			self.product = nil
			self.spoiltargettime = nil

			if self.spoiltask then 
				self.spoiltask:Cancel()
				self.spoiltask = nil
			end
		end
		
		if self.inst.components.container and not self.inst:HasTag("flooded") then		
			self.inst.components.container.canbeopened = true
		end
		
		return true
	end
end
AddComponentPostInit("stewer",Stewer)]]
