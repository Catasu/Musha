require "prefabutil"
local assets=
{
	Asset("ANIM", "anim/musha_egg_arong.zip"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_arong.xml"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_arong.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_cracked_arong.tex"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_cracked_arong.xml"),
	
}

local loot_hot = 
{
  --  "musha_egg_arong",
}

local loot_cold = 
{
  --  "musha_egg_arong",
}
----------------

local function green_apple(inst)
inst:DoTaskInTime( 1, function() 
local apple = SpawnPrefab("green_apple_plant")
apple.Transform:SetPosition(inst:GetPosition():Get()) 
SpawnPrefab("pine_needles").Transform:SetPosition(apple:GetPosition():Get()) 
apple.AnimState:PlayAnimation("grow") end)
end

local function Hatch(inst)
    local yamchebird = SpawnPrefab("mini_arong")
    yamchebird.Transform:SetPosition(inst.Transform:GetWorldPosition())
    yamchebird.sg:GoToState("hatch")
	if not inst.cooking_born then
	green_apple(inst)
	end
    inst:Remove()
end

local function CheckHatch(inst)
    --print("tallbirdegg - CheckHatch")
    if inst.components.hatchable.state == "hatch" then
        Hatch(inst)
    end
end

local function PlayUncomfySound(inst)
    inst.SoundEmitter:KillSound("uncomfy")
    if inst.components.hatchable.toohot then
        inst.SoundEmitter:PlaySound("dontstarve/creatures/egg/egg_hot_steam_LP", "uncomfy")
    elseif inst.components.hatchable.toocold then
        inst.SoundEmitter:PlaySound("dontstarve/creatures/egg/egg_cold_shiver_LP", "uncomfy")
    end
end

local function OnNear(inst)
    if inst.components.playerprox ~= nil and
        inst.components.playerprox:IsPlayerClose() and
        inst.components.hatchable.state == "hatch" then
        Hatch(inst)
    end
     --CheckHatch(inst)
end
local function OnFar(inst)
 
end

local function OnDropped(inst)
    inst.components.hatchable:StartUpdating()
    CheckHatch(inst)
	inst.holding = false
    PlayUncomfySound(inst)
	inst.Light:Enable(true)
end

local function OnPutInInventory(inst)
    inst.components.hatchable:StopUpdating()
    inst.SoundEmitter:KillSound("uncomfy")
	inst.holding = true
	inst.Light:Enable(false)
end

local function OnPutInInventory_hatched(inst)
    inst.components.hatchable:StartUpdating()
    inst.SoundEmitter:KillSound("uncomfy")
	inst.holding = true
	inst.Light:Enable(false)
end



local function GetStatus(inst)
    if inst.components.hatchable ~= nil and inst.components.hatchable.state == "uncomfy" then
        return (inst.components.hatchable.toohot and "HOT")
            or (inst.components.hatchable.toocold and "COLD")
            or nil
    end
end

local function DropLoot(inst)
     
    inst:AddComponent("lootdropper")
    if inst.components.hatchable.toohot then

        inst.components.lootdropper:SetLoot(loot_hot)
    else
        inst.components.lootdropper:SetLoot(loot_cold)
    end
    inst.components.lootdropper:DropLoot()
end

local function OnHatchState(inst, state)
    --print("tallbirdegg - OnHatchState", state)

    inst.SoundEmitter:KillSound("uncomfy")

    if state == "crack" then
        local cracked = SpawnPrefab("musha_egg_cracked_arong")
        cracked.Transform:SetPosition(inst.Transform:GetWorldPosition())
        cracked.AnimState:PlayAnimation("crack")
        cracked.AnimState:PushAnimation("idle_happy", true)
        cracked.SoundEmitter:PlaySound("dontstarve/creatures/egg/egg_hatch_crack")
        inst:Remove()
    elseif state == "uncomfy" then
        if inst.components.hatchable.toohot then
            inst.AnimState:PlayAnimation("idle_hot", true)
        elseif inst.components.hatchable.toocold then
            inst.AnimState:PlayAnimation("idle_cold", true)
        end
        PlayUncomfySound(inst)
    elseif state == "comfy" then
        inst.AnimState:PlayAnimation("idle_happy", true)
    elseif state == "hatch" then
        CheckHatch(inst)
    elseif state == "dead" then
        --print("   ACK! *splat*")
        if inst.components.hatchable.toohot then
            inst.SoundEmitter:PlaySound("dontstarve/creatures/egg/egg_hot_jump")
            inst:DoTaskInTime(20*FRAMES, PlaySound, "dontstarve/creatures/egg/egg_hot_explo")
            inst:DoTaskInTime(20*FRAMES, DropLoot)
            inst.AnimState:PlayAnimation("toohot")
        elseif inst.components.hatchable.toocold then
            inst:DoTaskInTime(15*FRAMES, PlaySound, "dontstarve/creatures/egg/egg_cold_freeze")
            inst:DoTaskInTime(30*FRAMES, DropLoot)
            inst.AnimState:PlayAnimation("toocold")
        end

        inst.components.inventoryitem.canbepickedup = false
        inst.persists = false
        inst:ListenForEvent("animover", inst.Remove)
    end
end
-----
local function onsave(inst, data)
    
	if inst.revealed then
		data.revealed = inst.revealed
	end
end

local function onload(inst, data)
     if data and data.revealed and data.revealed == true then
    	print("Reveal treasure")
    	inst:Reveal(inst)
    end
end

local function commonfn(anim, withsound, cookable)
local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    if withsound then
        inst.entity:AddSoundEmitter()
    end
    
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBuild("musha_egg_arong")
    inst.AnimState:SetBank("egg")
    inst.AnimState:PlayAnimation("egg")
	
	inst.entity:AddLight()
	inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.7)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(150/255, 150/255, 150/255)
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
	inst.Light:Enable(true)
	
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_egg_arong.tex" )
	
	
	if cookable then
        --cookable (from cookable component) added to pristine state for optimization
        inst:AddTag("cookable")
    end


    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")

	if cookable then
		inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_egg_arong.xml"
        inst:AddComponent("cookable")
        inst.components.cookable.product = "musha_egg_cooked_arong"
    end
	
	
	
    return inst
