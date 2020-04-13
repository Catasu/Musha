
local LEVELS = GetModConfigData("mushalevel")
local SKILLS = GetModConfigData("mushaskill")
local VALKYRIE = GetModConfigData("valkyriec")
local LIGHTNING = GetModConfigData("powerattack")
local SHIELD = GetModConfigData("shielda")
local Shadow = GetModConfigData("bunsin")
local Dogs = GetModConfigData("dogs")
local YAMCHO = GetModConfigData("commandyamche")
local MEAT = GetModConfigData("monstermeat")
--local Mbadge = GetModConfigData("mushabadge")
local Frostone = GetModConfigData("frostseries")
local Smart = GetModConfigData("smartmusha")
local expx_LV = GetModConfigData("expx_LV")
local expx_DR = GetModConfigData("expx_DR")
local Difficult_status = GetModConfigData("difficultstatus")
local Difficult_damage = GetModConfigData("difficultdamage")
local DifficultDamage_Range = GetModConfigData("difficultdamage_range")
local DifficultSanity = GetModConfigData("difficultsanity")
local Difficult_sleep = GetModConfigData("difficultsleep")
local Difficult_music = GetModConfigData("difficultmusic")
local Difficult_tired = GetModConfigData("difficulttired")
local Dsniff = GetModConfigData("difficultsniff")
local Dmana = GetModConfigData("difficultmana")
local Collect = GetModConfigData("yamchecollect")
local Hold = GetModConfigData("visualhold")
local Moontree = GetModConfigData("moontree")
local Arong = GetModConfigData("arongrong")
local Sleeprincess = GetModConfigData("sleeping")
local Sacrifice = GetModConfigData("Yamresurrect")
local Yamche_growup = GetModConfigData("yamchegrowup")
local Yamche_growup_a = GetModConfigData("yamchegrowup_a")
local Recipecontrols = GetModConfigData("Recipe_control")
local moontree_stop = GetModConfigData("stop_spawning")
local frostblade3rd = GetModConfigData("frostblade3rd")
local bunny_visual = GetModConfigData("bunnyarmored")
local in_container =  GetModConfigData("incontainer")
local musha_in_container =  GetModConfigData("musha_incontainer")
local Diet = GetModConfigData("dietmusha")
local Dislike = GetModConfigData("favoritemusha")
local PuppyPrincess = GetModConfigData("princess_taste")
local Badge_type = GetModConfigData("badge_type")
local Assasin_On = GetModConfigData("AssasinOn")
local DLC2voice = GetModConfigData("changeDLC2voice")
local tuna_stacks = GetModConfigData("tunastacks")
local Swimer_musha = GetModConfigData("swimer")
local Mod_language =  GetModConfigData("modlanguage")

local ACTIONS = GLOBAL.ACTIONS

ACTIONS.ADDFUEL.priority = 4
ACTIONS.COOK.priority = 4
ACTIONS.GIVE.priority = 2
ACTIONS.USEITEM.priority = 2
--ACTIONS.RUMMAGE.priority = 1

local require = GLOBAL.require
local SpawnPrefab = GLOBAL.SpawnPrefab
--------------
local Widget = GLOBAL.require('widgets/widget')
local Image = GLOBAL.require('widgets/image')
local Text = GLOBAL.require('widgets/text')
local Badge = GLOBAL.require("widgets/badge")
--------------
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient

TECH = GLOBAL.TECH


PrefabFiles = {
"musha",
          "musha_small", 
          "musha_egg",
          "musha_egg1",
          "musha_egg2",
          "musha_egg3",
          "musha_eggs1",
          "musha_eggs2",
          "musha_eggs3",
          "musha_egg8",
     	  "frosthammer",
          "broken_frosthammer",
          "frostback",
          "hat_mbunny",
          "hat_mphoenix",
          "hat_mcrown",
          "hat_mprincess",
          "ghosthound",
          "ghosthound2",
          "armor_mushaa",
          "armor_mushab",
	"books",
	"shock_fx2",
	"groundpoundringfx",
	"glowdust",
	"mushasword",
	"mushasword_base",
	"mushasword_frost",
	"mushasword2",
	"mushasword3",
	"mushasword4",
	"musha_flute",
	"cristal",
	"forcefieldfxx",
	"exp",
	"exp1000",
	"shadowmusha",
	"tentacle_frost",
	"tentacle_shadow",
	"tunacan",
	"bedroll_straw",
	"bedroll_furry",
	"tent",
	"siestahut",
	"tent_musha",
	"lightning2",
	"lightning_blue",
	"moontree",
"moonnutdrake",
"moonnutdrake2",
"moonbush",
"moonlight_plant",
"assasin_webber",
"assasin_wilson",
"pirateback",
"glowberry_plant",
"musha_cargo",
"sail_pirate",
"cannon_musha",
"forge_musha",
"musha_spores",
"musha_spores2",
"musha_spores_fire",
"musha_treasure",
"musha_treasure2",
"musha_hut",
"mushasword_fire",
"musha_oven",
"musha_ovenfire",
"musha_ovenfire_cold",
"coldfirefire_yamche",

"mini_arong",
"musha_egg_arong",
"green_apple_plant",
"green_fruit",
"greenworm",

	"bowm",
	"bowm_projectile",
	"arrowm",
	"poisonbubble2",
	"debuff",
	"icespike_fx",
	"phoenixspear",
	"sparks2",
	"hat_mwildcat",
	
"musha_ferns",
"green_ferns",
"musha_ferns_light",
"musha_spin_fx",
"arrowm_broken",
"apple_berry",
"backpack_base",
"splash_water_yamche",

}


function shadowminion(inst)
 inst:AddTag("shadowminion")
end 
AddPrefabPostInit("shadowwaxwell", shadowminion)

function hiteffectsymbol_hound(inst)
 inst.components.combat.hiteffectsymbol = "hound_body"
end 
function hiteffectsymbol_frog(inst)
 inst.components.combat.hiteffectsymbol = "frogsack"
end 
function hiteffectsymbol_body(inst)
 inst.components.combat.hiteffectsymbol = "body"
end
AddPrefabPostInit("hound", hiteffectsymbol_hound)
AddPrefabPostInit("firehound", hiteffectsymbol_hound)
AddPrefabPostInit("icehound", hiteffectsymbol_hound)
AddPrefabPostInit("frog", hiteffectsymbol_frog)
AddPrefabPostInit("hound", hiteffectsymbol_body)

Assets = {
Asset("ANIM", "anim/ui_chester_shadow_3x4.zip"),
Asset("ANIM", "anim/musha_chest.zip"),
Asset( "ANIM", "anim/spellpower.zip" ),
Asset( "ANIM", "anim/stamina.zip" ),
Asset( "ANIM", "anim/fatigue.zip" ),
    Asset( "IMAGE", "images/saveslot_portraits/musha.tex" ),
    Asset( "IMAGE", "images/selectscreen_portraits/musha.tex" ),
    Asset( "IMAGE", "images/selectscreen_portraits/musha_silho.tex" ),
    Asset( "IMAGE", "bigportraits/musha.tex" ),
	Asset("IMAGE", "images/musha.tex"),
	Asset("IMAGE", "images/mushas.tex"),
	
Asset( "ANIM", "anim/musha_battle.zip"),
Asset( "ANIM", "anim/musha.zip"),
Asset( "ANIM", "anim/musha_normal.zip"),
Asset( "ANIM", "anim/musha_hunger.zip"),
	----
Asset( "ANIM", "anim/musha_battle_dst.zip"),
Asset( "ANIM", "anim/musha_dst.zip"),
Asset( "ANIM", "anim/musha_normal_dst.zip"),
Asset( "ANIM", "anim/musha_hunger_dst.zip"),

Asset( "ANIM", "anim/musha_full_sw2.zip"),
Asset( "ANIM", "anim/musha_normal_sw2.zip"),
Asset( "ANIM", "anim/musha_battle_sw2.zip"),
Asset( "ANIM", "anim/musha_hunger_sw2.zip"),
Asset( "ANIM", "anim/musha_full_dst_sw2.zip"),
Asset( "ANIM", "anim/musha_battle_dst_sw2.zip"),
Asset( "ANIM", "anim/musha_hunger_dst_sw2.zip"),

Asset( "ANIM", "anim/musha_battle_k_dst.zip"),
Asset( "ANIM", "anim/musha_full_k_dst.zip"),
Asset( "ANIM", "anim/musha_normal_dst_sw2.zip"),
Asset( "ANIM", "anim/musha_normal_k_dst.zip"),
Asset( "ANIM", "anim/musha_hunger_k_dst.zip"),		
Asset( "ANIM", "anim/musha_h.zip"),	
Asset( "ANIM", "anim/musha_full_k.zip"),	
Asset( "ANIM", "anim/musha_normal_k.zip"),
Asset( "ANIM", "anim/musha_battle_k.zip"),
Asset( "ANIM", "anim/musha_hunger_k.zip"),
--Asset( "ANIM", "anim/musha_old.zip"),
--Asset( "ANIM", "anim/musha_normal_old.zip"),
--Asset( "ANIM", "anim/musha_battle_old.zip"),
--Asset( "ANIM", "anim/musha_hunger_old.zip"),
--Asset( "ANIM", "anim/musha_full_p_old.zip"),
--Asset( "ANIM", "anim/musha_normal_p_old.zip"),
--Asset( "ANIM", "anim/musha_battle_p_old.zip"),
--Asset( "ANIM", "anim/musha_hunger_p_old.zip"),
Asset("SOUNDPACKAGE", "sound/bowm.fev"),
Asset("SOUND", "sound/bowm_sounds.fsb"),
Asset( "ANIM", "anim/musha_spin_fx.zip"),
----
Asset( "ANIM", "anim/tent_musha.zip"),
Asset( "ANIM", "anim/tent_musha_on.zip"),
Asset( "ANIM", "anim/tent_musha_broken.zip"),
Asset( "ANIM", "anim/forge_musha.zip"),
Asset( "ANIM", "anim/forge_musha_on.zip"),
Asset( "ANIM", "anim/forge_musha_broken.zip"),
Asset( "ANIM", "anim/musha_hut.zip"),
Asset( "ANIM", "anim/musha_hut_shdw.zip"),
----
Asset( "ANIM", "anim/musha_backpack4.zip"),
Asset( "ANIM", "anim/musha_backpack5.zip"),
Asset( "ANIM", "anim/DS_butterfly_g_s.zip"),
Asset( "ANIM", "anim/DS_butterfly_g2_s.zip"),
Asset( "ANIM", "anim/DS_butterfly_r_s.zip"),
Asset( "ANIM", "anim/DS_butterfly_p_s.zip"),

Asset( "ANIM", "anim/frostback.zip"),
    Asset("ANIM", "anim/musha_egg8.zip"),
    Asset("ANIM", "anim/musha_egg.zip"),
    Asset("ANIM", "anim/musha_egg1.zip"),
    Asset("ANIM", "anim/musha_egg2.zip"),
    Asset("ANIM", "anim/musha_egg3.zip"),
    Asset("ANIM", "anim/musha_eggs1.zip"),
    Asset("ANIM", "anim/musha_eggs2.zip"),
    Asset("ANIM", "anim/musha_eggs3.zip"),
    Asset("ANIM", "anim/musha_ice.zip"),
    Asset("ANIM", "anim/musha_small.zip"),
    Asset("ANIM", "anim/musha_teen.zip"),
    Asset("ANIM", "anim/musha_tall.zip"),
    Asset("ANIM", "anim/musha_tall2.zip"),
    Asset("ANIM", "anim/musha_tall3.zip"),
    Asset("ANIM", "anim/musha_tall4.zip"),
    Asset("ANIM", "anim/musha_tall5.zip"),
    Asset("ANIM", "anim/frosthammer.zip"),
    Asset("ANIM", "anim/swap_frosthammer.zip"),
	Asset("ANIM", "anim/swap_frosthammer2.zip"),
    Asset("ANIM", "anim/broken_frosthammer.zip"),
    Asset("ANIM", "anim/swap_frostback.zip"),
    Asset("ANIM", "anim/swap_frostpocket.zip"),
    Asset("ANIM", "anim/hat_mbunny.zip"),
    Asset("ANIM", "anim/hat_mbunny2.zip"),
	Asset("ANIM", "anim/hat_mbunnya.zip"),
    Asset("ANIM", "anim/hat_mbunnya2.zip"),
	Asset("ANIM", "anim/hat_mwildcat.zip"),
	Asset("ANIM", "anim/hat_mwildcat2.zip"),
	Asset("ATLAS", "images/inventoryimages/hat_mwildcat.xml"),
	Asset("IMAGE", "images/inventoryimages/hat_mwildcat.tex"),
    Asset("ANIM", "anim/hat_mphoenix.zip"),
    Asset("ANIM", "anim/hat_mphoenix2.zip"),
    Asset("ANIM", "anim/hat_mcrown.zip"),
    Asset("ANIM", "anim/hat_mprincess.zip"),
    Asset("ANIM", "anim/ghosthound.zip"),
    Asset("ANIM", "anim/armor_mushaa.zip"),
    Asset("ANIM", "anim/armor_mushab.zip"),
    Asset("ANIM", "anim/ui_chest_yamche0.zip"),
    Asset("ANIM", "anim/ui_chest_yamche1.zip"),
    Asset("ANIM", "anim/ui_chest_yamche2.zip"),
	Asset("ANIM", "anim/ui_piggyfrost_2x6.zip"),
    Asset("ANIM", "anim/hat_yamche.zip"),
	Asset("ANIM", "anim/hat_yamche_on.zip"),
    Asset("ANIM", "anim/hat_house.zip"),		
    Asset("ANIM", "anim/ui_frostsmall.zip"),
    Asset("ANIM", "anim/ui_chest_frosthammer.zip"),
    Asset("ANIM", "anim/ui_chest_frosthammer2.zip"),
    Asset("ANIM", "anim/ui_mushab_2x3.zip"),
    Asset("ANIM", "anim/shock_fx2.zip"),
    Asset("ANIM", "anim/forcefieldx.zip"),
	Asset("ANIM", "anim/bearger_ring_fx.zip"),
    Asset("ANIM", "anim/glowdust.zip"),
    Asset("ANIM", "anim/cristal.zip"),
    Asset("ANIM", "anim/exp.zip"),
    Asset("ANIM", "anim/musha_flute.zip"),
    Asset("ANIM", "anim/mushasword_base.zip"),
    Asset("ANIM", "anim/mushasword_frost.zip"),
    Asset("ANIM", "anim/mushasword.zip"),
    Asset("ANIM", "anim/mushasword2.zip"),
    Asset("ANIM", "anim/mushasword3.zip"),
    Asset("ANIM", "anim/mushasword4.zip"), --phoenixaxe
	
	Asset("ANIM", "anim/swap_phoenixaxe.zip"), 
	Asset("ANIM", "anim/swap_phoenixaxe2.zip"),
	Asset("ANIM", "anim/swap_phoenixaxe_broken.zip"),
	Asset("ANIM", "anim/phoenixspear.zip"),
	Asset("ANIM", "anim/swap_phoenixspear.zip"),
	Asset("ANIM", "anim/swap_phoenixspear2.zip"),
	Asset("ANIM", "anim/swap_phoenixspear_2r.zip"),
	Asset("ANIM", "anim/swap_phoenixspear_broken.zip"),
	Asset("ANIM", "anim/swap_phoenixspear3rd.zip"),
    Asset("ANIM", "anim/swap_mushasword_base.zip"),
    Asset("ANIM", "anim/swap_mushasword_frost1.zip"),
    Asset("ANIM", "anim/swap_mushasword_frost2.zip"),
    Asset("ANIM", "anim/swap_mushasword_frost3.zip"),
    Asset("ANIM", "anim/swap_mushasword.zip"),
    Asset("ANIM", "anim/swap_mushasword2.zip"),
    Asset("ANIM", "anim/swap_mushasword3.zip"),
    Asset("ANIM", "anim/tentacle_frost.zip"),
	Asset("ANIM", "anim/lightning_blue.zip"),
	
	Asset("ANIM", "anim/leif_moon_spring_build.zip"),
	Asset("ANIM", "anim/leif_moon_build.zip"),
	Asset("ANIM", "anim/leif_moon_fall_build.zip"),
	Asset("ANIM", "anim/leif_moon_winter_build.zip"),

	Asset("ANIM", "anim/moonbush.zip"),
	Asset("ANIM", "anim/moondrake_build.zip"),
	Asset("ANIM", "anim/moondrake2_build.zip"),

Asset("ANIM", "anim/cook_pot_food.zip"),
Asset("ANIM", "anim/cook_pot_warly.zip"),
Asset("ANIM", "anim/swap_pirate_booty_bag.zip"),
Asset("ANIM", "anim/swap_pirate_musha_bag.zip"),
Asset("ANIM", "anim/musha_cargo_build.zip"),
Asset("ANIM", "anim/swap_sail_pirates.zip"),
Asset("ANIM", "anim/swap_musha_cannon0.zip"),
Asset("ANIM", "anim/swap_musha_cannon.zip"),
Asset("ANIM", "anim/worm.zip"),
Asset("ANIM", "anim/mushroom_spore_blue.zip"),
Asset("ANIM", "anim/mushroom_spore_red.zip"),
Asset("ANIM", "anim/mushroom_spore.zip"),
Asset("ANIM", "anim/musha_oven.zip"),
Asset("ANIM", "anim/musha_oven_open.zip"),
Asset("ANIM", "anim/musha_oven_fire.zip"),
Asset("ANIM", "anim/musha_oven_fire_cold.zip"),
Asset("ANIM", "anim/coldfire_yamchefire.zip"),
	Asset("ANIM", "anim/messagebottle.zip"),	
	Asset("ANIM", "anim/swap_telescope.zip"),	
	Asset( "ANIM", "anim/book_uniqueitem_swap.zip" ),
    Asset("ANIM", "anim/beefalo_actions_domestic.zip"),
	Asset("ANIM", "anim/beefalo_actions_quirky.zip"),
 	Asset("ANIM", "anim/arong_baby_build.zip"),
	Asset("ANIM", "anim/arong_mini1_build.zip"),
	Asset("ANIM", "anim/arong_mini2_build.zip"),
	Asset("ANIM", "anim/arong_mini3_build.zip"),
	Asset("ANIM", "anim/arong_mini4_build.zip"),
	Asset("ANIM", "anim/arong_mini4_v_build.zip"),
	Asset("ANIM", "anim/arong_grow1_build.zip"),
	Asset("ANIM", "anim/arong_grow1_v_build.zip"),
	Asset("ANIM", "anim/arong_basic.zip"),
	Asset("ANIM", "anim/arong_actions.zip"),
	Asset("ANIM", "anim/beefalo_fx.zip"),
	Asset("ANIM", "anim/musha_egg_arong.zip"),
	Asset("ANIM", "anim/grassgreen_build.zip"),
	Asset("ANIM", "anim/green_apple.zip"),
	Asset("ANIM", "anim/green_fruit.zip"),	
	Asset("ANIM", "anim/green_fruit_cooked.zip"),	
	Asset("ANIM", "anim/tuna.zip"),	
--bow	
	Asset("ANIM", "anim/arrowm.zip"),
	Asset("ANIM", "anim/bowm.zip"),
    Asset("ANIM", "anim/swap_bowm.zip"),
	Asset("ANIM", "anim/swap_bowm2.zip"),
	Asset("ANIM", "anim/swap_bowm3.zip"),
	Asset("ANIM", "anim/swap_bowm_boost.zip"),
	Asset("ANIM", "anim/swap_bowm_broken.zip"),
    Asset("ATLAS", "images/inventoryimages/bowm.xml"),
    Asset("IMAGE", "images/inventoryimages/bowm.tex"),
    Asset("ATLAS", "images/inventoryimages/arrowm.xml"),
    Asset("IMAGE", "images/inventoryimages/arrowm.tex"),
    Asset("ATLAS", "images/inventoryimages/dummy_arrow0.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow0.tex"),
	Asset("ATLAS", "images/inventoryimages/dummy_arrow1.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow1.tex"),
    Asset("ATLAS", "images/inventoryimages/dummy_arrow2.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow2.tex"),
    Asset("ATLAS", "images/inventoryimages/dummy_arrow3.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow3.tex"),
    Asset("ATLAS", "images/inventoryimages/arrowm_broken.xml"),
    Asset("IMAGE", "images/inventoryimages/arrowm_broken.tex"),
	Asset("ANIM", "anim/poison.zip"),
	Asset("ANIM", "anim/debuff_spark.zip"),
	Asset("ANIM", "anim/debuff_spark_0.zip"),
	Asset("ANIM", "anim/debuff_frozen.zip"),
	Asset("ANIM", "anim/debuff_blood.zip"),
	Asset("ANIM", "anim/icespikes.zip"),
 -------------------
	Asset("IMAGE", "images/inventoryimages/musha_egg.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg1.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg2.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg3.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_eggs1.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_eggs2.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_eggs3.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_cracked.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_cracked1.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_cracked2.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_cracked3.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_crackeds1.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_crackeds2.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_crackeds3.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_cooked.tex"),

	Asset("IMAGE", "images/inventoryimages/musha_egg8.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_cracked8.tex"),

	Asset("IMAGE", "images/inventoryimages/frosthammer.tex"),
	Asset("IMAGE", "images/inventoryimages/broken_frosthammer.tex"),
	Asset("IMAGE", "images/inventoryimages/frostback.tex"),
	Asset("IMAGE", "images/inventoryimages/hat_mbunny.tex"),
	Asset("IMAGE", "images/inventoryimages/hat_mphoenix.tex"),
	Asset("IMAGE", "images/inventoryimages/hat_mcrown.tex"),
	Asset("IMAGE", "images/inventoryimages/hat_mprincess.tex"),
	Asset("IMAGE", "images/inventoryimages/armor_mushaa.tex"),
	Asset("IMAGE", "images/inventoryimages/armor_mushab.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_flute.tex"),
	Asset("IMAGE", "images/inventoryimages/mushasword_base.tex"),
	Asset("IMAGE", "images/inventoryimages/mushasword_frost.tex"),
	Asset("IMAGE", "images/inventoryimages/mushasword.tex"),
	Asset("IMAGE", "images/inventoryimages/mushasword2.tex"),
	Asset("IMAGE", "images/inventoryimages/mushasword3.tex"),
	Asset("IMAGE", "images/inventoryimages/mushasword4.tex"),
	Asset("IMAGE", "images/inventoryimages/phoenixspear.tex"),
	
	Asset("IMAGE", "images/inventoryimages/blade_b.tex"),
	Asset("IMAGE", "images/inventoryimages/blade_1.tex"),
	Asset("IMAGE", "images/inventoryimages/blade_2.tex"),
	Asset("IMAGE", "images/inventoryimages/blade_3.tex"),
	Asset("IMAGE", "images/inventoryimages/blade_4.tex"),
	Asset("IMAGE", "images/inventoryimages/blade_f.tex"),
	Asset("IMAGE", "images/inventoryimages/glowdust.tex"),
	Asset("IMAGE", "images/inventoryimages/cristal.tex"),
	Asset("IMAGE", "images/inventoryimages/exp.tex"),
	Asset("IMAGE", "images/mushatab.tex"),
	Asset("ATLAS", "images/mushatab.xml"),
	Asset("ATLAS", "images/inventoryimages/tent_musha.xml"),
	Asset("ATLAS", "images/musha.xml"),
	Asset("ATLAS", "images/mushas.xml"),
	Asset( "ATLAS", "images/saveslot_portraits/musha.xml" ),
    Asset( "ATLAS", "images/selectscreen_portraits/musha.xml" ),
    Asset( "ATLAS", "images/selectscreen_portraits/musha_silho.xml" ),
    Asset( "ATLAS", "bigportraits/musha.xml" ),
	Asset("ATLAS", "images/inventoryimages/frosthammer.xml"),
	Asset("ATLAS", "images/inventoryimages/broken_frosthammer.xml"),
	Asset("ATLAS", "images/inventoryimages/frostback.xml"),
	Asset("ATLAS", "images/inventoryimages/hat_mbunny.xml"),
	Asset("ATLAS", "images/inventoryimages/hat_mphoenix.xml"),
	Asset("ATLAS", "images/inventoryimages/hat_mcrown.xml"),
	Asset("ATLAS", "images/inventoryimages/hat_mprincess.xml"),
	Asset("ATLAS", "images/inventoryimages/armor_mushaa.xml"),
	Asset("ATLAS", "images/inventoryimages/armor_mushab.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_flute.xml"),
	Asset("ATLAS", "images/inventoryimages/mushasword_base.xml"),
	Asset("ATLAS", "images/inventoryimages/mushasword_frost.xml"),
	Asset("ATLAS", "images/inventoryimages/mushasword.xml"),
	Asset("ATLAS", "images/inventoryimages/mushasword2.xml"),
	Asset("ATLAS", "images/inventoryimages/mushasword3.xml"),
	Asset("ATLAS", "images/inventoryimages/mushasword4.xml"),
	Asset("ATLAS", "images/inventoryimages/phoenixspear.xml"),
	
	Asset("ATLAS", "images/inventoryimages/blade_b.xml"),
	Asset("ATLAS", "images/inventoryimages/blade_1.xml"),
	Asset("ATLAS", "images/inventoryimages/blade_2.xml"),
	Asset("ATLAS", "images/inventoryimages/blade_3.xml"),
	Asset("ATLAS", "images/inventoryimages/blade_4.xml"),
	Asset("ATLAS", "images/inventoryimages/blade_f.xml"),
	
	Asset("ATLAS", "images/inventoryimages/musha_egg8.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_cracked8.xml"),

	Asset("ATLAS", "images/inventoryimages/musha_egg.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg1.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg2.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg3.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_cracked.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_cracked1.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_cracked2.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_cracked3.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_eggs1.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_eggs2.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_eggs3.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_cracked.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_crackeds1.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_crackeds2.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_crackeds3.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_cooked.xml"),
	
	Asset( "IMAGE", "images/inventoryimages/lesserf.tex" ),
	Asset( "ATLAS", "images/inventoryimages/lesserf.xml" ),
	Asset("ATLAS", "images/inventoryimages/glowdust.xml"),
	Asset("ATLAS", "images/inventoryimages/cristal.xml"),
	Asset("ATLAS", "images/inventoryimages/exp.xml"),
	Asset("ATLAS", "images/status_stamina.xml"),
	Asset( "IMAGE", "images/inventoryimages/moontree.tex" ),
	Asset( "ATLAS", "images/inventoryimages/moontree.xml" ),
	Asset( "IMAGE", "images/inventoryimages/tunacan.tex" ),
	Asset( "ATLAS", "images/inventoryimages/tunacan.xml" ),
	Asset( "IMAGE", "images/inventoryimages/portablecookpot_item.tex" ),
	Asset( "ATLAS", "images/inventoryimages/portablecookpot_item.xml" ),	
	Asset( "IMAGE", "images/inventoryimages/pirateback.tex" ),
	Asset( "ATLAS", "images/inventoryimages/pirateback.xml" ),	
	Asset( "IMAGE", "images/inventoryimages/sail_pirate.tex" ),
	Asset( "ATLAS", "images/inventoryimages/sail_pirate.xml" ),		
	Asset( "IMAGE", "images/inventoryimages/musha_cargo.tex" ),
	Asset( "ATLAS", "images/inventoryimages/musha_cargo.xml" ),		
	Asset( "IMAGE", "images/inventoryimages/cannon_musha.tex" ),
	Asset( "ATLAS", "images/inventoryimages/cannon_musha.xml" ),	
	Asset("ATLAS", "images/inventoryimages/forge_musha.xml"),	
	Asset("ATLAS", "images/inventoryimages/musha_hut.xml"),	
	Asset("ATLAS", "images/inventoryimages/musha_oven.xml"),
	
	Asset("IMAGE", "images/inventoryimages/arongbaby.tex"),
	Asset("ATLAS", "images/inventoryimages/arongbaby.xml"),
	Asset("IMAGE", "images/inventoryimages/mini_arong.tex"),
	Asset("ATLAS", "images/inventoryimages/mini_arong.xml"),
	Asset("IMAGE", "images/inventoryimages/mini_arong2.tex"),
	Asset("ATLAS", "images/inventoryimages/mini_arong2.xml"),
	Asset("IMAGE", "images/inventoryimages/grow_arong.tex"),
	Asset("ATLAS", "images/inventoryimages/grow_arong.xml"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_arong.xml"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_arong.tex"),
	Asset("IMAGE", "images/inventoryimages/musha_egg_cracked_arong.tex"),
	Asset("ATLAS", "images/inventoryimages/musha_egg_cracked_arong.xml"),
	Asset("IMAGE", "images/inventoryimages/green_fruit.tex"),
	Asset("ATLAS", "images/inventoryimages/green_fruit.xml"),
	Asset("ATLAS", "images/inventoryimages/green_fruit_cooked.xml"),
	Asset("IMAGE", "images/inventoryimages/green_fruit_cooked.tex"),

	Asset("IMAGE", "images/inventoryimages/x_mark.tex"),
	Asset("ATLAS", "images/inventoryimages/x_mark.xml"),	
	Asset("IMAGE", "images/inventoryimages/musha_mark.tex"),
	Asset("ATLAS", "images/inventoryimages/musha_mark.xml"),	
	Asset("IMAGE", "images/inventoryimages/tunacan.tex"),
	Asset("ATLAS", "images/inventoryimages/tunacan.xml"),	
	Asset("IMAGE", "images/inventoryimages/tunacan_open.tex"),
	Asset("ATLAS", "images/inventoryimages/tunacan_open.xml"),	
	
--yamche

Asset("IMAGE", "images/inventoryimages/musha_small.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teen.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr6.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr6.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp6.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp7.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rpice.tex"),

Asset("ATLAS", "images/inventoryimages/musha_small.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teen.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr6.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr6.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp6.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp7.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rpice.xml"),	

	Asset("IMAGE", "images/sleep_images/empty.tex"),
	Asset("ATLAS", "images/sleep_images/empty.xml"),	
	
}

