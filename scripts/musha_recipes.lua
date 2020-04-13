local require = GLOBAL.require
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local Cgems = GetModConfigData("craftgems")
local portable_recipe = GetModConfigData("portablerecipe")

local CAPY_2 = 0
 if GLOBAL.IsDLCInstalled(GLOBAL.CAPY_DLC) then  
		CAPY_2 = 1
end

GLOBAL.STRINGS.TABS.MUSHA = "Musha"
GLOBAL.RECIPETABS['MUSHA'] = {str = "MUSHA",      		sort = 777, icon = "mushatab.tex", icon_atlas = "images/mushatab.xml"}

function mushaPostInit(musha)
--matarial

local bushhat = Ingredient( "bushhat", 1)
local ruinshat = Ingredient( "ruinshat", 1)
local armorruins = Ingredient( "armorruins", 1)
local amulet = Ingredient( "amulet", 1)
local butterfly10 = Ingredient( "butterfly", 10)
local butterfly8 = Ingredient( "butterfly", 8)
local butterfly6 = Ingredient( "butterfly", 6)
local butterfly4 = Ingredient( "butterfly", 4)
local bee5 = Ingredient( "bee", 5)
local bee4 = Ingredient( "bee", 4)
local papyrus2 = Ingredient( "papyrus", 2)
local beefaloh = Ingredient( "beefalohat", 1)
local walrustusk = Ingredient( "walrus_tusk", 2)
local eyes = Ingredient( "deerclops_eyeball", 2)
local eye = Ingredient( "deerclops_eyeball", 1)

local princess = Ingredient( "hat_mprincess", 1)
princess.atlas = "images/inventoryimages/hat_mprincess.xml"

local armoraa = Ingredient( "armor_mushaa", 1)
armoraa.atlas = "images/inventoryimages/armor_mushaa.xml"

local glowdusts = Ingredient( "glowdust", 1)
glowdusts.atlas = "images/inventoryimages/glowdust.xml"
local dust2 = Ingredient( "glowdust", 2)
dust2.atlas = "images/inventoryimages/glowdust.xml"
local dust3 = Ingredient( "glowdust", 3)
dust3.atlas = "images/inventoryimages/glowdust.xml"
local dust4 = Ingredient( "glowdust", 4)
dust4.atlas = "images/inventoryimages/glowdust.xml"
local dust5 = Ingredient( "glowdust", 5)
dust5.atlas = "images/inventoryimages/glowdust.xml"
local dust6 = Ingredient( "glowdust", 6)
dust6.atlas = "images/inventoryimages/glowdust.xml"
local dust10 = Ingredient( "glowdust", 10)
dust10.atlas = "images/inventoryimages/glowdust.xml"
local dust15 = Ingredient( "glowdust", 15)
dust15.atlas = "images/inventoryimages/glowdust.xml"
local dust20 = Ingredient( "glowdust", 20)
dust20.atlas = "images/inventoryimages/glowdust.xml"

local broken = Ingredient( "broken_frosthammer", 1)
broken.atlas = "images/inventoryimages/broken_frosthammer.xml"

local frosta = Ingredient( "frosthammer", 1)
frosta.atlas = "images/inventoryimages/frosthammer.xml"

local meggs = Ingredient( "musha_egg", 1)
meggs.atlas = "images/inventoryimages/musha_egg.xml"
--egg
local phoenix_egg = Ingredient( "musha_egg", 1)
phoenix_egg.atlas = "images/inventoryimages/musha_egg.xml"
local phoenix_eggs1 = Ingredient( "musha_eggs1", 1)
phoenix_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local phoenix_eggs2 = Ingredient( "musha_eggs2", 1)
phoenix_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local phoenix_eggs3 = Ingredient( "musha_eggs3", 1)
phoenix_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local phoenix_egg1 = Ingredient( "musha_egg1", 1)
phoenix_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local phoenix_egg2 = Ingredient( "musha_egg2", 1)
phoenix_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local phoenix_egg3 = Ingredient( "musha_egg3", 1)
phoenix_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local phoenix_egg8 = Ingredient( "musha_egg8", 1)
phoenix_egg8.atlas = "images/inventoryimages/musha_egg8.xml"
--
local bladeb = Ingredient( "mushasword_base", 1)
bladeb.atlas = "images/inventoryimages/mushasword_base.xml"
local blade1 = Ingredient( "mushasword", 1)
blade1.atlas = "images/inventoryimages/mushasword.xml"
local blade2 = Ingredient( "mushasword2", 1)
blade2.atlas = "images/inventoryimages/mushasword2.xml"
local blade_f = Ingredient( "mushasword_frost", 1)
blade_f.atlas = "images/inventoryimages/mushasword_frost.xml"

local crystal = Ingredient( "cristal", 1)
crystal.atlas = "images/inventoryimages/cristal.xml"
local crystal2 = Ingredient( "cristal", 2)
crystal2.atlas = "images/inventoryimages/cristal.xml"
local crystal6 = Ingredient( "cristal", 6)
crystal6.atlas = "images/inventoryimages/cristal.xml"
local crystal10 = Ingredient( "cristal", 10)
crystal10.atlas = "images/inventoryimages/cristal.xml"

local blade_fire = Ingredient( "mushasword_fire", 1)
blade_fire.atlas = "images/inventoryimages/mushasword_fire.xml"
local blade_frost = Ingredient( "mushasword_frost", 1)
blade_frost.atlas = "images/inventoryimages/mushasword_frost.xml"

local broken_arrow2 = Ingredient( "arrowm_broken", 2)
broken_arrow2.atlas = "images/inventoryimages/arrowm_broken.xml"

local player = GLOBAL.GetPlayer()
if not GLOBAL.SaveGameIndex:IsModeShipwrecked() and not GLOBAL.SaveGameIndex:IsModePorkland() then
if player:HasTag("Recipe_normal") then

