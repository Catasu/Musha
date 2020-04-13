local ACTIONS = GLOBAL.ACTIONS
local STRINGS = GLOBAL.STRINGS
local Vector3 = GLOBAL.Vector3


----actions

ACTIONS.ADDFUEL.str = STRINGS.ACTIONS.ADDFUEL
ACTIONS.ADDFUEL.id = "ADDFUEL"

ACTIONS.ADDFUEL.strfn = function(act)
	local targ = act.target or act.invobject

	if targ:HasTag("musha_items") then
		STRINGS.ACTIONS.ADDFUEL = (STRINGS.MUSHA_ACTION_REPAIR)
		return 
	else
		STRINGS.ACTIONS.ADDFUEL = (STRINGS.MUSHA_ACTION_ADDFUEL)
		return 
	end	
end


ACTIONS.ADDFUEL.fn = function(act)
	if act.doer.components.inventory then
		local fuel = act.doer.components.inventory:RemoveItem(act.invobject)
		if fuel then
			if act.target.components.fueled:TakeFuelItem(fuel) then
				return true
			else
				print("False")
				act.doer.components.inventory:GiveItem(fuel)
			end
		end
	end
end

ACTIONS.PICKUP.fn = function(act)
if not act.doer:HasTag("critter") and not act.doer:HasTag("yamcheb") then
	-- this code translates the shelf_slot items into the item they contain.. and handles the shopping of it.
	if act.target and act.target.components.inventoryitem and act.target.components.shelfer then
		if not act.target.components.shelfer:GetGift() then
			print(act.doer.prefab,act.doer.GUID,"tried to grab item on shelf",act.target.prefab,act.target.GUID)
			return false
		else
			print(act.doer.prefab,act.doer.GUID,"grabbed item on shelf",act.target.prefab,act.target.GUID,act.target.components.shelfer:GetGift().prefab)
		end
		local item  = act.target.components.shelfer:GetGift()
		
		item:AddTag("cost_one_oinc")
		if not act.target.components.shelfer.shelf:HasTag("playercrafted") then
			if act.doer.components.shopper:IsWatching(item) then 
				if act.doer.components.shopper:CanPayFor(item) then 
					act.doer.components.shopper:PayFor(item)
				else 			
					return false, "CANTPAY"
				end
			else
				if act.target.components.shelfer.shelf.curse then
					act.target.components.shelfer.shelf.curse(act.target)
				end
			end
		end
		item:RemoveTag("cost_one_oinc")
		act.target = act.target.components.shelfer:GiveGift()		
	end

	if act.doer.components.inventory and act.target and act.target.components.inventoryitem and not act.target:IsInLimbo() then  
		if act.target.components.citypossession and act.target.components.citypossession.enabled and  act.target.components.citypossession.cityID then
			local world = GLOBAL.GetWorld()
			if world.components.cityalarms then
				world.components.cityalarms:ChangeStatus(act.target.components.citypossession.cityID, true, act.doer)		
			end
			act.target.components.citypossession:Disable()	
		end

		if act.doer:HasTag("player") and act.doer.components.shopper then
			if act.doer.components.shopper:IsWatching(act.target) then 
				if act.doer.components.shopper:CanPayFor(act.target) then 
					act.doer.components.shopper:PayFor(act.target)
				else 			
					return false, "CANTPAY"
				end
			end 
		end

		act.doer:PushEvent("onpickup", {item = act.target})

		--special case for trying to carry two backpacks
		if not act.target.components.inventoryitem.cangoincontainer and act.target.components.equippable and act.doer.components.inventory:GetEquippedItem(act.target.components.equippable.equipslot) then

			local item = act.doer.components.inventory:GetEquippedItem(act.target.components.equippable.equipslot)
			if item.components.inventoryitem and item.components.inventoryitem.cangoincontainer then
				
				--act.doer.components.inventory:SelectActiveItemFromEquipSlot(act.target.components.equippable.equipslot)
				act.doer.components.inventory:GiveItem(act.doer.components.inventory:Unequip(act.target.components.equippable.equipslot))
			else
				act.doer.components.inventory:DropItem(act.doer.components.inventory:GetEquippedItem(act.target.components.equippable.equipslot))
			end
			
			if act.target.components.inventoryitem and  act.target.bookshelf then
	        	act.target.components.inventoryitem:TakeOffShelf()
	    	end			

			act.doer.components.inventory:Equip(act.target)
			return true
		end

		if act.doer:HasTag("player") and act.target.components.equippable and act.target.components.equippable.equipslot 
		and not act.doer.components.inventory:GetEquippedItem(act.target.components.equippable.equipslot) then

			if act.target.components.inventoryitem and  act.target.bookshelf then
	        	act.target.components.inventoryitem:TakeOffShelf()
	    	end		
			act.doer.components.inventory:Equip(act.target)
		else
		   act.doer.components.inventory:GiveItem(act.target, nil, Vector3(TheSim:GetScreenPos(act.target.Transform:GetWorldPosition())))
		end

		return true 
	end

	if act.doer.components.inventory and act.target and act.target.components.pickupable and not act.target:IsInLimbo() then

		if act.target.components.inventoryitem and  act.target.bookshelf then
        	act.target.components.inventoryitem:TakeOffShelf()
    	end

		act.doer:PushEvent("onpickup", {item = act.target})
		return act.target.components.pickupable:OnPickup(act.doer)
	end
	