modimport ("scripts/tuning_musha.lua")
modimport ("scripts/musha_play.lua")
modimport("scripts/widgets/spellpower_statusdisplays.lua")
modimport("scripts/widgets/fatigue_sleep_statusdisplays.lua")
modimport("scripts/widgets/stamina_sleep_statusdisplays.lua")
modimport("scripts/difficulty_monster.lua")
modimport("scripts/musha_recipes.lua")
modimport("scripts/musha_start.lua")
modimport("scripts/musha_actions.lua")
modimport("scripts/musha_adds_comp.lua")
------working compatible states
--modimport("scripts/musha_states.lua")

local STRINGS = GLOBAL.STRINGS


------working DIALOGUE---
-- language with DST

--modimport("scripts/strings_musha_en.lua")
--STRINGS.CHARACTERS.MUSHA = require "speech_musha_en"
	
if Mod_language == "auto" then
	
	 KOR = 0
	 CHA = 0
	

	for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
	 language = GLOBAL.KnownModIndex:GetModInfo(moddir).name
	if language == "Korean Translation" then 
	KOR = 1
	elseif language == "Chinese" or language == "L.M.U汉化1.2" then
	CHA = 1
	end 
	end 
	
	if GLOBAL.KnownModIndex:IsModEnabled("workshop-1572028757") then
		KOR = 1
	elseif GLOBAL.KnownModIndex:IsModEnabled("workshop-725621177") or GLOBAL.KnownModIndex:IsModEnabled("workshop-874857181") then
		CHA = 1
	end
	

	if KOR == 1 then
	modimport("scripts/strings_musha_ko.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_ko"
	elseif CHA == 1 then
	modimport("scripts/strings_musha_cn.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_cn"
	else
	modimport("scripts/strings_musha_en.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_en"
	end

elseif Mod_language == "korean" then
	modimport("scripts/strings_musha_ko.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_ko"
elseif Mod_language == "chinese" then
	modimport("scripts/strings_musha_cn.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_cn"
elseif Mod_language == "english" then
	modimport("scripts/strings_musha_en.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_en"	

end


-- comfortable DLC
-- dlcsupport

local ROG = 0
 if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then  
		ROG = 1
end 

local CAPY = 0
 if GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then  
		CAPY = 1
end 

local CAPY_2 = 0
 if GLOBAL.IsDLCInstalled(GLOBAL.CAPY_DLC) then  
		CAPY_2 = 1
end

local PORK = 0
 if GLOBAL.IsDLCEnabled(GLOBAL.PORKLAND_DLC) then  
		PORK = 1
end 

--[[
function DLC(inst)

if GLOBAL.SaveGameIndex:IsModePorkland() or GLOBAL.SaveGameIndex:GetCurrentMode() == "porkland" then	
inst.DLC3 = true
inst.DLC2 = true
inst:AddTag("DLC2")
inst.DLC = true
inst:AddTag("DLC")
		
elseif GLOBAL.SaveGameIndex:IsModeShipwrecked() and (GLOBAL.SaveGameIndex:GetCurrentMode() == "shipwrecked" or GLOBAL.SaveGameIndex:GetCurrentMode() == "volcano") then
inst.DLC2 = true
inst:AddTag("DLC2")
inst.DLC = true
inst:AddTag("DLC")
		
elseif (GLOBAL.SaveGameIndex:GetCurrentMode() == "survival" or GLOBAL.SaveGameIndex:GetCurrentMode() == "cave") then
	if GLOBAL.GetPlayer().components.moisture then
	inst.DLC = true
	inst:AddTag("DLC")
	end 
	
end
end]]

function DLC(inst)
if GLOBAL.SaveGameIndex:IsModePorkland() or GLOBAL.SaveGameIndex:GetCurrentMode() == "porkland" then	
		inst.DLC3 = true
		inst.DLC2 = true
		inst:AddTag("DLC2")
		inst.DLC = true
		inst:AddTag("DLC")
		
elseif GLOBAL.SaveGameIndex:IsModeShipwrecked() or (GLOBAL.SaveGameIndex:GetCurrentMode() == "shipwrecked" or GLOBAL.SaveGameIndex:GetCurrentMode() == "volcano") then
	if not GLOBAL.GetPlayer().components.shopper then
		inst.DLC2 = true
		inst:AddTag("DLC2")
		inst.DLC = true
		inst:AddTag("DLC")
	elseif GLOBAL.GetPlayer().components.shopper then
		inst.DLC3 = true
		inst.DLC2 = true
		inst:AddTag("DLC2")
		inst.DLC = true
		inst:AddTag("DLC")
	end
elseif (GLOBAL.SaveGameIndex:GetCurrentMode() == "survival" or GLOBAL.SaveGameIndex:GetCurrentMode() == "cave") then
	
	if GLOBAL.GetPlayer().components.moisture and not GLOBAL.GetPlayer().components.poisonable and not GLOBAL.GetPlayer().components.shopper then
		inst.DLC = true
		inst:AddTag("DLC")
		
	elseif GLOBAL.GetPlayer().components.poisonable and not GLOBAL.GetPlayer().components.shopper then
		inst.DLC2 = true
		inst:AddTag("DLC2")
		inst.DLC = true
		inst:AddTag("DLC")
		
	elseif GLOBAL.GetPlayer().components.shopper then
		inst.DLC3 = true
		inst.DLC2 = true
		inst:AddTag("DLC2")
		inst.DLC = true
		inst:AddTag("DLC")
		
	end
end
end

function Assasin_enabler(inst)
if Assasin_On == "off" then
inst.no_assasin = true
end end
AddPrefabPostInit("musha", Assasin_enabler)


function Assasin_enabler(inst)
if Assasin_On == "off" then
inst.no_assasin = true
end end

function tentacle_arm(inst)
inst:AddTag("no_exp")
end 
AddPrefabPostInit("tentacle_pillar_arm", tentacle_arm)

function yamche_blue(inst)
inst:AddTag("icecream")
end 
function yamche_fire(inst)
inst:AddTag("hotchili")
end 
AddPrefabPostInit("hotchili", yamche_fire)
AddPrefabPostInit("icecream", yamche_blue)

function grass(inst)
inst:AddTag("greenygrass")
end 
AddPrefabPostInit("grass", grass)

function Musha_voice(inst)
	if DLC2voice == "walani" then
	if CAPY_2 == 1 then
	inst.change_voice = true
	if inst.components.poisonable then 
	inst.soundsname = "walani"
	inst.talker_path_override = "dontstarve_DLC002/characters/"
	end end end
end

AddPrefabPostInit("musha", DLC)
AddPrefabPostInit("assasin_webber", DLC)
AddPrefabPostInit("musha", Musha_voice)
AddPrefabPostInit("bedroll_straw", DLC)
AddPrefabPostInit("bedroll_furry", DLC)
AddPrefabPostInit("ghosthound", DLC)
AddPrefabPostInit("ghosthound2", DLC)
AddPrefabPostInit("shadowmusha", DLC)
AddPrefabPostInit("musha_flute", DLC)

AddPrefabPostInit("hat_mbunny", DLC)
AddPrefabPostInit("hat_mphoenix", DLC)
--AddPrefabPostInit("frostback", DLC)
AddPrefabPostInit("mushasword", DLC)
AddPrefabPostInit("mushasword2", DLC)
AddPrefabPostInit("mushasword3", DLC)
AddPrefabPostInit("mushasword4", DLC)
AddPrefabPostInit("mushasword_frost", DLC)
AddPrefabPostInit("frosthammer", DLC)
AddPrefabPostInit("musha_oven", DLC)
AddPrefabPostInit("musha_spin_fx", DLC)

function never_eat(inst)
        inst:AddTag("no_edible")
		end
AddPrefabPostInit("powcake", never_eat)
AddPrefabPostInit("mandrake", never_eat)
AddPrefabPostInit("cookedmandrake", never_eat)

function DLC_water(inst)
if GLOBAL.SaveGameIndex:IsModeShipwrecked() or GLOBAL.SaveGameIndex:IsModePorkland() or GLOBAL.GetPlayer().components.moisture then

	inst:AddTag("waterproofer")
    inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0
    inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(TUNING.INSULATION_MED)
    inst.components.insulator:SetSummer()
end
end

function DLC_water2(inst)
if GLOBAL.SaveGameIndex:IsModeShipwrecked() or GLOBAL.SaveGameIndex:IsModePorkland() or GLOBAL.GetPlayer().components.moisture then

    inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0
    inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(TUNING.INSULATION_LARGE)
end
end

function DLC_water3(inst)
if GLOBAL.SaveGameIndex:IsModeShipwrecked() or GLOBAL.SaveGameIndex:IsModePorkland() or GLOBAL.GetPlayer().components.moisture then

    inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0
end
end

AddPrefabPostInit("frostback", DLC_water)
AddPrefabPostInit("broken_frosthammer", DLC_water)
AddPrefabPostInit("mushasword_frost", DLC_water3)
AddPrefabPostInit("frosthammer", DLC_water3)
AddPrefabPostInit("mushasword", DLC_water3)
AddPrefabPostInit("mushasword2", DLC_water3)
AddPrefabPostInit("mushasword3", DLC_water3)
AddPrefabPostInit("mushasword4", DLC_water3)
AddPrefabPostInit("mushasword_fire", DLC_water3)
AddPrefabPostInit("mushasword_frost", DLC_water3)
AddPrefabPostInit("phoenixspear", DLC_water3)
AddPrefabPostInit("bowm", DLC_water3)

AddPrefabPostInit("armor_mushab", DLC_water2)

AddPrefabPostInit("armor_mushaa", DLC_water3)
AddPrefabPostInit("hat_mphoenix", DLC_water3)
AddPrefabPostInit("hat_mprincess", DLC_water3)
AddPrefabPostInit("hat_mcrown", DLC_water3)
AddPrefabPostInit("mushasword_base", DLC_water3)
AddPrefabPostInit("pirateback", DLC_water3)
AddPrefabPostInit("hat_mwildcat", DLC_water)

--AddPrefabPostInit("hat_mbunny", DLC_water3)

function Yam_resurrect(inst)
if Sacrifice == "off" then
		inst:AddTag("no_sacrifice")
end end
AddPrefabPostInit("musha", Yam_resurrect)

function difficult_Recipes(inst)
if Recipecontrols == "normal" then
inst:AddTag("Recipe_normal")
elseif Recipecontrols == "easy" then
inst:AddTag("Recipe_easy")
elseif Recipecontrols == "veasy" then
inst:AddTag("Recipe_veasy")
end end
AddPrefabPostInit("musha", difficult_Recipes)

function Difficulty_sanity(inst)
  if DifficultSanity == "easy" then
 inst.easys = true
	end
 if DifficultSanity == "normal" then
 inst.normals = true
	end
 if DifficultSanity == "hard" then
 inst.hards = true
	end
 if DifficultSanity == "hardcore" then
 inst.hardcores = true
	end
end 
 
AddPrefabPostInit("musha", Difficulty_sanity)


--GetPlayer = GLOBAL.GetPlayer

table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "musha")


function electric_weapon(inst)
        inst:AddTag("electric_weapon")
end
AddPrefabPostInit("nightstick", electric_weapon)


function no_target(inst)
        inst:AddTag("no_target")
end
AddPrefabPostInit("slurtlehole", no_target)

function arms(inst)
        inst:AddTag("arm")
end
AddPrefabPostInit("tentacle_pillar_arm", arms)


------------
AddMinimapAtlas("images/inventoryimages/musha_chest.xml")
AddMinimapAtlas("images/musha.xml")
AddMinimapAtlas("images/mushas.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg8.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked8.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg1.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked1.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg2.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked2.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg3.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked3.xml")
AddMinimapAtlas("images/inventoryimages/musha_eggs1.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_crackeds1.xml")
AddMinimapAtlas("images/inventoryimages/musha_eggs2.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_crackeds2.xml")
AddMinimapAtlas("images/inventoryimages/musha_eggs3.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_crackeds3.xml")
AddMinimapAtlas("images/inventoryimages/musha_small.xml")
AddMinimapAtlas("images/inventoryimages/musha_teen.xml")
AddMinimapAtlas("images/inventoryimages/musha_tall.xml")
AddMinimapAtlas("images/inventoryimages/frosthammer.xml")
AddMinimapAtlas("images/inventoryimages/frostback.xml")
AddMinimapAtlas("images/inventoryimages/broken_frosthammer.xml")
AddMinimapAtlas("images/inventoryimages/mushasword_base.xml")
AddMinimapAtlas("images/inventoryimages/mushasword.xml")
AddMinimapAtlas("images/inventoryimages/mushasword2.xml")
AddMinimapAtlas("images/inventoryimages/mushasword3.xml")
AddMinimapAtlas("images/inventoryimages/mushasword4.xml")
AddMinimapAtlas("images/inventoryimages/hat_mwildcat.xml")
AddMinimapAtlas("images/inventoryimages/blade_f.xml")
AddMinimapAtlas("images/inventoryimages/blade_b.xml")
AddMinimapAtlas("images/inventoryimages/blade_1.xml")
AddMinimapAtlas("images/inventoryimages/blade_2.xml")
AddMinimapAtlas("images/inventoryimages/blade_3.xml")
AddMinimapAtlas("images/inventoryimages/blade_4.xml")
AddMinimapAtlas("images/inventoryimages/cristal.xml")
AddMinimapAtlas("images/inventoryimages/exp.xml")
AddMinimapAtlas("images/inventoryimages/moontree.xml")
AddMinimapAtlas("images/inventoryimages/pirateback.xml")
AddMinimapAtlas("images/inventoryimages/musha_cargo.xml")
AddMinimapAtlas("images/inventoryimages/forge_musha.xml")
AddMinimapAtlas("images/inventoryimages/tent_musha.xml")
AddMinimapAtlas("images/inventoryimages/musha_hut.xml")
AddMinimapAtlas("images/inventoryimages/musha_oven.xml")
AddMinimapAtlas("images/inventoryimages/arongbaby.xml")
AddMinimapAtlas("images/inventoryimages/mini_arong.xml")
AddMinimapAtlas("images/inventoryimages/mini_arong2.xml")
AddMinimapAtlas("images/inventoryimages/grow_arong.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_arong.xml")
AddMinimapAtlas("images/inventoryimages/x_mark.xml")
AddMinimapAtlas("images/inventoryimages/musha_mark.xml")
AddMinimapAtlas("images/inventoryimages/bowm.xml")
AddMinimapAtlas("images/inventoryimages/phoenixspear.xml")

local function coffee(inst)
	 inst:AddTag("coffee")
end 
local function coffeebeans(inst)
	 inst:AddTag("coffeebeans")
end 

local function green_mush(inst)

	 inst:AddComponent("follower")
	 inst:AddTag("mushrooms")
end 

local function veggie(inst)

	 inst:AddComponent("follower")
	 inst:AddTag("carrot")
end 
AddPrefabPostInit("carrot_planted", veggie)
AddPrefabPostInit("green_mushroom", green_mush)
AddPrefabPostInit("coffee", coffee)
AddPrefabPostInit("coffeebeans", coffeebeans)




----------------------------------------------

function Yamche_auto_growup(inst)
if Yamche_growup_a == "auto" then
	inst.growup_auto = true
end end
AddPrefabPostInit("musha", Yamche_auto_growup)

local function yamche_growup_key(inst)
local inst = GLOBAL.GetPlayer()
----------------------------------------------

local inst = GLOBAL.GetPlayer()
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"phoenix"})
for k,v in pairs(ents) do

if not v.im_ready then

if v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("phoenix") == 0 and not v.hat then
if v.components.sleeper:IsAsleep() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_FOLLOW2)
v.components.sleeper:WakeUp()
else
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_FOLLOW)
end
	--[[if not v.components.staycommand then
	v:AddComponent("staycommand") 
	end
	v.components.staycommand:SetStaying(false)]]
	inst.components.leader:AddFollower(v)
	v.components.follower:SetLeader(inst)
	if inst.components.leader:CountFollowers("phoenix") == 1 then
	v.yamche_leader = true 
	v.yamche_leader_tag = true
	end
	
	v.stay = false
	--v.fightn = false
	v.peace = false
	v.active_hunt = false
	v.defense = false

	if v.components.burnable:IsBurning() then
        v.components.burnable:Extinguish()
	end
	if v.components.freezable:IsFrozen() then
        v.components.freezable:Unfreeze()
    end
	v.yamche = true
	
	if v.components.container then 
	v.components.container.canbeopened = true
	end
	if inst.components.leader:CountFollowers("phoenix") == 1 then
	v.yamche_leader = true end

	
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("phoenix") >= 1 and not v.hat then
	if v.yamche_leader then
	v.yamche_leader = false
	v.yamche_leader_tag = false
	inst.yamche_leader = false
	end
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_STAY)
	--[[if not v.components.staycommand then
		v:AddComponent("staycommand") 
	end
	v.components.staycommand:SetStaying(true)
	v.components.staycommand:RememberStayPos("stayspot", Point(v.Transform:GetWorldPosition()))]]
	if not v.components.burnable:IsBurning() then
        v.yamche = true 
	else
		inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_WAIT)
		v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_WAIT2)
	end	