end

local function defaultfn(anim)
	local inst = commonfn(anim, true, true)
		
 	
	
    inst:AddComponent("hatchable")
    inst.components.hatchable:SetOnState(OnHatchState)
    inst.components.hatchable:SetCrackTime(1)
    inst.components.hatchable:SetHatchTime(TUNING.SMALLBIRD_HATCH_TIME)
    inst.components.hatchable:SetHatchFailTime(TUNING.SMALLBIRD_HATCH_TIME * 900000000000)
    
	inst.components.hatchable:StartUpdating()
	
	

    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)

    inst.components.inspectable.getstatus = GetStatus

    
 
inst.Reveal = function(inst)
    	print("Treasure revealed")
    	inst.revealed = true
    	inst.entity:Show()
    	inst.MiniMapEntity:SetEnabled(true)
    	inst:RemoveTag("NOCLICK")
	end

	inst.IsRevealed = function(inst)
		return inst.revealed
	end

	inst.OnSave = onsave
	inst.OnLoad = onload

	inst.EggHunt = function(inst)
		inst:Reveal()
		--local treasures = GetTreasureLootDefinitionTable()
		--local treasure = GetRandomKey(treasures)
		--inst.loot = treasure
		local x, y, z = inst.Transform:GetLocalPosition()
    	local minimap = GetWorld().minimap.MiniMap
    	local map = GetWorld().Map
        local cx, cy, cz = map:GetTileCenterPoint(x, 0, z)
        minimap:ShowArea(cx, cy, cz, 20)
        map:VisitTile(map:GetTileCoordsAtPoint(cx, cy, cz))
		local px, py, pz = GetPlayer().Transform:GetWorldPosition()
    	GetPlayer().HUD.controls:ToggleMap()
    	minimap:Focus(x - px, z - pz, -minimap:GetZoom()) --Zoom in all the way		
	end	
	
	return inst
end

local function normalfn()
	return defaultfn("egg")
	
end

local function crackedfn()
   local inst = defaultfn("idle_happy")

    

	--[[if inst.components.cookable then
	inst:RemoveTag("cookable")
    inst:RemoveComponent("cookable")
    end]]
	
    inst.components.hatchable.state = "comfy"

	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_egg_cracked_arong.xml"
	
	inst.components.hatchable:StartUpdating()
	
    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(6, 6)
    inst.components.playerprox:SetOnPlayerNear(OnNear)
    --inst.components.playerprox:SetOnPlayerFar(OnFar)
	
    return inst
end

local function cookedfn()
	local inst = commonfn("idle_happy", true, true)

--[[local owner = inst.components.inventoryitem.owner
if owner ~= nil then
owner.components.inventory:DropItem(inst)  
end]]

	inst.cooking_born = true
	
	inst:AddComponent("hatchable")
    inst.components.hatchable:SetOnState(OnHatchState)
    inst.components.hatchable:SetCrackTime(0)
    inst.components.hatchable:SetHatchTime(0)
    inst.components.hatchable:SetHatchFailTime(TUNING.SMALLBIRD_HATCH_TIME * 9999999999999999999)
	inst.components.hatchable.state = "comfy"
	
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory_hatched)

    inst.components.inspectable.getstatus = GetStatus
	
	inst.components.inventoryitem:ChangeImageName("musha_egg_cracked_arong")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_egg_cracked_arong.xml"
		
	inst.components.hatchable:StartUpdating()
	
    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(6, 6)
    inst.components.playerprox:SetOnPlayerNear(OnNear)
    --inst.components.playerprox:SetOnPlayerFar(OnFar)
	
inst:DoTaskInTime( 1, function() 
inst.components.hatchable.state = "hatch"
CheckHatch(inst) end)


	
	return inst
end

return Prefab( "common/inventory/musha_egg_arong", normalfn, assets),
		Prefab( "common/inventory/musha_egg_cracked_arong", crackedfn, assets),
		Prefab("musha_egg_cooked_arong", cookedfn, assets)