elseif act.doer:HasTag("critter") or act.doer:HasTag("yamcheb") then	
	if act.doer.components.container and act.target and act.target.components.inventoryitem and not act.target:IsInLimbo() then    
		act.doer:PushEvent("onpickup", {item = act.target})
		
		   act.doer.components.container:GiveItem(act.target, nil, Vector3(TheSim:GetScreenPos(act.target.Transform:GetWorldPosition())))
		
		return true 
	end

	if act.doer.components.container and act.target and act.target.components.pickupable and not act.target:IsInLimbo() then    
		act.doer:PushEvent("onpickup", {item = act.target})
		return act.target.components.pickupable:OnPickup(act.doer)
	end

end

end


ACTIONS.HARVEST.fn = function(act)

	if act.target.components.citypossession and act.target.components.citypossession.enabled and  act.target.components.citypossession.cityID then
		local world = GLOBAL.GetWorld()
		if world.components.cityalarms then
			world.components.cityalarms:ChangeStatus(act.target.components.citypossession.cityID, true, act.doer)		
		end
		
	end

	if act.target.components.breeder then
		return act.target.components.breeder:Harvest(act.doer)
	elseif act.target.components.crop then
		return act.target.components.crop:Harvest(act.doer)
	elseif act.target.components.harvestable then
		return act.target.components.harvestable:Harvest(act.doer)
    elseif act.target.components.melter then
        return act.target.components.melter:Harvest(act.doer)		
	elseif act.target.components.stewer then
		return act.target.components.stewer:Harvest(act.doer)
	elseif act.target.components.dryer then
		return act.target.components.dryer:Harvest(act.doer)
	elseif act.target.components.occupiable and act.target.components.occupiable:IsOccupied() then
		local item =act.target.components.occupiable:Harvest(act.doer)
		if item then
			if not act.doer:HasTag("critter") and not act.doer:HasTag("yamcheb") then
			act.doer.components.inventory:GiveItem(item)
			elseif act.doer:HasTag("critter") or act.doer:HasTag("yamcheb") then
			act.doer.components.container:GiveItem(item)
			end
			return true
		end
	end
end


--[[
ACTIONS.STAYORDER = GLOBAL.Action(2, true, true)
ACTIONS.STAYORDER.fn = function(act)
local targ = act.target
	if targ and targ.components.staycommand then
		act.doer.components.locomotor:Stop()
		targ.components.locomotor:Stop()
		act.doer.components.talker:Say(GLOBAL.GetString(act.doer.prefab, "ANNOUNCE_STAYORDER"))
		targ.components.combat:GiveUp()
		if targ:HasTag("yamche") then 
		targ.stay = true
		if targ.components.container then 
		targ.components.container.canbeopened = false
		end
		if targ.yamche_leader then
			act.doer.yamche_leader = false
			targ.yamche_leader = false
			targ.yamche_leader_tag = false
		end
		end	
			if targ:HasTag("yamche") then
				
			if targ.components.burnable:IsBurning() then
				targ.components.talker:Say("[ Campfire ]")
			else
				if targ.components.sleeper:IsAsleep() then
				targ.components.sleeper:WakeUp()
				end
				targ.sg:GoToState("command")
			end
				targ.sleep_on = true	
				targ.stay = true
			end
		targ.components.staycommand:SetStaying(true)
		targ.components.staycommand:RememberStayPos("stayspot", GLOBAL.Point(targ.Transform:GetWorldPosition())) 
	return true
	end
end

ACTIONS.STAYORDER.str = STRINGS.ACTIONS.STAYORDER
ACTIONS.STAYORDER.id = "STAYORDER"
ACTIONS.STAYORDER_CANCEL = GLOBAL.Action(2, true, true)
ACTIONS.STAYORDER_CANCEL.fn = function(act)
	local targ = act.target
	if targ and targ.components.staycommand then
	act.doer.components.locomotor:Stop()
		targ.components.locomotor:Stop()
		
	if targ:HasTag("yamche") and GLOBAL.GetWorld():IsCave() then

	elseif targ:HasTag("yamche") and not GLOBAL.GetWorld():IsCave() then
	
			end
			if targ:HasTag("yamche") then
				targ.sg:GoToState("command")
				targ.stay = false
				targ.peace = false
				targ.active_hunt = false
				targ.defense = false
				targ.sleep_on = false 
				targ.sleep_f = false
	if act.doer.components.leader:CountFollowers("phoenix") == 1 then
	targ.yamche_leader = true 
	targ.yamche_leader_tag = true
	end
	
				if targ.components.container then 
				targ.components.container.canbeopened = true
				end
				if targ.components.burnable:IsBurning() then	
				targ.components.burnable:Extinguish() 
				end
				if targ.components.sleeper:IsAsleep() then
				targ.components.sleeper:WakeUp() 
				end
			 
			end
		act.doer.components.talker:Say(GLOBAL.GetString(act.doer.prefab, "ANNOUNCE_STAYORDER_CANCEL"))
		targ.components.staycommand:SetStaying(false)

		return true
	end
end

ACTIONS.STAYORDER_CANCEL.str = STRINGS.ACTIONS.STAYORDER_CANCEL
ACTIONS.STAYORDER_CANCEL.id = "STAYORDER_CANCEL"
]]
--[[STRINGS.ACTIONS.STAYORDER = "Stay here"
STRINGS.ACTIONS.STAYORDER_CANCEL = "Follow me"
STRINGS.CHARACTERS.GENERIC.ANNOUNCE_STAYORDER = "Stay here."
STRINGS.CHARACTERS.GENERIC.ANNOUNCE_STAYORDER_CANCEL = "Follow me."]]