v.sleep_on = true	
v.stay = true
v.components.follower:SetLeader(nil)
		
end 

elseif v.im_ready then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_GROWUP)
v.components.talker:Say(STRINGS.MUSHA_TALK_GROWUP)
--v.yamche = true
inst.components.locomotor:Stop()
inst.working = false
v.pick1 = false
v.working_food = false
v.drop = true

v.grow_up_yamchae_ready = true
v.grow_up_yamchae = true

end

end
end


if Yamche_growup == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()
		
end	end end) end

if Yamche_growup == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche_growup_key()

end	end end) end

if Yamche_growup == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end

	if Yamche_growup == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
	if Yamche_growup == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
	if Yamche_growup == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
	if Yamche_growup == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
	if Yamche_growup == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
		if Yamche_growup == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche_growup_key()
	end	end end) end
	
	-------------------------



----hold visual
----------------------------------------------
local function hold_visual(inst)
local inst = GLOBAL.GetPlayer()
----------------------------------------------
--if not inst.sleep_visual then
inst.components.talker.colour = GLOBAL.Vector3(0.7, 0.85, 1, 1)
inst.components.talker.fontsize = 26

if GLOBAL.SaveGameIndex:IsModeShipwrecked() or GLOBAL.SaveGameIndex:IsModePorkland() then 


if inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.berserk_hold and inst.valkyrie_hold then
inst.components.talker:Say("[Visual Hold - Off] \nVisual:[Auto] SET 1")
inst.set_on = true
inst.visual_hold = true
inst.visual_hold2 = false
inst.visual_hold3 = false

inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false

elseif not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and not inst.components.health:IsDead() and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold then
inst.components.talker:Say("[Visual Hold - Off] \nVisual:[Auto] SET 1")
inst.set_on = true
inst.visual_hold = true
inst.visual_hold2 = false
inst.visual_hold3 = false

inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false

elseif inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and not inst.components.health:IsDead() and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold then
inst.components.talker:Say("[Visual Hold - ON] \nVisual:[Auto] SET 2")
inst.set_on = true
inst.visual_hold = false
inst.visual_hold2 = true
inst.visual_hold3 = false

inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false

elseif not inst.visual_hold and inst.visual_hold2 and not inst.visual_hold3 and not inst.components.health:IsDead() and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold then
inst.components.talker:Say("[Visual Hold - ON] \nVisual:[Auto] SET 3")
inst.set_on = true
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
 
 ----------------------------------------------
----------------------------------------------
elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[Full]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = false
inst.valkyrie_hold = true
inst.berserk_hold = true

inst.AnimState:SetBuild("musha_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and not inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[Normal]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = false
inst.berserk_hold = true

inst.AnimState:SetBuild("musha_normal_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and not inst.valkyrie_hold and inst.berserk_hold then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[Valkyrie]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = false

inst.AnimState:SetBuild("musha_battle_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and not inst.berserk_hold then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[Berserk]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true

inst.AnimState:SetBuild("musha_hunger_dst")
end

elseif not GLOBAL.SaveGameIndex:IsModeShipwrecked() and not  GLOBAL.SaveGameIndex:IsModePorkland() then

if not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and not inst.components.health:IsDead() and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold and not inst.hold_old1 and not inst.hold_old2 and not inst.hold_old3 and not inst.hold_old4 and not inst.hold_old5 and not inst.hold_old6 and not inst.hold_old7 and not inst.hold_old8 and not inst.full_k_hold and not inst.normal_k_hold and not inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("[Visual Hold - Off] \nVisual:[Auto] SET 1")
inst.set_on = true
inst.visual_hold = true
inst.visual_hold2 = false
inst.visual_hold3 = false

inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false
--inst.AnimState:SetBuild("musha")

elseif inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and not inst.components.health:IsDead() and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold and not inst.hold_old1 and not inst.hold_old2 and not inst.hold_old3 and not inst.hold_old4 and not inst.hold_old5 and not inst.hold_old6 and not inst.hold_old7 and not inst.hold_old8 and not inst.full_k_hold and not inst.normal_k_hold and not inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("[Visual Hold - ON] \nVisual:[Auto] SET 2")
inst.set_on = true
inst.visual_hold = false
inst.visual_hold2 = true
inst.visual_hold3 = false

inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false

elseif not inst.visual_hold and inst.visual_hold2 and not inst.visual_hold3 and not inst.components.health:IsDead() and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold and not inst.hold_old1 and not inst.hold_old2 and not inst.hold_old3 and not inst.hold_old4 and not inst.hold_old5 and not inst.hold_old6 and not inst.hold_old7 and not inst.hold_old8 and not inst.full_k_hold and not inst.normal_k_hold and not inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("[Visual Hold - ON] \nVisual:[Auto] SET 3")
inst.set_on = true
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false

 
----------------------------------------------
elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold and not inst.hold_old1 and not inst.hold_old2 and not inst.hold_old3 and not inst.hold_old4 and not inst.hold_old5 and not inst.hold_old6 and not inst.hold_old7 and not inst.hold_old8 and not inst.full_k_hold and not inst.normal_k_hold and not inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[Full]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = false
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and not inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8  then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[Normal]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = false
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_normal_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and not inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8  then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[Valkyrie]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = false
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true

inst.AnimState:SetBuild("musha_battle_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and not inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8  then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[Berserk]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = false
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_hunger_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and not inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8  then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[old visual 1]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = false
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_full_dst_sw2")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and not inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8  then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[old visual 2]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = false
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_normal_dst_sw2")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and not inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8  then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[old visual 3]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = false
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_battle_dst_sw2")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and not inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8  then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[old visual 4]")

inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = false
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_hunger_dst_sw2")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and not inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8  then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[old visual 5]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = false
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_full_k_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and not inst.hold_old6 and inst.hold_old7 and inst.hold_old8  then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[old visual 6]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = false
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_normal_k_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and not inst.hold_old7 and inst.hold_old8  then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[old visual 7]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = false
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_battle_k_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and not inst.hold_old8 then
inst.components.talker:Say("[Visual Hold - On] \nVisual:[old visual 8]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true

inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.AnimState:SetBuild("musha_hunger_k_dst")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and not inst.components.health:IsDead() and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 then
inst.components.talker:Say("[Visual Hold - Off] \nVisual:[Auto]")
inst.set_on = false
inst.visual_hold = false
inst.visual_hold = false
inst.visual_hold2 = false
inst.visual_hold3 = false

inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false

 end end
 end 
 --end

if Hold == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		hold_visual()

	end
	end
end)
end
if Hold == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end

	if Hold == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
	if Hold == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
	if Hold == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
	if Hold == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
	if Hold == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end
		if Hold == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		hold_visual()
	end	end end) end

	
	--companion orders--
	
	---------------------moon tree moontree
 
local function dall_update(inst)
local inst = GLOBAL.GetPlayer()
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"dall"})
for k,v in pairs(ents) do
if inst.follow_dall and v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("dall") == 0 then
if not v.onsleep then
inst.components.leader:AddFollower(v)
v.yamche = true
v.sleep_on = false
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_DALL_FOLLOW)
elseif v.onsleep then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_DALL_SLEEPY)
end
elseif not inst.follow_dall and v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("dall") == 1 then
if not v.onsleep then
v.yamche = true 
v.sleep_on = true
v.components.follower:SetLeader(nil)
--inst.components.leader:RemoveFollowersByTag("dall")
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_DALL_STAY)
elseif v.onsleep then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_DALL_SLEEPY)
end
end end end
 
local function order_dall(inst)
local inst = GLOBAL.GetPlayer()
if inst.dall_follow and not inst.follow_dall and not inst.components.health:IsDead() then

inst.follow_dall = true
dall_update(inst)
elseif inst.dall_follow and inst.follow_dall and not inst.components.health:IsDead() then

inst.follow_dall = false
inst.dall_follow = false
dall_update(inst)
elseif not inst.dall_follow then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_DALL_LOST)
elseif inst.dall_follow and not inst.follow_dall and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_FOLLOW)
inst.follow_dall = true
dall_update(inst)
elseif inst.dall_follow and inst.follow_dall and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_STAY)
inst.follow_dall = false
inst.dall_follow = false
dall_update(inst)
elseif not inst.dall_follow and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_OOOOHHHH)
end
end


if Moontree == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_dall()

	end
	end
end)
end
if Moontree == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end

	if Moontree == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
	if Moontree == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
	if Moontree == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
	if Moontree == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
	if Moontree == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end
		if Moontree == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_dall()
	end	end end) end



local function order_arong(inst)
local inst = GLOBAL.GetPlayer()
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 20, {"arongb"})
for k,v in pairs(ents) do
if v and not v.openc then
if --[[not v.arong_follow and]] v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("arongb") == 0 and not v.hat then
if v.components.sleeper:IsAsleep() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_FOLLOW2)
v.components.sleeper:WakeUp()
else
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_FOLLOW)
end
inst.components.leader:AddFollower(v)
v.components.follower:SetLeader(inst)
v.yamche = true
v.following = true
v.staying = false
v.sleep_on = false
v.sleeping = false
--v.components.talker:Say("[I like follow you]")

