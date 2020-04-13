local assets = 
{
	Asset("ANIM", "anim/musha_spin_fx.zip")
}
local function onupdate(inst, dt)
    inst.Light:SetIntensity(inst.i)
    inst.i = inst.i - dt * 2
    if inst.i <= 0 then
        inst:Remove()
    end
end
local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.AnimState:SetBank("mossling_spin_fx")
	inst.AnimState:SetBuild("musha_spin_fx")
	inst.AnimState:PlayAnimation("spin_loop")
	
    inst.Light:Enable(true)
    inst.Light:SetRadius(2)
    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.8)
    inst.Light:SetColour(150/255,200/255,255/255)

	local dt = 1/150
    inst.i = .9
    inst:DoPeriodicTask(dt, onupdate, nil, dt)
	
	--[[inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/mossling/spin_electric")
	inst:DoTaskInTime(24*FRAMES, function(inst)
		inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/mossling/spin_electric")
		inst:DoTaskInTime(24*FRAMES, function(inst)
			inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/mossling/spin_electric")
		end)
	end)]]
	if inst.DLC then
    inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/mossling/spin_electric")
    inst:DoTaskInTime(24*FRAMES, function(inst)
        inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/mossling/spin_electric")
        inst:DoTaskInTime(24*FRAMES, function(inst)
            inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/mossling/spin_electric")
        end)
    end)
	elseif not inst.DLC then
	inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/spark")
    inst:DoTaskInTime(24*FRAMES, function(inst)
        inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/spark")
        inst:DoTaskInTime(24*FRAMES, function(inst)
            inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/spark")
        end)
    end)
end

	inst:AddTag("fx")

	inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
	inst.persists = false

	inst:ListenForEvent("animover", function() inst:Remove() end)

	return inst
end

return Prefab("musha_spin_fx", fn, assets)
