TUNING.MUSHA = TUNING.MUSHA or {}
TUNING.MUSHA_FOODS=
{
--"monstermeat",
--"cookedmonstermeat",
--"monstermeat_dried",
"monsterlasagna",
}
local Value_lasana = GetModConfigData("monsterfood")

local function Monsterfood_veasy(inst)
	local player = GLOBAL.GetPlayer()
	local fooditem = inst.prefab
if tostring(fooditem)=="monsterlasagna" and player:HasTag("musha") then
inst.components.edible.hungervalue=inst.components.edible.hungervalue * 1.75	
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -2
inst.components.edible.healthvalue=inst.components.edible.healthvalue * -1.5
--[[elseif tostring(fooditem)=="monstermeat_dried" and player:HasTag("musha") then
inst.components.edible.hungervalue=inst.components.edible.hungervalue * 1.5	
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -2	
inst.components.edible.healthvalue=inst.components.edible.healthvalue * -1	
elseif tostring(fooditem)=="cookedmonstermeat" and player:HasTag("musha") then
inst.components.edible.hungervalue=inst.components.edible.hungervalue * 1.5	
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -1
inst.components.edible.healthvalue=inst.components.edible.healthvalue * -1	
	else ]]
	end
end
local function Monsterfood_easy(inst)
	local player = GLOBAL.GetPlayer()
	local fooditem = inst.prefab
if tostring(fooditem)=="monsterlasagna" and player:HasTag("musha") then
inst.components.edible.hungervalue=inst.components.edible.hungervalue * 1.5	
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -1.5
inst.components.edible.healthvalue=inst.components.edible.healthvalue * -0.75
--[[elseif tostring(fooditem)=="monstermeat_dried" and player:HasTag("musha") then
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -1.25	
inst.components.edible.healthvalue=inst.components.edible.healthvalue * -.5	
elseif tostring(fooditem)=="cookedmonstermeat" and player:HasTag("musha") then
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -0.5
inst.components.edible.healthvalue=inst.components.edible.healthvalue * 0
	else ]]
	end
end
local function Monsterfood_moderato(inst)
	local player = GLOBAL.GetPlayer()
	local fooditem = inst.prefab
if tostring(fooditem)=="monsterlasagna" and player:HasTag("musha") then
inst.components.edible.hungervalue=inst.components.edible.hungervalue * 1	
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -1.25
inst.components.edible.healthvalue=inst.components.edible.healthvalue * -0.5
--[[elseif tostring(fooditem)=="monstermeat_dried" and player:HasTag("musha") then
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -1	

elseif tostring(fooditem)=="cookedmonstermeat" and player:HasTag("musha") then
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -0
inst.components.edible.healthvalue=inst.components.edible.healthvalue * 2	
	else]] 
	end
end
local function Monsterfood_hard(inst)
	local player = GLOBAL.GetPlayer()
	local fooditem = inst.prefab
if tostring(fooditem)=="monsterlasagna" and player:HasTag("musha") then
inst.components.edible.hungervalue=inst.components.edible.hungervalue * 0.75	
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -1
inst.components.edible.healthvalue=inst.components.edible.healthvalue * -0.25
--[[elseif tostring(fooditem)=="monstermeat_dried" and player:HasTag("musha") then
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -0.5	
elseif tostring(fooditem)=="cookedmonstermeat" and player:HasTag("musha") then
inst.components.edible.healthvalue=inst.components.edible.healthvalue * 2.5	
	else]] 
	end
end
local function Monsterfood_vhard(inst)
	local player = GLOBAL.GetPlayer()
	local fooditem = inst.prefab
if tostring(fooditem)=="monsterlasagna" and player:HasTag("musha") then
inst.components.edible.hungervalue=inst.components.edible.hungervalue * 0.5	
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -0.5
--[[elseif tostring(fooditem)=="monstermeat_dried" and player:HasTag("musha") then
inst.components.edible.sanityvalue=inst.components.edible.sanityvalue * -0.25	
inst.components.edible.healthvalue=inst.components.edible.healthvalue * 1.5
elseif tostring(fooditem)=="cookedmonstermeat" and player:HasTag("musha") then
inst.components.edible.healthvalue=inst.components.edible.healthvalue * 2.5	
	else ]]
	end
end

if Value_lasana == "vhigh" then
for k, fooditem in pairs(TUNING.MUSHA_FOODS) do
    AddPrefabPostInit(fooditem, Monsterfood_veasy)
	end end
if Value_lasana == "high" then
for k, fooditem in pairs(TUNING.MUSHA_FOODS) do
    AddPrefabPostInit(fooditem, Monsterfood_easy)
	end end
if Value_lasana == "mid" then
for k, fooditem in pairs(TUNING.MUSHA_FOODS) do
    AddPrefabPostInit(fooditem, Monsterfood_moderato)
	end end
if Value_lasana == "low" then
for k, fooditem in pairs(TUNING.MUSHA_FOODS) do
    AddPrefabPostInit(fooditem, Monsterfood_hard)
	end end