elseif --[[v.arong_follow and]] v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("arongb") >= 1 and not v.hat then
if v.yamche_leader then
	v.yamche_leader = false
	v.yamche_leader_tag = false
	inst.yamche_leader = false
	end
if v.components.sleeper:IsAsleep() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_STAY2)
else
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_STAY)
end
v.yamche = true 
v.following = false
v.staying = true
v.sleep_on = true
v.arong_follow = false
v.find_food = true
v.components.follower:SetLeader(nil)
--v.components.talker:Say("[I will wait for you]")
--inst.components.leader:RemoveFollowersByTag("arongb")
end 
end 
end
end 

if Arong == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
	
if Arong == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		order_arong()
	end	end end) end
if Arong == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end

	if Arong == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
	
	if Arong == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
	
	if Arong == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
	
	if Arong == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
	if Arong == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end
		if Arong == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		order_arong()
	end	end end) end

	
-----------collect stuffs

yamche2 = function() 
local inst = GLOBAL.GetPlayer()
inst.components.talker.colour = GLOBAL.Vector3(0.7, 0.85, 1, 1)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"yamche"})
for k,v in pairs(ents) do

if v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst:HasTag("playerghost") and v.components.container and v.item_max_full then	
	v.working_food = false
	v.pick1 = false
	v.drop = true
	v.item_1 = false 
	v.item_ready_drop = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_GATHER)
	v.yamche = true
	SpawnPrefab("dr_warm_loop_2").Transform:SetPosition(v:GetPosition():Get())
	if v.prefab ~= "musha_small" then
		if not v.light_on then
		v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_REST.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x1)")
		elseif v.light_on then
		v.components.talker:Say(STRINGS.MUSHA_TALK_LIGHT_YAMCHE.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x8)")
		end
	end
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not v.pick1 and not inst:HasTag("playerghost") and not v.item_max_full then --and not v.level1 then

	if not v.components.inventory then
	--v:AddComponent("inventory")
	end
	if v:HasTag("arongb") then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_GATHER)
	else
	inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_GATHER)
	end
	
	v.working_food = true
	v.pick1 = true
	v.drop = false
	v.yamche = true 

	if not v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_STUFF.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x6)")
	elseif v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_LIGHT_YAMCHE"+"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_STUFF.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x14)")
	end
	
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and v.pick1 and not inst:HasTag("playerghost") and not v.item_max_full then

inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_GATHER_STOP)

v.working_food = false
v.pick1 = false
v.drop = true
v.yamche = true 
	if not v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_REST.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x1)")
	elseif v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_LIGHT_YAMCHE.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x8)")
	end


elseif not inst.components.leader:IsFollower(v) and not inst:HasTag("playerghost") and inst.components.leader:CountFollowers("yamcheb") == 0 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_EGG )
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not v.pick1 and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_GATHER)
v.working_food = true
v.pick1 = true
v.drop = false
v.yamche = true 
	if not v.components.inventory then
	--v:AddComponent("inventory") 
	end
	if not v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_STUFF.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x6)")
	elseif v.light_on then
	v.components.talker:Say("[Light]+"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_STUFF.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x14)")
	end
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and v.pick1 and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_STOP)
v.working_food = false
v.pick1 = false
v.drop = true
	if not v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_REST.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x1)")
	elseif v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_LIGHT_YAMCHE.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x8)")
	end
end

end 
end

if Collect == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end
if Collect == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		yamche2()

	end
	end
end)
end

	if Collect == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
	if Collect == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
	if Collect == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
	if Collect == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
	if Collect == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
		if Collect == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		yamche2()
	end	end end) end
	
	
	
---------------
local function on_yamcheinfo()
local inst = GLOBAL.GetPlayer()
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 12, {"yamche"})
for k,v in pairs(ents) do
if inst.components.leader:IsFollower(v) and v.components.follower.leader then 
v.yamcheinfo = true
--v.yamche = true
end
end end
--level?
-- KEY_L
level_info = function() 
	local player = GLOBAL.GetPlayer()
	local inst = GLOBAL.GetPlayer()
local max_exp = 999997000
local level = math.min(inst.level, max_exp)
	local max_stamina = 100
	local min_stamina = 0
	local max_fatigue = 100
	local min_fatigue = 0	
	local max_music = 100
	local min_music = 0	
	local max_treasure = 100
	local min_treasure = 0	
	local stamina_sleep = inst.components.stamina_sleep.current
	local fatigue_sleep = inst.components.fatigue_sleep.current
			local mx=math.floor(max_stamina-min_stamina)
			local cur=math.floor(stamina_sleep-min_stamina)
			local mx2=math.floor(max_fatigue-min_fatigue)
			local cur2=math.floor(fatigue_sleep-min_fatigue)
			local mxx=math.floor(max_music-min_music)
			local curr=math.floor(inst.music-min_music)
			local mxt=math.floor(max_treasure-min_treasure)
			local curt=math.floor(inst.treasure-min_treasure)
		
			sleep = ""..math.floor(cur*100/mx).."%"
			sleepy = ""..math.floor(cur2*100/mx2).."%"
			musics = ""..math.floor(curr*100/mxx).."%"
			treasures = ""..math.floor(curt*100/mxt).."%"
inst.components.talker.colour = GLOBAL.Vector3(0.7, 0.85, 1, 1)
inst.components.talker.fontsize = 26
			--inst.sg:AddStateTag("notalking")
inst.keep_check = false	
if not inst.keep_check then	
if not inst:HasTag("aquatic") and not inst.sg:HasStateTag("boating") then
inst.sleep_visual = true inst.changed_look =true 	
end
inst.keep_check = true	
on_yamcheinfo()			
inst.components.talker:Say("["..STRINGS.MUSHA_LEVEL_NEXT_LEVEL_UP.."] "..STRINGS.MUSHA_LEVEL_EXP..":" .. (inst.level) .."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
	
if inst.level <5 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "1 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 5".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=5 and inst.level <9  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "2 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 10".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=10 and inst.level <29  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "3 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 30".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=30 and inst.level <49  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "4 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 50".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=50 and inst.level <79  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "5 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 80".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=80 and inst.level <124  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "6 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 125".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=125 and inst.level <199  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "7 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 200".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=200 and inst.level <339  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "8 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 340".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=340 and inst.level <429  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "9 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 430".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=430 and inst.level <529  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "10 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 530".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=530 and inst.level <639  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "11 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 640".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=640 and inst.level <759  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "12 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 760".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=760 and inst.level <889  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "13 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 890".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=890 and inst.level <1029  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "14 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1030".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1030 and inst.level <1179  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "15 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1180".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1180 and inst.level <1339  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "16 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1340".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1340 and inst.level <1509  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "17 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1510".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1510 and inst.level <1689  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "18 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1690".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1690 and inst.level <1879  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "19 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1880".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1880 and inst.level <2079  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "20 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 2080".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=2080 and inst.level <2289  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "21 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 2289".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=2290 and inst.level <2499  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "22 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 2500".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=2500 and inst.level <2849  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "23 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 2850".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=2850 and inst.level <3199  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "24 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 3200".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=3200 and inst.level <3699  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "25 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 3700".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=3700 and inst.level <4199  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "26 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 4200".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=4200 and inst.level <4699  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "27 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 4700".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=4700 and inst.level <5499 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "28 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 5500".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=5500 and inst.level <6999 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "29 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 7000".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=7000  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "30 \n[MAX]\n Extra EXP ".. (inst.level -7000).."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	

end
elseif inst.keep_check then		
inst.keep_check = false	
end
inst:DoTaskInTime( 0.5, function()
if inst.keep_check then
inst.keep_check = false
--inst.sg:RemoveStateTag("notalking") 
end end)
--inst:DoTaskInTime( 1, function() inst.sg:RemoveStateTag("notalking") end)
end

--config SKILL hotkey 
if LEVELS == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end
if LEVELS == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		level_info()

	end
	end
end)
end

	if LEVELS == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
	if LEVELS == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
	if LEVELS == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
	if LEVELS == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
	
	if LEVELS == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
		if LEVELS == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		level_info()
	end	end end) end
	
	
---skill?
--default key = K
-----------
skill_info = function() 
	local player = GLOBAL.GetPlayer()
	local inst = GLOBAL.GetPlayer()
	local max_exp = 99997000
	local exp = math.min(player.level, max_exp)
player.components.talker.colour = GLOBAL.Vector3(0.7, 0.85, 1, 1)
player.components.talker.fontsize = 22
inst.keep_check = false			
if not inst.keep_check then		
inst.keep_check = true
			if player.level >=0 and player.level <=4 then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]")
			elseif player.level >=4 and player.level <10 then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_ELECTRA.."[1/4]")
			elseif player.level >=10 and player.level <30  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V]\n"..STRINGS.MUSHA_SKILL_ELECTRA.."[1/4]")
			elseif player.level >=30 and player.level <50  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V]\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [1/4] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[1/4]")
			elseif player.level >=50 and player.level <80  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V]\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [1/4] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[1/4]")
			elseif player.level >=80 and player.level <124  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V]\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[1/4]")
			elseif player.level >=125 and player.level <200  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[1/4]")
			elseif player.level >=200 and player.level <340  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [1/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[1/4]")
			elseif player.level >=340 and player.level <430  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [1/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[1/4]\n\n")
			elseif player.level >=430 and player.level <530  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [1/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[1/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[1/4]")
			elseif player.level >=530 and player.level <640  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [1/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[2/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[1/4]")
			elseif player.level >=640 and player.level <760  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [1/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[3/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[1/4]")
			elseif player.level >=760 and player.level <890  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [1/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[1/4]")
			elseif player.level >=890 and player.level <1030  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [2/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[1/4]")
			elseif player.level >=1030 and player.level <1180  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [3/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[1/4]")
			elseif player.level >=1180 and player.level <1340  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[1/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[1/4]")
			elseif player.level >=1340 and player.level <1510  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[1/4]")
			elseif player.level >=1510 and player.level <1690  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[2/4]")
			elseif player.level >=1690 and player.level <1880  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[3/4]")
			elseif player.level >=1880 and player.level <2080  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[1/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4]")
			elseif player.level >=2080 and player.level <2290  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[2/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4]")
			elseif player.level >=2290 and player.level <2500  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[1/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[3/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][1/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4]")
			elseif player.level >=2500 and player.level <2850  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[2/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[3/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][2/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4]")
			elseif player.level >=2850 and player.level <3200  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[3/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[3/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4]")
			elseif player.level >=3200 and player.level <3700  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][1/3]\n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[4/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[3/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][2/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4]")
			elseif player.level >=3700 and player.level <4200  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][2/3] \n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[4/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[3/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][2/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4]")
			elseif player.level >=4200 and player.level <4700  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][3/3] \n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[4/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[3/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][2/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4]")
			elseif player.level >=4700 and player.level <5500 then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][3/3] \n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[4/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[3/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][2/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4] \n"..STRINGS.MUSHA_SKILL_BARMOR)
			elseif player.level >=5500 and player.level <7000 then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][3/3] \n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[4/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[4/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[1/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][2/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4] \n"..STRINGS.MUSHA_SKILL_BARMOR)
			elseif player.level >=7000  then
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SLEEP.." [T]\n"..STRINGS.MUSHA_SKILL_MUSIC.." [U]\n"..STRINGS.MUSHA_SKILL_SHIELD.." [C][3/3] \n"..STRINGS.MUSHA_SKILL_VALKYR.." [V] \n"..STRINGS.MUSHA_SKILL_BERSERK.."\n"..STRINGS.MUSHA_SKILL_ELECTRA.." [4/4] \n"..STRINGS.MUSHA_SKILL_FSHIELD.."[4/4] \n"..STRINGS.MUSHA_SKILL_REGENERATE.."[4/4] \n"..STRINGS.MUSHA_SKILL_RECOVERY.."[2/2] \n"..STRINGS.MUSHA_SKILL_POWER.."[2/2] \n"..STRINGS.MUSHA_SKILL_CRITIC.."[4/4] \n"..STRINGS.MUSHA_SKILL_BACKSTAB.."[G][3/3] \n"..STRINGS.MUSHA_SKILL_FREEZE.."[4/4] \n"..STRINGS.MUSHA_SKILL_BARMOR)
end
elseif inst.keep_check then		
inst.keep_check = false	
end
inst:DoTaskInTime( 0.5, function()
if inst.keep_check then
inst.keep_check = false
--inst.sg:RemoveStateTag("notalking") 
end end)
end

--config SKILL hotkey 
if SKILLS == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end
if SKILLS == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_info()

	end
	end
end)
end

	if SKILLS == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
	if SKILLS == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
	if SKILLS == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
	if SKILLS == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
	if SKILLS == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end
		if SKILLS == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_info()
	end	end end) end

	--call lightning
local function Call_lightining_on(inst, data)

local inst = GLOBAL.GetPlayer()
--[[local x, y, z = inst.Transform:GetWorldPosition() 
    local ents = TheSim:FindEntities(x, y, z, 40, { "burn" })
    for i, v in ipairs(ents) do	]]
local x,y,z = inst.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 12)
for k,v in pairs(ents) do	

	if v.components.health and not v.components.health:IsDead() and v.entity:IsVisible() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("stalkerminion") and not inst.sg:HasStateTag("moving") and not inst.sg:HasStateTag("attack") and not v:HasTag("structure") and v.components.combat and (v.components.combat.target == inst or v:HasTag("monster") or v:HasTag("burn") or v:HasTag("werepig") or v:HasTag("frog")) then		
	inst.components.locomotor:Stop()

----------------------------------------------------
if not inst.casting then

	inst.casting = true 
	if inst.components.spellpower then
	inst.components.spellpower:DoDelta(-10)
	end
	inst.sg:GoToState("book2")
	call_lightning_on = true

	
if inst.level < 430 then
inst.components.talker:Say("["..STRINGS.MUSHA_TALK_CALL_LIGHTNING.." I ]")

	inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
	local fx_2 = SpawnPrefab("groundpoundring_fx")
		fx_2.Transform:SetScale(0.4, 0.4, 0.4)
		fx_2.Transform:SetPosition(inst:GetPosition():Get())
	  
	v:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) 
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(v:GetPosition():Get())
	  end)
		if v:HasTag("burn") then
			v.slow = true 
			if not v:HasTag("slow") then
			v:AddTag("slow") 
			end
		else	
		v.components.health:DoDelta(-10)
		end
		
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
	
	v.burn = false v.bloom = false 
	v:RemoveTag("burn")
		if not v:HasTag("lightninggoat") then
		v.AnimState:SetBloomEffectHandle( "" ) 
		v.bloom = false 
		end
	

	if v:HasTag("slow") then
	
			
		
		if not v.shocked then
		v.components.health:DoDelta(-25)
		elseif v.shocked then
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
		v.components.health:DoDelta(-40)
		v.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(v:GetPosition():Get())
		if debuff and v:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
			if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		inst:DoPeriodicTask(2, function() 
		if v:HasTag("slow") and not v.components.health:IsDead() then 
			v.components.health:DoDelta(-2)
			--
		end	end)
		end	
		inst:DoTaskInTime(15, function() if v.components.locomotor then v.components.locomotor.groundspeedmultiplier = 1 v.slow = false v:RemoveTag("slow") debuff:Remove() end end)
	elseif not v:HasTag("slow")	then
	v:AddTag("burn")
	end
	end)
	
elseif inst.level >= 430 and inst.level < 1880 then
inst.components.talker:Say("["..STRINGS.MUSHA_TALK_CALL_LIGHTNING.." II ]")

	
	inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
	local fx_2 = SpawnPrefab("groundpoundring_fx")
		fx_2.Transform:SetScale(0.4, 0.4, 0.4)
		fx_2.Transform:SetPosition(inst:GetPosition():Get())
	  
	v:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) 
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(v:GetPosition():Get())
	  end)
		if v:HasTag("burn") then
			v.slow = true 
			if not v:HasTag("slow") then
			v:AddTag("slow") 
			end
		else	
		v.components.health:DoDelta(-15)
		end
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
	v.burn = false v.bloom = false 
	v:RemoveTag("burn")
		if not v:HasTag("lightninggoat") then
		v.AnimState:SetBloomEffectHandle( "" ) 
		v.bloom = false 
		end
	

	if v:HasTag("slow") then
	
			
		
		if not v.shocked then
		v.components.health:DoDelta(-30)
		elseif v.shocked then
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
		v.components.health:DoDelta(-50)
		v.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(v:GetPosition():Get())
		if debuff and v:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
		if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		inst:DoPeriodicTask(2, function() 
		if v:HasTag("slow") and not v.components.health:IsDead() then 
			v.components.health:DoDelta(-4)
			--
		end	end)
		end	
		inst:DoTaskInTime(15, function() if v.components.locomotor then v.components.locomotor.groundspeedmultiplier = 1 v.slow = false v:RemoveTag("slow") debuff:Remove() end end)
	elseif not v:HasTag("slow")	then
	v:AddTag("burn")	
	end
	end)
	
elseif inst.level >= 1880 and inst.level < 7000 then
inst.components.talker:Say("["..STRINGS.MUSHA_TALK_CALL_LIGHTNING.." III ]")
	
	
	inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
	local fx_2 = SpawnPrefab("groundpoundring_fx")
		fx_2.Transform:SetScale(0.4, 0.4, 0.4)
		fx_2.Transform:SetPosition(inst:GetPosition():Get())
	  
	v:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) 
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(v:GetPosition():Get())
	  end)
		if v:HasTag("burn") then
			v.slow = true 
			if not v:HasTag("slow") then
			v:AddTag("slow") 
			end
		else	
		v.components.health:DoDelta(-20)
		end
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
	v.burn = false v.bloom = false 
	v:RemoveTag("burn")
		if not v:HasTag("lightninggoat") then
		v.AnimState:SetBloomEffectHandle( "" ) 
		v.bloom = false 
		end
	

	if v:HasTag("slow") then
	
			
		
		if not v.shocked then
		v.components.health:DoDelta(-35)
		elseif v.shocked then
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
		v.components.health:DoDelta(-60)
		v.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(v:GetPosition():Get())
		if debuff and v:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
		if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		inst:DoPeriodicTask(2, function() 
		if v:HasTag("slow") and not v.components.health:IsDead() then 
			v.components.health:DoDelta(-6)
			--
		end	end)
		end	
		inst:DoTaskInTime(15, function() if v.components.locomotor then v.components.locomotor.groundspeedmultiplier = 1 v.slow = false v:RemoveTag("slow") debuff:Remove() end end)
	elseif not v:HasTag("slow")	then
	v:AddTag("burn")	
	end
	end)
	
elseif inst.level >= 7000 then
inst.components.talker:Say("["..STRINGS.MUSHA_TALK_CALL_LIGHTNING.." IV ]")
			

	
	inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
	local fx_2 = SpawnPrefab("groundpoundring_fx")
		fx_2.Transform:SetScale(0.4, 0.4, 0.4)
		fx_2.Transform:SetPosition(inst:GetPosition():Get())
	  
	v:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) 
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(v:GetPosition():Get())
	  end)
		if v:HasTag("burn") then
			v.slow = true 
			if not v:HasTag("slow") then
			v:AddTag("slow") 
			end
		else	
		v.components.health:DoDelta(-25)
		end
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
	v.burn = false v.bloom = false 
	v:RemoveTag("burn")
		if not v:HasTag("lightninggoat") then
		v.AnimState:SetBloomEffectHandle( "" ) 
		v.bloom = false 
		end
	

	if v:HasTag("slow") then
	
			
		
		if not v.shocked then
		v.components.health:DoDelta(-40)
		elseif v.shocked then
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
		v.components.health:DoDelta(-70)
		v.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(v:GetPosition():Get())
		if debuff and v:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
		if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		inst:DoPeriodicTask(2, function() 
		if v:HasTag("slow") and not v.components.health:IsDead() then 
			v.components.health:DoDelta(-8)
			--
		end	end)
		end	
		inst:DoTaskInTime(15, function() if v.components.locomotor then v.components.locomotor.groundspeedmultiplier = 1 v.slow = false v:RemoveTag("slow") debuff:Remove() end end)
	elseif not v:HasTag("slow")	then
	v:AddTag("burn")	
	end
	end)
	
	end 
	end
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
		end
	end