--arrow
--local arrowm = GLOBAL.Recipe( "arrowm", { Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
--arrowm.atlas = "images/inventoryimages/arrowm.xml"
local dummy_arrow0 = GLOBAL.Recipe( "dummy_arrow0",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow0.atlas = "images/inventoryimages/dummy_arrow0.xml"
local dummy_arrow1 = GLOBAL.Recipe( "dummy_arrow1",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow1.atlas = "images/inventoryimages/dummy_arrow1.xml"
local dummy_arrow2 = GLOBAL.Recipe( "dummy_arrow2",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow2.atlas = "images/inventoryimages/dummy_arrow2.xml"
local dummy_arrow3 = GLOBAL.Recipe( "dummy_arrow3",{ broken_arrow2, Ingredient("twigs", 1)}, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow3.atlas = "images/inventoryimages/dummy_arrow3.xml"

--grass hut
if player:HasTag("DLC") and player.components.poisonable then
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 5), Ingredient("cutgrass", 6), Ingredient("rope", 3), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 5), Ingredient("cutgrass", 6), Ingredient("rope", 3), }, RECIPETABS.MUSHA, {SCIENCE=1}, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
elseif not player:HasTag("DLC") then
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 5), Ingredient("cutgrass", 6), Ingredient("rope", 3), }, RECIPETABS.MUSHA, {SCIENCE=1}, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
end
--dall
if player:HasTag("DLC") and player.components.poisonable then
local moontree = GLOBAL.Recipe("moontree", {  glowdust10,GLOBAL.Ingredient("livinglog", 25), Ingredient("purplegem", 12), Ingredient("orangegem", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local moontree = GLOBAL.Recipe("moontree", {  glowdust10,GLOBAL.Ingredient("livinglog", 25), Ingredient("purplegem", 12), Ingredient("orangegem", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
elseif not player:HasTag("DLC") then
local moontree = GLOBAL.Recipe("moontree", {  glowdust10,GLOBAL.Ingredient("livinglog", 15), Ingredient("purplegem", 8), Ingredient("orangegem", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
end
--oven
if player:HasTag("DLC") and player.components.poisonable then
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("rocks", 20), Ingredient("froglegs", 8), Ingredient("livinglog", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("rocks", 20), Ingredient("froglegs", 8), Ingredient("livinglog", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
elseif not player:HasTag("DLC") then
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("rocks", 20), Ingredient("froglegs", 8), Ingredient("livinglog", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
end
--forge
if player:HasTag("DLC") and player.components.poisonable then
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust10, Ingredient("gears", 8), Ingredient("transistor", 8), Ingredient("livinglog", 12), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust10, Ingredient("gears", 8), Ingredient("transistor", 8), Ingredient("livinglog", 12), }, RECIPETABS.MUSHA, {SCIENCE=2}, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
elseif not player:HasTag("DLC") then
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust10, Ingredient("gears", 8), Ingredient("transistor", 8), Ingredient("livinglog", 12), }, RECIPETABS.MUSHA, {SCIENCE=2}, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
end
--tent
if player:HasTag("DLC") and player.components.poisonable then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 20), Ingredient("papyrus", 8), Ingredient("twigs", 12), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 20), Ingredient("papyrus", 8), Ingredient("twigs", 12), }, RECIPETABS.MUSHA, {SCIENCE=1}, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
elseif not player:HasTag("DLC") then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 20), Ingredient("papyrus", 8), Ingredient("twigs", 12), }, RECIPETABS.MUSHA, {SCIENCE=1}, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
end

--dust
 local glowdust = GLOBAL.Recipe( "glowdust", {Ingredient("wormlight", 1), Ingredient("ash", 5) }, RECIPETABS.MUSHA, {SCIENCE=0})
	glowdust.atlas = "images/inventoryimages/glowdust.xml"
--cristal
 local cristal = GLOBAL.Recipe( "cristal", {dust10}, RECIPETABS.MUSHA, {SCIENCE=2})
	cristal.atlas = "images/inventoryimages/cristal.xml"
--flute
 local musha_flute = GLOBAL.Recipe( "musha_flute", {dust6, Ingredient("horn", 1), Ingredient("spidergland", 40)},  RECIPETABS.MUSHA, {SCIENCE=2})
	musha_flute.atlas = "images/inventoryimages/musha_flute.xml"
--phoenix weapon
 local mushasword_base = GLOBAL.Recipe( "mushasword_base", { Ingredient("goldnugget", 2), Ingredient("flint", 3)}, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword_base.atlas = "images/inventoryimages/mushasword_base.xml"
--[[ local mushasword = GLOBAL.Recipe( "mushasword", { bladeb, glowdusts, Ingredient("feather_robin", 8), Ingredient("goldnugget", 20) }, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword.atlas = "images/inventoryimages/mushasword.xml"
 local mushasword2 = GLOBAL.Recipe( "mushasword2", { blade1,  dust6, Ingredient("redgem", 10), Ingredient("goldnugget", 60) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword2.atlas = "images/inventoryimages/mushasword2.xml"
 local mushasword3 = GLOBAL.Recipe( "mushasword3", { blade2,  dust10, Ingredient("redgem", 40), Ingredient("goldnugget", 80) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword3.atlas = "images/inventoryimages/mushasword3.xml"]]

--fire
local mushasword_fire = GLOBAL.Recipe( "mushasword_fire", { bladeb, glowdusts, Ingredient("redgem", 4) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_fire.atlas = "images/inventoryimages/mushasword_fire.xml"
--frost 
 local mushasword_frost = GLOBAL.Recipe( "mushasword_frost", { bladeb, glowdusts, Ingredient("bluegem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_frost.atlas = "images/inventoryimages/mushasword_frost.xml"
--blade-bow
local bowm = GLOBAL.Recipe( "bowm", { blade_fire, Ingredient("spidergland", 12), dust3 }, RECIPETABS.MUSHA, {SCIENCE=1})
bowm.atlas = "images/inventoryimages/bowm.xml"
--spear
local phoenixspear = GLOBAL.Recipe( "phoenixspear", { blade_fire, blade_frost, dust3, Ingredient("goldnugget", 30) }, RECIPETABS.MUSHA, {SCIENCE=1})
phoenixspear.atlas = "images/inventoryimages/phoenixspear.xml"
--hammer
 local frosthammer = GLOBAL.Recipe( "frosthammer", { eyes, Ingredient("livinglog", 15), Ingredient("bluegem", 30), broken }, RECIPETABS.MUSHA, {SCIENCE=1})
frosthammer.atlas = "images/inventoryimages/frosthammer.xml"
--axe
if player:HasTag("DLC") then
 local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("thulecite", 50), Ingredient("dragon_scales", 2), Ingredient("greengem", 10), Ingredient("livinglog", 8) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"
else
local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("thulecite", 50), Ingredient("purplegem", 20), Ingredient("greengem", 10), Ingredient("livinglog", 8) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"
end

--armor
local pirateback = GLOBAL.Recipe( "pirateback", { broken, armoraa, Ingredient("goldnugget", 60), Ingredient("yellowgem", 5) }, RECIPETABS.MUSHA, {SCIENCE=2})
pirateback.atlas = "images/inventoryimages/pirateback.xml"
 local broken_frosthammer = GLOBAL.Recipe( "broken_frosthammer", { butterfly4, Ingredient("gears", 4), Ingredient("bluegem", 4) }, RECIPETABS.MUSHA, {SCIENCE=1})
broken_frosthammer.atlas = "images/inventoryimages/broken_frosthammer.xml"
 local armor_mushaa = GLOBAL.Recipe( "armor_mushaa", {amulet, Ingredient("goldnugget", 12), Ingredient("thulecite", 3) }, RECIPETABS.MUSHA, {SCIENCE=0})
	armor_mushaa.atlas = "images/inventoryimages/armor_mushaa.xml"
 local frostback = GLOBAL.Recipe( "frostback", { broken,  butterfly8, Ingredient("bluegem", 6) }, RECIPETABS.MUSHA, {SCIENCE=2})
frostback.atlas = "images/inventoryimages/frostback.xml"
 local armor_mushab = GLOBAL.Recipe( "armor_mushab", {armoraa, eyes, Ingredient("greengem", 8), Ingredient("orangegem", 8), }, RECIPETABS.MUSHA, {SCIENCE=2})
	armor_mushab.atlas = "images/inventoryimages/armor_mushab.xml"
--hat
local hat_mwildcat = GLOBAL.Recipe( "hat_mwildcat", {  Ingredient("gears", 4), Ingredient("boneshard", 16), Ingredient("bluegem", 4) }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mwildcat.atlas = "images/inventoryimages/hat_mwildcat.xml"
 local hat_mbunny = GLOBAL.Recipe( "hat_mbunny", {walrustusk, Ingredient("dug_grass", 8), Ingredient("manrabbit_tail", 6), Ingredient("purplegem", 2)  }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mbunny.atlas = "images/inventoryimages/hat_mbunny.xml"
 local hat_mprincess = GLOBAL.Recipe( "hat_mprincess", {amulet, Ingredient("goldnugget", 12), Ingredient("purplegem", 2) },  RECIPETABS.MUSHA, {SCIENCE=0})
	hat_mprincess.atlas = "images/inventoryimages/hat_mprincess.xml"
 local hat_mcrown = GLOBAL.Recipe( "hat_mcrown", {princess, Ingredient("thulecite", 10), Ingredient("purplegem", 6) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mcrown.atlas = "images/inventoryimages/hat_mcrown.xml"
	
if player:HasTag("DLC") then
local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {Ingredient("dragon_scales", 2), Ingredient("panflute", 1), Ingredient("goldnugget", 60), Ingredient("thulecite", 80) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
else
local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {eyes, Ingredient("panflute", 1), Ingredient("goldnugget", 60), Ingredient("thulecite", 80) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
end	

--egg
--arong egg
 local musha_egg_arong = GLOBAL.Recipe( "musha_egg_arong", { dust5, GLOBAL.Ingredient("amulet", 1), GLOBAL.Ingredient("beefalowool", 40), GLOBAL.Ingredient("purplegem", 6) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg_arong.atlas = "images/inventoryimages/musha_egg_arong.xml"
--phoenix_egg
 local musha_egg = GLOBAL.Recipe( "musha_egg", { dust10, Ingredient("redgem", 50), Ingredient("bluegem", 30), Ingredient("greengem", 20) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg.atlas = "images/inventoryimages/musha_egg.xml"

local musha_eggs1 = GLOBAL.Recipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 10)}, RECIPETABS.MUSHA, {SCIENCE=0})  
musha_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local musha_eggs2 = GLOBAL.Recipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 15)}, RECIPETABS.MUSHA, {SCIENCE=1})  
musha_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local musha_eggs3 = GLOBAL.Recipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 30)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local musha_egg1 = GLOBAL.Recipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 45), GLOBAL.Ingredient("purplegem", 1)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local musha_egg2 = GLOBAL.Recipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 60), GLOBAL.Ingredient("purplegem", 3)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local musha_egg3 = GLOBAL.Recipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 90), GLOBAL.Ingredient("purplegem", 5)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local musha_egg8 = GLOBAL.Recipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 150), GLOBAL.Ingredient("purplegem", 8)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg8.atlas = "images/inventoryimages/musha_egg8.xml"
------------------------------------------------------------------------------------------------------------
end
------------------------------------------------------------------------------------------------------------
if player:HasTag("Recipe_easy") then
--arrow
--local arrowm = GLOBAL.Recipe( "arrowm", { Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
--arrowm.atlas = "images/inventoryimages/arrowm.xml"
local dummy_arrow0 = GLOBAL.Recipe( "dummy_arrow0",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow0.atlas = "images/inventoryimages/dummy_arrow0.xml"
local dummy_arrow1 = GLOBAL.Recipe( "dummy_arrow1",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow1.atlas = "images/inventoryimages/dummy_arrow1.xml"
local dummy_arrow2 = GLOBAL.Recipe( "dummy_arrow2",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow2.atlas = "images/inventoryimages/dummy_arrow2.xml"
local dummy_arrow3 = GLOBAL.Recipe( "dummy_arrow3",{ broken_arrow2, Ingredient("twigs", 1)}, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow3.atlas = "images/inventoryimages/dummy_arrow3.xml"

--grass hut
if player:HasTag("DLC") and player.components.poisonable then
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 3), Ingredient("cutgrass", 3), Ingredient("rope", 2), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 3), Ingredient("cutgrass", 3), Ingredient("rope", 2), }, RECIPETABS.MUSHA, {SCIENCE=1}, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
elseif not player:HasTag("DLC") then
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 3), Ingredient("cutgrass", 3), Ingredient("rope", 2), }, RECIPETABS.MUSHA, {SCIENCE=1}, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
end
--dall
if player:HasTag("DLC") and player.components.poisonable then
local moontree = GLOBAL.Recipe("moontree", {  glowdust10,GLOBAL.Ingredient("livinglog", 15), Ingredient("purplegem", 6), Ingredient("orangegem", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local moontree = GLOBAL.Recipe("moontree", {  glowdust10,GLOBAL.Ingredient("livinglog", 15), Ingredient("purplegem", 6), Ingredient("orangegem", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
elseif not player:HasTag("DLC") then
local moontree = GLOBAL.Recipe("moontree", {  glowdust10,GLOBAL.Ingredient("livinglog", 15), Ingredient("purplegem", 4), }, RECIPETABS.MUSHA, {SCIENCE=2}, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
end
--oven
if player:HasTag("DLC") and player.components.poisonable then
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("rocks", 12), Ingredient("froglegs", 4), Ingredient("livinglog", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("rocks", 12), Ingredient("froglegs", 4), Ingredient("livinglog", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
elseif not player:HasTag("DLC") then
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("rocks", 12), Ingredient("froglegs", 4), Ingredient("livinglog", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
end
--forge
if player:HasTag("DLC") and player.components.poisonable then
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust10, Ingredient("gears", 4), Ingredient("transistor", 4), Ingredient("livinglog", 6), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust10, Ingredient("gears", 4), Ingredient("transistor", 4), Ingredient("livinglog", 6), }, RECIPETABS.MUSHA, {SCIENCE=2}, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
elseif not player:HasTag("DLC") then
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust10, Ingredient("gears", 4), Ingredient("transistor", 4), Ingredient("livinglog", 6), }, RECIPETABS.MUSHA, {SCIENCE=2}, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
end
--tent
if player:HasTag("DLC") and player.components.poisonable then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 10), Ingredient("papyrus", 5), Ingredient("twigs", 6), }, RECIPETABS.MUSHA, nil, {SCIENCE=1}, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 10), Ingredient("papyrus", 5), Ingredient("twigs", 6), }, RECIPETABS.MUSHA, {SCIENCE=1}, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
elseif not player:HasTag("DLC") then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 10), Ingredient("papyrus", 5), Ingredient("twigs", 6), }, RECIPETABS.MUSHA, {SCIENCE=1}, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
end
--tent
if player:HasTag("DLC") and player.components.poisonable then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 10), Ingredient("papyrus", 5), Ingredient("twigs", 6), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 10), Ingredient("papyrus", 5), Ingredient("twigs", 6), }, RECIPETABS.MUSHA, {SCIENCE=1}, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
elseif not player:HasTag("DLC") then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 10), Ingredient("papyrus", 5), Ingredient("twigs", 6), }, RECIPETABS.MUSHA, {SCIENCE=1}, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
end

--dust
 local glowdust = GLOBAL.Recipe( "glowdust", {Ingredient("wormlight", 1), Ingredient("ash", 2) }, RECIPETABS.MUSHA, {SCIENCE=0})
	glowdust.atlas = "images/inventoryimages/glowdust.xml"
--cristal
 local cristal = GLOBAL.Recipe( "cristal", {dust6}, RECIPETABS.MUSHA, {SCIENCE=2})
	cristal.atlas = "images/inventoryimages/cristal.xml"
--flute
 local musha_flute = GLOBAL.Recipe( "musha_flute", {dust3, Ingredient("horn", 1), Ingredient("spidergland", 20)},  RECIPETABS.MUSHA, {SCIENCE=2})
	musha_flute.atlas = "images/inventoryimages/musha_flute.xml"
--phoenix weapon
 local mushasword_base = GLOBAL.Recipe( "mushasword_base", { Ingredient("goldnugget", 1), Ingredient("flint", 2)}, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword_base.atlas = "images/inventoryimages/mushasword_base.xml"
--[[ local mushasword = GLOBAL.Recipe( "mushasword", { bladeb, glowdusts, Ingredient("feather_robin", 1), Ingredient("goldnugget", 5) }, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword.atlas = "images/inventoryimages/mushasword.xml"
 local mushasword2 = GLOBAL.Recipe( "mushasword2", { blade1,  dust3, Ingredient("redgem", 3), Ingredient("goldnugget", 10) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword2.atlas = "images/inventoryimages/mushasword2.xml"
 local mushasword3 = GLOBAL.Recipe( "mushasword3", { blade2,  dust5, Ingredient("redgem", 15), Ingredient("goldnugget", 40) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword3.atlas = "images/inventoryimages/mushasword3.xml"]]
--fire
local mushasword_fire = GLOBAL.Recipe( "mushasword_fire", { bladeb, glowdusts, Ingredient("redgem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_fire.atlas = "images/inventoryimages/mushasword_fire.xml"
--frost 
 local mushasword_frost = GLOBAL.Recipe( "mushasword_frost", { bladeb, glowdusts, Ingredient("bluegem", 3) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_frost.atlas = "images/inventoryimages/mushasword_frost.xml"
--blade-bow
local bowm = GLOBAL.Recipe( "bowm", { blade_fire, Ingredient("spidergland", 6), dust2 }, RECIPETABS.MUSHA, {SCIENCE=1})
bowm.atlas = "images/inventoryimages/bowm.xml"
--spear
local phoenixspear = GLOBAL.Recipe( "phoenixspear", { blade_fire, blade_frost, dust2, Ingredient("goldnugget", 20) }, RECIPETABS.MUSHA, {SCIENCE=1})
phoenixspear.atlas = "images/inventoryimages/phoenixspear.xml"
--hammer
 local frosthammer = GLOBAL.Recipe( "frosthammer", { eye, Ingredient("livinglog", 8), Ingredient("bluegem", 15), broken}, RECIPETABS.MUSHA, {SCIENCE=1})
frosthammer.atlas = "images/inventoryimages/frosthammer.xml"
--axe
if player:HasTag("DLC") then
 local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("thulecite", 25), Ingredient("dragon_scales", 1), Ingredient("greengem", 5), Ingredient("livinglog", 4) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"
else
local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("thulecite", 25), Ingredient("purplegem", 10), Ingredient("greengem", 5), Ingredient("livinglog", 4) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"
end
--armor
local pirateback = GLOBAL.Recipe( "pirateback", { broken,armoraa, Ingredient("goldnugget", 30), Ingredient("yellowgem", 3)  }, RECIPETABS.MUSHA, {SCIENCE=2})
pirateback.atlas = "images/inventoryimages/pirateback.xml"
 local broken_frosthammer = GLOBAL.Recipe( "broken_frosthammer", { butterfly4, Ingredient("gears", 2), Ingredient("bluegem", 3) }, RECIPETABS.MUSHA, {SCIENCE=1})
broken_frosthammer.atlas = "images/inventoryimages/broken_frosthammer.xml"
 local armor_mushaa = GLOBAL.Recipe( "armor_mushaa", {amulet, Ingredient("goldnugget", 8), Ingredient("thulecite", 2) }, RECIPETABS.MUSHA, {SCIENCE=0})
	armor_mushaa.atlas = "images/inventoryimages/armor_mushaa.xml"
 local frostback = GLOBAL.Recipe( "frostback", { broken,  butterfly8, Ingredient("bluegem", 3) }, RECIPETABS.MUSHA, {SCIENCE=2})
frostback.atlas = "images/inventoryimages/frostback.xml"
 local armor_mushab = GLOBAL.Recipe( "armor_mushab", {armoraa, eye, Ingredient("greengem", 4), Ingredient("orangegem", 4)}, RECIPETABS.MUSHA, {SCIENCE=2})
	armor_mushab.atlas = "images/inventoryimages/armor_mushab.xml"
--hat
local hat_mwildcat = GLOBAL.Recipe( "hat_mwildcat", {  Ingredient("gears", 2), Ingredient("boneshard", 8), Ingredient("bluegem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mwildcat.atlas = "images/inventoryimages/hat_mwildcat.xml"
 local hat_mbunny = GLOBAL.Recipe( "hat_mbunny", {walrustusk, Ingredient("dug_grass", 4), Ingredient("manrabbit_tail", 3), Ingredient("bluegem", 2)  }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mbunny.atlas = "images/inventoryimages/hat_mbunny.xml"
 local hat_mprincess = GLOBAL.Recipe( "hat_mprincess", {amulet, Ingredient("goldnugget", 6), Ingredient("purplegem", 1) },  RECIPETABS.MUSHA, {SCIENCE=0})
	hat_mprincess.atlas = "images/inventoryimages/hat_mprincess.xml"
 local hat_mcrown = GLOBAL.Recipe( "hat_mcrown", {princess, Ingredient("thulecite", 5), Ingredient("purplegem", 3) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mcrown.atlas = "images/inventoryimages/hat_mcrown.xml"
if player:HasTag("DLC") then
local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {Ingredient("dragon_scales", 1), Ingredient("panflute", 1), Ingredient("goldnugget", 30), Ingredient("thulecite", 40) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
else
local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {eye, Ingredient("panflute", 1), Ingredient("goldnugget", 30), Ingredient("thulecite", 40) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
end	
--egg
--arong egg
  local musha_egg_arong = GLOBAL.Recipe( "musha_egg_arong", { dust5, GLOBAL.Ingredient("amulet", 1), GLOBAL.Ingredient("beefalowool", 20), GLOBAL.Ingredient("purplegem", 3) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg_arong.atlas = "images/inventoryimages/musha_egg_arong.xml"
--phoenix_egg
 local musha_egg = GLOBAL.Recipe( "musha_egg", { dust5, Ingredient("redgem", 25), Ingredient("bluegem", 15), Ingredient("greengem", 10) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg.atlas = "images/inventoryimages/musha_egg.xml"
local musha_eggs1 = GLOBAL.Recipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 5)}, RECIPETABS.MUSHA, {SCIENCE=0})  
musha_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local musha_eggs2 = GLOBAL.Recipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 7)}, RECIPETABS.MUSHA, {SCIENCE=1})  
musha_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local musha_eggs3 = GLOBAL.Recipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 15)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local musha_egg1 = GLOBAL.Recipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 22), GLOBAL.Ingredient("purplegem", 1)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local musha_egg2 = GLOBAL.Recipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 30), GLOBAL.Ingredient("purplegem", 3)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local musha_egg3 = GLOBAL.Recipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 45), GLOBAL.Ingredient("purplegem", 5)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local musha_egg8 = GLOBAL.Recipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 75), GLOBAL.Ingredient("purplegem", 8)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg8.atlas = "images/inventoryimages/musha_egg8.xml"
------------------------------------------------------------------------------------------------------------
end
------------------------------------------------------------------------------------------------------------
if player:HasTag("Recipe_veasy") then
--arrow
--local arrowm = GLOBAL.Recipe( "arrowm", { Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
--arrowm.atlas = "images/inventoryimages/arrowm.xml"
local dummy_arrow0 = GLOBAL.Recipe( "dummy_arrow0",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow0.atlas = "images/inventoryimages/dummy_arrow0.xml"
local dummy_arrow1 = GLOBAL.Recipe( "dummy_arrow1",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow1.atlas = "images/inventoryimages/dummy_arrow1.xml"
local dummy_arrow2 = GLOBAL.Recipe( "dummy_arrow2",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow2.atlas = "images/inventoryimages/dummy_arrow2.xml"
local dummy_arrow3 = GLOBAL.Recipe( "dummy_arrow3",{ broken_arrow2}, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow3.atlas = "images/inventoryimages/dummy_arrow3.xml"

--grass hut
if player:HasTag("DLC") and player.components.poisonable then
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 2), Ingredient("cutgrass", 2), Ingredient("rope", 1), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 2), Ingredient("cutgrass", 2), Ingredient("rope", 1), }, RECIPETABS.MUSHA, {SCIENCE=1}, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
elseif not player:HasTag("DLC") then
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 2), Ingredient("cutgrass", 2), Ingredient("rope", 1), }, RECIPETABS.MUSHA, {SCIENCE=1}, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
end
--dall
if player:HasTag("DLC") and player.components.poisonable then
local moontree = GLOBAL.Recipe("moontree", {  dust6,GLOBAL.Ingredient("livinglog", 6), Ingredient("purplegem", 3), Ingredient("bluegem", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local moontree = GLOBAL.Recipe("moontree", {  dust6,GLOBAL.Ingredient("livinglog", 6), Ingredient("purplegem", 3), Ingredient("bluegem", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
elseif not player:HasTag("DLC") then
local moontree = GLOBAL.Recipe("moontree", {  dust6,GLOBAL.Ingredient("livinglog", 6), Ingredient("purplegem", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
end
--oven
if player:HasTag("DLC") and player.components.poisonable then
local musha_oven = GLOBAL.Recipe("musha_oven", { dust6, Ingredient("rocks", 5), Ingredient("froglegs", 2), Ingredient("livinglog", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local musha_oven = GLOBAL.Recipe("musha_oven", { dust6, Ingredient("rocks", 5), Ingredient("froglegs", 2), Ingredient("livinglog", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
elseif not player:HasTag("DLC") then
local musha_oven = GLOBAL.Recipe("musha_oven", { dust6, Ingredient("rocks", 5), Ingredient("froglegs", 2), Ingredient("livinglog", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
end
--forge
if player:HasTag("DLC") and player.components.poisonable then
local forge_musha = GLOBAL.Recipe("forge_musha", { dust6, Ingredient("gears", 2), Ingredient("transistor", 2), Ingredient("livinglog", 3), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local forge_musha = GLOBAL.Recipe("forge_musha", { dust6, Ingredient("gears", 2), Ingredient("transistor", 2), Ingredient("livinglog", 3), }, RECIPETABS.MUSHA, {SCIENCE=2}, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
elseif not player:HasTag("DLC") then
local forge_musha = GLOBAL.Recipe("forge_musha", { dust6, Ingredient("gears", 2), Ingredient("transistor", 2), Ingredient("livinglog", 3), }, RECIPETABS.MUSHA, {SCIENCE=2}, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
end
--tent
if player:HasTag("DLC") and player.components.poisonable then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 5), Ingredient("papyrus", 2), Ingredient("twigs", 3), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
elseif player:HasTag("DLC") and not player.components.poisonable then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 5), Ingredient("papyrus", 2), Ingredient("twigs", 3), }, RECIPETABS.MUSHA, {SCIENCE=1}, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
elseif not player:HasTag("DLC") then
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lightbulb", 5), Ingredient("papyrus", 2), Ingredient("twigs", 3), }, RECIPETABS.MUSHA, {SCIENCE=1}, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
end


--dust
 local glowdust = GLOBAL.Recipe( "glowdust", {Ingredient("wormlight", 1) }, RECIPETABS.MUSHA, {SCIENCE=0})
	glowdust.atlas = "images/inventoryimages/glowdust.xml"
--cristal
 local cristal = GLOBAL.Recipe( "cristal", {dust4}, RECIPETABS.MUSHA, {SCIENCE=2})
	cristal.atlas = "images/inventoryimages/cristal.xml"
--flute
 local musha_flute = GLOBAL.Recipe( "musha_flute", {dust2, Ingredient("horn", 1), Ingredient("spidergland", 10)},  RECIPETABS.MUSHA, {SCIENCE=2})
	musha_flute.atlas = "images/inventoryimages/musha_flute.xml"
--phoenix weapon
 local mushasword_base = GLOBAL.Recipe( "mushasword_base", { Ingredient("flint", 1)}, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword_base.atlas = "images/inventoryimages/mushasword_base.xml"

--[[ local mushasword = GLOBAL.Recipe( "mushasword", { bladeb, glowdusts, Ingredient("feather_robin", 1), Ingredient("goldnugget", 2) }, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword.atlas = "images/inventoryimages/mushasword.xml"
 local mushasword2 = GLOBAL.Recipe( "mushasword2", { blade1,  dust2, Ingredient("redgem", 1), Ingredient("goldnugget", 5) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword2.atlas = "images/inventoryimages/mushasword2.xml"
 local mushasword3 = GLOBAL.Recipe( "mushasword3", { blade2,  dust2, Ingredient("redgem", 7), Ingredient("goldnugget", 20) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword3.atlas = "images/inventoryimages/mushasword3.xml"]]
--fire
local mushasword_fire = GLOBAL.Recipe( "mushasword_fire", { bladeb, glowdusts, Ingredient("redgem", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_fire.atlas = "images/inventoryimages/mushasword_fire.xml"
--frost 
 local mushasword_frost = GLOBAL.Recipe( "mushasword_frost", { bladeb, glowdusts, Ingredient("bluegem", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_frost.atlas = "images/inventoryimages/mushasword_frost.xml"
--blade-bow
local bowm = GLOBAL.Recipe( "bowm", { blade_fire, Ingredient("spidergland", 3), glowdusts }, RECIPETABS.MUSHA, {SCIENCE=1})
bowm.atlas = "images/inventoryimages/bowm.xml"
--spear
local phoenixspear = GLOBAL.Recipe( "phoenixspear", { blade_fire, blade_frost, glowdusts, Ingredient("goldnugget", 15) }, RECIPETABS.MUSHA, {SCIENCE=1})
phoenixspear.atlas = "images/inventoryimages/phoenixspear.xml"
--hammer
 local frosthammer = GLOBAL.Recipe( "frosthammer", { eye, Ingredient("livinglog", 4), Ingredient("bluegem", 7), broken}, RECIPETABS.MUSHA, {SCIENCE=1})
frosthammer.atlas = "images/inventoryimages/frosthammer.xml"
--axe
if player:HasTag("DLC") then
 local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("thulecite", 12), Ingredient("dragon_scales", 1), Ingredient("greengem", 1), Ingredient("livinglog", 2) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"
else
local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("thulecite", 12), Ingredient("purplegem", 5), Ingredient("greengem", 2), Ingredient("livinglog", 2) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"
end

--armor
local pirateback = GLOBAL.Recipe( "pirateback", { broken,armoraa, Ingredient("goldnugget", 15), Ingredient("yellowgem", 1) }, RECIPETABS.MUSHA, {SCIENCE=2})
pirateback.atlas = "images/inventoryimages/pirateback.xml"
 local broken_frosthammer = GLOBAL.Recipe( "broken_frosthammer", { butterfly4, Ingredient("gears", 1), Ingredient("bluegem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
broken_frosthammer.atlas = "images/inventoryimages/broken_frosthammer.xml"
 local armor_mushaa = GLOBAL.Recipe( "armor_mushaa", {amulet, Ingredient("goldnugget", 6), Ingredient("thulecite", 1) }, RECIPETABS.MUSHA, {SCIENCE=0})
	armor_mushaa.atlas = "images/inventoryimages/armor_mushaa.xml"
 local frostback = GLOBAL.Recipe( "frostback", { broken,  butterfly4, Ingredient("bluegem", 1) }, RECIPETABS.MUSHA, {SCIENCE=2})
frostback.atlas = "images/inventoryimages/frostback.xml"
 local armor_mushab = GLOBAL.Recipe( "armor_mushab", {armoraa, eye, Ingredient("greengem", 2), Ingredient("orangegem", 2)}, RECIPETABS.MUSHA, {SCIENCE=2})
	armor_mushab.atlas = "images/inventoryimages/armor_mushab.xml"
--hat
local hat_mwildcat = GLOBAL.Recipe( "hat_mwildcat", {  Ingredient("gears", 1), Ingredient("boneshard", 4), Ingredient("bluegem", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mwildcat.atlas = "images/inventoryimages/hat_mwildcat.xml"
 local hat_mbunny = GLOBAL.Recipe( "hat_mbunny", {Ingredient("dug_grass", 2), Ingredient("manrabbit_tail", 1), Ingredient("bluegem", 1)  }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mbunny.atlas = "images/inventoryimages/hat_mbunny.xml"
 local hat_mprincess = GLOBAL.Recipe( "hat_mprincess", {amulet, Ingredient("goldnugget", 3) },  RECIPETABS.MUSHA, {SCIENCE=0})
	hat_mprincess.atlas = "images/inventoryimages/hat_mprincess.xml"
 local hat_mcrown = GLOBAL.Recipe( "hat_mcrown", {princess, Ingredient("thulecite", 2), Ingredient("purplegem", 1) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mcrown.atlas = "images/inventoryimages/hat_mcrown.xml"
 if player:HasTag("DLC") then
local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {Ingredient("dragon_scales", 1), Ingredient("panflute", 1), Ingredient("thulecite", 10) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
else
local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {eye, Ingredient("panflute", 1), Ingredient("thulecite", 10) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
end	
--egg
--arong egg
 local musha_egg_arong = GLOBAL.Recipe( "musha_egg_arong", { dust5, GLOBAL.Ingredient("beefalowool", 10), GLOBAL.Ingredient("purplegem", 2) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg_arong.atlas = "images/inventoryimages/musha_egg_arong.xml"
--phoenix_egg
 local musha_egg = GLOBAL.Recipe( "musha_egg", { dust10, Ingredient("redgem", 15), Ingredient("bluegem", 10), Ingredient("greengem", 7) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg.atlas = "images/inventoryimages/musha_egg.xml"
local musha_eggs1 = GLOBAL.Recipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 2)}, RECIPETABS.MUSHA, {SCIENCE=0})  
musha_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local musha_eggs2 = GLOBAL.Recipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 3)}, RECIPETABS.MUSHA, {SCIENCE=1})  
musha_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local musha_eggs3 = GLOBAL.Recipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 7)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local musha_egg1 = GLOBAL.Recipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 10)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local musha_egg2 = GLOBAL.Recipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 15), GLOBAL.Ingredient("purplegem", 1)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local musha_egg3 = GLOBAL.Recipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 25), GLOBAL.Ingredient("purplegem", 2)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local musha_egg8 = GLOBAL.Recipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 35), GLOBAL.Ingredient("purplegem", 4)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg8.atlas = "images/inventoryimages/musha_egg8.xml"
------------------------------------------------------------------------------------------------------------
end


------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
elseif GLOBAL.SaveGameIndex:IsModeShipwrecked() then
if player:HasTag("Recipe_normal") then
require "recipe"
require "tuning"
--arrow
--local arrowm = GLOBAL.Recipe( "arrowm", { Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
--arrowm.atlas = "images/inventoryimages/arrowm.xml"
local dummy_arrow0 = GLOBAL.Recipe( "dummy_arrow0",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow0.atlas = "images/inventoryimages/dummy_arrow0.xml"
local dummy_arrow1 = GLOBAL.Recipe( "dummy_arrow1",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow1.atlas = "images/inventoryimages/dummy_arrow1.xml"
local dummy_arrow2 = GLOBAL.Recipe( "dummy_arrow2",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow2.atlas = "images/inventoryimages/dummy_arrow2.xml"
local dummy_arrow3 = GLOBAL.Recipe( "dummy_arrow3",{ broken_arrow2, Ingredient("twigs", 1)}, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow3.atlas = "images/inventoryimages/dummy_arrow3.xml"
--boat
local musha_cargo = GLOBAL.Recipe("musha_cargo", { GLOBAL.Ingredient("livinglog", 10), Ingredient("boards", 8), GLOBAL.Ingredient("rope", 6), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_cargo_placer", nil, nil, nil, true, 4) 
	musha_cargo.atlas = "images/inventoryimages/musha_cargo.xml"
local sail_pirate = GLOBAL.Recipe( "sail_pirate", {Ingredient("fabric", 4), Ingredient("bamboo", 3), Ingredient("charcoal", 2), }, RECIPETABS.MUSHA, {SCIENCE=2})
	sail_pirate.atlas = "images/inventoryimages/sail_pirate.xml"
local cannon_musha = GLOBAL.Recipe( "cannon_musha", {Ingredient("boatcannon", 1), Ingredient("flowerhat", 1), dust5 }, RECIPETABS.MUSHA, {SCIENCE=2})
	cannon_musha.atlas = "images/inventoryimages/cannon_musha.xml"	
	
--grass hut
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 5), Ingredient("cutgrass", 6), Ingredient("rope", 3), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
--dall
local moontree = GLOBAL.Recipe("moontree", {  glowdust10,GLOBAL.Ingredient("livinglog", 15), Ingredient("purplegem", 8), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
--oven
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("limestone", 8), Ingredient("sand", 8), Ingredient("livinglog", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
--forge
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust10, Ingredient("gears", 6), Ingredient("transistor", 6), Ingredient("livinglog", 10), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
--tent
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("boat_lantern", 1), Ingredient("palmleaf", 20), Ingredient("bamboo", 10), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"


--dust

local glowdust = GLOBAL.Recipe( "glowdust", {Ingredient("wormlight", 1), Ingredient("ash", 5) }, RECIPETABS.MUSHA, {SCIENCE=0})
	glowdust.atlas = "images/inventoryimages/glowdust.xml"

--exp
--[[
 local exp = GLOBAL.Recipe( "exp", {Ingredient("goldnugget", 4),}, RECIPETABS.MUSHA, {SCIENCE=0})
	exp.atlas = "images/inventoryimages/exp.xml"]]

--cristal
 local cristal = GLOBAL.Recipe( "cristal", {dust10}, RECIPETABS.MUSHA, {SCIENCE=2})
	cristal.atlas = "images/inventoryimages/cristal.xml"

--flute
 local musha_flute = GLOBAL.Recipe( "musha_flute", {dust10, Ingredient("bamboo", 6), Ingredient("antivenom", 6), Ingredient("amulet", 2)},  RECIPETABS.MUSHA, {SCIENCE=2})
	musha_flute.atlas = "images/inventoryimages/musha_flute.xml"

--phoenix weapon

 local mushasword_base = GLOBAL.Recipe( "mushasword_base", { Ingredient("machete", 1), glowdusts, Ingredient("flint", 3)}, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword_base.atlas = "images/inventoryimages/mushasword_base.xml"

--[[ local mushasword = GLOBAL.Recipe( "mushasword", { bladeb, dust3, Ingredient("goldnugget", 15) }, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword.atlas = "images/inventoryimages/mushasword.xml"
 local mushasword2 = GLOBAL.Recipe( "mushasword2", { blade1,  dust6, Ingredient("feather_robin", 10), Ingredient("goldnugget", 30)  }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword2.atlas = "images/inventoryimages/mushasword2.xml"
 local mushasword3 = GLOBAL.Recipe( "mushasword3", { blade2,  dust15, Ingredient("redgem", 20), Ingredient("obsidian", 50) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword3.atlas = "images/inventoryimages/mushasword3.xml"]]
--fire
local mushasword_fire = GLOBAL.Recipe( "mushasword_fire", { bladeb, Ingredient("goldenmachete", 1), Ingredient("redgem", 4) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_fire.atlas = "images/inventoryimages/mushasword_fire.xml"
--frost 
 local mushasword_frost = GLOBAL.Recipe( "mushasword_frost", { bladeb, Ingredient("goldenmachete", 1), Ingredient("bluegem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_frost.atlas = "images/inventoryimages/mushasword_frost.xml"
--blade-bow
local bowm = GLOBAL.Recipe( "bowm", { blade_fire, Ingredient("venomgland", 4), dust3 }, RECIPETABS.MUSHA, {SCIENCE=1})
bowm.atlas = "images/inventoryimages/bowm.xml"
--spear
local phoenixspear = GLOBAL.Recipe( "phoenixspear", { blade_fire, blade_frost, dust3, Ingredient("goldnugget", 30) }, RECIPETABS.MUSHA, {SCIENCE=1})
phoenixspear.atlas = "images/inventoryimages/phoenixspear.xml"
--hammer
 local frosthammer = GLOBAL.Recipe( "frosthammer", { Ingredient("livinglog", 20), Ingredient("bluegem", 24), broken}, RECIPETABS.MUSHA, {SCIENCE=1})
frosthammer.atlas = "images/inventoryimages/frosthammer.xml"
--axe
local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("obsidian", 80), Ingredient("purplegem", 20), Ingredient("greengem", 8), }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"

--armor
local pirateback = GLOBAL.Recipe( "pirateback", { broken,armoraa, Ingredient("dragoonheart", 8), Ingredient("dubloon", 50) }, RECIPETABS.MUSHA, {SCIENCE=2})     
pirateback.atlas = "images/inventoryimages/pirateback.xml"

 local broken_frosthammer = GLOBAL.Recipe( "broken_frosthammer", { butterfly4, Ingredient("gears", 4), Ingredient("bluegem", 5) }, RECIPETABS.MUSHA, {SCIENCE=1})
broken_frosthammer.atlas = "images/inventoryimages/broken_frosthammer.xml"

local armor_mushaa = GLOBAL.Recipe( "armor_mushaa", {dust3, Ingredient("goldnugget", 10), Ingredient("boneshard", 4) }, RECIPETABS.MUSHA, {SCIENCE=0})
	armor_mushaa.atlas = "images/inventoryimages/armor_mushaa.xml"

 local frostback = GLOBAL.Recipe( "frostback", { broken,  butterfly8, Ingredient("bluegem", 6),Ingredient("gears", 4)}, RECIPETABS.MUSHA, {SCIENCE=2})
frostback.atlas = "images/inventoryimages/frostback.xml"

 local armor_mushab = GLOBAL.Recipe( "armor_mushab", {armoraa, Ingredient("tigereye", 6), Ingredient("orangegem", 10), Ingredient("shark_gills", 12)}, RECIPETABS.MUSHA, {SCIENCE=2})
	armor_mushab.atlas = "images/inventoryimages/armor_mushab.xml"

--hat
local hat_mwildcat = GLOBAL.Recipe( "hat_mwildcat", {  Ingredient("gears", 4), Ingredient("boneshard", 16), Ingredient("bluegem", 3) }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mwildcat.atlas = "images/inventoryimages/hat_mwildcat.xml"
 local hat_mbunny = GLOBAL.Recipe( "hat_mbunny", { Ingredient("blubber", 5), Ingredient("cutgrass", 20), Ingredient("purplegem", 2)  }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mbunny.atlas = "images/inventoryimages/hat_mbunny.xml"
	
 local hat_mprincess = GLOBAL.Recipe( "hat_mprincess", {amulet, Ingredient("goldnugget", 10), },  RECIPETABS.MUSHA, {SCIENCE=0})
	hat_mprincess.atlas = "images/inventoryimages/hat_mprincess.xml"
	
 local hat_mcrown = GLOBAL.Recipe( "hat_mcrown", {princess, Ingredient("goldnugget", 20), Ingredient("purplegem", 4) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mcrown.atlas = "images/inventoryimages/hat_mcrown.xml"

 local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {princess, Ingredient("obsidian", 60), Ingredient("yellowgem", 10), Ingredient("goldnugget", 40), }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
	
--egg
--arong egg
 local musha_egg_arong = GLOBAL.Recipe( "musha_egg_arong", { phoenix_egg },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg_arong.atlas = "images/inventoryimages/musha_egg_arong.xml"
--phoenix_egg
 local musha_egg = GLOBAL.Recipe( "musha_egg", { dust10, Ingredient("redgem", 30), Ingredient("bluegem", 25), Ingredient("greengem", 3) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg.atlas = "images/inventoryimages/musha_egg.xml"


local musha_eggs1 = GLOBAL.Recipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 10)}, RECIPETABS.MUSHA, {SCIENCE=0})  
musha_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local musha_eggs2 = GLOBAL.Recipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 15)}, RECIPETABS.MUSHA, {SCIENCE=1})  
musha_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local musha_eggs3 = GLOBAL.Recipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 30)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local musha_egg1 = GLOBAL.Recipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 45), GLOBAL.Ingredient("purplegem", 1)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local musha_egg2 = GLOBAL.Recipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 60), GLOBAL.Ingredient("purplegem", 3)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local musha_egg3 = GLOBAL.Recipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 90), GLOBAL.Ingredient("purplegem", 5)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local musha_egg8 = GLOBAL.Recipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 150), GLOBAL.Ingredient("purplegem", 8)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg8.atlas = "images/inventoryimages/musha_egg8.xml"

elseif player:HasTag("Recipe_easy") then
require "recipe"
require "tuning"
--arrow
--local arrowm = GLOBAL.Recipe( "arrowm", { Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
--arrowm.atlas = "images/inventoryimages/arrowm.xml"
local dummy_arrow0 = GLOBAL.Recipe( "dummy_arrow0",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow0.atlas = "images/inventoryimages/dummy_arrow0.xml"
local dummy_arrow1 = GLOBAL.Recipe( "dummy_arrow1",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow1.atlas = "images/inventoryimages/dummy_arrow1.xml"
local dummy_arrow2 = GLOBAL.Recipe( "dummy_arrow2",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow2.atlas = "images/inventoryimages/dummy_arrow2.xml"
local dummy_arrow3 = GLOBAL.Recipe( "dummy_arrow3",{ broken_arrow2, Ingredient("twigs", 1)}, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow3.atlas = "images/inventoryimages/dummy_arrow3.xml"
--boat
local musha_cargo = GLOBAL.Recipe("musha_cargo", { GLOBAL.Ingredient("livinglog", 5), Ingredient("boards", 4), GLOBAL.Ingredient("rope", 3), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_cargo_placer", nil, nil, nil, true, 4) 
	musha_cargo.atlas = "images/inventoryimages/musha_cargo.xml"
local sail_pirate = GLOBAL.Recipe( "sail_pirate", {Ingredient("fabric", 3), Ingredient("bamboo", 1), Ingredient("charcoal", 1), }, RECIPETABS.MUSHA, {SCIENCE=2})
	sail_pirate.atlas = "images/inventoryimages/sail_pirate.xml"
local cannon_musha = GLOBAL.Recipe( "cannon_musha", {Ingredient("boatcannon", 1), Ingredient("flowerhat", 1), dust2 }, RECIPETABS.MUSHA, {SCIENCE=2})
	cannon_musha.atlas = "images/inventoryimages/cannon_musha.xml"	
--grass hut
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 3), Ingredient("cutgrass", 3), Ingredient("rope", 2), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
--dall	
local moontree = GLOBAL.Recipe("moontree", {  dust5,GLOBAL.Ingredient("livinglog", 7), Ingredient("purplegem", 4), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
--oven
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("limestone", 4), Ingredient("sand", 4), Ingredient("livinglog", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
--forge
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust10, Ingredient("gears", 3), Ingredient("transistor", 3), Ingredient("livinglog", 5), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
--tent
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("boat_torch", 1), Ingredient("palmleaf", 10), Ingredient("bamboo", 8), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"


--dust

local glowdust = GLOBAL.Recipe( "glowdust", {Ingredient("wormlight", 1), Ingredient("ash", 3) }, RECIPETABS.MUSHA, {SCIENCE=0})
	glowdust.atlas = "images/inventoryimages/glowdust.xml"

--exp
--[[
 local exp = GLOBAL.Recipe( "exp", {Ingredient("goldnugget", 4),}, RECIPETABS.MUSHA, {SCIENCE=0})
	exp.atlas = "images/inventoryimages/exp.xml"]]

--cristal
 local cristal = GLOBAL.Recipe( "cristal", {dust6}, RECIPETABS.MUSHA, {SCIENCE=2})
	cristal.atlas = "images/inventoryimages/cristal.xml"

--flute
 local musha_flute = GLOBAL.Recipe( "musha_flute", {dust5, Ingredient("bamboo", 3), Ingredient("antivenom", 3), Ingredient("amulet", 1)},  RECIPETABS.MUSHA, {SCIENCE=2})
	musha_flute.atlas = "images/inventoryimages/musha_flute.xml"

--phoenix weapon

 local mushasword_base = GLOBAL.Recipe( "mushasword_base", { Ingredient("machete", 1), glowdusts, Ingredient("flint", 2)}, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword_base.atlas = "images/inventoryimages/mushasword_base.xml"

--[[ local mushasword = GLOBAL.Recipe( "mushasword", { bladeb, glowdusts, Ingredient("goldnugget", 7) }, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword.atlas = "images/inventoryimages/mushasword.xml"
 local mushasword2 = GLOBAL.Recipe( "mushasword2", { blade1,  dust3, Ingredient("feather_robin", 4), Ingredient("goldnugget", 15)  }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword2.atlas = "images/inventoryimages/mushasword2.xml"
 local mushasword3 = GLOBAL.Recipe( "mushasword3", { blade2,  dust5, Ingredient("redgem", 5), Ingredient("obsidian", 20) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword3.atlas = "images/inventoryimages/mushasword3.xml"]]

--fire
local mushasword_fire = GLOBAL.Recipe( "mushasword_fire", { bladeb, Ingredient("goldenmachete", 1), Ingredient("redgem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_fire.atlas = "images/inventoryimages/mushasword_fire.xml"
--frost 
 local mushasword_frost = GLOBAL.Recipe( "mushasword_frost", { bladeb, Ingredient("goldenmachete", 1), Ingredient("bluegem", 3) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_frost.atlas = "images/inventoryimages/mushasword_frost.xml"
--blade-bow
local bowm = GLOBAL.Recipe( "bowm", { blade_fire, Ingredient("venomgland", 2), dust2 }, RECIPETABS.MUSHA, {SCIENCE=1})
bowm.atlas = "images/inventoryimages/bowm.xml"
--spear
local phoenixspear = GLOBAL.Recipe( "phoenixspear", { blade_fire, blade_frost, dust2, Ingredient("goldnugget", 20) }, RECIPETABS.MUSHA, {SCIENCE=1})
phoenixspear.atlas = "images/inventoryimages/phoenixspear.xml"
--hammer
 local frosthammer = GLOBAL.Recipe( "frosthammer", { Ingredient("livinglog", 10), Ingredient("bluegem", 12), broken}, RECIPETABS.MUSHA, {SCIENCE=1})
frosthammer.atlas = "images/inventoryimages/frosthammer.xml"
--axe
local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("obsidian", 40), Ingredient("purplegem", 4), Ingredient("greengem", 4), }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"
--armor
local pirateback = GLOBAL.Recipe( "pirateback", {broken,armoraa, Ingredient("dragoonheart", 4), Ingredient("dubloon", 25)}, RECIPETABS.MUSHA, {SCIENCE=2})
pirateback.atlas = "images/inventoryimages/pirateback.xml"

 local broken_frosthammer = GLOBAL.Recipe( "broken_frosthammer", { butterfly4, Ingredient("gears", 2), Ingredient("bluegem", 3) }, RECIPETABS.MUSHA, {SCIENCE=1})
broken_frosthammer.atlas = "images/inventoryimages/broken_frosthammer.xml"

local armor_mushaa = GLOBAL.Recipe( "armor_mushaa", {glowdusts, Ingredient("goldnugget", 8), Ingredient("boneshard", 2) }, RECIPETABS.MUSHA, {SCIENCE=0})
	armor_mushaa.atlas = "images/inventoryimages/armor_mushaa.xml"

 local frostback = GLOBAL.Recipe( "frostback", { broken,  butterfly4, Ingredient("bluegem", 2),Ingredient("gears", 2) }, RECIPETABS.MUSHA, {SCIENCE=2})
frostback.atlas = "images/inventoryimages/frostback.xml"

 local armor_mushab = GLOBAL.Recipe( "armor_mushab", {armoraa, Ingredient("tigereye", 3), Ingredient("orangegem", 4), Ingredient("shark_gills", 6)}, RECIPETABS.MUSHA, {SCIENCE=2})
	armor_mushab.atlas = "images/inventoryimages/armor_mushab.xml"

--hat
local hat_mwildcat = GLOBAL.Recipe( "hat_mwildcat", {  Ingredient("gears", 2), Ingredient("boneshard", 8), Ingredient("bluegem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mwildcat.atlas = "images/inventoryimages/hat_mwildcat.xml"
 local hat_mbunny = GLOBAL.Recipe( "hat_mbunny", { Ingredient("blubber", 1), Ingredient("cutgrass", 10), Ingredient("purplegem", 1)  }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mbunny.atlas = "images/inventoryimages/hat_mbunny.xml"
	
 local hat_mprincess = GLOBAL.Recipe( "hat_mprincess", {amulet, Ingredient("goldnugget", 6) },  RECIPETABS.MUSHA, {SCIENCE=0})
	hat_mprincess.atlas = "images/inventoryimages/hat_mprincess.xml"
	
 local hat_mcrown = GLOBAL.Recipe( "hat_mcrown", {princess, Ingredient("goldnugget", 8), Ingredient("purplegem", 3) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mcrown.atlas = "images/inventoryimages/hat_mcrown.xml"

 local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {princess, Ingredient("obsidian", 20), Ingredient("yellowgem", 3) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
	
--egg
--arong egg
local musha_egg_arong = GLOBAL.Recipe( "musha_egg_arong", { phoenix_egg },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg_arong.atlas = "images/inventoryimages/musha_egg_arong.xml"
--phoenix_egg
 local musha_egg = GLOBAL.Recipe( "musha_egg", { dust10, Ingredient("redgem", 30), Ingredient("bluegem", 25), Ingredient("greengem", 3) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg.atlas = "images/inventoryimages/musha_egg.xml"


local musha_eggs1 = GLOBAL.Recipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 5)}, RECIPETABS.MUSHA, {SCIENCE=0})  
musha_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local musha_eggs2 = GLOBAL.Recipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 8)}, RECIPETABS.MUSHA, {SCIENCE=1})  
musha_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local musha_eggs3 = GLOBAL.Recipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 10)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local musha_egg1 = GLOBAL.Recipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 20), GLOBAL.Ingredient("purplegem", 1)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local musha_egg2 = GLOBAL.Recipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 30), GLOBAL.Ingredient("purplegem", 3)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local musha_egg3 = GLOBAL.Recipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 45), GLOBAL.Ingredient("purplegem", 5)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local musha_egg8 = GLOBAL.Recipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 75), GLOBAL.Ingredient("purplegem", 8)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg8.atlas = "images/inventoryimages/musha_egg8.xml"

elseif player:HasTag("Recipe_veasy") then
require "recipe"
require "tuning"
--arrow
--local arrowm = GLOBAL.Recipe( "arrowm", { Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
--arrowm.atlas = "images/inventoryimages/arrowm.xml"
local dummy_arrow0 = GLOBAL.Recipe( "dummy_arrow0",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow0.atlas = "images/inventoryimages/dummy_arrow0.xml"
local dummy_arrow1 = GLOBAL.Recipe( "dummy_arrow1",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow1.atlas = "images/inventoryimages/dummy_arrow1.xml"
local dummy_arrow2 = GLOBAL.Recipe( "dummy_arrow2",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow2.atlas = "images/inventoryimages/dummy_arrow2.xml"
local dummy_arrow3 = GLOBAL.Recipe( "dummy_arrow3",{ broken_arrow2}, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow3.atlas = "images/inventoryimages/dummy_arrow3.xml"
--boat
local musha_cargo = GLOBAL.Recipe("musha_cargo", { GLOBAL.Ingredient("livinglog", 2), Ingredient("boards", 2), GLOBAL.Ingredient("rope", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_cargo_placer", nil, nil, nil, true, 4) 
	musha_cargo.atlas = "images/inventoryimages/musha_cargo.xml"
local sail_pirate = GLOBAL.Recipe( "sail_pirate", {Ingredient("fabric", 1), Ingredient("bamboo", 1), Ingredient("charcoal", 1), }, RECIPETABS.MUSHA, {SCIENCE=2})
	sail_pirate.atlas = "images/inventoryimages/sail_pirate.xml"
local cannon_musha = GLOBAL.Recipe( "cannon_musha", {Ingredient("boatcannon", 1), Ingredient("flowerhat", 1) }, RECIPETABS.MUSHA, {SCIENCE=2})
	cannon_musha.atlas = "images/inventoryimages/cannon_musha.xml"	
--grass hut
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 2), Ingredient("cutgrass", 2), Ingredient("rope", 1), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
--dall
local moontree = GLOBAL.Recipe("moontree", {  glowdusts,GLOBAL.Ingredient("livinglog", 3), Ingredient("purplegem", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
--oven
local musha_oven = GLOBAL.Recipe("musha_oven", { glowdusts, Ingredient("limestone", 1), Ingredient("sand", 2), Ingredient("livinglog", 1), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
--forge
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdusts, Ingredient("gears", 1), Ingredient("transistor", 1), Ingredient("livinglog", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
--tent
local tent_musha = GLOBAL.Recipe("tent_musha", { glowdusts, Ingredient("boat_torch", 1), Ingredient("palmleaf", 5), Ingredient("bamboo", 2), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"


--dust

local glowdust = GLOBAL.Recipe( "glowdust", {Ingredient("wormlight", 1), Ingredient("ash", 1) }, RECIPETABS.MUSHA, {SCIENCE=0})
	glowdust.atlas = "images/inventoryimages/glowdust.xml"

--exp
--[[
 local exp = GLOBAL.Recipe( "exp", {Ingredient("goldnugget", 4),}, RECIPETABS.MUSHA, {SCIENCE=0})
	exp.atlas = "images/inventoryimages/exp.xml"]]

--cristal
 local cristal = GLOBAL.Recipe( "cristal", {dust4}, RECIPETABS.MUSHA, {SCIENCE=2})
	cristal.atlas = "images/inventoryimages/cristal.xml"

--flute
 local musha_flute = GLOBAL.Recipe( "musha_flute", {glowdusts, Ingredient("bamboo", 1), Ingredient("antivenom", 1), Ingredient("amulet", 1)},  RECIPETABS.MUSHA, {SCIENCE=2})
	musha_flute.atlas = "images/inventoryimages/musha_flute.xml"

--phoenix weapon

 local mushasword_base = GLOBAL.Recipe( "mushasword_base", { Ingredient("machete", 1), glowdusts}, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword_base.atlas = "images/inventoryimages/mushasword_base.xml"

--[[ local mushasword = GLOBAL.Recipe( "mushasword", { bladeb, glowdusts, Ingredient("goldnugget", 2) }, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword.atlas = "images/inventoryimages/mushasword.xml"
 local mushasword2 = GLOBAL.Recipe( "mushasword2", { blade1,  glowdusts, Ingredient("feather_robin", 1), Ingredient("goldnugget", 3)  }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword2.atlas = "images/inventoryimages/mushasword2.xml"
 local mushasword3 = GLOBAL.Recipe( "mushasword3", { blade2,  glowdusts, Ingredient("redgem", 1), Ingredient("obsidian", 3) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword3.atlas = "images/inventoryimages/mushasword3.xml"
 local mushasword4 = GLOBAL.Recipe( "mushasword4", { blade2, blade_f, Ingredient("greengem", 2),  Ingredient("obsidian", 3) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"]]
--fire
local mushasword_fire = GLOBAL.Recipe( "mushasword_fire", { bladeb, Ingredient("goldenmachete", 1), Ingredient("redgem", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_fire.atlas = "images/inventoryimages/mushasword_fire.xml"
--frost 
 local mushasword_frost = GLOBAL.Recipe( "mushasword_frost", { bladeb, Ingredient("goldenmachete", 1), Ingredient("bluegem", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_frost.atlas = "images/inventoryimages/mushasword_frost.xml"
--blade-bow
local bowm = GLOBAL.Recipe( "bowm", { blade_fire, Ingredient("venomgland", 1), glowdusts }, RECIPETABS.MUSHA, {SCIENCE=1})
bowm.atlas = "images/inventoryimages/bowm.xml"
--spear
local phoenixspear = GLOBAL.Recipe( "phoenixspear", { blade_fire, blade_frost, glowdusts, Ingredient("goldnugget", 15) }, RECIPETABS.MUSHA, {SCIENCE=1})
phoenixspear.atlas = "images/inventoryimages/phoenixspear.xml"
--hammer
 local frosthammer = GLOBAL.Recipe( "frosthammer", { Ingredient("livinglog", 5), Ingredient("bluegem", 6), broken}, RECIPETABS.MUSHA, {SCIENCE=1})
frosthammer.atlas = "images/inventoryimages/frosthammer.xml"
--axe
local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("obsidian", 20), Ingredient("purplegem", 2), Ingredient("greengem", 2) }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"

--armor
local pirateback = GLOBAL.Recipe( "pirateback", { broken,armoraa, Ingredient("dragoonheart", 2), Ingredient("dubloon", 12)}, RECIPETABS.MUSHA, {SCIENCE=2})
pirateback.atlas = "images/inventoryimages/pirateback.xml"

 local broken_frosthammer = GLOBAL.Recipe( "broken_frosthammer", { butterfly4, Ingredient("gears", 1), Ingredient("bluegem", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
broken_frosthammer.atlas = "images/inventoryimages/broken_frosthammer.xml"

local armor_mushaa = GLOBAL.Recipe( "armor_mushaa", {glowdusts, Ingredient("goldnugget", 5) }, RECIPETABS.MUSHA, {SCIENCE=0})
	armor_mushaa.atlas = "images/inventoryimages/armor_mushaa.xml"

 local frostback = GLOBAL.Recipe( "frostback", { broken, Ingredient("bluegem",1),Ingredient("gears", 1) }, RECIPETABS.MUSHA, {SCIENCE=2})
frostback.atlas = "images/inventoryimages/frostback.xml"

 local armor_mushab = GLOBAL.Recipe( "armor_mushab", {armoraa, Ingredient("orangegem", 1), Ingredient("purplegem", 2)}, RECIPETABS.MUSHA, {SCIENCE=2})
	armor_mushab.atlas = "images/inventoryimages/armor_mushab.xml"

--hat
local hat_mwildcat = GLOBAL.Recipe( "hat_mwildcat", {  Ingredient("gears", 1), Ingredient("boneshard", 4), Ingredient("bluegem", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mwildcat.atlas = "images/inventoryimages/hat_mwildcat.xml"
 local hat_mbunny = GLOBAL.Recipe( "hat_mbunny", { Ingredient("cutgrass", 5), Ingredient("purplegem", 1)  }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mbunny.atlas = "images/inventoryimages/hat_mbunny.xml"
	
 local hat_mprincess = GLOBAL.Recipe( "hat_mprincess", {amulet, Ingredient("goldnugget", 3) },  RECIPETABS.MUSHA, {SCIENCE=0})
	hat_mprincess.atlas = "images/inventoryimages/hat_mprincess.xml"
	
 local hat_mcrown = GLOBAL.Recipe( "hat_mcrown", {princess, Ingredient("goldnugget", 3), Ingredient("purplegem", 1) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mcrown.atlas = "images/inventoryimages/hat_mcrown.xml"

 local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {princess, Ingredient("obsidian", 5) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
	
--egg
--arong egg
 local musha_egg_arong = GLOBAL.Recipe( "musha_egg_arong", { dust5, GLOBAL.Ingredient("amulet", 1), GLOBAL.Ingredient("beefalowool", 40), GLOBAL.Ingredient("purplegem", 5) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg_arong.atlas = "images/inventoryimages/musha_egg_arong.xml"
--phoenix_egg
 local musha_egg = GLOBAL.Recipe( "musha_egg", { dust10, Ingredient("redgem", 15), Ingredient("bluegem", 10), Ingredient("greengem", 7) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg.atlas = "images/inventoryimages/musha_egg.xml"
local musha_eggs1 = GLOBAL.Recipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 1)}, RECIPETABS.MUSHA, {SCIENCE=0})  
musha_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local musha_eggs2 = GLOBAL.Recipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 3)}, RECIPETABS.MUSHA, {SCIENCE=1})  
musha_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local musha_eggs3 = GLOBAL.Recipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 7)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local musha_egg1 = GLOBAL.Recipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 10)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local musha_egg2 = GLOBAL.Recipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 15), GLOBAL.Ingredient("purplegem", 1)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local musha_egg3 = GLOBAL.Recipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 25), GLOBAL.Ingredient("purplegem", 2)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local musha_egg8 = GLOBAL.Recipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 30), GLOBAL.Ingredient("purplegem", 4)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg8.atlas = "images/inventoryimages/musha_egg8.xml"
------------------------------------------------------------------------------------------------------------
end 

elseif GLOBAL.SaveGameIndex:IsModePorkland() then
-- working recipe in hamlet
if player:HasTag("Recipe_normal") then

require "recipe"
require "tuning"
--arrow
--local arrowm = GLOBAL.Recipe( "arrowm", { Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
--arrowm.atlas = "images/inventoryimages/arrowm.xml"
--dust

local glowdust = GLOBAL.Recipe( "glowdust", {Ingredient("wormlight", 1), Ingredient("ash", 1), Ingredient("honey", 1) }, RECIPETABS.MUSHA, {SCIENCE=0})
	glowdust.atlas = "images/inventoryimages/glowdust.xml"
	
local dummy_arrow0 = GLOBAL.Recipe( "dummy_arrow0",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow0.atlas = "images/inventoryimages/dummy_arrow0.xml"
local dummy_arrow1 = GLOBAL.Recipe( "dummy_arrow1",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow1.atlas = "images/inventoryimages/dummy_arrow1.xml"
local dummy_arrow2 = GLOBAL.Recipe( "dummy_arrow2",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow2.atlas = "images/inventoryimages/dummy_arrow2.xml"
local dummy_arrow3 = GLOBAL.Recipe( "dummy_arrow3",{ broken_arrow2, Ingredient("twigs", 1)}, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow3.atlas = "images/inventoryimages/dummy_arrow3.xml"
--boat
local musha_cargo = GLOBAL.Recipe("musha_cargo", { GLOBAL.Ingredient("livinglog", 10), Ingredient("boards", 8), GLOBAL.Ingredient("rope", 6), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_cargo_placer", nil, nil, nil, true, 4) 
	musha_cargo.atlas = "images/inventoryimages/musha_cargo.xml"
local sail_pirate = GLOBAL.Recipe( "sail_pirate", {Ingredient("fabric", 4), Ingredient("bamboo", 3), Ingredient("charcoal", 2), }, RECIPETABS.MUSHA, {SCIENCE=2})
	sail_pirate.atlas = "images/inventoryimages/sail_pirate.xml"
local cannon_musha = GLOBAL.Recipe( "cannon_musha", {Ingredient("boatcannon", 1), Ingredient("flowerhat", 1), dust5 }, RECIPETABS.MUSHA, {SCIENCE=2})
	cannon_musha.atlas = "images/inventoryimages/cannon_musha.xml"	
	
--grass hut
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 4), Ingredient("cutgrass", 8), Ingredient("rope", 2), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
--dall
local moontree = GLOBAL.Recipe("moontree", {  glowdust10,GLOBAL.Ingredient("livinglog", 15), Ingredient("greengem", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
--oven
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("rocks", 10), Ingredient("nitre", 8), Ingredient("livinglog", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
--forge
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust10, Ingredient("gears", 4), Ingredient("livinglog", 8), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
--tent
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lantern", 1), Ingredient("cutreeds", 20), Ingredient("log", 8), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"

--cristal
 local cristal = GLOBAL.Recipe( "cristal", {dust10}, RECIPETABS.MUSHA, {SCIENCE=2})
	cristal.atlas = "images/inventoryimages/cristal.xml"

--flute
 local musha_flute = GLOBAL.Recipe( "musha_flute", {dust10, Ingredient("vine", 8), Ingredient("antivenom", 6), Ingredient("amulet", 2)},  RECIPETABS.MUSHA, {SCIENCE=2})
	musha_flute.atlas = "images/inventoryimages/musha_flute.xml"

--phoenix weapon

 local mushasword_base = GLOBAL.Recipe( "mushasword_base", { Ingredient("iron", 2), Ingredient("machete", 1), glowdusts}, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword_base.atlas = "images/inventoryimages/mushasword_base.xml"

--fire
local mushasword_fire = GLOBAL.Recipe( "mushasword_fire", { bladeb, Ingredient("goldenmachete", 1), Ingredient("redgem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_fire.atlas = "images/inventoryimages/mushasword_fire.xml"
--frost 
 local mushasword_frost = GLOBAL.Recipe( "mushasword_frost", { bladeb, Ingredient("goldenmachete", 1), Ingredient("bluegem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_frost.atlas = "images/inventoryimages/mushasword_frost.xml"
--blade-bow
local bowm = GLOBAL.Recipe( "bowm", { blade_fire, Ingredient("venomgland", 4), dust3 }, RECIPETABS.MUSHA, {SCIENCE=1})
bowm.atlas = "images/inventoryimages/bowm.xml"
--spear
local phoenixspear = GLOBAL.Recipe( "phoenixspear", { blade_fire, blade_frost, dust3, Ingredient("alloy", 12) }, RECIPETABS.MUSHA, {SCIENCE=1})
phoenixspear.atlas = "images/inventoryimages/phoenixspear.xml"
--hammer
 local frosthammer = GLOBAL.Recipe( "frosthammer", { Ingredient("alloy", 15), Ingredient("bluegem", 30), Ingredient("livinglog", 5)}, RECIPETABS.MUSHA, {SCIENCE=1})
frosthammer.atlas = "images/inventoryimages/frosthammer.xml"
--axe
local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("dragon_scales", 2), Ingredient("purplegem", 30), Ingredient("greengem", 8), }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"

--armor

 local armor_mushaa = GLOBAL.Recipe( "armor_mushaa", {dust3, Ingredient("goldnugget", 12), Ingredient("pigskin", 2) }, RECIPETABS.MUSHA, {SCIENCE=0})
	armor_mushaa.atlas = "images/inventoryimages/armor_mushaa.xml"

 local broken_frosthammer = GLOBAL.Recipe( "broken_frosthammer", { Ingredient("armor_weevole", 1), Ingredient("vine", 12), Ingredient("bluegem", 5) }, RECIPETABS.MUSHA, {SCIENCE=1})
broken_frosthammer.atlas = "images/inventoryimages/broken_frosthammer.xml"	
	
 local frostback = GLOBAL.Recipe( "frostback", { broken,  Ingredient("chitin", 20), Ingredient("purplegem", 8),Ingredient("gears", 3)}, RECIPETABS.MUSHA, {SCIENCE=2})
frostback.atlas = "images/inventoryimages/frostback.xml"

 local pirateback = GLOBAL.Recipe( "pirateback", { armoraa, Ingredient("oinc10", 25), Ingredient("greengem", 2) }, RECIPETABS.MUSHA, {SCIENCE=2})     
pirateback.atlas = "images/inventoryimages/pirateback.xml"

 local armor_mushab = GLOBAL.Recipe( "armor_mushab", {armoraa, Ingredient("purplegem", 12), Ingredient("orangegem", 12), Ingredient("yellowgem", 8)}, RECIPETABS.MUSHA, {SCIENCE=2})
	armor_mushab.atlas = "images/inventoryimages/armor_mushab.xml"

	
--hat
local hat_mwildcat = GLOBAL.Recipe( "hat_mwildcat", {  Ingredient("gasmaskhat", 1), Ingredient("minerhat", 1), Ingredient("alloy", 20) }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mwildcat.atlas = "images/inventoryimages/hat_mwildcat.xml"
	
 local hat_mbunny = GLOBAL.Recipe( "hat_mbunny", { Ingredient("walrus_tusk", 1), Ingredient("alloy", 6), Ingredient("purplegem", 2)  }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mbunny.atlas = "images/inventoryimages/hat_mbunny.xml"
	
 local hat_mprincess = GLOBAL.Recipe( "hat_mprincess", {amulet, Ingredient("oinc", 30), },  RECIPETABS.MUSHA, {SCIENCE=0})
	hat_mprincess.atlas = "images/inventoryimages/hat_mprincess.xml"
	
 local hat_mcrown = GLOBAL.Recipe( "hat_mcrown", {princess, Ingredient("pigcrownhat", 1), Ingredient("purplegem", 6) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mcrown.atlas = "images/inventoryimages/hat_mcrown.xml"

 local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {princess, Ingredient("snake_bone", 40), Ingredient("yellowgem", 12), Ingredient("goldnugget", 40), }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
	
--egg
--arong egg
local musha_egg_arong = GLOBAL.Recipe( "musha_egg_arong", { phoenix_egg },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg_arong.atlas = "images/inventoryimages/musha_egg_arong.xml"
--phoenix_egg
 local musha_egg = GLOBAL.Recipe( "musha_egg", { dust10, Ingredient("redgem", 12), Ingredient("bluegem", 8), Ingredient("greengem", 1) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg.atlas = "images/inventoryimages/musha_egg.xml"


local musha_eggs1 = GLOBAL.Recipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 2)}, RECIPETABS.MUSHA, {SCIENCE=0})  
musha_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local musha_eggs2 = GLOBAL.Recipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 5)}, RECIPETABS.MUSHA, {SCIENCE=1})  
musha_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local musha_eggs3 = GLOBAL.Recipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 15)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local musha_egg1 = GLOBAL.Recipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 25), GLOBAL.Ingredient("purplegem", 1)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local musha_egg2 = GLOBAL.Recipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 35), GLOBAL.Ingredient("purplegem", 3)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local musha_egg3 = GLOBAL.Recipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 45), GLOBAL.Ingredient("purplegem", 5)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local musha_egg8 = GLOBAL.Recipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 60), GLOBAL.Ingredient("purplegem", 8)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg8.atlas = "images/inventoryimages/musha_egg8.xml"

end

if player:HasTag("Recipe_easy") then

require "recipe"
require "tuning"
--arrow
--local arrowm = GLOBAL.Recipe( "arrowm", { Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
--arrowm.atlas = "images/inventoryimages/arrowm.xml"
--dust

local glowdust = GLOBAL.Recipe( "glowdust", {Ingredient("wormlight", 1), Ingredient("ash", 1), Ingredient("honey", 1) }, RECIPETABS.MUSHA, {SCIENCE=0})
	glowdust.atlas = "images/inventoryimages/glowdust.xml"
	
local dummy_arrow0 = GLOBAL.Recipe( "dummy_arrow0",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow0.atlas = "images/inventoryimages/dummy_arrow0.xml"
local dummy_arrow1 = GLOBAL.Recipe( "dummy_arrow1",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow1.atlas = "images/inventoryimages/dummy_arrow1.xml"
local dummy_arrow2 = GLOBAL.Recipe( "dummy_arrow2",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow2.atlas = "images/inventoryimages/dummy_arrow2.xml"
local dummy_arrow3 = GLOBAL.Recipe( "dummy_arrow3",{ broken_arrow2, Ingredient("twigs", 1)}, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow3.atlas = "images/inventoryimages/dummy_arrow3.xml"
--boat
local musha_cargo = GLOBAL.Recipe("musha_cargo", { GLOBAL.Ingredient("livinglog", 7), Ingredient("boards", 6), GLOBAL.Ingredient("rope", 5), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_cargo_placer", nil, nil, nil, true, 4) 
	musha_cargo.atlas = "images/inventoryimages/musha_cargo.xml"
local sail_pirate = GLOBAL.Recipe( "sail_pirate", {Ingredient("fabric", 3), Ingredient("bamboo", 3), Ingredient("charcoal", 1), }, RECIPETABS.MUSHA, {SCIENCE=2})
	sail_pirate.atlas = "images/inventoryimages/sail_pirate.xml"
local cannon_musha = GLOBAL.Recipe( "cannon_musha", {Ingredient("boatcannon", 1), Ingredient("flowerhat", 1), dust5 }, RECIPETABS.MUSHA, {SCIENCE=2})
	cannon_musha.atlas = "images/inventoryimages/cannon_musha.xml"	
	
--grass hut
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 2), Ingredient("cutgrass", 6), Ingredient("rope", 1), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
--dall
local moontree = GLOBAL.Recipe("moontree", {  glowdust6,GLOBAL.Ingredient("livinglog", 12), Ingredient("greengem", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
--oven
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("rocks", 5), Ingredient("nitre", 4), Ingredient("livinglog", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
--forge
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust6, Ingredient("gears", 2), Ingredient("livinglog", 6), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
--tent
local tent_musha = GLOBAL.Recipe("tent_musha", { dust3, Ingredient("lantern", 1), Ingredient("cutreeds", 14), Ingredient("log", 5), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"

--cristal
 local cristal = GLOBAL.Recipe( "cristal", {dust5}, RECIPETABS.MUSHA, {SCIENCE=2})
	cristal.atlas = "images/inventoryimages/cristal.xml"

--flute
 local musha_flute = GLOBAL.Recipe( "musha_flute", {dust5, Ingredient("vine", 4), Ingredient("antivenom", 4), Ingredient("amulet", 1)},  RECIPETABS.MUSHA, {SCIENCE=2})
	musha_flute.atlas = "images/inventoryimages/musha_flute.xml"

--phoenix weapon

 local mushasword_base = GLOBAL.Recipe( "mushasword_base", { Ingredient("iron", 2), Ingredient("machete", 1), glowdusts}, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword_base.atlas = "images/inventoryimages/mushasword_base.xml"

--fire
local mushasword_fire = GLOBAL.Recipe( "mushasword_fire", { bladeb, Ingredient("goldenmachete", 1), Ingredient("redgem", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_fire.atlas = "images/inventoryimages/mushasword_fire.xml"
--frost 
 local mushasword_frost = GLOBAL.Recipe( "mushasword_frost", { bladeb, Ingredient("goldenmachete", 1), Ingredient("bluegem", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_frost.atlas = "images/inventoryimages/mushasword_frost.xml"
--blade-bow
local bowm = GLOBAL.Recipe( "bowm", { blade_fire, Ingredient("venomgland", 2), dust3 }, RECIPETABS.MUSHA, {SCIENCE=1})
bowm.atlas = "images/inventoryimages/bowm.xml"
--spear
local phoenixspear = GLOBAL.Recipe( "phoenixspear", { blade_fire, blade_frost, dust3, Ingredient("alloy", 6) }, RECIPETABS.MUSHA, {SCIENCE=1})
phoenixspear.atlas = "images/inventoryimages/phoenixspear.xml"
--hammer
 local frosthammer = GLOBAL.Recipe( "frosthammer", { Ingredient("alloy", 10), Ingredient("bluegem", 15), Ingredient("livinglog", 3)}, RECIPETABS.MUSHA, {SCIENCE=1})
frosthammer.atlas = "images/inventoryimages/frosthammer.xml"
--axe
local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("dragon_scales", 1), Ingredient("purplegem", 20), Ingredient("greengem", 4), }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"

--armor

 local armor_mushaa = GLOBAL.Recipe( "armor_mushaa", {dust2, Ingredient("goldnugget", 8), Ingredient("pigskin", 1) }, RECIPETABS.MUSHA, {SCIENCE=0})
	armor_mushaa.atlas = "images/inventoryimages/armor_mushaa.xml"

 local broken_frosthammer = GLOBAL.Recipe( "broken_frosthammer", { Ingredient("armor_weevole", 1), Ingredient("vine", 8), Ingredient("bluegem", 3) }, RECIPETABS.MUSHA, {SCIENCE=1})
broken_frosthammer.atlas = "images/inventoryimages/broken_frosthammer.xml"	
	
 local frostback = GLOBAL.Recipe( "frostback", { broken,  Ingredient("chitin", 10), Ingredient("purplegem", 5),Ingredient("gears", 2)}, RECIPETABS.MUSHA, {SCIENCE=2})
frostback.atlas = "images/inventoryimages/frostback.xml"

 local pirateback = GLOBAL.Recipe( "pirateback", { armoraa, Ingredient("oinc", 100), Ingredient("greengem", 1) }, RECIPETABS.MUSHA, {SCIENCE=2})     
pirateback.atlas = "images/inventoryimages/pirateback.xml"

 local armor_mushab = GLOBAL.Recipe( "armor_mushab", {armoraa, Ingredient("purplegem", 8), Ingredient("orangegem", 6), Ingredient("yellowgem", 4)}, RECIPETABS.MUSHA, {SCIENCE=2})
	armor_mushab.atlas = "images/inventoryimages/armor_mushab.xml"

	
--hat
local hat_mwildcat = GLOBAL.Recipe( "hat_mwildcat", {  Ingredient("gasmaskhat", 1), Ingredient("minerhat", 1), Ingredient("alloy", 12) }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mwildcat.atlas = "images/inventoryimages/hat_mwildcat.xml"
	
 local hat_mbunny = GLOBAL.Recipe( "hat_mbunny", { Ingredient("walrus_tusk", 1), Ingredient("alloy", 4), Ingredient("purplegem", 2)  }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mbunny.atlas = "images/inventoryimages/hat_mbunny.xml"
	
 local hat_mprincess = GLOBAL.Recipe( "hat_mprincess", {amulet, Ingredient("oinc", 20), },  RECIPETABS.MUSHA, {SCIENCE=0})
	hat_mprincess.atlas = "images/inventoryimages/hat_mprincess.xml"
	
 local hat_mcrown = GLOBAL.Recipe( "hat_mcrown", {princess, Ingredient("pigcrownhat", 1), Ingredient("purplegem", 4) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mcrown.atlas = "images/inventoryimages/hat_mcrown.xml"

 local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {princess, Ingredient("snake_bone", 20), Ingredient("yellowgem", 6), Ingredient("goldnugget", 30), }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
	
--egg
--arong egg
local musha_egg_arong = GLOBAL.Recipe( "musha_egg_arong", { phoenix_egg },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg_arong.atlas = "images/inventoryimages/musha_egg_arong.xml"
--phoenix_egg
 local musha_egg = GLOBAL.Recipe( "musha_egg", { dust6, Ingredient("redgem", 8), Ingredient("bluegem", 6), Ingredient("greengem", 1) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg.atlas = "images/inventoryimages/musha_egg.xml"


local musha_eggs1 = GLOBAL.Recipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 2)}, RECIPETABS.MUSHA, {SCIENCE=0})  
musha_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local musha_eggs2 = GLOBAL.Recipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 5)}, RECIPETABS.MUSHA, {SCIENCE=1})  
musha_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local musha_eggs3 = GLOBAL.Recipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 15)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local musha_egg1 = GLOBAL.Recipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 25), GLOBAL.Ingredient("purplegem", 1)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local musha_egg2 = GLOBAL.Recipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 35), GLOBAL.Ingredient("purplegem", 3)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local musha_egg3 = GLOBAL.Recipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 45), GLOBAL.Ingredient("purplegem", 5)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local musha_egg8 = GLOBAL.Recipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 60), GLOBAL.Ingredient("purplegem", 8)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg8.atlas = "images/inventoryimages/musha_egg8.xml"

end

if player:HasTag("Recipe_veasy") then


require "recipe"
require "tuning"
--arrow
--local arrowm = GLOBAL.Recipe( "arrowm", { Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
--arrowm.atlas = "images/inventoryimages/arrowm.xml"
--dust

local glowdust = GLOBAL.Recipe( "glowdust", {Ingredient("wormlight", 1), Ingredient("ash", 1), Ingredient("honey", 1) }, RECIPETABS.MUSHA, {SCIENCE=0})
	glowdust.atlas = "images/inventoryimages/glowdust.xml"
	
local dummy_arrow0 = GLOBAL.Recipe( "dummy_arrow0",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow0.atlas = "images/inventoryimages/dummy_arrow0.xml"
local dummy_arrow1 = GLOBAL.Recipe( "dummy_arrow1",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow1.atlas = "images/inventoryimages/dummy_arrow1.xml"
local dummy_arrow2 = GLOBAL.Recipe( "dummy_arrow2",{ Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow2.atlas = "images/inventoryimages/dummy_arrow2.xml"
local dummy_arrow3 = GLOBAL.Recipe( "dummy_arrow3",{ broken_arrow2, Ingredient("twigs", 1)}, RECIPETABS.MUSHA, {SCIENCE=1})
dummy_arrow3.atlas = "images/inventoryimages/dummy_arrow3.xml"
--boat
local musha_cargo = GLOBAL.Recipe("musha_cargo", { GLOBAL.Ingredient("livinglog", 10), Ingredient("boards", 8), GLOBAL.Ingredient("rope", 6), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_cargo_placer", nil, nil, nil, true, 4) 
	musha_cargo.atlas = "images/inventoryimages/musha_cargo.xml"
local sail_pirate = GLOBAL.Recipe( "sail_pirate", {Ingredient("fabric", 4), Ingredient("bamboo", 3), Ingredient("charcoal", 2), }, RECIPETABS.MUSHA, {SCIENCE=2})
	sail_pirate.atlas = "images/inventoryimages/sail_pirate.xml"
local cannon_musha = GLOBAL.Recipe( "cannon_musha", {Ingredient("boatcannon", 1), Ingredient("flowerhat", 1), dust5 }, RECIPETABS.MUSHA, {SCIENCE=2})
	cannon_musha.atlas = "images/inventoryimages/cannon_musha.xml"	
	
--grass hut
 local musha_hut = GLOBAL.Recipe("musha_hut", {  GLOBAL.Ingredient("log", 4), Ingredient("cutgrass", 8), Ingredient("rope", 2), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "musha_hut_placer" )
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
--dall
local moontree = GLOBAL.Recipe("moontree", {  glowdust10,GLOBAL.Ingredient("livinglog", 15), Ingredient("greengem", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "moontree_placer" )
moontree.atlas = "images/inventoryimages/moontree.xml"
--oven
local musha_oven = GLOBAL.Recipe("musha_oven", { crystal, Ingredient("rocks", 10), Ingredient("nitre", 8), Ingredient("livinglog", 2), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "musha_oven_placer" )
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
--forge
local forge_musha = GLOBAL.Recipe("forge_musha", { glowdust10, Ingredient("gears", 4), Ingredient("livinglog", 8), }, RECIPETABS.MUSHA, {SCIENCE=2}, nil, "forge_musha_placer" )
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
--tent
local tent_musha = GLOBAL.Recipe("tent_musha", { dust6, Ingredient("lantern", 1), Ingredient("cutreeds", 20), Ingredient("log", 8), }, RECIPETABS.MUSHA, {SCIENCE=1}, nil, "tent_musha_placer" )
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"

--cristal
 local cristal = GLOBAL.Recipe( "cristal", {dust10}, RECIPETABS.MUSHA, {SCIENCE=2})
	cristal.atlas = "images/inventoryimages/cristal.xml"

--flute
 local musha_flute = GLOBAL.Recipe( "musha_flute", {dust10, Ingredient("vine", 8), Ingredient("antivenom", 6), Ingredient("amulet", 2)},  RECIPETABS.MUSHA, {SCIENCE=2})
	musha_flute.atlas = "images/inventoryimages/musha_flute.xml"

--phoenix weapon

 local mushasword_base = GLOBAL.Recipe( "mushasword_base", { Ingredient("iron", 2), Ingredient("machete", 1), glowdusts}, RECIPETABS.MUSHA, {SCIENCE=0})
mushasword_base.atlas = "images/inventoryimages/mushasword_base.xml"

--fire
local mushasword_fire = GLOBAL.Recipe( "mushasword_fire", { bladeb, Ingredient("goldenmachete", 1), Ingredient("redgem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_fire.atlas = "images/inventoryimages/mushasword_fire.xml"
--frost 
 local mushasword_frost = GLOBAL.Recipe( "mushasword_frost", { bladeb, Ingredient("goldenmachete", 1), Ingredient("bluegem", 2) }, RECIPETABS.MUSHA, {SCIENCE=1})
mushasword_frost.atlas = "images/inventoryimages/mushasword_frost.xml"
--blade-bow
local bowm = GLOBAL.Recipe( "bowm", { blade_fire, Ingredient("venomgland", 4), dust3 }, RECIPETABS.MUSHA, {SCIENCE=1})
bowm.atlas = "images/inventoryimages/bowm.xml"
--spear
local phoenixspear = GLOBAL.Recipe( "phoenixspear", { blade_fire, blade_frost, dust3, Ingredient("alloy", 12) }, RECIPETABS.MUSHA, {SCIENCE=1})
phoenixspear.atlas = "images/inventoryimages/phoenixspear.xml"
--hammer
 local frosthammer = GLOBAL.Recipe( "frosthammer", { Ingredient("alloy", 15), Ingredient("bluegem", 30), Ingredient("livinglog", 5)}, RECIPETABS.MUSHA, {SCIENCE=1})
frosthammer.atlas = "images/inventoryimages/frosthammer.xml"
--axe
local mushasword4 = GLOBAL.Recipe( "mushasword4", { Ingredient("dragon_scales", 2), Ingredient("purplegem", 30), Ingredient("greengem", 8), }, RECIPETABS.MUSHA, {SCIENCE=2})
mushasword4.atlas = "images/inventoryimages/mushasword4.xml"

--armor

 local armor_mushaa = GLOBAL.Recipe( "armor_mushaa", {dust3, Ingredient("goldnugget", 12), Ingredient("pigskin", 2) }, RECIPETABS.MUSHA, {SCIENCE=0})
	armor_mushaa.atlas = "images/inventoryimages/armor_mushaa.xml"

 local broken_frosthammer = GLOBAL.Recipe( "broken_frosthammer", { Ingredient("armor_weevole", 1), Ingredient("vine", 12), Ingredient("bluegem", 5) }, RECIPETABS.MUSHA, {SCIENCE=1})
broken_frosthammer.atlas = "images/inventoryimages/broken_frosthammer.xml"	
	
 local frostback = GLOBAL.Recipe( "frostback", { broken,  Ingredient("chitin", 20), Ingredient("purplegem", 8),Ingredient("gears", 3)}, RECIPETABS.MUSHA, {SCIENCE=2})
frostback.atlas = "images/inventoryimages/frostback.xml"

 local pirateback = GLOBAL.Recipe( "pirateback", { armoraa, Ingredient("oinc10", 20), Ingredient("oinc", 150), Ingredient("greengem", 1) }, RECIPETABS.MUSHA, {SCIENCE=2})     
pirateback.atlas = "images/inventoryimages/pirateback.xml"

 local armor_mushab = GLOBAL.Recipe( "armor_mushab", {armoraa, Ingredient("purplegem", 12), Ingredient("orangegem", 12), Ingredient("yellowgem", 8)}, RECIPETABS.MUSHA, {SCIENCE=2})
	armor_mushab.atlas = "images/inventoryimages/armor_mushab.xml"

	
--hat
local hat_mwildcat = GLOBAL.Recipe( "hat_mwildcat", {  Ingredient("gasmaskhat", 1), Ingredient("minerhat", 1), Ingredient("alloy", 20) }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mwildcat.atlas = "images/inventoryimages/hat_mwildcat.xml"
	
 local hat_mbunny = GLOBAL.Recipe( "hat_mbunny", { Ingredient("walrus_tusk", 1), Ingredient("alloy", 6), Ingredient("purplegem", 2)  }, RECIPETABS.MUSHA, {SCIENCE=1})
	hat_mbunny.atlas = "images/inventoryimages/hat_mbunny.xml"
	
 local hat_mprincess = GLOBAL.Recipe( "hat_mprincess", {amulet, Ingredient("oinc", 30), },  RECIPETABS.MUSHA, {SCIENCE=0})
	hat_mprincess.atlas = "images/inventoryimages/hat_mprincess.xml"
	
 local hat_mcrown = GLOBAL.Recipe( "hat_mcrown", {princess, Ingredient("pigcrownhat", 1), Ingredient("purplegem", 6) }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mcrown.atlas = "images/inventoryimages/hat_mcrown.xml"

 local hat_mphoenix = GLOBAL.Recipe( "hat_mphoenix", {princess, Ingredient("snake_bone", 40), Ingredient("yellowgem", 12), Ingredient("goldnugget", 40), }, RECIPETABS.MUSHA, {SCIENCE=2})
	hat_mphoenix.atlas = "images/inventoryimages/hat_mphoenix.xml"
	
--egg
--arong egg
local musha_egg_arong = GLOBAL.Recipe( "musha_egg_arong", { phoenix_egg },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg_arong.atlas = "images/inventoryimages/musha_egg_arong.xml"
--phoenix_egg
 local musha_egg = GLOBAL.Recipe( "musha_egg", { dust10, Ingredient("redgem", 12), Ingredient("bluegem", 8), Ingredient("greengem", 1) },  RECIPETABS.MUSHA, {SCIENCE=0})
	musha_egg.atlas = "images/inventoryimages/musha_egg.xml"


local musha_eggs1 = GLOBAL.Recipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 2)}, RECIPETABS.MUSHA, {SCIENCE=0})  
musha_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local musha_eggs2 = GLOBAL.Recipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 5)}, RECIPETABS.MUSHA, {SCIENCE=1})  
musha_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local musha_eggs3 = GLOBAL.Recipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 15)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local musha_egg1 = GLOBAL.Recipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 25), GLOBAL.Ingredient("purplegem", 1)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local musha_egg2 = GLOBAL.Recipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 35), GLOBAL.Ingredient("purplegem", 3)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local musha_egg3 = GLOBAL.Recipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 45), GLOBAL.Ingredient("purplegem", 5)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local musha_egg8 = GLOBAL.Recipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 60), GLOBAL.Ingredient("purplegem", 8)}, RECIPETABS.MUSHA, {SCIENCE=2})  
musha_egg8.atlas = "images/inventoryimages/musha_egg8.xml"


------------------------------------------------------------------------------------------------------------
end

end
end

AddSimPostInit(function(inst)
        if inst.prefab == "musha" then
                mushaPostInit(inst)
        end
end)

--warly's cookpot (portable cookpot)
if portable_recipe == "on" then
if CAPY_2 == 1 then

local function warlycookpot(inst)
	--local getplayer = GLOBAL.GetPlayer().prefab
	--inst.components.characterspecific:SetOwner(getplayer)
end
	--AddPrefabPostInit("portablecookpot", warlycookpot)
	--AddPrefabPostInit("portablecookpot_item", warlycookpot)
	
function warly_cookpot(inst)


local crystal = Ingredient( "cristal", 1)
crystal.atlas = "images/inventoryimages/cristal.xml"
local glowdusts = Ingredient( "glowdust", 1)
glowdusts.atlas = "images/inventoryimages/glowdust.xml"

if GLOBAL.SaveGameIndex:IsModeShipwrecked() then 
local portablecookpot_item = Recipe("portablecookpot_item", {Ingredient( "obsidian",5),crystal,Ingredient( "transistor",2)}, RECIPETABS.MUSHA, {SCIENCE=1})
portablecookpot_item.atlas = "images/inventoryimages/portablecookpot_item.xml"

elseif GLOBAL.SaveGameIndex:IsModePorkland() then 
local portablecookpot_item = Recipe("portablecookpot_item", {Ingredient( "alloy",5),crystal,Ingredient( "transistor",2)}, RECIPETABS.MUSHA, {SCIENCE=1})
portablecookpot_item.atlas = "images/inventoryimages/portablecookpot_item.xml"

else
local portablecookpot_item = Recipe("portablecookpot_item", {Ingredient( "thulecite",5),crystal,Ingredient( "transistor",2)}, RECIPETABS.MUSHA, {SCIENCE=1})
portablecookpot_item.atlas = "images/inventoryimages/portablecookpot_item.xml"

end
 
end 
end

AddPrefabPostInit("musha",warly_cookpot)
end

function make_tunacan(inst)
 
if GLOBAL.SaveGameIndex:IsModeShipwrecked() then 
local tunacan = Recipe("tunacan", {Ingredient("fish_raw", 1), Ingredient("charcoal", 1), Ingredient("honey", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
tunacan.atlas = "images/inventoryimages/tunacan.xml"

elseif GLOBAL.SaveGameIndex:IsModePorkland() then 
local tunacan = Recipe("tunacan", {Ingredient("fish", 1), Ingredient("charcoal", 1), Ingredient("nectar_pod", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
tunacan.atlas = "images/inventoryimages/tunacan.xml"

else
local tunacan = Recipe("tunacan", {Ingredient("fish", 2), Ingredient("charcoal", 1), Ingredient("honey", 1) }, RECIPETABS.MUSHA, {SCIENCE=1})
tunacan.atlas = "images/inventoryimages/tunacan.xml"
end end
AddPrefabPostInit("musha",make_tunacan)

--convert gem

function gem_purple(inst)
local glowdusts = Ingredient( "glowdust", 1)
glowdusts.atlas = "images/inventoryimages/glowdust.xml"
Recipe("redgem", {Ingredient( "purplegem",1),glowdusts,}, RECIPETABS.MUSHA, {SCIENCE=1})
Recipe("bluegem", {Ingredient( "purplegem",1),glowdusts, }, RECIPETABS.MUSHA, {SCIENCE=1})
end
function gem_color_basic(inst)
local glowdusts = Ingredient( "glowdust", 1)
glowdusts.atlas = "images/inventoryimages/glowdust.xml"
Recipe("redgem", {Ingredient( "bluegem",1),glowdusts,}, RECIPETABS.MUSHA, {SCIENCE=1})
Recipe("bluegem", {Ingredient( "redgem",1),glowdusts, }, RECIPETABS.MUSHA, {SCIENCE=1})
end
function gem_color(inst)
local glowdusts = Ingredient( "glowdust", 1)
glowdusts.atlas = "images/inventoryimages/glowdust.xml"
local dust5 = Ingredient( "glowdust", 5)
dust5.atlas = "images/inventoryimages/glowdust.xml"
Recipe("bluegem", {Ingredient( "redgem",1),glowdust}, RECIPETABS.MUSHA, {SCIENCE=0})
Recipe("redgem", {Ingredient( "bluegem",1),glowdust}, RECIPETABS.MUSHA, {SCIENCE=0})
Recipe("greengem",  {Ingredient("purplegem", 8),Ingredient( "goldnugget",15),dust5}, RECIPETABS.MUSHA, {SCIENCE=0})
Recipe("yellowgem", {Ingredient("purplegem", 8),Ingredient( "goldnugget",15),dust5}, RECIPETABS.MUSHA, {SCIENCE=0})
Recipe("orangegem", {Ingredient("purplegem", 8),Ingredient( "goldnugget",15),dust5}, RECIPETABS.MUSHA, {SCIENCE=0})
end


function glowberry(inst)
--local greenf = Ingredient( "green_fruit", 1)
--greenf.atlas = "images/inventoryimages/green_fruit.xml"

local greenf2 = Ingredient( "green_fruit_cooked", 1)
greenf2.atlas = "images/inventoryimages/green_fruit_cooked.xml"
Recipe("wormlight", {greenf2, Ingredient("seeds", 1) }, RECIPETABS.MUSHA, {SCIENCE=0})

end

AddPrefabPostInit("musha",glowberry)

if Cgems == "purple" then
AddPrefabPostInit("musha",gem_purple)
end
if Cgems == "color_b" then
AddPrefabPostInit("musha",gem_color_basic)
end
if Cgems == "color" then
AddPrefabPostInit("musha",gem_color)
end
if Cgems == "craft" then
AddPrefabPostInit("musha",gem_craft)
end