local assets =
{
	Asset("ANIM", "anim/apple_glowberry.zip"),
}

local prefabs =
{
    "green_fruit",
}

local FADE_FRAMES = 26
local FADE_INTENSITY = .8
local FADE_FALLOFF = .5
local FADE_RADIUS = 1.5


local function KillPlant(inst)
    inst._killtask = nil
    inst.components.pickable.caninteractwith = false
    --FadeOut(inst)
    inst:ListenForEvent("animover", inst.Remove)
    inst.AnimState:PlayAnimation("wilt")
end

local function OnBloomed(inst)
    inst:RemoveEventCallback("animover", OnBloomed)
    inst.AnimState:PlayAnimation("idle_loop", true)
    inst.components.pickable.caninteractwith = true
    inst._killtask = inst:DoTaskInTime(5 + math.random(), KillPlant)
end

local function OnPicked(inst)--, picker, loot)
    if inst._killtask ~= nil then
        inst._killtask:Cancel()
        inst._killtask = nil
    end
    --FadeOut(inst, true)
    inst:RemoveEventCallback("animover", OnBloomed)
    inst:ListenForEvent("animover", inst.Remove)
    inst.AnimState:PlayAnimation("picked_wilt")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
 
    inst.AnimState:SetBank("forest_glowberry")
    inst.AnimState:SetBuild("apple_glowberry")
    inst.AnimState:PlayAnimation("bloom")


     inst.SoundEmitter:PlaySound("dontstarve/common/plant")
	
  if math.random() < 0.2 then
inst.Transform:SetScale(0.75, 0.75, 0.75)
elseif math.random() < 0.2 then
inst.Transform:SetScale(0.9, 0.9, 0.9)
elseif math.random() < 0.2 then
inst.Transform:SetScale(0.95, 0.95, 0.95)
elseif math.random() < 0.2 then
inst.Transform:SetScale(0.8, 0.8, 0.8)
elseif math.random() < 0.2 then
inst.Transform:SetScale(0.85, 0.85, 0.85)
else
inst.Transform:SetScale(1, 1, 1)
end

    inst:AddComponent("pickable")
	inst.components.pickable.quickpick = true
    inst.components.pickable.picksound = "dontstarve/wilson/pickup_reeds"
    inst.components.pickable.onpickedfn = OnPicked
    inst.components.pickable.caninteractwith = false
    inst.components.pickable:SetUp("green_fruit", 1000000)
    inst.components.pickable:Pause()

    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")

    inst:ListenForEvent("animover", OnBloomed)

    inst.persists = false

    return inst
end

return Prefab("apple_berry", fn, assets, prefabs)