end	
	
----active skill -lightning strike (powerattack)

local function frosta_hammer()
local player = GLOBAL.GetPlayer()
local weapon = player.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
if weapon and player:HasTag("frosta") and player.frosthammer2 then
   	player.AnimState:OverrideSymbol("swap_object", "swap_frosthammer2", "frosthammer")
    player.AnimState:Show("ARM_carry") 
    player.AnimState:Hide("ARM_normal") 
elseif weapon and not player:HasTag("frosta") and player.frosthammer2 then
	player.AnimState:OverrideSymbol("swap_object", "swap_frosthammer", "frosthammer")
    player.AnimState:Show("ARM_carry") 
    player.AnimState:Hide("ARM_normal") 
end
	end


skill_lightning = function() 
local player = GLOBAL.GetPlayer()

if player.strength == "berserk" then
player.components.talker:Say(STRINGS.MUSHA_TALK_GRRR)
	local shocking_self = SpawnPrefab("musha_spin_fx")
		shocking_self.Transform:SetPosition(player:GetPosition():Get())
		if shocking_self then
		local follower = shocking_self.entity:AddFollower()
		--player.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
		end	
local x,y,z = player.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 10)
for k,v in pairs(ents) do	
	if v.components.health and not v.components.health:IsDead() and v.entity:IsVisible() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("stalkerminion") and not v:HasTag("structure") and not v:HasTag("groundspike") and not v:HasTag("stalkerminion") and v.components.locomotor and not v:HasTag("ghost_spark") and v.components.combat and (v.components.combat.target == player or v:HasTag("monster") or v:HasTag("burn")) then	

	v:AddTag("ghost_spark")
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	player:DoTaskInTime(0.6, function() SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get()) end)
	local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0 )
		end	
		player.components.spellpower:DoDelta(-2)
	if v:HasTag("burn") then
		
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
			if not v:HasTag("slow") then
			v:AddTag("slow") 
			end
		if v:HasTag("slow") then
	
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
			
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0 )
		end	
		
		if not v.shocked then
		v.components.health:DoDelta(-40)
		elseif v.shocked then
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
		v.components.health:DoDelta(-65)
		v.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(v:GetPosition():Get())
		if debuff and v:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
		if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		player:DoPeriodicTask(2, function() 
		if v:HasTag("slow") and not v.components.health:IsDead() then 
			v.components.health:DoDelta(-2)
			--
		end	end)
		end	
		player:DoTaskInTime(15, function() if v.components.locomotor then v.components.locomotor.groundspeedmultiplier = 1 v.slow = false v:RemoveTag("slow") debuff:Remove() end end)
			end
	else
		v.components.health:DoDelta(-30)
	end		
				if v:HasTag("ghost_spark") and v:HasTag("spider") then
					v.sg:GoToState("hit_stunlock")
				else
					v.sg:GoToState("hit")
				end
				if v.components.combat and not v:HasTag("companion") then
				v.components.combat:SuggestTarget(player)
				end
		v:DoTaskInTime(3, function() v:RemoveTag("ghost_spark") end)
end
end
else
if player.sneaka then
player.components.talker:Say(STRINGS.MUSHA_TALK_QUIET)
else
if player.level < 50 and not player.lightning_activate and player.Valkyrieh then
	player.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_NEED_EXP_POWER)
	if player.components.spellpower.current >= 12 then
	Call_lightining_on(inst)
	else
	player.sg:GoToState("mindcontrol")
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SPELLPOWER)
	end
	

elseif player.level >=50 and player.lightning_activate then
player.components.combat:SetRange(2)
--player.Light:Enable(false)
 player.lightningblue1 = false
 player:RemoveTag("lightningblue2")
 player:RemoveTag("frosta")
 player:RemoveTag("framea")
local weapon = player.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
if weapon and weapon.components.weapon and not weapon:HasTag("electric_weapon") then
weapon.components.weapon.stimuli = nil 
end
--SpawnPrefab("sparks").Transform:SetPosition(player:GetPosition():Get())
player.AnimState:SetBloomEffectHandle( "" )
player.lightning_activate = false
 
elseif player.level >=50 and player.Valkyrieh and player.components.spellpower.current < 6 and not player.lightning_activate then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SPELLPOWER)
 
elseif player.level >=50 and not player.Valkyrieh and not player:HasTag("frosthammer") and not player:HasTag("phoenixblade") and not player.lightning_activate then

	if player.components.spellpower.current >= 12 then
	Call_lightining_on(inst)
	else
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SPELLPOWER)
	player.sg:GoToState("mindcontrol")
	end
	
 
 ------on lightning
elseif player.level >=50 and not player.lightning_activate and player.Valkyrieh and player.components.spellpower.current >= 6 then 

	if player.components.spellpower.current >= 12 then
	Call_lightining_on(inst)
	end

if player.Valkyrieh and not player.lightningblue1 and not player.lightningblue2 and (player:HasTag("frosta") or player:HasTag("framea")) then
	player:RemoveTag("frosta")
	player:RemoveTag("framea")
end

if not player:HasTag("frosthammer") and not player:HasTag("phoenixblade") then
	if player.Valkyrieh and player.hitlightning1 and not player.lightningblue1 then
	
	
		player.lightningblue1 = true
	player.components.combat:SetRange(11)
	
player:DoTaskInTime(2, function()if player.lightningblue1 then player.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)

player.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
player.lightning_activate = true
local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(player:GetPosition():Get())
		if shocking then
		player.components.spellpower:DoDelta(-1)
		
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
		end	
	elseif player.Valkyrieh and player.hitlightning2 and not player.lightningblue2 then

	
		player.lightningblue2 = true
	player.components.combat:SetRange(11)
	
player:DoTaskInTime(2, function()if player.lightningblue2 then player.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)
player.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
player.lightning_activate = true
local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(player:GetPosition():Get())
		if shocking then
		player.components.spellpower:DoDelta(-1)
		
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
		end	
end

---- with weapon
elseif player:HasTag("frosthammer") then
	if player.hitlightning1 and not player.lightningblue1 and not player:HasTag("frosta") then
	
		player.lightningblue1 = true
		player:AddTag("frosta")
	player.components.combat:SetRange(11)
	
player:DoTaskInTime(2, function()if player.lightningblue1 then player.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)
player.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
player.lightning_activate = true
local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(player:GetPosition():Get())
		if shocking then
		player.components.spellpower:DoDelta(-1)
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
		end	
	elseif player.hitlightning2 and not player.lightningblue2 and not player:HasTag("frosta") then
	
		player.lightningblue2 = true
		player:AddTag("frosta")
	player.components.combat:SetRange(11)
	
player:DoTaskInTime(2, function()if player.lightningblue2 then player.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)
player.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
player.lightning_activate = true
local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(player:GetPosition():Get())
		if shocking then
		player.components.spellpower:DoDelta(-1)
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
		end	
		end
	if player.frosthammer2 then
		frosta_hammer(inst)
	end
 
elseif player:HasTag("phoenixblade") then	

	if player.hitlightning1 and not player.lightningblue1 and not player:HasTag("framea") then
	
		player.lightningblue1 = true
		player:AddTag("framea")
	player.components.combat:SetRange(11)
	
player:DoTaskInTime(2, function()if player.lightningblue1 then player.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)
player.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
player.lightning_activate = true
local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(player:GetPosition():Get())
		if shocking then
		player.components.spellpower:DoDelta(-1)
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
	elseif player.hitlightning2 and not player.lightningblue2 and not player:HasTag("framea") then
	
		player.lightningblue2 = true
		player:AddTag("framea")
	player.components.combat:SetRange(11)
	
player:DoTaskInTime(2, function()if player.lightningblue2 then player.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)
player.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
player.lightning_activate = true
local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(player:GetPosition():Get())
		if shocking then
		player.components.spellpower:DoDelta(-1)
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
----
end
	end
-------
elseif not player.Valkyrieh and player.components.spellpower.current < 6 and not player.lightning_activate and (player:HasTag("frosthammer") or player:HasTag("phoenixblade")) then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SPELLPOWER)
	
elseif not player.Valkyrieh and player.components.spellpower.current >= 6 and not player.lightning_activate then 

	if player.components.spellpower.current >= 12 then
	Call_lightining_on(inst)
	end
if player:HasTag("frosthammer") and not player:HasTag("frosta") then
		player:AddTag("frosta")
	
	local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(player:GetPosition():Get())
		if shocking then
		player.components.spellpower:DoDelta(-1)
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
player.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
	if player.frosthammer2 then
		frosta_hammer(inst)
	end
elseif player:HasTag("phoenixblade") and not player:HasTag("framea") then
		player:AddTag("framea")
	
	local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(player:GetPosition():Get())
		if shocking then
		player.components.spellpower:DoDelta(-1)
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
		end
player.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") 

elseif player:HasTag("framea") or player:HasTag("frosta") then
	player.components.talker:Say(STRINGS.MUSHA_WEAPON_SWORD_POWER_OFF)
	
	player:RemoveTag("frosta")
	player:RemoveTag("framea")
	
end
	if player.frosthammer2 then
		frosta_hammer(inst)
	end
	end
end

SpawnPrefab("sparks").Transform:SetPosition(player:GetPosition():Get())

local weapon = player.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
if weapon and (player.lightningblue1 or player.lightningblue2) and weapon.components.weapon then 
weapon.components.weapon.stimuli = "electric"
elseif weapon and not (player.lightningblue1 or player.lightningblue2) and weapon.components.weapon and not weapon:HasTag("electric_weapon") then
weapon.components.weapon.stimuli = nil
end
end 


end

--config SPECIAL ATTACK hotkey 
if LIGHTNING == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end
if LIGHTNING == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_lightning()

	end
	end
end)
end

	if LIGHTNING == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
	if LIGHTNING == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
	if LIGHTNING == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
	if LIGHTNING == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
	if LIGHTNING == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end
		if LIGHTNING == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_lightning()
	end	end end) end

----active skill -shield
--default key = T
skill_cure = function() 
	local player = GLOBAL.GetPlayer()

if  player.components.spellpower.current < 20 then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SPELLPOWER)
	player.sg:GoToState("mindcontrol")	
	if not player.mindcontrol_ready then
	player.mindcontrol = true
	end
elseif player.components.spellpower.current >= 20 then	
if player.cure0 and not player.cure1 and not player.cure2 and player.Cureoo0 and not player.shieldon and not player.components.health:IsDead() then

	
		player.Cureo0 = true
		player.frameon1 = true
		player.frameon2 = true
		player.frameon3 = true
		player.frameon4 = true

elseif player.cure1 and not player.cure0 and not player.cure2 and player.Cureoo1 and not player.shieldon and not player.components.health:IsDead() then

	
		player.Cureo1 = true
		player.frameon1 = true
		player.frameon2 = true
		player.frameon3 = true
		player.frameon4 = true

elseif player.cure2 and not player.cure0 and not player.cure1 and player.Cureoo2 and not player.shieldon and not player.components.health:IsDead() then

	
		player.Cureo2 = true
		player.frameon1 = true
		player.frameon2 = true
		player.frameon3 = true
		player.frameon4 = true

elseif player.cure0 and not player.cure1 and not player.cure2 and not player.Cureoo0 then
	if player.sg:HasStateTag("boating") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_COOLDOWN)
	end
	player.sg:GoToState("mindcontrol")
	if not player.mindcontrol_ready then
	player.mindcontrol = true
	end
elseif player.cure1 and not player.cure0 and not player.cure2 and not player.Cureoo1 then
	if player.sg:HasStateTag("boating") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_COOLDOWN)
	end
	player.sg:GoToState("mindcontrol")
	if not player.mindcontrol_ready then
	player.mindcontrol = true
	end
elseif player.cure2 and not player.cure0 and not player.cure1 and not player.Cureoo2 then
	if player.sg:HasStateTag("boating") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_COOLDOWN)
	end
	player.sg:GoToState("mindcontrol")
	if not player.mindcontrol_ready then
	player.mindcontrol = true
	end
elseif player.shieldon then
	player.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_FULL)
	
elseif not player.cure0 and not player.cure1 and not player.cure2  then
	if player.sg:HasStateTag("boating") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_COOLDOWN.."(LV 2)")
	end
	player.sg:GoToState("mindcontrol")
	if not player.mindcontrol_ready then
	player.mindcontrol = true
	end
end
end

if player.mindcontrol then
player.mindcontrol = false
player.mindcontrol_ready = true
player:DoTaskInTime(2, function() player.mindcontrol_ready = false end)
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(player:GetPosition():Get())
			if shocking then
			player.components.spellpower:DoDelta(-1)
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
			end
			
	local x,y,z = player.Transform:GetWorldPosition()	
	local ents = TheSim:FindEntities(x, y, z, 8)
for k,v in pairs(ents) do	
if v:IsValid() and v.entity:IsVisible() and v.components.health and not v.components.health:IsDead() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("player") and not v:HasTag("companion") and not v:HasTag("stalkerminion") and not v:HasTag("structure") and v.components.combat ~= nil and (v.components.combat.target == player or v:HasTag("monster") or v:HasTag("burn")) then
	
	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	--SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get())
	
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
		v.components.health:DoDelta(-1)
		--v.components.combat:GetAttacked(player, 10)
	
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(player)
    end
	
end
end
end


end

--config SHIELD hotkey 
if SHIELD == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end
if SHIELD == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_cure()

	end
	end
end)
end

	if SHIELD == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
	if SHIELD == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
	if SHIELD == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
	if SHIELD == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
	if SHIELD == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
		if SHIELD == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_cure()
	end	end end) end
	
----active skill -Valkyrie
--default key = V

skill_valkyrie = function() 
	local player = GLOBAL.GetPlayer()
if player.components.fatigue_sleep.current <=0 then	
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SLEEP)
player.valkyrie_look = false
elseif player.components.fatigue_sleep.current >0 then
if player.valkyrie_mood and not player.Valkyrieh and not player.berserks and not player.fberserk then
		player.Valkyrieh = true
		player.Valkyriech2 = false
		player.valkyrie_look = true

	
elseif player.valkyrie_mood and player.Valkyrieh and not player.berserks and not player.fberserk then
		player.Valkyriech2 = true
		player.Valkyrieh = false
		player.valkyrie_look = false
		if player.components.hunger.current >= 160 then
		player.full_look = true
		elseif player.components.hunger.current < 160 then
		player.normal_look = true
		end		
		player.AnimState:SetBloomEffectHandle( "" )
		
local weapon = player.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
if weapon and weapon.components.weapon and not weapon:HasTag("electric_weapon") then
weapon.components.weapon.stimuli = nil 
end

	------------------	

