local assets=
{
	Asset("ANIM", "anim/tuna.zip"),
--    Asset("INV_IMAGE", "tuna"),
--    Asset("INV_IMAGE", "tuna_opened"),
}


local prefabs =
{
    --"fish_med_cooked",
}    

local function Onuse(inst)
inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
  			local stacksize = 1 
	     			if inst.components.stackable then 
	     				stacksize = inst.components.stackable:StackSize()
	     			end 
						
			
					local steak = SpawnPrefab("fish_cooked")
					local steak2 = SpawnPrefab("fish_cooked")							
	     			if steak.components.stackable then 
	     				steak.components.stackable:SetStackSize(stacksize)
	     			end
					if steak2.components.stackable then 
	     				steak2.components.stackable:SetStackSize(stacksize)
	     			end
	     			inst:Remove()
					GetPlayer().components.inventory:GiveItem(steak)
					GetPlayer().components.inventory:GiveItem(steak2)
		

end
local function Offuse(inst)

end

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()

    inst.AnimState:SetBank("tuna")
    inst.AnimState:SetBuild("tuna")
    inst.AnimState:PlayAnimation("idle")
    
    MakeInventoryPhysics(inst)

local player = GetPlayer()
if player.components.moisture or IsDLCEnabled(REIGN_OF_GIANTS) then
         inst.DLC = true
		 player.DLC = true
		end
if player.components.poisonable or SaveGameIndex:IsModeShipwrecked() then 
		inst.DLC = true
         inst.DLC2 = true
		  player.DLC2 = true
		end	
if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then		
    MakeInventoryFloatable(inst, "idle_water", "idle")
    MakeBlowInHurricane(inst, TUNING.WINDBLOWN_SCALE_MIN.MEDIUM, TUNING.WINDBLOWN_SCALE_MAX.MEDIUM)
	end
	
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	if inst.DLC2 then
    inst.components.inventoryitem.imagename = "tuna"
	elseif not inst.DLC2 then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/tunacan.xml"
	end
   
    inst:AddComponent("tradable")
    inst.components.tradable.goldvalue = 1
    
	if not inst.DLC2 then
	     inst:AddComponent("machine")
	inst.components.machine.turnonfn = Onuse
    inst.components.machine.turnofffn = Offuse
    inst.components.machine.cooldowntime = 0
	elseif inst.DLC2 then
	inst:AddComponent("useableitem")
    inst.components.useableitem.verb = "OPEN"
    inst.components.useableitem:SetCanInteractFn(function() return true end)
    inst.components.useableitem:SetOnUseFn(function(inst)
        inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/can_open")
		
       -- local steak = SpawnPrefab("fish_med_cooked")
       -- GetPlayer().components.inventory:GiveItem(steak)
        --inst:Remove()
	
     			local stacksize = 1 
	     			if inst.components.stackable then 
	     				stacksize = inst.components.stackable:StackSize()
	     			end 
				 
				if inst.DLC2 then
					local steak = SpawnPrefab("fish_med_cooked")
						
	     			if steak.components.stackable then 
	     				steak.components.stackable:SetStackSize(stacksize)
	     			end 
	     			inst:Remove()
					GetPlayer().components.inventory:GiveItem(steak)
						
			elseif inst.DLC2 then
					local steak = SpawnPrefab("fish_cooked")
					local steak2 = SpawnPrefab("fish_cooked")							
	     			if steak.components.stackable then 
	     				steak.components.stackable:SetStackSize(stacksize)
	     			end 
	     			inst:Remove()
					GetPlayer().components.inventory:GiveItem(steak)
					GetPlayer().components.inventory:GiveItem(steak2)
					end
    end)
	end
    return inst
end

return Prefab("common/inventory/tunacan", fn, assets, prefabs)
