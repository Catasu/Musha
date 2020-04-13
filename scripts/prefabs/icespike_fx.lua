local assets =
{
	Asset("ANIM", "anim/icespikes.zip")
	
}

local function fn1()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.Transform:SetFourFaced()
    anim:SetBank("deerclops_icespike")
    anim:SetBuild("icespikes")
    anim:PlayAnimation("spike1")
    inst:AddTag("fx")
	inst.SoundEmitter:PlaySound("dontstarve/creatures/deerclops/ice_small")
    inst:ListenForEvent( "animover", function(inst) inst:Remove() end )
    return inst
end
local function fn2()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.Transform:SetFourFaced()
    anim:SetBank("deerclops_icespike")
    anim:SetBuild("icespikes")
    anim:PlayAnimation("spike1")
    inst:AddTag("fx")
	inst.SoundEmitter:PlaySound("dontstarve/creatures/deerclops/ice_small")
    inst:ListenForEvent( "animover", function(inst) inst:Remove() end )
    return inst
end
local function fn3()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.Transform:SetFourFaced()
    anim:SetBank("deerclops_icespike")
    anim:SetBuild("icespikes")
    anim:PlayAnimation("spike1")
    inst:AddTag("fx")
	inst.SoundEmitter:PlaySound("dontstarve/creatures/deerclops/ice_small")
    inst:ListenForEvent( "animover", function(inst) inst:Remove() end )
    return inst
end
local function fn4()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.Transform:SetFourFaced()
    anim:SetBank("deerclops_icespike")
    anim:SetBuild("icespikes")
    anim:PlayAnimation("spike1")
    inst:AddTag("fx")
	inst.SoundEmitter:PlaySound("dontstarve/creatures/deerclops/ice_small")
    inst:ListenForEvent( "animover", function(inst) inst:Remove() end )
    return inst
end

return Prefab("icespikes_fx_1", fn1, assets),
		Prefab("icespikes_fx_2", fn2, assets),
		Prefab("icespikes_fx_3", fn3, assets),
		Prefab("icespikes_fx_4", fn4, assets)