if player.backstab1  and player.sneakaa then
		player.sneakaa = false
		player.sneaka = false
  player:RemoveTag("hide")
        player:RemoveTag("notarget")
	player.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	player.components.colourtweener:StartTween({1,1,1,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(player.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
         player.components.sanity:DoDelta(40)

elseif player.backstab2 and player.sneakaa then
		player.sneakaa = false
		player.sneaka = false
        player:RemoveTag("notarget")
	player.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	player.components.colourtweener:StartTween({1,1,1,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(player.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
         player.components.sanity:DoDelta(80)

elseif player.backstab3  and player.sneakaa then
		player.sneakaa = false
		player.sneaka = false
        player:RemoveTag("notarget")
	player.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	player.components.colourtweener:StartTween({1,1,1,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(player.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
         player.components.sanity:DoDelta(120)
end
			
-----------------------
		--player.components.talker:Say("")

elseif not player.valkyrie_mood then
		player.Valkyrieh = false
	player.components.talker:Say(STRINGS.MUSHA_TALK_VALKYRIE_NEED_EXP)
	player.valkyrie_look = false
elseif player.berserks and not player.fberserk then
	player.components.talker:Say(STRINGS.MUSHA_TALK_GRRR)
		player.Valkyrieh = false
	player.valkyrie_look = false	
	player.berserk_look = true
elseif player.fberserk and not player.berserks then
	player.components.talker:Say(STRINGS.MUSHA_TALK_GRRR)
		player.Valkyrieh = false
	player.valkyrie_look = false	
	player.berserk_look = true
end
end 
SpawnPrefab("sparks2").Transform:SetPosition(player:GetPosition():Get())
--SpawnPrefab("statue_transition_2").Transform:SetPosition(player:GetPosition():Get())
local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(player:GetPosition():Get())
		if shocking then
		player.components.spellpower:DoDelta(-1)
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0 )
		end

end

--transform Valkyrie
--config Valkyrie hotkey 
if VALKYRIE == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
if VALKYRIE == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_valkyrie()

	end
	end
end)
end
	if VALKYRIE == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
	if VALKYRIE == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
	if VALKYRIE == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
	if VALKYRIE == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end
		if VALKYRIE == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_valkyrie()
	end	end end) end

	
-----sleep
--compatible other mods 
local Advanced_Farming = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Advanced Farming" then
		Advanced_Farming = 1
	   end end
if Advanced_Farming == 1 then
function No_crop(inst)
inst.No_crop = true
end

AddPrefabPostInit("musha", No_crop)
end

local Archery_enable = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Archery Mod [DS Version]" then
		Archery_enable = 1
	   end end
if Archery_enable == 1 then
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if string.find(GLOBAL.KnownModIndex:GetModInfo(moddir).name, "RPG HUD Neat") then
		RPGHUDisON = true
		end end
end

local RPGHUD = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "RPG HUD Neat" then
		RPGHUD = 1
		end
	if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "RPG HUD" then
		RPGHUD = 1
		end 
	end

	   
if RPGHUD == 1 then	
_G = GLOBAL
Vector3 = _G.Vector3
_G.package.loaded["rpghud.modenv"] = env
   	table.insert(_G.EQUIPSLOTS, "PACK")
	_G.EQUIPSLOTS.PACK = "pack"
-- Add Backpack Slot
local function backpack_neat(inst)
		inst.components.equippable.equipslot = _G.EQUIPSLOTS.PACK

	end
	--AddPrefabPostInit("pirateback", backpack_neat)
end

--[[local HeroDark = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Hero in the Dark" then
		HeroDark = 1
	end 
end]]

local AlwaysOnStatus = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Combined Status" then
		AlwaysOnStatus = 1
		end
	if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Always On Status" then
		AlwaysOnStatus = 1		
   end end
   
local SeasonClock = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Season Clock" then
		SeasonClock = 1
   end end
   

--------------------

 function on_wakeup(inst)
local inst = GLOBAL.GetPlayer()

if not inst.music_check and inst.sleep_on then
inst.sleep_on = false
inst.sg:GoToState("wakeup")
inst.entity:AddLight()
inst.Light:SetRadius(1)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
--inst.components.health:SetAbsorptionAmount(1)
inst.music_armor = true
inst.Light:Enable(true)
inst:DoTaskInTime(1.5, function() inst.Light:Enable(false) inst.music_armor = false
inst.musha_press = false 
	if inst.components.stamina_sleep.current < 99 then 
	--inst.sg:GoToState("yawn") 
	inst.AnimState:PlayAnimation("yawn")
	elseif inst.components.stamina_sleep.current >= 99 then 
		if math.random() < 0.3 then
		inst.AnimState:PlayAnimation("yawn")
		elseif math.random() < 0.3 then
		inst.AnimState:PushAnimation("mime1", false)
		elseif math.random() < 0.3 then
		inst.AnimState:PushAnimation("mime4", false)
		else
		inst.AnimState:PushAnimation("mime3", false)
		end
	end
end)
elseif not inst.music_check and inst.tiny_sleep then
inst.tiny_sleep = false
inst.sg:GoToState("wakeup")
inst.entity:AddLight()
inst.Light:SetRadius(1)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
--inst.components.health:SetAbsorptionAmount(1)
inst.music_armor = true
inst.Light:Enable(true)
inst:DoTaskInTime(3.1, function() inst.Light:Enable(false) inst.music_armor = false
	--inst.sg:GoToState("yawn") 
	inst.musha_press = false
	inst.AnimState:PlayAnimation("yawn")
	
end)

--if inst.sleepheal then inst.sleepheal:Cancel() inst.sleepheal = nil end
elseif inst.music_check then
	inst.components.playercontroller:Enable(false)
inst.sleep_on = false
inst.tiny_sleep = false
--inst.sg.statemem.iswaking = true
inst.sg:GoToState("wakeup")
inst.entity:AddLight()
inst.Light:SetRadius(1)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
--inst.components.health:SetAbsorptionAmount(1)
--inst.music_armor = true
inst.Light:Enable(true)
inst.AnimState:SetBloomEffectHandle( "" )
inst.music_check = false
inst.switlight = true
inst:DoTaskInTime(2, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_READY.."\n[ U ]") inst.sg:GoToState("play_flute2") inst.Light:Enable(false) inst.music_armor = false inst.music_check = false inst.AnimState:SetBloomEffectHandle( "" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.musha_press = false inst.components.playercontroller:Enable(true) 
end)

end
end


local function on_sleep(inst)
local inst = GLOBAL.GetPlayer()
local bedroll = inst.sg:GoToState("bedroll")
inst.musha_press = true
if not GLOBAL.GetSeasonManager():IsWinter() then
GLOBAL.GetPlayer().AnimState:OverrideSymbol("swap_bedroll", "swap_bedroll_straw", "bedroll_straw") 
elseif GLOBAL.GetSeasonManager():IsWinter() then
GLOBAL.GetPlayer().AnimState:OverrideSymbol("swap_bedroll", "swap_bedroll_furry", "bedroll_furry") 
end
inst.AnimState:PlayAnimation("bedroll",false)
inst.sleep_in = true inst.sleep_on = true

--inst:DoTaskInTime(2, function() inst.sleep_in = true inst.sleep_on = true end)
inst:DoTaskInTime(2, function() inst.musha_press = false end)
end 


sleeping_princess = function()
local inst = GLOBAL.GetPlayer()
local player = GLOBAL.GetPlayer() 
if inst.music_check and (inst.sleep_on or inst.sleep_in or inst.tiny_sleep) then
 
   inst.sg:GoToState("wakeup")
	inst.sleep_on = false
	inst.tiny_sleep = false
	inst.sleep_in = false
   
  inst.music_check = false
  inst:DoTaskInTime(2, function() inst.music_armor = false inst.switlight = true inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_READY.."\n[ U ]")
  inst.components.playercontroller:Enable(true)
	inst.sg:GoToState("play_flute2") 
   inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")  end)

--on_wakeup(inst)
	
elseif GLOBAL.GetClock():IsDay() and not inst.tiny_sleep and not inst.sleep_in and not inst.sleep_on and not inst.sleep_no and not inst.music_check and not (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("attack") or inst.sg:HasStateTag("chopping") or inst.sg:HasStateTag("mining") or  inst.sg:HasStateTag("hammering") or inst.sg:HasStateTag("digging") or inst.sg:HasStateTag("netting") or inst.sg:HasStateTag("fishing") or inst.sg:HasStateTag("boating") ) and inst.components.fatigue_sleep.current > 90 then 
--inst.sleep_visual = false
local random1 = 0.2
  --inst.tiny_sleep = false
  --inst.sleep_on = false
  --inst.sleep_in = false
  inst:RemoveTag("bedrolll")

if math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_1)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_2)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_3)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_4)
else
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_5)
end

--test
elseif GLOBAL.GetClock():IsDay() and not inst.sleep_in and not inst.sleep_on and not inst.tiny_sleep and not inst:HasTag("aquatic") and not inst.sleep_no and not inst.music_check  and not inst:HasTag("aquatic") and inst.components.fatigue_sleep.current <= 90 then
--and (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("attack") or inst.sg:HasStateTag("chopping") or inst.sg:HasStateTag("mining") or  inst.sg:HasStateTag("hammering") or inst.sg:HasStateTag("digging") or inst.sg:HasStateTag("netting") or inst.sg:HasStateTag("fishing") or inst.sg:HasStateTag("boating") ) then
inst.components.playercontroller:Enable(false)

inst.sleep_visual = true inst.changed_look =true  
inst.fberserk = false


	if (player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating") or player:HasTag("aquatic")) then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_BOAT)
	else
	if (inst.warm_on or inst.warm_tent) then 
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_2)
	elseif inst.components.fatigue_sleep.current >=40 and not (inst.warm_on or inst.warm_tent) then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_1)
	elseif inst.components.fatigue_sleep.current < 40 and inst.components.fatigue_sleep.current >=25  and not (inst.warm_on or inst.warm_tent) then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_2)
	elseif inst.components.fatigue_sleep.current < 25 and inst.components.fatigue_sleep.current >=5  and not (inst.warm_on or inst.warm_tent) then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_3)
	elseif inst.components.fatigue_sleep.current < 5  and not (inst.warm_on or inst.warm_tent) then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_4)
	end
	inst:DoTaskInTime(1, function() inst.sg:GoToState("knockout") inst.sleep_in = true inst.tiny_sleep = true end)
	end


elseif GLOBAL.GetClock():IsDusk() and not inst.sleep_in and not inst.sleep_on and not tiny_sleep and not inst:HasTag("aquatic") and not inst.sleep_no  and not inst:HasTag("aquatic") then
--and (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("attack") or inst.sg:HasStateTag("chopping") or inst.sg:HasStateTag("mining") or  inst.sg:HasStateTag("hammering") or inst.sg:HasStateTag("digging") or inst.sg:HasStateTag("netting") or inst.sg:HasStateTag("fishing") or inst.sg:HasStateTag("boating") ) then
inst.components.playercontroller:Enable(false)
inst.sleep_visual = true inst.changed_look =true  
inst.fberserk = false


inst.components.locomotor:Stop()
if (inst.warm_on or inst.warm_tent) and not inst.musha_press then
	if (player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating") or player:HasTag("aquatic")) then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_BOAT)
	else
	--inst.components.talker:Say("[Good Sleep]")
	local random1 = 0.2
	if math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD_1)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD_2)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD_3)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD_4)
else
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD)
	end
	on_sleep(inst)
	end
elseif not (inst.warm_on or inst.warm_tent) and not inst.musha_press then
	if (player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating") or player:HasTag("aquatic")) then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_BOAT)
	else
	inst.musha_press = true
	if inst.components.fatigue_sleep.current >=40 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_1)
	elseif inst.components.fatigue_sleep.current < 40 and inst.components.fatigue_sleep.current >=25 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_0)
	elseif inst.components.fatigue_sleep.current < 25 and inst.components.fatigue_sleep.current >=5  then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_3)
	elseif inst.components.fatigue_sleep.current < 5  then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_4)
	end
	inst:DoTaskInTime(1, function() inst.sg:GoToState("knockout") inst.sleep_in = true inst.tiny_sleep = true inst.musha_press = false end)
	end
 
end

elseif GLOBAL.GetClock():IsNight() and not inst.sleep_in and not inst.sleep_on and not tiny_sleep and not inst:HasTag("aquatic") and not inst.sleep_no and (inst.warm_on or inst.warm_tent) and not inst:HasTag("aquatic") and not inst.musha_press then
--and not (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("attack") or inst.sg:HasStateTag("chopping") or inst.sg:HasStateTag("mining") or  inst.sg:HasStateTag("hammering") or inst.sg:HasStateTag("digging") or inst.sg:HasStateTag("netting") or inst.sg:HasStateTag("fishing") or inst.sg:HasStateTag("boating") ) then
inst.components.playercontroller:Enable(false)
inst.sleep_visual = true inst.changed_look =true  
inst.fberserk = false

inst.components.locomotor:Stop()
if (inst.warm_on or inst.warm_tent) then
	if (player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating") or player:HasTag("aquatic")) then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_BOAT)
	else
	--inst.components.talker:Say("[Good Sleep]")
		local random1 = 0.2
	if math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD_1)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD_2)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD_3)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD_4)
else
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD)
	end
	on_sleep(inst)
	end
elseif not (inst.warm_on or inst.warm_tent) then 
	if (player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating") or player:HasTag("aquatic")) then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_BOAT)
	else
	if inst.components.fatigue_sleep.current >=40 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_1)
	elseif inst.components.fatigue_sleep.current < 40 and inst.components.fatigue_sleep.current >=25 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_0)
	elseif inst.components.fatigue_sleep.current < 25 and inst.components.fatigue_sleep.current >=5  then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_3)
	elseif inst.components.fatigue_sleep.current < 5  then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_4)
	end
	inst:DoTaskInTime(1, function() inst.sg:GoToState("knockout") inst.sleep_in = true inst.tiny_sleep = true end)
	end

end
elseif GLOBAL.GetClock():IsNight() and not inst.sleep_in and not inst.sleep_on and not inst.tiny_sleep and not inst.sleep_no and not inst.warm_on then
--inst.sleep_visual = false  
local random1 = 0.2

if not inst.LightWatcher:IsInLight() then
if math.random() < random1 then
inst.components.talker:Say("Too dark..")
elseif math.random() < random1 then
inst.components.talker:Say("More light !")
elseif math.random() < random1 then
inst.components.talker:Say("Darkness too danger..")
elseif math.random() < random1 then
inst.components.talker:Say("Musha must find fire !")
elseif math.random() < 1 then
inst.components.talker:Say("Musha need fire !")
end
elseif inst.LightWatcher:IsInLight() then
	if (player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating") or player:HasTag("aquatic")) then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_BOAT)
	else
	if inst.components.fatigue_sleep.current >=40 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_1)
	elseif inst.components.fatigue_sleep.current < 40 and inst.components.fatigue_sleep.current >=25 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_0)
	elseif inst.components.fatigue_sleep.current < 25 and inst.components.fatigue_sleep.current >=5  then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_3)
	elseif inst.components.fatigue_sleep.current < 5  then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_4)
	end
	inst:DoTaskInTime(1, function() inst.sg:GoToState("knockout") inst.sleep_in = true inst.tiny_sleep = true end)
	end
end
-- wake up
elseif inst.sleep_on and not inst.music_check and not inst.musha_press then
inst.musha_press = true
inst.sg:GoToState("wakeup")
  inst.sleep_on = false
  inst.sleep_in = false
  inst:RemoveTag("bedrolll")
   inst.tiny_sleep = false
   	inst.sleeping_musha = false
	inst.sleepbuff = false
   inst:DoTaskInTime(1.5, function() inst.sleep_visual = true inst.changed_look =true 
 	if inst.components.stamina_sleep.current < 99 then 
	if not inst.SW_set3 then
	inst.AnimState:PlayAnimation("yawn")
	else
	inst.AnimState:PushAnimation("mime3", false)
	end
	elseif inst.components.stamina_sleep.current >= 99 then 
		if math.random() < 0.3 then
		inst.AnimState:PlayAnimation("yawn")
		elseif math.random() < 0.3 then
		inst.AnimState:PlayAnimation("mime1", false)
		elseif math.random() < 0.3 then
		inst.AnimState:PlayAnimation("mime4", false)
		else
		inst.AnimState:PlayAnimation("mime3", false)
		end
	end
	
	inst:DoTaskInTime(1, function() inst.components.playercontroller:Enable(true) inst.musha_press = false end)
   end)
 elseif inst.tiny_sleep and not inst.music_check and not inst.musha_press then
 inst.sg:GoToState("wakeup")
inst.musha_press = true
  inst.sleep_on = false
  inst.sleep_in = false
  inst:RemoveTag("bedrolll")
   inst.tiny_sleep = false
   	inst.sleeping_musha = false
	inst.sleepbuff = false
   inst:DoTaskInTime(3, function() inst.sleep_visual = true inst.changed_look =true 
    if not inst.SW_set3 then
	inst.AnimState:PlayAnimation("yawn")
	end
	inst:DoTaskInTime(1, function() inst.components.playercontroller:Enable(true) inst.musha_press = false end)
   end)  
   
elseif not inst.sleep_in and inst.sleep_no and not inst.music_check  then
local random1 = 0.2
local random2 = 1
if math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DANGER_1)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DANGER_2)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DANGER_3)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DANGER_4)
else
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DANGER_5)

end
end 
end

--config yamche hotkey 
if Sleeprincess == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end
if Sleeprincess == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		sleeping_princess()

	end
	end
end)
end

	if Sleeprincess == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
	if Sleeprincess == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
	if Sleeprincess == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
	if Sleeprincess == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
	if Sleeprincess == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end
		if Sleeprincess == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		sleeping_princess()
	end	end end) end

----active battle command yamche 
follow_yamche = function() 
	local player = GLOBAL.GetPlayer()
	player.components.talker.fontsize = 28
player.components.talker.colour = GLOBAL.Vector3(0.7, 0.85, 1, 1)
local x,y,z = player.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 20, {"yamcheb"})
for k,v in pairs(ents) do

if not v.sleep_on and player.components.leader:IsFollower(v) and v.components.follower and v.components.follower.leader and not v.yamche_leader and not player.yamche_leader and not v:HasTag("ghosthound") then
	player.yamche_leader = true
	v.yamche_leader = true
	if not v.yamche_leader_tag then
	v.yamche_leader_tag = true
	end
	if player.components.leader:CountFollowers("phoenix") >= 1 and v:HasTag("arongb") then
		v.yamche_leader_tag = false
	end
		
end
if not v.sleep_on and player.components.leader:IsFollower(v) then
	v.yamche = true
	end

-- Leader
if v.yamche_leader and not player.berserks and not player.fberserk and player.components.leader:IsFollower(v) and v.components.follower and v.components.follower.leader then

--Offensive leader
if not v.peace and not v.active_hunt and not v.defense then
 
 if player.components.leader:CountFollowers("Yamche") == 1 and player.components.leader:CountFollowers("ghosthound") == 0 then
	if v:HasTag("arongb") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_HUNT)
	elseif v:HasTag("yamche") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNT)
	end
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_OFFENSE)
else
	player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ALL_HUNT)
	if v.yamche_leader_tag then
		v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_OFFENSE.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_LEADER)
		else	
		v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_OFFENSE)
	end
 end
	
v.peace = false
v.active_hunt = true
v.defense = false
	if not player.crazy then
	v.crazyness = false
	end

--Avoid leader
elseif not v.peace and v.active_hunt and not v.defense then
 
 if player.components.leader:CountFollowers("Yamche") == 1 and player.components.leader:CountFollowers("ghosthound") == 0 then
	if v:HasTag("arongb") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_RETREAT)
	elseif v:HasTag("yamche") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_RETREAT)
	end
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_AVOID)
else
	player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ALL_RETREAT)
	if v.yamche_leader_tag then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_AVOID.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_LEADER)
	else
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_AVOID)
	end
 end

v.peace = true
v.active_hunt = false
v.defense = true
	if not player.crazy then
	v.crazyness = true
	end

--Defensive leader
elseif v.peace and not v.active_hunt and v.defense then
 
 if player.components.leader:CountFollowers("Yamche") == 1 and player.components.leader:CountFollowers("ghosthound") == 0 then
	if v:HasTag("arongb") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_PROTECT)
	elseif v:HasTag("yamche") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_PROTECT)
	end
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_DEFFENSE)
else
	player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ALL_PROTECT)
		if v.yamche_leader_tag then
		v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_DEFFENSE.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_LEADER)
		else	
		v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_DEFFENSE)
		end
	end

v.peace = false
v.active_hunt = false
v.defense = false
	if not player.crazy then
	v.crazyness = false
	end

--berserker Avoid
elseif (player.berserks or player.fberserk) then
player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_BERSERK)
 
v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_AVOID)
v.peace = true
v.active_hunt = false
v.defense = true
	if not v.crazyness then
	v.crazyness = true
	end

-- No leader
elseif not v.yamche_leader and not player.berserks and not player.fberserk and player.components.leader:IsFollower(v) and v.components.follower and v.components.follower.leader then

