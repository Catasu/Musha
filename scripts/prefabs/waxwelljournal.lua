local assets =
{
	Asset("ANIM", "anim/book_maxwell.zip"),
}

local prefabs =
{
	"shadowwaxwell",
    "waxwell_book_fx"
}

local function doeffects(inst, pos)
    SpawnPrefab("statue_transition").Transform:SetPosition(pos:Get())
    SpawnPrefab("statue_transition_2").Transform:SetPosition(pos:Get())
	
end

local function canread(inst)
    return (inst.components.sanity:GetMaxSanity() >= TUNING.SHADOWWAXWELL_SANITY_PENALTY)
end

local function Dropped_book(inst)

		SpawnPrefab("statue_transition").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("nightmarefuel").Transform:SetPosition(inst:GetPosition():Get())
		inst:Remove()
end

local function onread(inst, reader)

    --Check sanity
    if not canread(reader) then 
        if reader.components.talker and not reader:HasTag("musha") then
            reader.components.talker:Say(GetString(reader.prefab, "ANNOUNCE_NOSANITY"))
			
		else	
			 reader.components.talker:Say("Rise! shadow puppy!")
        end
		
		return true
    end

    --Check reagent
	if not reader:HasTag("musha") then
    if not reader.components.inventory:Has("nightmarefuel", TUNING.SHADOWWAXWELL_FUEL_COST) then
        if reader.components.talker then
            reader.components.talker:Say(GetString(reader.prefab, "ANNOUNCE_NOFUEL"))
		
        end
		
		return true
    end

    reader.components.inventory:ConsumeByName("nightmarefuel", TUNING.SHADOWWAXWELL_FUEL_COST)
	end
    --Ok you had everything. Make the image.
    local theta = math.random() * 2 * PI
    local pt = inst:GetPosition()
    local radius = math.random(3, 6)
    local offset = FindWalkableOffset(pt, theta, radius, 12, true)
    if offset then
        local image = SpawnPrefab("shadowwaxwell")
        local pos = pt + offset
        image.Transform:SetPosition(pos:Get())
		if reader:HasTag("musha") then
		local x,y,z = inst.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x,y,z, 10, {"shadowminion"})
	for k,v in pairs(ents) do
		v.shadow_image = true
		v.AnimState:SetBuild("musha_h")
		v.shadowmusha = true
		v:AddComponent("colourtweener")
		v.components.colourtweener:StartTween({1,1,1,.7}, 0)
		v.Transform:SetScale(0.9, 0.9, 0.9)
		end
		end
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() or GetPlayer().DLC2 then
        if image:GetIsOnWater() then
            image:SpawnShadowBoat(pos)
        end
	end
        doeffects(inst, pos)
        image.components.follower:SetLeader(reader)
        reader.components.health:DoDelta(-TUNING.SHADOWWAXWELL_HEALTH_COST)
        reader.components.sanity:RecalculatePenalty()
        inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
			if reader:HasTag("musha") then
			SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get())
			inst:Remove()
			end
        return true
    end
	
end



local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    local sound = inst.entity:AddSoundEmitter()
    
    MakeInventoryPhysics(inst)

    anim:SetBank("book_maxwell")
    anim:SetBuild("book_maxwell")
    anim:PlayAnimation("idle")
	if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() or GetPlayer().DLC2 then
    MakeInventoryFloatable(inst, "idle_water", "idle")
    end
    inst:AddComponent("inventoryitem")

	if GetPlayer():HasTag("musha") then
	inst.components.inventoryitem:SetOnDroppedFn(Dropped_book)
	else
    inst:AddComponent("characterspecific")
    inst.components.characterspecific:SetOwner("waxwell")
	end
    -----------------------------------
    inst:AddComponent("inspectable")
    inst:AddComponent("book")
    inst.components.book.onread = onread

    MakeSmallBurnable(inst)
    MakeSmallPropagator(inst)

    return inst
end

return Prefab("common/waxwelljournal", fn, assets)