if not v.active_hunt then
v.order = true
player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ALL_HUNT)
v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_OFFENSE)
v.peace = false
v.active_hunt = true
v.defense = false


elseif not v.active_hunt then
v.order = true
player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ALL_PROTECT)
v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_DEFFENSE)
v.peace = false
v.active_hunt = false
v.defense = false

end
end 
elseif --[[not player.components.leader:IsFollower(v) and not v.components.follower and v.components.follower.leader and]]  player.components.leader:CountFollowers("Yamche") == 0 and player.components.leader:CountFollowers("ghosthound") == 0 then
player.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_SLEEPY)	
end
end
end


--config yamche hotkey 
if YAMCHO == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end
if YAMCHO == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		follow_yamche()

	end
	end
end)
end

	if YAMCHO == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
	if YAMCHO == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
	if YAMCHO == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
	if YAMCHO == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
	if YAMCHO == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
		if YAMCHO == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		follow_yamche()
	end	end end) end
	
----active shadows skill
--default key = H


local function InShadow(inst, data)
local player = GLOBAL.GetPlayer()
player.sneaka = true
if player.lightning_activate then
player.components.combat:SetRange(2)
--[[player.SoundEmitter:PlaySound("dontstarve/common/fireOut")
SpawnPrefab("sparks").Transform:SetPosition(player:GetPosition():Get())
 player.lightningblue1 = false
 player:RemoveTag("lightningblue2")
 --player:RemoveTag("frosta")
 --player:RemoveTag("framea")
player.AnimState:SetBloomEffectHandle( "" )
player.lightning_activate = false
local weapon = player.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
if weapon and weapon.components.weapon and not weapon:HasTag("electric_weapon") then
weapon.components.weapon.stimuli = nil 
end]]
end

local x,y,z = player.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 20)
for k,v in pairs(ents) do
if v.components.health and not v.components.health:IsDead() and v.components.combat and v.components.combat.target == player and not (v:HasTag("berrythief") or v:HasTag("prey") or v:HasTag("bird") or v:HasTag("butterfly")) then
		v.components.combat.target = nil 
end end
end 

skill_shadow= function() 
	local player = GLOBAL.GetPlayer()
	player.components.talker.colour = GLOBAL.Vector3(0.7, 0.85, 1, 1)
	
if (player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating") or player:HasTag("aquatic")) and not player.sg:HasStateTag("busy") then
	player.components.talker:Say(STRINGS.MUSHA_TALK_SPELL_WATER)
	
elseif not (player.sg:HasStateTag("rowing") or player.sg:HasStateTag("sailing") or player.sg:HasStateTag("sail") or player.sg:HasStateTag("row") or player.sg:HasStateTag("boating") or player:HasTag("aquatic")) and not player.sg:HasStateTag("busy") then

    if player.level >= 432 and not player.Valkyrieh and player.components.sanity:GetMaxSanity() >= 40 and player.components.health.currenthealth >= 40 and player.shadowb and not player.shadows then
		player.shadows = true
		player.components.talker:Say(STRINGS.MUSHA_TALK_SHADOW_CAST)
		player.sg:GoToState("book")
elseif player.level < 433 and not player.Valkyrieh and player.components.sanity:GetMaxSanity() >= 40 and player.shadowb then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_EXP.."\n[EXP] 432")

elseif player.level >= 432 and not player.Valkyrieh and player.components.sanity:GetMaxSanity() < 40 and player.components.health.currenthealth >= 40 and player.shadowb then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SANITY)

elseif player.level >= 432 and not player.Valkyrieh and player.components.sanity:GetMaxSanity() > 40 and player.components.health.currenthealth < 40 and player.shadowb then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_HEALTH)

elseif player.level >= 432 and not player.Valkyrieh and not player.shadowb then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_LEVEL_SHADOW)

--backstab
	elseif not player.backstab1 and not player.backstab2 and not player.backstab3 then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_LEVEL_BACKSTAB)
	elseif player.backstab1 and not player.sneakaa and player.components.sanity.current <= 40 then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SANITY)
	elseif player.backstab2 and not player.sneakaa and player.components.sanity.current <= 80 then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SANITY)
	elseif player.backstab3 and not player.sneakaa and player.components.sanity.current <= 120 then
	player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SANITY)

elseif player.Valkyrieh and player.backstab1 and not player.sneakaa and not player.sg:HasStateTag("attack") and not player.sg:HasStateTag("moving") and player.components.sanity:GetMaxSanity() > 60 then
		player.sneakaa = true
 	player.components.talker:Say(STRINGS.MUSHA_SKILL_SHADOW) 
	player:DoTaskInTime(4, function() if player.sneakaa then player.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SHADOW)  player:AddTag("notarget") SpawnPrefab("statue_transition").Transform:SetPosition(player:GetPosition():Get()) player.components.colourtweener:StartTween({0.1,0.1,0.1,1}, 0) 	InShadow(inst) end end)
	player.components.colourtweener:StartTween({0.3,0.3,0.3,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(player.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
   --	player.components.sanityaura.penalty = 80
   -- 	player.components.sanity:RecalculatePenalty()
         player.components.sanity:DoDelta(-40)

elseif player.backstab1  and player.sneakaa then
		player.sneakaa = false
		player.sneaka = false
  player:RemoveTag("hide")
        player:RemoveTag("notarget")
	player.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	player.components.colourtweener:StartTween({1,1,1,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(player.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
--	player.components.sanityaura.penalty = 0
 --   	player.components.sanity:RecalculatePenalty()
         player.components.sanity:DoDelta(40)

elseif player.Valkyrieh and player.backstab2 and not player.sneakaa and not player.sg:HasStateTag("attack") and not player.sg:HasStateTag("moving") and player.components.sanity:GetMaxSanity() > 60 then

		player.sneakaa = true
 	player.components.talker:Say(STRINGS.MUSHA_SKILL_SHADOW )
	player:DoTaskInTime(4, function() if player.sneakaa then player.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SHADOW) player:AddTag("notarget") SpawnPrefab("statue_transition").Transform:SetPosition(player:GetPosition():Get()) player.components.colourtweener:StartTween({0.1,0.1,0.1,1}, 0) 	InShadow(inst) end end)
	player.components.colourtweener:StartTween({0.3,0.3,0.3,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(player.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
         player.components.sanity:DoDelta(-80)

elseif player.backstab2 and player.sneakaa then
		player.sneakaa = false
		player.sneaka = false
        player:RemoveTag("notarget")
	player.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	player.components.colourtweener:StartTween({1,1,1,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(player.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
         player.components.sanity:DoDelta(80)

elseif player.Valkyrieh and player.backstab3 and not player.sneakaa and not player.sg:HasStateTag("attack") and not player.sg:HasStateTag("moving") and player.components.sanity:GetMaxSanity() > 60 then

		player.sneakaa = true
	player.components.talker:Say(STRINGS.MUSHA_SKILL_SHADOW )
	player:DoTaskInTime(4, function() if player.sneakaa then player.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SHADOW)  player:AddTag("notarget") SpawnPrefab("statue_transition").Transform:SetPosition(player:GetPosition():Get()) player.components.colourtweener:StartTween({0.1,0.1,0.1,1}, 0) 	InShadow(inst) end end)
	player.components.colourtweener:StartTween({0.3,0.3,0.3,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(player.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
         player.components.sanity:DoDelta(-120)

elseif player.backstab3  and player.sneakaa then
		player.sneakaa = false
		player.sneaka = false
        player:RemoveTag("notarget")
	player.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	player.components.colourtweener:StartTween({1,1,1,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(player.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
         player.components.sanity:DoDelta(120)

end
end
end

if Shadow== "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow== "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end
if Shadow == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_shadow()

	end
	end
end)
end

	if Shadow == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
	if Shadow == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
	if Shadow == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
	if Shadow == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
	if Shadow == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
		if Shadow == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_shadow()
	end	end end) end
	
	
----active dog skill
--default key = X

skill_dogs= function() 
	local player = GLOBAL.GetPlayer()
	local inst = GLOBAL.GetPlayer()
	player.components.talker.colour = GLOBAL.Vector3(0.7, 0.85, 1, 1)
if not inst.sleep_on and not inst.tiny_sleep then	
if inst.treasure_sniff_tag then	
	if GLOBAL.GetWorld().components.interiorspawner and  GLOBAL.GetWorld().components.interiorspawner.current_interior then
	player.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_INSIDE)
	inst.treasure = inst.treasure - 5
	inst.treasure_sniff = false
	inst.treasure_sniff_tag = false
	else
	inst.treasure_sniff = true
	end
elseif not inst.treasure_sniff_tag then

if (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) then
player.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_WATER)

elseif not  (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) then

if inst.switlight	and not inst.nsleep then
inst.light_on = true
inst.switlight = false
--InShadow(inst)
elseif not inst.switlight and inst.music < 100 and not inst.light_on and not inst.nsleep then
player.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SLEEP)
elseif not inst.switlight and inst.music >= 100 and not inst.light_on and not inst.nsleep then

inst.light_on = true
elseif inst.nsleep then
player.components.talker:Say(STRINGS.MUSHA_TALK_SHINY)

end

end
end
end
end

if Dogs == "R" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "T" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "Y" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Y, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "U" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_U, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "G" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_G, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "H" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_H, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "J" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_J, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "Z" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_Z, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "X" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_X, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "C" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_C, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "V" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_V, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "B" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_B, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end
if Dogs == "N" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_N, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput

	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
   
		skill_dogs()

	end
	end
end)
end

	if Dogs == "K" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_K, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
	if Dogs == "L" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_L, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
	if Dogs == "O" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_O, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
	if Dogs == "P" then
GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_P, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
	if Dogs == "F1" then
GLOBAL.TheInput:AddKeyDownHandler(282, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F2" then
GLOBAL.TheInput:AddKeyDownHandler(283, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F3" then
GLOBAL.TheInput:AddKeyDownHandler(284, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F4" then
GLOBAL.TheInput:AddKeyDownHandler(285, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F5" then
GLOBAL.TheInput:AddKeyDownHandler(286, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F6" then
GLOBAL.TheInput:AddKeyDownHandler(287, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F7" then
GLOBAL.TheInput:AddKeyDownHandler(288, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F8" then
GLOBAL.TheInput:AddKeyDownHandler(289, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F9" then
GLOBAL.TheInput:AddKeyDownHandler(290, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F10" then
GLOBAL.TheInput:AddKeyDownHandler(291, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F11" then
GLOBAL.TheInput:AddKeyDownHandler(292, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end
		if Dogs == "F12" then
GLOBAL.TheInput:AddKeyDownHandler(293, function()
	local player = GLOBAL.GetPlayer()
	if player and player:HasTag("musha") then
		local TheInput = GLOBAL.TheInput
	if not GLOBAL.IsPaused() and not TheInput:IsKeyDown(GLOBAL.KEY_CTRL) and not TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
 		skill_dogs()
	end	end end) end

	
function gruefix(inst)
        inst:AddTag("gruef")
end

--AddPrefabPostInit("grue", gruefix)

--
-------------comfortable RPG HUD
local BackPackPlus = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "BackPackPlus" then
		BackPackPlus = 1
    end
end

if BackPackPlus == 1 then
local function pirateback(inst)
	inst.components.equippable.equipslot = GLOBAL.EQUIPSLOTS.BACK
	
end

--AddPrefabPostInit("pirateback", pirateback)

end




--[[
-------------comfortable RPG HUD
local RPGActive = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "RPG HUD" then
		RPGActive = 1
    end
end

if RPGActive == 1 then
-- frostback
local function frostbackpostinit(inst)
	inst.components.equippable.equipslot = GLOBAL.EQUIPSLOTS.PACK
	--inst.components.inventoryitem.cangoincontainer = false		-- storable = true // non storable = false
	inst:AddTag("nonpotatable")

end
local function rpgtag(inst)
	inst.rpgtag = true
end

AddPrefabPostInit("frostback", frostbackpostinit)
AddPrefabPostInit("broken_frosthammer", frostbackpostinit)
AddPrefabPostInit("armor_mushaa", rpgtag)
AddPrefabPostInit("armor_mushab", rpgtag)
end]]

-------------comfortable Sort Inventory
local SORTActive = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Sort Inventory" then
		SORTActive = 1
    end
end

if SORTActive == 1 then
-- frostback
local function armorsortpostinit(inst)
inst.components.container.type = "pack"
end

AddPrefabPostInit("armor_mushaa", armorsortpostinit)
AddPrefabPostInit("armor_mushab", armorsortpostinit)

end

-------yamche floating badge 

local function Yamchebadge ( inst )

	inst:DoTaskInTime( 0, function() 
		local controls = inst.HUD.controls
	local YamcheStatusDisplays = require "widgets/yamchestatusdisplays"
	controls.YamcheStatus = controls:AddChild(YamcheStatusDisplays(inst))
		controls.YamcheStatus:SetPosition(0, 0, 0)
	end)	
end
AddSimPostInit( Yamchebadge )

local function Dallbadge ( inst )

	inst:DoTaskInTime( 0, function() 
		local controls = inst.HUD.controls
	local DallStatusDisplays = require "widgets/dallstatusdisplays"
	controls.DallStatus = controls:AddChild(DallStatusDisplays(inst))
		controls.DallStatus:SetPosition(0, 0, 0)
	end)	
end
AddSimPostInit( Dallbadge )
-------musha floating badge 
--[[
local function Mushabadge ( inst )

	inst:DoTaskInTime( 0, function() 
		local controls = inst.HUD.controls
	local MushaStatusDisplays = require "widgets/mushastatusdisplays"
	controls.MushaStatus = controls:AddChild(MushaStatusDisplays(inst))
		controls.MushaStatus:SetPosition(0, 0, 0)
	end)	
end
AddSimPostInit( Mushabadge )

function mushabadge_on(inst)
 	inst:AddTag("mushab")
end
function mushabadge_valkyrie(inst)
 	inst:AddTag("mushabv")
end
function mushabadge_off(inst)
 	inst:RemoveTag("mushab")
 	inst:RemoveTag("mushabv")
end

if Mbadge == "always" then
AddPrefabPostInit("musha", mushabadge_on)
end
if Mbadge == "valkyrie" then
AddPrefabPostInit("musha", mushabadge_valkyrie)
end
if Mbadge == "off" then
AddPrefabPostInit("musha", mushabadge_off)
end
]]

-------------
--checking

if Badge_type == 1 then   
	
AddClassPostConstruct("widgets/badge", function(self)

local player = GLOBAL.GetPlayer()
if player:HasTag("musha") then
	
	if Badge_type == 3 then
	self.st = self:AddChild(Image("images/status_stamina.xml", "status_stamina.tex"))
	else 
	self.st = self:AddChild(Image("images/sleep_images/empty.xml", "empty.tex"))
	end
	self.st:SetScale(0,1,0)

	self.st:SetPosition(-25,-68,0)

	self.num:SetFont(GLOBAL.NUMBERFONT)
	self.num:SetSize(28)
	

	self.num:MoveToFront()
	
	
	self.maxnum = self:AddChild(Text(GLOBAL.NUMBERFONT, 33))
    self.maxnum:SetPosition(6, 0, 0)
	self.maxnum:MoveToFront()
	
	if AlwaysOnStatus == 0 then 
	self.num:Hide()
    self.maxnum:Hide()
	end

	local OldOnGainFocus = self.OnGainFocus
	function self:OnGainFocus()
		OldOnGainFocus(self)
	if AlwaysOnStatus == 1 then 	
		self.maxnum:Show()
	elseif AlwaysOnStatus == 0 then 	
		self.num:Show()
	end

	local OldOnLoseFocus = self.OnLoseFocus
	function self:OnLoseFocus()
		OldOnLoseFocus(self)
	if AlwaysOnStatus == 1 then 		
		self.maxnum:Hide()
		self.num:Show()
	elseif AlwaysOnStatus == 0 then 	
		self.num:Hide()
	end
		end
	end

if AlwaysOnStatus == 0 then	
self.num:SetPosition(3.5, 0, 0)
	self.num:SetScale(1,1,1)

if GLOBAL.GetPlayer().components.moisture then
	
	
	local OldSetPercent = self.SetPercent
	if OldSetPercent then
		function self:SetPercent(val, max, ...)
			self.maxnum:SetString(tostring(math.ceil(max or 100)))
			OldSetPercent(self, val, max, ...)
		end
	end
	
	
	local OldSetValue = self.SetValue
	if OldSetValue then
		function self:SetValue(val, max, ...)
			self.maxnum:SetString(tostring(math.ceil(max)))
			OldSetValue(self, val, max, ...)
			
			end
	end end end end
end)

AddClassPostConstruct("widgets/statusdisplays",function(self,inst)

local player = GLOBAL.GetPlayer()
if player:HasTag("musha") then
		
		if Badge_type == 3 then
		self.staminab = self:AddChild(Badge("status_stamina", self.owner))
		else 
		self.staminab = self:AddChild(Badge("empty", self.owner))
		end
		
		self.staminab.st:SetScale(0.9, 1.5, 0.9)
		self.staminab.num:SetScale(0.8, 0.8, 0.8)
		self.staminab.num:SetPosition(-25, -25, 0)
if AlwaysOnStatus == 1  then	
		
		self.staminab:SetPosition(-110, -90, 0)

	else
		
		self.staminab:SetPosition(-80, -60, 0)
end	
		
if AlwaysOnStatus == 1 then	
	if self.staminab.bg then 
	self.staminab.bg:Kill()
	self.staminab.bg = nil
	end 
end
	
	local function Updatesleep(sleepbadge)
	local player = GLOBAL.GetPlayer()
	
	local max_music = 100
	local min_music = 0	
	local max_treasure = 100
	local min_treasure = 0	
			
			local mxx=math.floor(max_music-min_music)
			local curr=math.floor(inst.music-min_music)
			local mxt=math.floor(max_treasure-min_treasure)
			local curt=math.floor(inst.treasure-min_treasure)
			
			music = ""..math.floor(curr*100/mxx).."%"
			treasure = ""..math.floor(curt*100/mxt).."%"
			
	
	if sleepbadge == nil then
		sleepbadge = self.staminab.focus
			end
			
	if sleepbadge then 
			GLOBAL.GetPlayer().badge_hide = true
			self.staminab.num:Show()
			self.staminab.num:SetString(STRINGS.MUSHA_LEVEL_MUSIC..":".. music.."\n"..STRINGS.MUSHA_LEVEL_SNIFF..": ".. treasure)
	
		local player = GLOBAL.GetPlayer()
			local x,y,z = player.Transform:GetWorldPosition()
			local ents = TheSim:FindEntities(x,y,z, 20, {"yamche"})
			htr = ""
		for k,v in pairs(ents) do
	if v.components.follower and v.components.follower.leader and v.yamche_leader_tag and player.components.leader:IsFollower(v) then
			local h=v.components.health
			local mx=math.floor(h.maxhealth-h.minhealth)
			local cur=math.floor(h.currenthealth-h.minhealth)
			htr = (STRINGS.MUSHA_COMPANION.."\n"..STRINGS.MUSHA_HEALTH..": "..math.floor(cur*100/mx).."%")
		self.staminab.num:SetString(STRINGS.MUSHA_LEVEL_MUSIC..":".. music .."\n"..STRINGS.MUSHA_LEVEL_SNIFF..": ".. treasure .."\n" .. htr)
	
	end
		end	

			
		else 
			GLOBAL.GetPlayer().badge_hide = false
			if Badge_type == 3 then
			self.staminab.num:Show()
			self.staminab.num:SetString(STRINGS.MUSHA_LEVEL_MUSIC..":".. music.."\n"..STRINGS.MUSHA_LEVEL_SNIFF..": ".. treasure)
			else 
			self.staminab.num:Hide() 
			end
		end
		end
	self.Updatesleep = self.inst:DoPeriodicTask(0.2, function() Updatesleep() end)

	end	
	end)	


end


-------------

AddModCharacter("musha")


function musha_princess_taste(inst)
inst.princess_taste = true
end 	
if PuppyPrincess == "princess" then
AddPrefabPostInit("musha", musha_princess_taste)
end

function musha_dis_meat(inst)
inst.dis_meat_taste = true
end 
function musha_dis_veggie(inst)
inst.dis_veggie_taste = true
end 
function musha_normal(inst)
inst.normal_taste = true
end 
function musha_meat(inst)
inst.meat_taste = true
end 
function musha_veggie(inst)
inst.veggie_taste = true
end 

if Dislike == "dis_meat" then
AddPrefabPostInit("musha", musha_dis_meat)
end
if Dislike == "dis_veggie" then
AddPrefabPostInit("musha", musha_dis_veggie)
end
if Diet == "normal" then
AddPrefabPostInit("musha", musha_normal)
end
if Diet == "meat" then
AddPrefabPostInit("musha", musha_meat)
end
if Diet == "veggie" then
AddPrefabPostInit("musha", musha_veggie)
end


function tuna_stack(inst)
if tuna_stacks == "5" then
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = 5
elseif tuna_stacks == "10" then
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = 10	
elseif tuna_stacks == "15" then
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = 15	
elseif tuna_stacks == "20" then
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = 20		
end end
AddPrefabPostInit("tunacan",tuna_stack)
------

function spoiled(inst)
 	inst:AddTag("spoiled")
end
AddPrefabPostInit("spoiled_food",spoiled)
AddPrefabPostInit("spoiledfood",spoiled)
AddPrefabPostInit("rottenegg",spoiled)
AddPrefabPostInit("wetgoop",spoiled)

--elemental
local function elemental( inst )
    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL
	--inst.components.fuel.fuelvalue = TUNING.MED_LARGE_FUEL
    inst.components.fuel.fueltype = "CHEMICAL"
end
local function elemental_ore( inst )
inst:AddComponent("fuel")
inst.components.fuel.fuelvalue = TUNING.MED_LARGE_FUEL
inst.components.fuel.fueltype = "CHEMICAL"
end
local function elemental_gold( inst )
inst:AddComponent("fuel")
inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
inst.components.fuel.fueltype = "CHEMICAL"
end

AddPrefabPostInit("goldnugget",elemental_gold)
AddPrefabPostInit("thulecite",elemental_gold)
AddPrefabPostInit("rocks",elemental_ore)
AddPrefabPostInit("flint",elemental_ore)
AddPrefabPostInit("marble",elemental_ore)
AddPrefabPostInit("moonrocknugget",elemental_ore)
AddPrefabPostInit("thulecite_pieces",elemental_ore)
AddPrefabPostInit("boneshard",elemental_ore)
AddPrefabPostInit("stinger",elemental)
AddPrefabPostInit("spidergland",elemental)
AddPrefabPostInit("houndstooth",elemental)
AddPrefabPostInit("snakeskin",elemental)
AddPrefabPostInit("slurtleslime",elemental)
AddPrefabPostInit("slurtle_shellpieces",elemental)
AddPrefabPostInit("silk",elemental)
AddPrefabPostInit("chitin",elemental_ore)
AddPrefabPostInit("weevole_carapace",elemental)
AddPrefabPostInit("seashell",elemental)
AddPrefabPostInit("oinc",elemental_ore)
AddPrefabPostInit("dubloon",elemental_ore)
AddPrefabPostInit("gold_dust",elemental_ore)
AddPrefabPostInit("iron",elemental_ore)
AddPrefabPostInit("alloy",elemental_gold)
AddPrefabPostInit("nightmarefuel",elemental_gold)


--rocks
--[[
if CAPY == 0 then
function rockss(inst)
local glowdusts1 = Ingredient( "glowdust", 1)
glowdusts1.atlas = "images/inventoryimages/glowdust.xml"
Recipe("goldnugget", {Ingredient("flint", 1), glowdusts1}, RECIPETABS.MUSHA, {SCIENCE=0})

end
AddPrefabPostInit("musha",rockss)
end]]

function disable(inst)
        inst:AddTag("tstone")
        inst:AddTag("tstoneback")
        inst:AddTag("tstonehammer")
end
function enable(inst)
end
function frostback(inst)
        inst:AddTag("tstone")
        inst:AddTag("tstonehammer")
end
function frosthammer(inst)
        inst:AddTag("tstone")
        inst:AddTag("tstoneback")
end
function frostheart(inst)
        inst:AddTag("tstonehammer")
        inst:AddTag("tstoneback")
end

if Frostone == "disable" then
AddPrefabPostInit("heatrock", disable)
end
if Frostone == "enable" then
AddPrefabPostInit("heatrock", enable)
end
if Frostone == "frostback" then
AddPrefabPostInit("heatrock", frostback)
end
if Frostone == "frosthammer" then
AddPrefabPostInit("heatrock", frosthammer)
end
if Frostone == "frostheart" then
AddPrefabPostInit("heatrock", frostheart)
end

function musha_verysmart(inst)
inst.components.builder.science_bonus = 2
end
function musha_smart(inst)
inst.components.builder.science_bonus = 1
end
function musha_normal(inst)
inst.components.builder.science_bonus = 0
end

if Smart == "verysmart" then
AddPrefabPostInit("musha", musha_verysmart)
end
if Smart == "smart" then
AddPrefabPostInit("musha", musha_smart)
end
if Smart == "normal" then
AddPrefabPostInit("musha", musha_normal)
end

function dsleep_off(inst)
inst.dsleep_off = true
end
function dsleep_veasy(inst)
inst.dsleep_veasy = true
end
function dsleep_easy(inst)
inst.dsleep_easy = true
end
function dsleep_normal(inst)
inst.dsleep_normal = true
end
function dsleep_hard(inst)
inst.dsleep_hard = true
end
function dsleep_hardcore(inst)
inst.dsleep_hardcore = true
end

if Difficult_sleep == "off" then
AddPrefabPostInit("musha",dsleep_off)
end
if Difficult_sleep == "veasy" then
AddPrefabPostInit("musha",dsleep_veasy)
end
if Difficult_sleep == "easy" then
AddPrefabPostInit("musha",dsleep_easy)
end
if Difficult_sleep == "normal" then
AddPrefabPostInit("musha",dsleep_normal)
end
if Difficult_sleep == "hard" then
AddPrefabPostInit("musha",dsleep_hard)
end
if Difficult_sleep == "hardcore" then
AddPrefabPostInit("musha",dsleep_hardcore)
end

function Difficulty_music(inst)

  if Difficult_music == "dmusic_veasy" then
 inst.dmusic_veasy = true
  elseif Difficult_music == "dmusic_easy" then
 inst.dmusic_easy = true
  elseif Difficult_music == "dmusic_normal" then
 inst.dmusic_normal = true
  elseif Difficult_music == "dmusic_hard" then
 inst.dmusic_hard = true
  elseif Difficult_music == "dmusic_hardcore" then
 inst.dmusic_hardcore = true
end
end
AddPrefabPostInit("musha", Difficulty_music)

function dtired_veasy(inst)
inst.dtired_veasy = true
end
function dtired_easy(inst)
inst.dtired_easy = true
end
function dtired_normal(inst)
inst.dtired_normal = true
end
function dtired_hard(inst)
inst.dtired_hard = true
end
function dtired_hardcore(inst)
inst.dtired_hardcore = true
end
if Difficult_tired == "veasy" then
AddPrefabPostInit("musha",dtired_veasy)
end
if Difficult_tired == "easy" then
AddPrefabPostInit("musha",dtired_easy)
end
if Difficult_tired == "normal" then
AddPrefabPostInit("musha",dtired_normal)
end
if Difficult_tired == "hard" then
AddPrefabPostInit("musha",dtired_hard)
end
if Difficult_tired == "hardcore" then
AddPrefabPostInit("musha",dtired_hardcore)
end

function Difficulty_mana(inst)
if IsServer then
  if Dmana == "easy" then
 inst.dmana_veasy = true
  elseif Dmana == "normal" then
 inst.dmana_normal = true
  elseif Dmana == "hard" then
 inst.dmana_hard = true
  elseif Dmana == "hardcore" then
 inst.dmana_hardcore = true
 end end
end
AddPrefabPostInit("musha", Difficulty_mana)

function Difficulty_sniff(inst)

  if Dsniff == "easy" then
 inst.dsniff_easy = true
  elseif Dsniff == "normal" then
 inst.dsniff_normal = true
  elseif Dsniff == "hard" then
 inst.dsniff_hard = true
  elseif Dsniff == "hardcore" then
 inst.dsniff_hardcore = true
	end 
end
AddPrefabPostInit("musha", Difficulty_sniff)

local function moontree_spawn(inst)
if moontree_stop == 2 then
inst.radius_spawning = true
end
if moontree_stop == 3 then
inst.stop_spawning = true

end
end
AddPrefabPostInit("moontree", moontree_spawn)

local function armored_bunny_scout(inst)
if bunny_visual == 1 then
inst.armored_bunny_auto = true

elseif bunny_visual == 2 then
inst.armored_bunny = true
	if GLOBAL.GetPlayer().components.moisture then
    inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0
	end
--elseif bunny_visual == 3 then
--inst.grass_bunny = true
--end
end
end
AddPrefabPostInit("hat_mbunny", armored_bunny_scout)

if in_container == 1 then
ACTIONS.RUMMAGE.priority = 1
end
--in container
function backpack_incontainer(inst)
	if in_container == 1 then
	if inst.components.inventoryitem then
	inst.components.inventoryitem.cangoincontainer = true
	end
	end
end
AddPrefabPostInit("backpack", backpack_incontainer)
AddPrefabPostInit("piggyback", backpack_incontainer)
AddPrefabPostInit("icepack", backpack_incontainer)
AddPrefabPostInit("krampus_sack", backpack_incontainer)
AddPrefabPostInit("thatchpack", backpack_incontainer)

function musha_incontainer(inst)
	if musha_in_container == 0 then
	if inst.components.inventoryitem then
	inst.components.inventoryitem.cangoincontainer = false
	end
	elseif musha_in_container == 1 then
	if inst.components.inventoryitem then
	inst.components.inventoryitem.cangoincontainer = true
	end
	end
end
AddPrefabPostInit("armor_mushaa", musha_incontainer)
AddPrefabPostInit("armor_mushab", musha_incontainer)
AddPrefabPostInit("broken_frosthammer", musha_incontainer)
AddPrefabPostInit("frostback", musha_incontainer)
AddPrefabPostInit("pirateback", musha_incontainer)

------------------------------------------

function stat_hellh(inst)
        inst:AddTag("hellh")
		-- inst:AddTag("helld")
inst.components.health:SetMaxHealth(40)
inst.components.sanity:SetMax(80)		 

end
function stat_hardcoreh(inst)
        inst:AddTag("hardcoreh")
		--inst:AddTag("hardcored")
		inst.components.health:SetMaxHealth(60)
		inst.components.sanity:SetMax(80)

end
function stat_hardh(inst)
        inst:AddTag("hardh")
		 --inst:AddTag("hardd")
		 inst.components.health:SetMaxHealth(70)
		inst.components.sanity:SetMax(90)

end
function stat_normalh(inst)
        inst:AddTag("normalh")
		 --inst:AddTag("normald")
		inst.components.health:SetMaxHealth(80)
		inst.components.sanity:SetMax(90)

end
function stat_easyh(inst)
        inst:AddTag("easyh")
		 --inst:AddTag("easyd")
inst.components.health:SetMaxHealth(120)
inst.components.sanity:SetMax(90)		 

end
function stat_veasyh(inst)
inst:AddTag("veasyh")
--inst:AddTag("veasyd")
inst.components.health:SetMaxHealth(120)
inst.components.sanity:SetMax(90)

end

-- difficulty -damage

function damage_helld(inst)

	inst:AddTag("helld")
	if CAPY==0 and PORK==0 then
 	inst.components.combat.damagemultiplier = .2
	else
	inst.components.combat:AddDamageModifier("musha", -0.8)
	end
end
function damage_hardcored(inst)

inst:AddTag("hardcored")
 	if CAPY==0 and PORK==0 then
 	inst.components.combat.damagemultiplier = .35
	else
	inst.components.combat:AddDamageModifier("musha", -0.65)
	end
end
function damage_hardd(inst)

inst:AddTag("hardd")
 	if CAPY==0 and PORK==0 then
 	inst.components.combat.damagemultiplier = .5
	else
	inst.components.combat:AddDamageModifier("musha", -0.5)
	end
end
function damage_normald(inst)

inst:AddTag("normald")
 	if CAPY==0 and PORK==0 then
 	inst.components.combat.damagemultiplier = .80
	else
	inst.components.combat:AddDamageModifier("musha", -0.20)
	end
end
function damage_easyd(inst)

inst:AddTag("easyd")
 	if CAPY==0 and PORK==0 then
 	inst.components.combat.damagemultiplier = 1.0
	else
	inst.components.combat:AddDamageModifier("musha", 0)
	end
end
function damage_veasyd(inst)

inst:AddTag("veasyd")
	if CAPY==0 and PORK==0 then
 	inst.components.combat.damagemultiplier = 1.5
	else
	inst.components.combat:AddDamageModifier("musha", 0.5)
	end
end

--range weapon damage

function Range_boomerang(inst)
if GLOBAL.GetPlayer():HasTag("musha") then
inst.components.weapon:SetDamage(28)
end
end
function Range_flup(inst)
if GLOBAL.GetPlayer():HasTag("musha") then
inst.components.weapon:SetDamage(20)
end
end

function Range_Weapon(inst)
inst:AddTag("range_weapon")
end

AddPrefabPostInit("blowdart_flup",Range_flup)
AddPrefabPostInit("boomerang", Range_boomerang)
AddPrefabPostInit("blowdart_flup",Range_Weapon )
AddPrefabPostInit("boomerang", Range_Weapon)
AddPrefabPostInit("blowdart_sleep",Range_Weapon )
AddPrefabPostInit("blowdart_fire",Range_Weapon )
AddPrefabPostInit("blowdart_pipe",Range_Weapon )
AddPrefabPostInit("blowdart_walrus",Range_Weapon)
AddPrefabPostInit("blowdart_poison",Range_Weapon )
AddPrefabPostInit("speargun",Range_Weapon )
AddPrefabPostInit("speargun_poison",Range_Weapon )
AddPrefabPostInit("obsidianspeargun",Range_Weapon )
AddPrefabPostInit("spear_launcher",Range_Weapon )

-------difficult option

--damage
if Difficult_damage == "damage_easyh" then
AddPrefabPostInit("musha", damage_easyd)
end
if Difficult_damage == "damage_veasyh" then
AddPrefabPostInit("musha", damage_veasyd)
end
if Difficult_damage == "damage_normalh" then
AddPrefabPostInit("musha", damage_normald)
end
if Difficult_damage == "damage_hardh" then
AddPrefabPostInit("musha", damage_hardd)
end
if Difficult_damage == "damage_hardcoreh" then
AddPrefabPostInit("musha", damage_hardcored)
end
if Difficult_damage == "damage_hellh" then
AddPrefabPostInit("musha", damage_helld)
end 

function Difficulty_damage_range(inst)
if DifficultDamage_Range == "normal" then
inst.normalr = true
elseif DifficultDamage_Range == "hard" then
inst.hardr = true
elseif DifficultDamage_Range == "hardcore" then
inst.hardcorer = true
end 
end
AddPrefabPostInit("musha", Difficulty_damage_range)

if Swimer_dog == "on" then
function Difficulty_damage_range(inst)
	if GLOBAL.SaveGameIndex:IsModeShipwrecked() then
	inst.components.resurrectable.cantdrown = true
	end
end
AddPrefabPostInit("musha", Swimer_dog)
end

--stat
if Difficult_status == "stat_easyh" then
AddPrefabPostInit("musha", stat_easyh)
end
if Difficult_status == "stat_veasyh" then
AddPrefabPostInit("musha", stat_veasyh)
end

if Difficult_status == "stat_normalh" then
AddPrefabPostInit("musha", stat_normalh)
end
if Difficult_status == "stat_hardh" then
AddPrefabPostInit("musha", stat_hardh)
end
if Difficult_status == "stat_hardcoreh" then
AddPrefabPostInit("musha", stat_hardcoreh)
end
if Difficult_status == "stat_hellh" then
AddPrefabPostInit("musha", stat_hellh)
end 

function expx1(inst)
inst:AddTag("expx1")
end
function expx2(inst)
inst:AddTag("expx2")
end
function expx3(inst)
inst:AddTag("expx3")
end
function expx4(inst)
inst:AddTag("expx4")
end
function expd1(inst)
inst:AddTag("expd1")
end
function expd2(inst)
inst:AddTag("expd2")
end
function expd3(inst)
inst:AddTag("expd3")
end
function expd4(inst)
inst:AddTag("expd4")
end
--exp
	if expx_LV == "expx1" then
AddPrefabPostInit("musha", expx1)
elseif expx_LV == "expx2" then
AddPrefabPostInit("musha", expx2)
elseif expx_LV == "expx3" then
AddPrefabPostInit("musha", expx3)
elseif expx_LV == "expx4" then
AddPrefabPostInit("musha", expx4)
end
	if expx_DR == "expd1" then
AddPrefabPostInit("musha", expx1)
elseif expx_DR == "expd2" then
AddPrefabPostInit("musha", expx2)
elseif expx_DR == "expx3" then
AddPrefabPostInit("musha", expx3)
elseif expx_DR == "expx4" then
AddPrefabPostInit("musha", expx4)
end


