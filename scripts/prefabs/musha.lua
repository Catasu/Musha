local MakePlayerCharacter = require "prefabs/player_common"
require "recipe"
require "tuning"

local assets = {
 Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
		Asset( "ANIM", "anim/player_actions_telescope.zip"),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/maxwell.fsb" ),
		Asset("SOUND", "sound/willow.fsb"),    
        Asset( "ANIM", "anim/beard.zip" ),
		Asset("ANIM", "anim/player_knockedout.zip"),
		Asset("ANIM", "anim/player_actions_speargun.zip"),
        Asset( "ANIM", "anim/musha_battle.zip" ),
        Asset( "ANIM", "anim/musha.zip" ),
        Asset( "ANIM", "anim/musha_normal.zip" ),
		Asset( "ANIM", "anim/musha_hunger.zip" ),
		Asset( "ANIM", "anim/musha_adds.zip"),
		Asset( "ANIM", "anim_musha/musha_channel.zip" ),
		--Asset( "ANIM", "anim_musha/musha_actions_eat.zip" ),
		Asset( "ANIM", "anim_musha/musha_idles_groggy.zip" ),
		Asset( "ANIM", "anim_musha/musha_groggy.zip" ),
		Asset( "ANIM", "anim_musha/emote_yawn.zip" ),
		Asset("ANIM", "anim/player_sneeze.zip"), -- dlc3
}

local prefabs = 
{
}

local start_inv = 
{
	--"glowdust",
	--"glowdust",
}

local function treasure_hunt(inst,data)
local max_treasure = 100
local treasure = math.min(inst.treasure, max_treasure)
 end						
local function count_spider(inst,data)
local max_count_s = 100
local count_s = math.min(inst.count_s, max_count_s)
 end		
 local function count_wil(inst,data)
local max_count_w = 100
local count_w = math.min(inst.count_w, max_count_w)
 end	
--[[
local function stamina_sleep(inst,data)
local max_stamina = 100
local stamina = math.min(inst.stamina, max_stamina)
 end
local function fatigue_sleep(inst,data)
local max_fatigue = 100
local fatigue = math.min(inst.fatigue, max_fatigue)
 end
 ]]
local function fullcharged_music(inst)
local max_music = 100
local music = math.min(inst.music, max_music)
 end
 
local function check_music(inst)
local chrged_time = 2
local chrging_timer = 0
	inst.time_perfomance = inst:DoPeriodicTask(0.1,function(inst)
		chrging_timer = chrging_timer + 1
		if chrging_timer > chrged_time then
			if inst.dmusic_veasy then
			inst.music = inst.music + 1.5
			elseif inst.dmusic_easy then
			inst.music = inst.music + 1  
			elseif inst.dmusic_normal then
			inst.music = inst.music + 0.75  
			elseif inst.dmusic_hard then
			inst.music = inst.music + 0.5
			elseif inst.dmusic_hardcore then
			inst.music = inst.music + 0.25
			end
			fullcharged_music(inst)
		end
		if inst.time_perfomance and (chrging_timer > chrged_time)  then
			inst.time_perfomance:Cancel()
			inst.time_perfomance = nil
		end	end)
	end


local function levelexp(inst,data)

	local max_exp = 99999999999999997000
	local exp = math.min(inst.level, max_exp)

	--local hunger_percent = inst.components.hunger:GetPercent()
	local health_percent = inst.components.health:GetPercent()
	local sanity_percent = inst.components.sanity:GetPercent()

	--inst.components.hunger.max = math.ceil (200 + exp* 0.02)
	--inst.components.health.maxhealth = math.ceil (50 + exp* 0.05)
	--inst.components.sanity.max = math.ceil (100 + exp* 0.05)


if inst.level <7000 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_EXP.."\n".. (inst.level))
end
--stat 
	--level 1
	if inst:HasTag("normalh") then
if inst.level <5 then
	inst.components.health.maxhealth = math.ceil (80)
	inst.components.sanity.max = math.ceil (90)
	--level 2
elseif inst.level >=5 and inst.level <10  then
	inst.components.health.maxhealth = math.ceil (85)
	inst.components.sanity.max = math.ceil (100)
	--level 3
elseif inst.level >=10 and inst.level <30  then
	inst.components.health.maxhealth = math.ceil (90)
	inst.components.sanity.max = math.ceil (110)
	--level 4
elseif inst.level >=30 and inst.level <50  then
	inst.components.health.maxhealth = math.ceil (95)
	inst.components.sanity.max = math.ceil (120)
	--level 5
elseif inst.level >=50 and inst.level <80  then
	inst.components.health.maxhealth = math.ceil (100)
	inst.components.sanity.max = math.ceil (130)
	--level 6
elseif inst.level >=80 and inst.level <125  then
	inst.components.health.maxhealth = math.ceil (105)
	inst.components.sanity.max = math.ceil (140)
	--level 7
elseif inst.level >=125 and inst.level <200  then
	inst.components.health.maxhealth = math.ceil (110)
	inst.components.sanity.max = math.ceil (150)
	--level 8
elseif inst.level >=200 and inst.level <340  then
	inst.components.health.maxhealth = math.ceil (115)
	inst.components.sanity.max = math.ceil (160)
	--level 9
elseif inst.level >=340 and inst.level <430  then
	inst.components.health.maxhealth = math.ceil (120)
	inst.components.sanity.max = math.ceil (170)
	--level 10
elseif inst.level >=430 and inst.level <530  then
	inst.components.health.maxhealth = math.ceil (125)
	inst.components.sanity.max = math.ceil (180)
	--level 11
elseif inst.level >=530 and inst.level <640  then
	inst.components.health.maxhealth = math.ceil (130)
	inst.components.sanity.max = math.ceil (190)
	--level 12
elseif inst.level >=640 and inst.level <760  then
	inst.components.health.maxhealth = math.ceil (135)
	inst.components.sanity.max = math.ceil (200)
	--level 13
elseif inst.level >=760 and inst.level <890  then
	inst.components.health.maxhealth = math.ceil (140)
	inst.components.sanity.max = math.ceil (210)
	--level 14
elseif inst.level >=890 and inst.level <1030  then
	inst.components.health.maxhealth = math.ceil (145)
	inst.components.sanity.max = math.ceil (220)
	--level 15
elseif inst.level >=1030 and inst.level <1180  then
	inst.components.health.maxhealth = math.ceil (150)
	inst.components.sanity.max = math.ceil (230)
	--level 16
elseif inst.level >=1180 and inst.level <1340  then
	inst.components.health.maxhealth = math.ceil (155)
	inst.components.sanity.max = math.ceil (240)
	--level 17
elseif inst.level >=1340 and inst.level <1510  then
	inst.components.health.maxhealth = math.ceil (160)
	inst.components.sanity.max = math.ceil (250)
	--level 18
elseif inst.level >=1510 and inst.level <1690  then
	inst.components.health.maxhealth = math.ceil (165)
	inst.components.sanity.max = math.ceil (260)
	--level 19
elseif inst.level >=1690 and inst.level <1880  then
	inst.components.health.maxhealth = math.ceil (170)
	inst.components.sanity.max = math.ceil (270)
	--level 20
elseif inst.level >=1880 and inst.level <2080  then
	inst.components.health.maxhealth = math.ceil (175)
	inst.components.sanity.max = math.ceil (280)
	--level 21
elseif inst.level >=2080 and inst.level <2290  then
	inst.components.health.maxhealth = math.ceil (180)
	inst.components.sanity.max = math.ceil (290)
	--level 22
elseif inst.level >=2290 and inst.level <2500  then
	inst.components.health.maxhealth = math.ceil (185)
	inst.components.sanity.max = math.ceil (300)
	--level 23
elseif inst.level >=2500 and inst.level <2850  then
	inst.components.health.maxhealth = math.ceil (190)
	inst.components.sanity.max = math.ceil (310)
	--level 24
elseif inst.level >=2850 and inst.level <3200  then
	inst.components.health.maxhealth = math.ceil (195)
	inst.components.sanity.max = math.ceil (320)
	--level 25
elseif inst.level >=3200 and inst.level <3700  then
	inst.components.health.maxhealth = math.ceil (200)
	inst.components.sanity.max = math.ceil (330)
	--level 26
elseif inst.level >=3700 and inst.level <4200  then
	inst.components.health.maxhealth = math.ceil (205)
	inst.components.sanity.max = math.ceil (340)
	--level 27
elseif inst.level >=4200 and inst.level <4700  then
	inst.components.health.maxhealth = math.ceil (210)
	inst.components.sanity.max = math.ceil (350)
	--level 28
elseif inst.level >=4700 and inst.level <5500 then
	inst.components.health.maxhealth = math.ceil (215)
	inst.components.sanity.max = math.ceil (360)
	--level 29
elseif inst.level >=5500 and inst.level <7000 then
	inst.components.health.maxhealth = math.ceil (220)
	inst.components.sanity.max = math.ceil (370)
	-- level 30
elseif inst.level >=7000  then
	inst.components.health.maxhealth = math.ceil (225)
	inst.components.sanity.max = math.ceil (370 + inst.level* 0.01)
--	inst.components.combat.damagemultiplier = 1.1
end

		elseif inst:HasTag("hardh") then
if inst.level <5 then
	inst.components.health.maxhealth = math.ceil (70)
	inst.components.sanity.max = math.ceil (90)
	--level 2
elseif inst.level >=5 and inst.level <10  then
	inst.components.health.maxhealth = math.ceil (75)
	inst.components.sanity.max = math.ceil (95)
	--level 3
elseif inst.level >=10 and inst.level <30  then
	inst.components.health.maxhealth = math.ceil (80)
	inst.components.sanity.max = math.ceil (100)
	--level 4
elseif inst.level >=30 and inst.level <50  then
	inst.components.health.maxhealth = math.ceil (85)
	inst.components.sanity.max = math.ceil (105)
	--level 5
elseif inst.level >=50 and inst.level <80  then
	inst.components.health.maxhealth = math.ceil (90)
	inst.components.sanity.max = math.ceil (110)
	--level 6
elseif inst.level >=80 and inst.level <125  then
	inst.components.health.maxhealth = math.ceil (95)
	inst.components.sanity.max = math.ceil (115)
	--level 7
elseif inst.level >=125 and inst.level <200  then
	inst.components.health.maxhealth = math.ceil (100)
	inst.components.sanity.max = math.ceil (120)
	--level 8
elseif inst.level >=200 and inst.level <340  then
	inst.components.health.maxhealth = math.ceil (105)
	inst.components.sanity.max = math.ceil (125)
	--level 9
elseif inst.level >=340 and inst.level <430  then
	inst.components.health.maxhealth = math.ceil (110)
	inst.components.sanity.max = math.ceil (130)
	--level 10
elseif inst.level >=430 and inst.level <530  then
	inst.components.health.maxhealth = math.ceil (115)
	inst.components.sanity.max = math.ceil (135)
	--level 11
elseif inst.level >=530 and inst.level <640  then
	inst.components.health.maxhealth = math.ceil (120)
	inst.components.sanity.max = math.ceil (140)
	--level 12
elseif inst.level >=640 and inst.level <760  then
	inst.components.health.maxhealth = math.ceil (125)
	inst.components.sanity.max = math.ceil (145)
	--level 13
elseif inst.level >=760 and inst.level <890  then
	inst.components.health.maxhealth = math.ceil (130)
	inst.components.sanity.max = math.ceil (150)
	--level 14
elseif inst.level >=890 and inst.level <1030  then
	inst.components.health.maxhealth = math.ceil (135)
	inst.components.sanity.max = math.ceil (155)
	--level 15
elseif inst.level >=1030 and inst.level <1180  then
	inst.components.health.maxhealth = math.ceil (140)
	inst.components.sanity.max = math.ceil (160)
	--level 16
elseif inst.level >=1180 and inst.level <1340  then
	inst.components.health.maxhealth = math.ceil (145)
	inst.components.sanity.max = math.ceil (165)
	--level 17
elseif inst.level >=1340 and inst.level <1510  then
	inst.components.health.maxhealth = math.ceil (150)
	inst.components.sanity.max = math.ceil (170)
	--level 18
elseif inst.level >=1510 and inst.level <1690  then
	inst.components.health.maxhealth = math.ceil (155)
	inst.components.sanity.max = math.ceil (175)
	--level 19
elseif inst.level >=1690 and inst.level <1880  then
	inst.components.health.maxhealth = math.ceil (160)
	inst.components.sanity.max = math.ceil (180)
	--level 20
elseif inst.level >=1880 and inst.level <2080  then
	inst.components.health.maxhealth = math.ceil (165)
	inst.components.sanity.max = math.ceil (185)
	--level 21 --decrease sanity
elseif inst.level >=2080 and inst.level <2290  then
	inst.components.health.maxhealth = math.ceil (170)
	inst.components.sanity.max = math.ceil (190)
	--level 22
elseif inst.level >=2290 and inst.level <2500  then
	inst.components.health.maxhealth = math.ceil (175)
	inst.components.sanity.max = math.ceil (195)
	--level 23
elseif inst.level >=2500 and inst.level <2850  then
	inst.components.health.maxhealth = math.ceil (180)
	inst.components.sanity.max = math.ceil (200)
	--level 24
elseif inst.level >=2850 and inst.level <3200  then
	inst.components.health.maxhealth = math.ceil (185)
	inst.components.sanity.max = math.ceil (205)
	--level 25
elseif inst.level >=3200 and inst.level <3700  then
	inst.components.health.maxhealth = math.ceil (190)
	inst.components.sanity.max = math.ceil (210)
	--level 26
elseif inst.level >=3700 and inst.level <4200  then
	inst.components.health.maxhealth = math.ceil (195)
	inst.components.sanity.max = math.ceil (215)
	--level 27
elseif inst.level >=4200 and inst.level <4700  then
	inst.components.health.maxhealth = math.ceil (200)
	inst.components.sanity.max = math.ceil (220)
	--level 28
elseif inst.level >=4700 and inst.level <5500 then
	inst.components.health.maxhealth = math.ceil (205)
	inst.components.sanity.max = math.ceil (225)
	--level 29
elseif inst.level >=5500 and inst.level <7000 then
	inst.components.health.maxhealth = math.ceil (210)
	inst.components.sanity.max = math.ceil (230)
	-- level 30
elseif inst.level >=7000  then
	inst.components.health.maxhealth = math.ceil (215)
	inst.components.sanity.max = math.ceil (235 + inst.level* 0.01)
--	inst.components.combat.damagemultiplier = 1.1
end

		elseif inst:HasTag("hardcoreh") then
if inst.level <5 then
	inst.components.health.maxhealth = math.ceil (60)
	inst.components.sanity.max = math.ceil (80)
	--level 2
elseif inst.level >=5 and inst.level <10  then
	inst.components.health.maxhealth = math.ceil (65)
	inst.components.sanity.max = math.ceil (85)
	--level 3
elseif inst.level >=10 and inst.level <30  then
	inst.components.health.maxhealth = math.ceil (70)
	inst.components.sanity.max = math.ceil (90)
	--level 4
elseif inst.level >=30 and inst.level <50  then
	inst.components.health.maxhealth = math.ceil (75)
	inst.components.sanity.max = math.ceil (95)
	--level 5
elseif inst.level >=50 and inst.level <80  then
	inst.components.health.maxhealth = math.ceil (80)
	inst.components.sanity.max = math.ceil (100)
	--level 6
elseif inst.level >=80 and inst.level <125  then
	inst.components.health.maxhealth = math.ceil (85)
	inst.components.sanity.max = math.ceil (105)
	--level 7
elseif inst.level >=125 and inst.level <200  then
	inst.components.health.maxhealth = math.ceil (90)
	inst.components.sanity.max = math.ceil (110)
	--level 8
elseif inst.level >=200 and inst.level <340  then
	inst.components.health.maxhealth = math.ceil (95)
	inst.components.sanity.max = math.ceil (115)
	--level 9
elseif inst.level >=340 and inst.level <430  then
	inst.components.health.maxhealth = math.ceil (100)
	inst.components.sanity.max = math.ceil (120)
	--level 10
elseif inst.level >=430 and inst.level <530  then
	inst.components.health.maxhealth = math.ceil (105)
	inst.components.sanity.max = math.ceil (125)
	--level 11
elseif inst.level >=530 and inst.level <640  then
	inst.components.health.maxhealth = math.ceil (110)
	inst.components.sanity.max = math.ceil (130)
	--level 12
elseif inst.level >=640 and inst.level <760  then
	inst.components.health.maxhealth = math.ceil (115)
	inst.components.sanity.max = math.ceil (135)
	--level 13
elseif inst.level >=760 and inst.level <890  then
	inst.components.health.maxhealth = math.ceil (120)
	inst.components.sanity.max = math.ceil (140)
	--level 14
elseif inst.level >=890 and inst.level <1030  then
	inst.components.health.maxhealth = math.ceil (125)
	inst.components.sanity.max = math.ceil (145)
	--level 15
elseif inst.level >=1030 and inst.level <1180  then
	inst.components.health.maxhealth = math.ceil (130)
	inst.components.sanity.max = math.ceil (150)
	--level 16
elseif inst.level >=1180 and inst.level <1340  then
	inst.components.health.maxhealth = math.ceil (135)
	inst.components.sanity.max = math.ceil (155)
	--level 17
elseif inst.level >=1340 and inst.level <1510  then
	inst.components.health.maxhealth = math.ceil (140)
	inst.components.sanity.max = math.ceil (160)
	--level 18
elseif inst.level >=1510 and inst.level <1690  then
	inst.components.health.maxhealth = math.ceil (145)
	inst.components.sanity.max = math.ceil (165)
	--level 19
elseif inst.level >=1690 and inst.level <1880  then
	inst.components.health.maxhealth = math.ceil (150)
	inst.components.sanity.max = math.ceil (170)
	--level 20
elseif inst.level >=1880 and inst.level <2080  then
	inst.components.health.maxhealth = math.ceil (155)
	inst.components.sanity.max = math.ceil (175)
	--level 21
elseif inst.level >=2080 and inst.level <2290  then
	inst.components.health.maxhealth = math.ceil (160)
	inst.components.sanity.max = math.ceil (180)
	--level 22
elseif inst.level >=2290 and inst.level <2500  then
	inst.components.health.maxhealth = math.ceil (165)
	inst.components.sanity.max = math.ceil (185)
	--level 23
elseif inst.level >=2500 and inst.level <2850  then
	inst.components.health.maxhealth = math.ceil (170)
	inst.components.sanity.max = math.ceil (190)
	--level 24
elseif inst.level >=2850 and inst.level <3200  then
	inst.components.health.maxhealth = math.ceil (175)
	inst.components.sanity.max = math.ceil (195)
	--level 25
elseif inst.level >=3200 and inst.level <3700  then
	inst.components.health.maxhealth = math.ceil (180)
	inst.components.sanity.max = math.ceil (200)
	--level 26
elseif inst.level >=3700 and inst.level <4200  then
	inst.components.health.maxhealth = math.ceil (185)
	inst.components.sanity.max = math.ceil (205)
	--level 27
elseif inst.level >=4200 and inst.level <4700  then
	inst.components.health.maxhealth = math.ceil (190)
	inst.components.sanity.max = math.ceil (210)
	--level 28
elseif inst.level >=4700 and inst.level <5500 then
	inst.components.health.maxhealth = math.ceil (195)
	inst.components.sanity.max = math.ceil (215)
	--level 29
elseif inst.level >=5500 and inst.level <7000 then
	inst.components.health.maxhealth = math.ceil (200)
	inst.components.sanity.max = math.ceil (220)
	-- level 30
elseif inst.level >=7000  then
	inst.components.health.maxhealth = math.ceil (205)
	inst.components.sanity.max = math.ceil (220 + inst.level* 0.005)
	end

		elseif inst:HasTag("hellh") then
if inst.level <5 then
	inst.components.health.maxhealth = math.ceil (40)
	inst.components.sanity.max = math.ceil (80)
	--level 2
elseif inst.level >=5 and inst.level <10  then
	inst.components.health.maxhealth = math.ceil (45)
	inst.components.sanity.max = math.ceil (85)
	--level 3
elseif inst.level >=10 and inst.level <30  then
	inst.components.health.maxhealth = math.ceil (50)
	inst.components.sanity.max = math.ceil (90)
	--level 4
elseif inst.level >=30 and inst.level <50  then
	inst.components.health.maxhealth = math.ceil (55)
	inst.components.sanity.max = math.ceil (95)
	--level 5
elseif inst.level >=50 and inst.level <80  then
	inst.components.health.maxhealth = math.ceil (60)
	inst.components.sanity.max = math.ceil (100)
	--level 6
elseif inst.level >=80 and inst.level <125  then
	inst.components.health.maxhealth = math.ceil (65)
	inst.components.sanity.max = math.ceil (105)
	--level 7
elseif inst.level >=125 and inst.level <200  then
	inst.components.health.maxhealth = math.ceil (70)
	inst.components.sanity.max = math.ceil (110)
	--level 8
elseif inst.level >=200 and inst.level <340  then
	inst.components.health.maxhealth = math.ceil (75)
	inst.components.sanity.max = math.ceil (115)
	--level 9
elseif inst.level >=340 and inst.level <430  then
	inst.components.health.maxhealth = math.ceil (80)
	inst.components.sanity.max = math.ceil (120)
	--level 10
elseif inst.level >=430 and inst.level <530  then
	inst.components.health.maxhealth = math.ceil (85)
	inst.components.sanity.max = math.ceil (125)
	--level 11
elseif inst.level >=530 and inst.level <640  then
	inst.components.health.maxhealth = math.ceil (90)
	inst.components.sanity.max = math.ceil (130)
	--level 12
elseif inst.level >=640 and inst.level <760  then
	inst.components.health.maxhealth = math.ceil (95)
	inst.components.sanity.max = math.ceil (135)
	--level 13
elseif inst.level >=760 and inst.level <890  then
	inst.components.health.maxhealth = math.ceil (100)
	inst.components.sanity.max = math.ceil (140)
	--level 14
elseif inst.level >=890 and inst.level <1030  then
	inst.components.health.maxhealth = math.ceil (105)
	inst.components.sanity.max = math.ceil (145)
	--level 15
elseif inst.level >=1030 and inst.level <1180  then
	inst.components.health.maxhealth = math.ceil (110)
	inst.components.sanity.max = math.ceil (150)
	--level 16
elseif inst.level >=1180 and inst.level <1340  then
	inst.components.health.maxhealth = math.ceil (115)
	inst.components.sanity.max = math.ceil (155)
	--level 17
elseif inst.level >=1340 and inst.level <1510  then
	inst.components.health.maxhealth = math.ceil (120)
	inst.components.sanity.max = math.ceil (160)
	--level 18
elseif inst.level >=1510 and inst.level <1690  then
	inst.components.health.maxhealth = math.ceil (125)
	inst.components.sanity.max = math.ceil (165)
	--level 19
elseif inst.level >=1690 and inst.level <1880  then
	inst.components.health.maxhealth = math.ceil (130)
	inst.components.sanity.max = math.ceil (170)
	--level 20
elseif inst.level >=1880 and inst.level <2080  then
	inst.components.health.maxhealth = math.ceil (132)
	inst.components.sanity.max = math.ceil (172)
	--level 21
elseif inst.level >=2080 and inst.level <2290  then
	inst.components.health.maxhealth = math.ceil (134)
	inst.components.sanity.max = math.ceil (174)
	--level 22
elseif inst.level >=2290 and inst.level <2500  then
	inst.components.health.maxhealth = math.ceil (136)
	inst.components.sanity.max = math.ceil (176)
	--level 23
elseif inst.level >=2500 and inst.level <2850  then
	inst.components.health.maxhealth = math.ceil (138)
	inst.components.sanity.max = math.ceil (178)
	--level 24
elseif inst.level >=2850 and inst.level <3200  then
	inst.components.health.maxhealth = math.ceil (140)
	inst.components.sanity.max = math.ceil (180)
	--level 25
elseif inst.level >=3200 and inst.level <3700  then
	inst.components.health.maxhealth = math.ceil (142)
	inst.components.sanity.max = math.ceil (182)
	--level 26
elseif inst.level >=3700 and inst.level <4200  then
	inst.components.health.maxhealth = math.ceil (144)
	inst.components.sanity.max = math.ceil (184)
	--level 27
elseif inst.level >=4200 and inst.level <4700  then
	inst.components.health.maxhealth = math.ceil (146)
	inst.components.sanity.max = math.ceil (186)
	--level 28
elseif inst.level >=4700 and inst.level <5500 then
	inst.components.health.maxhealth = math.ceil (148)
	inst.components.sanity.max = math.ceil (188)
	--level 29
elseif inst.level >=5500 and inst.level <7000 then
	inst.components.health.maxhealth = math.ceil (150)
	inst.components.sanity.max = math.ceil (190)
	-- level 30
elseif inst.level >=7000  then
	inst.components.health.maxhealth = math.ceil (155)
	inst.components.sanity.max = math.ceil (195 + inst.level* 0.005)
	end

		elseif inst:HasTag("easyh") then
if inst.level <5 then
	inst.components.health.maxhealth = math.ceil (120)
	inst.components.sanity.max = math.ceil (90)
	--level 2
elseif inst.level >=5 and inst.level <10  then
	inst.components.health.maxhealth = math.ceil (125)
	inst.components.sanity.max = math.ceil (100)
	--level 3
elseif inst.level >=10 and inst.level <30  then
	inst.components.health.maxhealth = math.ceil (130)
	inst.components.sanity.max = math.ceil (110)
	--level 4
elseif inst.level >=30 and inst.level <50  then
	inst.components.health.maxhealth = math.ceil (135)
	inst.components.sanity.max = math.ceil (120)
	--level 5
elseif inst.level >=50 and inst.level <80  then
	inst.components.health.maxhealth = math.ceil (140)
	inst.components.sanity.max = math.ceil (130)
	--level 6
elseif inst.level >=80 and inst.level <125  then
	inst.components.health.maxhealth = math.ceil (145)
	inst.components.sanity.max = math.ceil (140)
	--level 7
elseif inst.level >=125 and inst.level <200  then
	inst.components.health.maxhealth = math.ceil (150)
	inst.components.sanity.max = math.ceil (150)
	--level 8
elseif inst.level >=200 and inst.level <340  then
	inst.components.health.maxhealth = math.ceil (155)
	inst.components.sanity.max = math.ceil (160)
	--level 9
elseif inst.level >=340 and inst.level <430  then
	inst.components.health.maxhealth = math.ceil (160)
	inst.components.sanity.max = math.ceil (170)
	--level 10
elseif inst.level >=430 and inst.level <530  then
	inst.components.health.maxhealth = math.ceil (165)
	inst.components.sanity.max = math.ceil (180)
	--level 11
elseif inst.level >=530 and inst.level <640  then
	inst.components.health.maxhealth = math.ceil (170)
	inst.components.sanity.max = math.ceil (190)
	--level 12
elseif inst.level >=640 and inst.level <760  then
	inst.components.health.maxhealth = math.ceil (175)
	inst.components.sanity.max = math.ceil (200)
	--level 13
elseif inst.level >=760 and inst.level <890  then
	inst.components.health.maxhealth = math.ceil (180)
	inst.components.sanity.max = math.ceil (210)
	--level 14
elseif inst.level >=890 and inst.level <1030  then
	inst.components.health.maxhealth = math.ceil (185)
	inst.components.sanity.max = math.ceil (220)
	--level 15
elseif inst.level >=1030 and inst.level <1180  then
	inst.components.health.maxhealth = math.ceil (190)
	inst.components.sanity.max = math.ceil (230)
	--level 16
elseif inst.level >=1180 and inst.level <1340  then
	inst.components.health.maxhealth = math.ceil (195)
	inst.components.sanity.max = math.ceil (240)
	--level 17
elseif inst.level >=1340 and inst.level <1510  then
	inst.components.health.maxhealth = math.ceil (200)
	inst.components.sanity.max = math.ceil (250)
	--level 18
elseif inst.level >=1510 and inst.level <1690  then
	inst.components.health.maxhealth = math.ceil (205)
	inst.components.sanity.max = math.ceil (260)
	--level 19
elseif inst.level >=1690 and inst.level <1880  then
	inst.components.health.maxhealth = math.ceil (210)
	inst.components.sanity.max = math.ceil (270)
	--level 20
elseif inst.level >=1880 and inst.level <2080  then
	inst.components.health.maxhealth = math.ceil (215)
	inst.components.sanity.max = math.ceil (280)
	--level 21
elseif inst.level >=2080 and inst.level <2290  then
	inst.components.health.maxhealth = math.ceil (220)
	inst.components.sanity.max = math.ceil (290)
	--level 22
elseif inst.level >=2290 and inst.level <2500  then
	inst.components.health.maxhealth = math.ceil (225)
	inst.components.sanity.max = math.ceil (300)
	--level 23
elseif inst.level >=2500 and inst.level <2850  then
	inst.components.health.maxhealth = math.ceil (230)
	inst.components.sanity.max = math.ceil (310)
	--level 24
elseif inst.level >=2850 and inst.level <3200  then
	inst.components.health.maxhealth = math.ceil (235)
	inst.components.sanity.max = math.ceil (320)
	--level 25
elseif inst.level >=3200 and inst.level <3700  then
	inst.components.health.maxhealth = math.ceil (240)
	inst.components.sanity.max = math.ceil (330)
	--level 26
elseif inst.level >=3700 and inst.level <4200  then
	inst.components.health.maxhealth = math.ceil (245)
	inst.components.sanity.max = math.ceil (340)
	--level 27
elseif inst.level >=4200 and inst.level <4700  then
	inst.components.health.maxhealth = math.ceil (250)
	inst.components.sanity.max = math.ceil (350)
	--level 28
elseif inst.level >=4700 and inst.level <5500 then
	inst.components.health.maxhealth = math.ceil (255)
	inst.components.sanity.max = math.ceil (360)
	--level 29
elseif inst.level >=5500 and inst.level <7000 then
	inst.components.health.maxhealth = math.ceil (260)
	inst.components.sanity.max = math.ceil (370)
	-- level 30
elseif inst.level >=7000  then
	inst.components.health.maxhealth = math.ceil (275)
	inst.components.sanity.max = math.ceil (380 + inst.level* 0.01)
--	inst.components.combat.damagemultiplier = 1.1
end

		elseif inst:HasTag("veasyh") then
if inst.level <5 then
	inst.components.health.maxhealth = math.ceil (120)
	inst.components.sanity.max = math.ceil (90)
	--level 2
elseif inst.level >=5 and inst.level <10  then
	inst.components.health.maxhealth = math.ceil (130)
	inst.components.sanity.max = math.ceil (105)
	--level 3
elseif inst.level >=10 and inst.level <30  then
	inst.components.health.maxhealth = math.ceil (140)
	inst.components.sanity.max = math.ceil (120)
	--level 4
elseif inst.level >=30 and inst.level <50  then
	inst.components.health.maxhealth = math.ceil (150)
	inst.components.sanity.max = math.ceil (135)
	--level 5
elseif inst.level >=50 and inst.level <80  then
	inst.components.health.maxhealth = math.ceil (160)
	inst.components.sanity.max = math.ceil (150)
	--level 6
elseif inst.level >=80 and inst.level <125  then
	inst.components.health.maxhealth = math.ceil (180)
	inst.components.sanity.max = math.ceil (165)
	--level 7
elseif inst.level >=125 and inst.level <200  then
	inst.components.health.maxhealth = math.ceil (190)
	inst.components.sanity.max = math.ceil (180)
	--level 8
elseif inst.level >=200 and inst.level <340  then
	inst.components.health.maxhealth = math.ceil (200)
	inst.components.sanity.max = math.ceil (195)
	--level 9
elseif inst.level >=340 and inst.level <430  then
	inst.components.health.maxhealth = math.ceil (210)
	inst.components.sanity.max = math.ceil (210)
	--level 10
elseif inst.level >=430 and inst.level <530  then
	inst.components.health.maxhealth = math.ceil (220)
	inst.components.sanity.max = math.ceil (225)
	--level 11
elseif inst.level >=530 and inst.level <640  then
	inst.components.health.maxhealth = math.ceil (230)
	inst.components.sanity.max = math.ceil (240)
	--level 12
elseif inst.level >=640 and inst.level <760  then
	inst.components.health.maxhealth = math.ceil (240)
	inst.components.sanity.max = math.ceil (255)
	--level 13
elseif inst.level >=760 and inst.level <890  then
	inst.components.health.maxhealth = math.ceil (250)
	inst.components.sanity.max = math.ceil (270)
	--level 14
elseif inst.level >=890 and inst.level <1030  then
	inst.components.health.maxhealth = math.ceil (260)
	inst.components.sanity.max = math.ceil (285)
	--level 15
elseif inst.level >=1030 and inst.level <1180  then
	inst.components.health.maxhealth = math.ceil (270)
	inst.components.sanity.max = math.ceil (300)
	--level 16
elseif inst.level >=1180 and inst.level <1340  then
	inst.components.health.maxhealth = math.ceil (280)
	inst.components.sanity.max = math.ceil (315)
	--level 17
elseif inst.level >=1340 and inst.level <1510  then
	inst.components.health.maxhealth = math.ceil (290)
	inst.components.sanity.max = math.ceil (330)
	--level 18
elseif inst.level >=1510 and inst.level <1690  then
	inst.components.health.maxhealth = math.ceil (300)
	inst.components.sanity.max = math.ceil (345)
	--level 19
elseif inst.level >=1690 and inst.level <1880  then
	inst.components.health.maxhealth = math.ceil (310)
	inst.components.sanity.max = math.ceil (360)
	--level 20
elseif inst.level >=1880 and inst.level <2080  then
	inst.components.health.maxhealth = math.ceil (320)
	inst.components.sanity.max = math.ceil (375)
	--level 21
elseif inst.level >=2080 and inst.level <2290  then
	inst.components.health.maxhealth = math.ceil (330)
	inst.components.sanity.max = math.ceil (390)
	--level 22
elseif inst.level >=2290 and inst.level <2500  then
	inst.components.health.maxhealth = math.ceil (340)
	inst.components.sanity.max = math.ceil (405)
	--level 23
elseif inst.level >=2500 and inst.level <2850  then
	inst.components.health.maxhealth = math.ceil (350)
	inst.components.sanity.max = math.ceil (420)
	--level 24
elseif inst.level >=2850 and inst.level <3200  then
	inst.components.health.maxhealth = math.ceil (360)
	inst.components.sanity.max = math.ceil (435)
	--level 25
elseif inst.level >=3200 and inst.level <3700  then
	inst.components.health.maxhealth = math.ceil (380)
	inst.components.sanity.max = math.ceil (450)
	--level 26
elseif inst.level >=3700 and inst.level <4200  then
	inst.components.health.maxhealth = math.ceil (390)
	inst.components.sanity.max = math.ceil (465)
	--level 27
elseif inst.level >=4200 and inst.level <4700  then
	inst.components.health.maxhealth = math.ceil (400)
	inst.components.sanity.max = math.ceil (480)
	--level 28
elseif inst.level >=4700 and inst.level <5500 then
	inst.components.health.maxhealth = math.ceil (410)
	inst.components.sanity.max = math.ceil (495)
	--level 29
elseif inst.level >=5500 and inst.level <7000 then
	inst.components.health.maxhealth = math.ceil (420)
	inst.components.sanity.max = math.ceil (510)
	-- level 30
elseif inst.level >=7000  then
	inst.components.health.maxhealth = math.ceil (430)
	inst.components.sanity.max = math.ceil (525 + inst.level* 0.01)
--	inst.components.combat.damagemultiplier = 1.1
end
	end



	inst.components.health:SetPercent(health_percent)
	inst.components.sanity:SetPercent(sanity_percent)
 
--[test]
--[[
if inst.level >0 then
inst.musha_level1 = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.valkyrie_mood = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.fshield1 = true
	inst.hpregen1 = true
	inst.hitfreeze1 = true
	inst.lessercure1 = true
	inst.cure0 = true
 	inst.berserkarmor = true
 	inst:AddTag("shadowimage")
 	inst:AddTag("backstab")

]]--
			if inst.level >0 and inst.level <= 4 then

inst.musha_level1 = true

			elseif inst.level >4 and inst.level <= 5 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 2\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_ELECTRA.."]\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_SHIELD.."]")
	inst.healshield1 = true
	inst.cure0 = true
	inst.musha_level2 = true
	

inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")


			elseif inst.level >5 and inst.level <= 9 then

	inst.healshield1 = true
	inst.cure0 = true
	inst.musha_level2 = true
	

		elseif inst.level >9 and inst.level <= 10 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 3\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..":["..STRINGS.MUSHA_SKILL_VALKYR.."]\n1/1")
	inst.valkyrie_mood = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.healshield1 = true
	inst.cure0 = true
	inst.musha_level3 = true
	
	

			elseif inst.level >10 and inst.level <= 29 then
--inst.components.talker:Say("Next :EXP[30]\n[EXP] + ".. (inst.level))
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.cure0 = true
	inst.musha_level3 = true
	
	

		elseif inst.level >29 and inst.level <= 30 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 4\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_CRITIC.."]\n1/4")
	inst.hitcritical1 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.cure0 = true
	inst.musha_level4 = true
	
	
	

			elseif inst.level > 30 and inst.level <= 49  then

	inst.hitcritical1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.cure0 = true
	inst.musha_level4 = true
	
	
	

		elseif inst.level >49 and inst.level <= 50 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 5\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_T_SKILL_V_POWER.."]\n1/2")
	inst.hitlightning1 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level5 = true



			elseif inst.level >50 and inst.level <=79  then

	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level5 = true


		elseif inst.level >79 and inst.level <= 80 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 6\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_RECOVERY.."]\n1/2")
	inst.lessercure1 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level6 = true

	

			elseif inst.level >80 and inst.level <=124  then
--inst.components.talker:Say("Next :EXP[125]\n[EXP] + ".. (inst.level))
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level6 = true

	

		elseif inst.level >124 and inst.level <= 125 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 7\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_T_SKILL_BERSERK.."]\n1/1")
	inst.berserk_mood = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level7 = true

			elseif inst.level >125 and inst.level <=199  then

inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level7 = true

		elseif inst.level >199 and inst.level <= 200 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 8\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_FSHIELD.."]\n1/4")
	inst.fshield1 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level8 = true
	

			elseif inst.level >200 and inst.level <=339  then

	inst.fshield1 = true
inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level8 = true
	
		elseif inst.level >339 and inst.level <= 340 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 9\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_REGENERATE.."]\n1/4")
	inst.hpregen1 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level9 = true

	

			elseif inst.level >340 and inst.level <=429  then

	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level9 = true
	
	

		elseif inst.level >429 and inst.level <= 430 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 10\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..":["..STRINGS.MUSHA_SKILL_BACKSTAB.."] 1/3\nLevel 10\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..":["..STRINGS.MUSHA_SKILL_SHADOW.."] 1/1\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..":["..STRINGS.MUSHA_SKILL_FREEZE.."] 1/4")
	inst.hitfreeze1 = true
 	inst.backstab1 = true inst.shadowb = true 
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level10 = true


			elseif inst.level >430 and inst.level <=529  then

	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = true
	inst.cure0 = true
	inst.musha_level10 = true

 	inst.backstab1 = true inst.shadowb = true 

		elseif inst.level >529 and inst.level <= 530 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 11\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_CRITIC.."]\n2/4")
	inst.hitcritical1 = false
	inst.hitcritical2 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.cure0 = true
	inst.musha_level11 = true

	
 	inst.backstab1 = true inst.shadowb = true 

			elseif inst.level >530 and inst.level <=639  then

	inst.hitcritical2 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = false
	inst.cure0 = true
	inst.musha_level11 = true

	
 	inst.backstab1 = true inst.shadowb = true 

		elseif inst.level >639 and inst.level <= 640 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 12\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_CRITIC.."]\n3/4")
	inst.hitcritical2 = false
	inst.hitcritical3 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = false
	inst.cure0 = true
	inst.musha_level12 = true

	
	
 	inst.backstab1 = true inst.shadowb = true 

			elseif inst.level >640 and inst.level <=759  then

	inst.hitcritical3 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.cure0 = true
	inst.musha_level12 = true

	
	
 	inst.backstab1 = true inst.shadowb = true 

		elseif inst.level >759 and inst.level <= 760 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 13\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_CRITIC.."]\n4/4")
	inst.hitcritical3 = false
	inst.hitcritical4 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.cure0 = true
	inst.musha_level13 = true

 	inst.backstab1 = true inst.shadowb = true 

			elseif inst.level >760 and inst.level <=889  then

	inst.hitcritical4 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = true
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level13 = true

 	inst.backstab1 = true inst.shadowb = true 

		elseif inst.level >889 and inst.level <= 890 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 14\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_ELECTRA.."]\n2/4")
	inst.healshield1 = false
	inst.healshield2 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hitcritical4 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level14 = true

	
 	inst.backstab1 = true inst.shadowb = true 

			elseif inst.level >890 and inst.level <=1029  then

	inst.healshield2 = true
	inst.hitcritical4 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level14 = true

	
 	inst.backstab1 = true inst.shadowb = true 

		elseif inst.level >1029 and inst.level <= 1030 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 15\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_ELECTRA.."]\n3/4")
	inst.healshield2 = false
	inst.healshield3 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hitcritical4 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level15 = true

	
	
 	inst.backstab1 = true inst.shadowb = true 

			elseif inst.level >1030 and inst.level <=1179  then

	inst.healshield3 = true
	inst.hitcritical4 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level15 = true

	
	
 	inst.backstab1 = true inst.shadowb = true 

		elseif inst.level >1179 and inst.level <= 1180 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 16\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_ELECTRA.."]\n4/4")
	inst.healshield3 = false
	inst.healshield4 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hitcritical4 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level16 = true

 	inst.backstab1 = true inst.shadowb = true 

			elseif inst.level >1180 and inst.level <=1339  then

	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.lessercure1 = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level16 = true

 	inst.backstab1 = true inst.shadowb = true 

		elseif inst.level >1339 and inst.level <= 1340 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 17\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_RECOVERY.."]\n2/2")
	inst.lessercure1 = false
	inst.lessercure2 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level17 = true

	
 	inst.backstab1 = true inst.shadowb = true 

			elseif inst.level >1340 and inst.level <=1509  then

	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level17 = true

	
 	inst.backstab1 = true inst.shadowb = true 

		elseif inst.level >1509 and inst.level <= 1510 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 18\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_FREEZE.."]\n2/4")
	inst.hitfreeze1 = false
	inst.hitfreeze2 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hitfreeze1 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level18 = true

	
	
 	inst.backstab1 = true inst.shadowb = true 

			elseif inst.level >1510 and inst.level <=1689  then

	inst.hitfreeze2 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level18 = true

	
	
 	inst.backstab1 = true inst.shadowb = true 

		elseif inst.level >1689 and inst.level <= 1690 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 19\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_FREEZE.."]\n3/4")
	inst.hitfreeze2 = false
	inst.hitfreeze3 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level19 = true
 	inst.backstab1 = true inst.shadowb = true 

			elseif inst.level >1690 and inst.level <=1879  then

	inst.hitfreeze3 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level19 = true
 	inst.backstab1 = true inst.shadowb = true 

		elseif inst.level >1879 and inst.level <= 1880 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 20\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_BACKSTAB.."] 2/3\n["..STRINGS.MUSHA_SKILL_FREEZE.."] 4/4")
	inst.hitfreeze3 = false
	inst.hitfreeze4 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level20 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	

			elseif inst.level >1880 and inst.level <=2079  then

	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level20 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	

		elseif inst.level >2079 and inst.level <= 2080 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 21\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_REGENERATE.."]\n2/4")
	inst.hpregen1 = false
	inst.hpregen2 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level21 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 


			elseif inst.level >2080 and inst.level <=2289  then

	inst.hpregen2 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level21 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 


		elseif inst.level >2189 and inst.level <= 2290 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 22\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_REGENERATE.."]\n3/4")
	inst.hpregen2 = false
	inst.hpregen3 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level22 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	

			elseif inst.level >2290 and inst.level <=2499  then

	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hpregen1 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level22 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	

		elseif inst.level >2499 and inst.level <= 2500 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 23\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_FSHIELD.."]\n2/4")
	inst.fshield1 = false
	inst.fshield2 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.hpregen1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level23 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	
	

			elseif inst.level >2500 and inst.level <=2849  then

	inst.fshield2 = true
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level23 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	
	

		elseif inst.level >2849 and inst.level <= 2850 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 24\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_FSHIELD.."]\n3/4")
	inst.fshield2 = false
	inst.fshield3 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level24 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 


			elseif inst.level >2850 and inst.level <=3199  then

	inst.fshield3 = true
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level24 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 


		elseif inst.level >3199 and inst.level <= 3200 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 25\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_FSHIELD.."]\n4/4")
	inst.fshield3 = false
	inst.fshield4 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level25 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	

			elseif inst.level >3200 and inst.level <=3699  then

	inst.fshield4 = true
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = true
	inst.musha_level25 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	

		elseif inst.level >3699 and inst.level <= 3700 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 26\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_SHIELD.."]\n2/3")
	inst.cure1 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.fshield4 = true
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = false
	inst.musha_level26 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	
	

			elseif inst.level >3700 and inst.level <=4199  then

	inst.cure1 = true
	inst.fshield4 = true
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = false
	inst.musha_level26 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	
	

		elseif inst.level >4199 and inst.level <= 4200 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 27\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_SHIELD.."]\n3/3")
	inst.cure1 = false
	inst.cure2 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.fshield4 = true
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure0 = false
	inst.musha_level27 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 



			elseif inst.level >4200 and inst.level <=4699  then

	inst.cure2 = true
	inst.fshield4 = true
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure1 = false
	inst.cure0 = false
	inst.musha_level27 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 



		elseif inst.level >4699 and inst.level <= 4700 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 28\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_T_SKILL_DOUBLE.."]\n1/1")
	inst.berserkarmor = true

inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.cure2 = true
	inst.fshield4 = true
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure1 = false
	inst.cure0 = false
	inst.musha_level28 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	inst:RemoveTag("level27")


			elseif inst.level >4700 and inst.level <=5499  then

	inst.cure2 = true
	inst.fshield4 = true
	inst.hpregen3 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure1 = false
 	inst.berserkarmor = true
	inst.cure0 = false
	inst.musha_level28 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	inst:RemoveTag("level27")

	

		elseif inst.level >5499 and inst.level <= 5500 then
	inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 29\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_REGENERATE.."]\n4/4")
	inst.hpregen3 = false
	inst.hpregen4 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.cure2 = true
	inst.fshield4 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure1 = false
 	inst.berserkarmor = true
	inst.cure0 = false
	inst.musha_level29 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	inst:RemoveTag("level28")
	inst:RemoveTag("level27")

	

			elseif inst.level >5500 and inst.level <=6999  then

	inst.hpregen4 = true
	inst.cure2 = true
	inst.fshield4 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.hitlightning1 = true
	inst.valkyrie_mood = true
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure1 = false
	inst.hpregen3 = false
 	inst.berserkarmor = true
	inst.cure0 = false
	inst.musha_level29 = true
 	inst.backstab2 = true inst.shadowb = true 
 	inst.backstab1 = false 

	inst:RemoveTag("level28")
	inst:RemoveTag("level27")

	
	

		elseif inst.level >6999 and inst.level <= 7000 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL..": 30\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_T_SKILL_V_POWER.."] 2/2\n"..STRINGS.MUSHA_T_SKILL_UNLOCK..": ["..STRINGS.MUSHA_SKILL_BACKSTAB.."]3/3")
	inst.hitlightning1 = false
	inst.hitlightning2 = true
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	inst.hpregen4 = true
	inst.cure2 = true
	inst.fshield4 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.valkyrie_mood = true
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure1 = false
	inst.hpregen3 = false
 	inst.berserkarmor = true
	inst.cure0 = false
 	inst.shadowb = true
	inst.musha_level30 = true
 	inst.backstab3 = true 
 	inst.backstab2 = false 
 	inst.backstab1 = false 

	inst:RemoveTag("level29")
	inst:RemoveTag("level28")
	inst:RemoveTag("level27")
	
	


		elseif inst.level > 7000 then
	inst.hitlightning2 = true
	inst.hpregen4 = true
	inst.cure2 = true
	inst.fshield4 = true
	inst.hitfreeze4 = true
	inst.lessercure2 = true
	inst.healshield4 = true
	inst.hitcritical4 = true
	inst.fshield1 = true
	inst.berserk_mood = true
	inst.valkyrie_mood = true
	inst.hitlightning1 = false
	inst.fshield3 = false
	inst.fshield2 = false
	inst.fshield1 = false
	inst.hpregen2 = false
	inst.hpregen1 = false
	inst.hitfreeze3 = false
	inst.hitfreeze2 = false
	inst.hitfreeze1 = false
	inst.lessercure1 = false
	inst.healshield3 = false
	inst.healshield2 = false
	inst.healshield1 = false
	inst.hitcritical1 = false
	inst.hitcritical2 = false
	inst.hitcritical3 = false
	inst.cure1 = false
	inst.hpregen3 = false
 	inst.berserkarmor = true
	inst.cure0 = false
	inst.musha_level30 = true
 	inst.shadowb = true
 	inst.backstab3 = true 
 	inst.backstab2 = false 
 	inst.backstab1 = false 

	inst:RemoveTag("level29")
	inst:RemoveTag("level28")
	inst:RemoveTag("level27")
	
	
	end
end
---
local exp1x = 0.05
local exp2x = 0.1
local exp3x = 0.2
local exp4x = 0.3
local tynychance = 0.1
local smallllchance = 0.15
local smallchance = 0.25
local normalchance = 0.35
local largechance = 0.7
local foodnormalchance = 0.45
local foodgoodchance = 0.65
local foodlargechance = 0.8
local smallScale = 0.5
local medScale = 0.7
local largeScale = 1.1
local function onkilll(inst, data)
--local victim = data.inst
local victim = data.victim
	--if data.cause == inst.prefab and not data.inst:HasTag("companion") then
	if not victim:HasTag("companion") then
	if victim:HasTag("spider_c") and not inst.no_assasin then
		inst.count_s = inst.count_s + 1
		if inst.count_s >= 70 and inst.count_s < 100 and math.random() < smallchance then
			inst.assain_pop = true	
		elseif inst.count_s >= 100 then
			inst.assain_pop = true	
							end
						end
				
	if math.random() < smallchance and victim:HasTag("prey") and not victim:HasTag("monster") and not victim:HasTag("insect") then
        			inst.level = inst.level + 1
					levelexp(inst)	
	elseif math.random() < tynychance and victim:HasTag("insect") and not victim:HasTag("monster") and not victim:HasTag("prey") then
    				inst.level = inst.level + 1
					levelexp(inst)
	elseif math.random() < largechance and not victim:HasTag("no_exp") and not victim:HasTag("prey") and not victim:HasTag("eyeplant") and not victim:HasTag("insect") and not victim:HasTag("arm") and not victim:HasTag("wall") then
    				inst.level = inst.level + 1
					levelexp(inst)
		if math.random() < .35 and not victim:HasTag("hound") and victim.components.combat then	
		if inst.DLC or inst.DLC2 then
			local delta = (victim.components.combat.defaultdamage) * 0.15
	        local time = victim.components.health.destroytime or 2
        	inst:DoTaskInTime(time, function()
        		local s = medScale
        		if victim:HasTag("smallcreature") then
        			s = smallScale
    			elseif victim:HasTag("largecreature") then
    				s = largeScale
    			end
        		local fx = SpawnPrefab("wathgrithr_spirit")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx.Transform:SetScale(s,s,s)
				inst.components.sanity:DoDelta(delta)
				inst:DoTaskInTime(0, function() SpawnPrefab("musha_spore").Transform:SetPosition(victim:GetPosition():Get()) end) end) 
		elseif not (inst.DLC and inst.DLC2) then		
				inst:DoTaskInTime(1.2, function() SpawnPrefab("musha_spore").Transform:SetPosition(victim:GetPosition():Get()) end) 
				
				end
				end
        
			if not inst.berserk and math.random() < .25 and victim:HasTag("hound") then
				inst.SoundEmitter:PlaySound("dontstarve/characters/willow/talk_LP", "talk")
				inst:DoTaskInTime(0.5, function() inst.SoundEmitter:KillSound("talk") end)
					if math.random() < 0.25 then
					inst.components.talker:Say(STRINGS.MUSHA_TALK_PUPPY_SPAWN1)
					elseif math.random() < 0.25 then
					inst.components.talker:Say(STRINGS.MUSHA_TALK_PUPPY_SPAWN2)
					else
					inst.components.talker:Say(STRINGS.MUSHA_TALK_PUPPY_SPAWN3)
						end
						if inst.DLC or inst.DLC2 then
	        local time = victim.components.health.destroytime or 2
        	inst:DoTaskInTime(time, function()
        		local s = medScale
        		if victim:HasTag("smallcreature") then
        			s = smallScale
    			elseif victim:HasTag("largecreature") then
    				s = largeScale
    			end
        		local fx = SpawnPrefab("wathgrithr_spirit")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx.Transform:SetScale(s,s,s)
				inst:DoTaskInTime(0, function() SpawnPrefab("ghosthound2").Transform:SetPosition(victim:GetPosition():Get()) end) end) 			elseif not (inst.DLC and inst.DLC2) then
				inst:DoTaskInTime(1.2, function() SpawnPrefab("musha_spore").Transform:SetPosition(victim:GetPosition():Get()) SpawnPrefab("ghosthound2").Transform:SetPosition(victim:GetPosition():Get()) end)
						end
					end
						
		
		end
	
------extra
  
if not (victim:HasTag("prey") and victim:HasTag("eyeplant") and victim:HasTag("veggie") and victim:HasTag("insect") and victim:HasTag("arm") and victim:HasTag("wall")) then

	if math.random() < exp1x and inst:HasTag("expd1") then
	local fx = SpawnPrefab("statue_transition")
	local fx2 = SpawnPrefab("exp")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx2.Transform:SetPosition(victim:GetPosition():Get())
	--inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(victim:GetPosition():Get()) end) 
	elseif math.random() < exp2x and inst:HasTag("expd2") then
	local fx = SpawnPrefab("statue_transition")
	local fx2 = SpawnPrefab("exp")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx2.Transform:SetPosition(victim:GetPosition():Get())
	--inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(victim:GetPosition():Get()) end) 
	elseif math.random() < exp3x and inst:HasTag("expd3") then 
	local fx = SpawnPrefab("statue_transition")
	local fx2 = SpawnPrefab("exp")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx2.Transform:SetPosition(victim:GetPosition():Get())
	--inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(victim:GetPosition():Get()) end) 
	elseif math.random() < exp4x and inst:HasTag("expd4") then
	local fx = SpawnPrefab("statue_transition")
	local fx2 = SpawnPrefab("exp")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx2.Transform:SetPosition(victim:GetPosition():Get())
	--inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(victim:GetPosition():Get()) end) 
end	
	end
	-- rare monster	
	if victim:HasTag("giant1x") then
	local fx = SpawnPrefab("statue_transition")
	local fx4 = SpawnPrefab("musha_treasure2")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx4.Transform:SetPosition(victim:GetPosition():Get())
				fx4:SetTreasureHunt()
    				inst.level = inst.level + 10
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_GIANT..STRINGS.MUSHA_LEVEL_EXP.."(+10) \n".. (inst.level))
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore2").Transform:SetPosition(victim:GetPosition():Get()) end)
	elseif victim:HasTag("giant2x") then
	local fx = SpawnPrefab("statue_transition")
	local fx2 = SpawnPrefab("redgem")
	local fx3 = SpawnPrefab("bluegem")
	local fx4 = SpawnPrefab("musha_treasure2")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx2.Transform:SetPosition(victim:GetPosition():Get())
        		fx3.Transform:SetPosition(victim:GetPosition():Get())
        		fx4.Transform:SetPosition(victim:GetPosition():Get())
				fx4:SetTreasureHunt()
    				inst.level = inst.level + 20
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_GIANT..STRINGS.MUSHA_LEVEL_EXP.."(+20) \n".. (inst.level))
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore2").Transform:SetPosition(victim:GetPosition():Get()) end)
	elseif victim:HasTag("giant3x") then
	local fx = SpawnPrefab("statue_transition")
	local fx2 = SpawnPrefab("redgem")
	local fx3 = SpawnPrefab("bluegem")
	local fx4 = SpawnPrefab("musha_treasure2")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx2.Transform:SetPosition(victim:GetPosition():Get())
        		fx3.Transform:SetPosition(victim:GetPosition():Get())
        		fx4.Transform:SetPosition(victim:GetPosition():Get())
				fx4:SetTreasureHunt()
    				inst.level = inst.level + 30
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_GIANT..STRINGS.MUSHA_LEVEL_EXP.."(+30) \n".. (inst.level))
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore2").Transform:SetPosition(victim:GetPosition():Get()) end)
	elseif victim:HasTag("giant4x") then
	local fx = SpawnPrefab("statue_transition")
	local fx2 = SpawnPrefab("redgem")
	local fx3 = SpawnPrefab("bluegem")
	local fx5 = SpawnPrefab("greengem")
	local fx4 = SpawnPrefab("musha_treasure2")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx2.Transform:SetPosition(victim:GetPosition():Get())
        		fx3.Transform:SetPosition(victim:GetPosition():Get())
        		fx5.Transform:SetPosition(victim:GetPosition():Get())
				fx4.Transform:SetPosition(victim:GetPosition():Get())
				fx4:SetTreasureHunt()
    				inst.level = inst.level + 40
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_GIANT..STRINGS.MUSHA_LEVEL_EXP.."(+40) \n".. (inst.level))
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore2").Transform:SetPosition(victim:GetPosition():Get()) end)
	
	elseif victim:HasTag("small_giant2x") then
	local fx = SpawnPrefab("statue_transition")
	local fx2 = SpawnPrefab("goldnugget")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx2.Transform:SetPosition(victim:GetPosition():Get())
	local fx3 = SpawnPrefab("glowdust")
        		fx3.Transform:SetPosition(victim:GetPosition():Get())
    				inst.level = inst.level + 4
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_EPIC..STRINGS.MUSHA_LEVEL_EXP.."(+4) \n".. (inst.level))
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(victim:GetPosition():Get()) end)
	elseif victim:HasTag("small_giant3x") then
	local fx = SpawnPrefab("statue_transition")
	local fx2 = SpawnPrefab("goldnugget")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx2.Transform:SetPosition(victim:GetPosition():Get())
	local fx3 = SpawnPrefab("glowdust")
        		fx3.Transform:SetPosition(victim:GetPosition():Get())
    				inst.level = inst.level + 7
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_EPIC..STRINGS.MUSHA_LEVEL_EXP.."(+7) \n".. (inst.level))
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(victim:GetPosition():Get()) end)
	elseif victim:HasTag("small_giant4x") then
	local fx = SpawnPrefab("statue_transition")
	local fx2 = SpawnPrefab("goldnugget")
        		fx.Transform:SetPosition(victim:GetPosition():Get())
        		fx2.Transform:SetPosition(victim:GetPosition():Get())
	local fx3 = SpawnPrefab("glowdust")
        		fx3.Transform:SetPosition(victim:GetPosition():Get())
    				inst.level = inst.level + 10
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_KILL_EPIC..STRINGS.MUSHA_LEVEL_EXP.."(+10) \n".. (inst.level))
	inst:DoTaskInTime(1, function() SpawnPrefab("musha_spore").Transform:SetPosition(victim:GetPosition():Get()) end)
    end
	end	
end
		
local function berserk_countdown(inst)
inst:DoTaskInTime(180, function() 
if inst.fberserk then
inst.fberserk = false 
if inst.chnaged and (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) then
inst.chnaged = false
elseif inst.chnaged and not (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) then
--SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get())
		if not inst.sleep_visual then
		inst.sleep_visual = true inst.changed_look =true  end
			if not (inst.tiny_sleep or inst.sleep_on) then
			inst.sg:GoToState("knockout") 
			end
			inst.tiny_sleep = true inst.sleep_in = true
		inst.chnaged = false
		end end end)
end		

local function berserk_changer(inst)
if GetClock():IsNight() and GetClock():GetMoonPhase() == "full" and not inst.tiny_sleep and not inst.sleep_on then
		--inst.moon_berserks = true
		if not inst.berserks then
		inst.changed_look =true
		end
		inst.changed_moon = true
		inst.fullmoon = true
		inst.berserks = true
		
		
	elseif not GetClock():IsNight() or not GetClock():GetMoonPhase() == "full" then		
		--inst.moon_berserks = false
		inst.fullmoon = false
		inst.berserks = false
end
if inst.fberserk and not inst.chnaged then
--SpawnPrefab("statue_transition").Transform:SetPosition(inst:GetPosition():Get())
inst.chnaged = true
berserk_countdown(inst)
end
if inst.strength == "berserk" then
--inst.components.eater.strongstomach = true -- for balance
--inst.components.eater.monsterimmune = true
elseif inst.strength ~= "berserk" then
--inst.components.eater.strongstomach = false
--inst.components.eater.monsterimmune = true
end
end
						
local function expeat(inst, food)

if food.components.edible then
inst.components.fatigue_sleep:DoDelta(-1)
end
if food:HasTag("coffeebeans") or food:HasTag("coffeebeans_cooked") then
if inst.components.stamina_sleep then
inst.components.stamina_sleep:DoDelta(2) 
inst.components.fatigue_sleep:DoDelta(-4)
end
end
if food:HasTag("coffee") then
inst.sg:GoToState("celebrate")
if inst.components.stamina_sleep then
inst.components.stamina_sleep:DoDelta(8)
inst.components.fatigue_sleep:DoDelta(-16)
end
end



if food.prefab == "mandrakesoup" or food.prefab == "waterdrop" then
inst.components.spellpower:DoDelta(30)
	inst.level = inst.level + 25
	levelexp(inst)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_EXP)

elseif food.prefab == "wormlight" then
	inst.components.spellpower:DoDelta(15)

elseif food.components.edible.hungervalue > 100 or food.components.edible.healthvalue > 35 then 
inst.components.spellpower:DoDelta(12)
if inst.components.fatigue_sleep then
inst.components.fatigue_sleep:DoDelta(-30) 
end
if food.components.edible and math.random() < foodlargechance then
	inst.level = inst.level + 1
	levelexp(inst)
end
elseif food.components.edible.hungervalue > 55 or food.components.edible.healthvalue > 29 or food.components.edible.sanityvalue > 19 then 
inst.components.spellpower:DoDelta(8)
if inst.components.fatigue_sleep.current >= 0 then
inst.components.fatigue_sleep:DoDelta(-15)
end
if food.components.edible and math.random() < foodgoodchance then
	inst.level = inst.level + 1
	levelexp(inst)
end
elseif food.components.edible.hungervalue > 24 or food.components.edible.healthvalue > 19 or food.components.edible.sanityvalue > 14 then 
inst.components.spellpower:DoDelta(4)
if inst.components.fatigue_sleep then
inst.components.fatigue_sleep:DoDelta(-10)
end
if food.components.edible and math.random() < foodnormalchance then
	inst.level = inst.level + 1	levelexp(inst)
end
else
if inst.components.fatigue_sleep then
inst.components.fatigue_sleep:DoDelta(-2)
end
if food.components.edible and math.random() < 0.3 then
	inst.level = inst.level + 1
	levelexp(inst)
end
end



--dislike food type
	
if inst.dis_meat_taste and not inst.berserk then
	if food.components.edible and food.components.edible.foodtype == "MEAT" then
	if inst.princess_taste then
	inst:DoTaskInTime(0.7, function() --[[inst.sg:GoToState("refuseeat")]] 
	inst.sg:GoToState("mindcontrol")
	if math.random() < 0.2 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_1)
	elseif math.random() < 0.25 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_2)
	elseif math.random() < 0.3 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_3)
	elseif math.random() < 0.3 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_4)
	elseif math.random() < 0.3 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_MEAT)
	else
	inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_HATEFOOD"))
	end
	inst.components.sanity:DoDelta(-20) 
	if inst.components.health.currenthealth > 5 then
	inst.components.health:DoDelta(-3)
	end
	end)
	end
	
	end
end
if inst.dis_veggie_taste and not inst.berserk then
	if food.components.edible and food.components.edible.foodtype == "VEGGIE" and not food:HasTag("green_fruit") and food.prefab ~= "butterflywings" and food.prefab ~= "glowdust" then
	if inst.princess_taste then
	inst:DoTaskInTime(0.7, function() --[[inst.sg:GoToState("refuseeat")]] 
	inst.sg:GoToState("mindcontrol")
	if math.random() < 0.2 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_1)
	elseif math.random() < 0.25 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_2)
	elseif math.random() < 0.3 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_3)
	elseif math.random() < 0.35 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_4)
	elseif math.random() < 0.4 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_VEGGIE)
	else
	inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_HATEFOOD"))
	end
	inst.components.sanity:DoDelta(-20) 
	if inst.components.health.currenthealth > 5 then
	inst.components.health:DoDelta(-3)
	end
	end)
	end
	end
end

-- basic taste
if food.components.edible and not string.find(tostring(food),"monster") and not string.find(tostring(food),"human") and not inst.berserk then

	if food.components.edible and (food:HasTag("stale") or food:HasTag("spoiled")) and food.prefab ~= "butterflywings" then
	if math.random() < 0.4 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_OLD_1)
	elseif math.random() < 0.5 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_OLD_2)
	elseif math.random() < 0.8 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_OLD_3)
	else
	inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_HATEFOOD"))
	end
	end
	
	elseif food.components.edible and food.prefab == "butterflywings" then
	if inst.princess_taste then
	inst:DoTaskInTime(0.5, function() --[[inst.sg:GoToState("refuseeat")]] 
	inst.sg:GoToState("mindcontrol")
	if math.random() < 0.4 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BUG_1)
	elseif math.random() < 0.5 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BUG_2)
	elseif math.random() < 0.8 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BUG_3)
	else
	inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_HATEFOOD"))
	end
	inst.components.sanity:DoDelta(-10) end)
	end
end



--force bersrek
--if inst.berserk_mood then
if food.components.edible and string.find(tostring(food),"monster") then
	if inst.princess_taste and food.prefab ~= "monsterlasagna" then
		inst:DoTaskInTime(0.7, function() --[[inst.sg:GoToState("refuseeat")]] 
		inst.sg:GoToState("mindcontrol")
	if math.random() < 0.4 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_BAD_2)
	elseif math.random() < 0.5 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_MONSTER_1)
	elseif math.random() < 0.8 then  
	inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_MONSTER_2)
	else
	inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_HATEFOOD"))
	end
	inst.components.sanity:DoDelta(-5) end)
	end
	
 if food.prefab ~= "monsterlasagna" and inst.berserk_mood then 
	inst.fberserk = true 
	inst.components.talker:Say(STRINGS.MUSHA_TALK_BERSERK)
 else
 if math.random() <= 0.5 and inst.berserk_mood then 
		 	inst.fberserk = true 
	inst.components.talker:Say(STRINGS.MUSHA_TALK_BERSERK)
	end
 end
	
end
end

local specialtyfoods =
{
	
	sweetpotatosouffle =
	{
		test = function(cooker, names, tags) return (names.sweet_potato and names.sweet_potato == 2) and tags.egg and tags.egg >= 2 end,
		priority = 30,
		foodtype = "VEGGIE",
		health = TUNING.HEALING_MED,
		hunger = TUNING.CALORIES_LARGE,
		perishtime = TUNING.PERISH_MED,
		sanity = TUNING.SANITY_MED,
		cooktime = 2,
	},

	monstertartare =
	{
		test = function(cooker, names, tags) return tags.monster and tags.monster >= 2 and tags.egg and tags.veggie end,
		priority = 30,
		foodtype = "MEAT",
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.CALORIES_LARGE,
		perishtime = TUNING.PERISH_MED,
		sanity = TUNING.SANITY_SMALL,
		cooktime = 2,
	},

	freshfruitcrepes =
	{
		test = function(cooker, names, tags) return tags.fruit and tags.fruit >= 1.5 and names.butter and names.honey end,
		priority = 30,
		foodtype = "VEGGIE",
		health = TUNING.HEALING_HUGE,
		hunger = TUNING.CALORIES_SUPERHUGE,
		perishtime = TUNING.PERISH_MED,
		sanity = TUNING.SANITY_MED,
		cooktime = 2,
	},

	musselbouillabaise =
	{
		test = function(cooker, names, tags) return (names.mussel and names.mussel == 2) and tags.veggie and tags.veggie >= 2 end,
		priority = 30,
		foodtype = "MEAT",
		health = TUNING.HEALING_MED,
		hunger = TUNING.CALORIES_LARGE,
		perishtime = TUNING.PERISH_MED,
		sanity = TUNING.SANITY_MED,
		cooktime = 2,
	},

}

local function MakeSpeciallyPreparedFood(data)

	local foodassets=
	{
		Asset("ANIM", "anim/cook_pot_food.zip"),
		Asset("INV_IMAGE", data.name),
	}

	local foodprefabsdeps = 
	{
		"spoiled_food",
	}
	
	local function fn(Sim)
		local inst = CreateEntity()
		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		MakeInventoryPhysics(inst)
		
		inst.AnimState:SetBuild("cook_pot_food")
		inst.AnimState:SetBank("food")
		inst.AnimState:PlayAnimation(data.name, false)
	    
	    inst:AddTag("preparedfood")

		inst:AddComponent("edible")
		inst.components.edible.healthvalue = data.health
		inst.components.edible.hungervalue = data.hunger
		inst.components.edible.foodtype = data.foodtype or "GENERIC"
		inst.components.edible.foodstate = data.foodstate or "PREPARED"
		inst.components.edible.sanityvalue = data.sanity or 0
		inst.components.edible.temperaturedelta = data.temperature or 0
		inst.components.edible.temperatureduration = data.temperatureduration or 0
		inst.components.edible.naughtyvalue = data.naughtiness or 0
		inst.components.edible.caffeinedelta = data.caffeinedelta or 0
		inst.components.edible.caffeineduration = data.caffeineduration or 0

		inst:AddComponent("inspectable")
		inst.wet_prefix = data.wet_prefix

		inst:AddComponent("inventoryitem")
		
		inst:AddComponent("stackable")
		inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM


		inst:AddComponent("perishable")
		inst.components.perishable:SetPerishTime(data.perishtime or TUNING.PERISH_SLOW)
		inst.components.perishable:StartPerishing()
		inst.components.perishable.onperishreplacement = "spoiled_food"

		if data.tags then
			for i,v in pairs(data.tags) do
				inst:AddTag(v)
			end
		end
		
	    
        MakeSmallBurnable(inst)
		MakeSmallPropagator(inst)
		MakeInventoryFloatable(inst, data.name.."_water", data.name)
		---------------------        

		inst:AddComponent("bait")
	    
		------------------------------------------------
		inst:AddComponent("tradable")
	    
		------------------------------------------------  
	    
		return inst
	end

	return Prefab( "common/inventory/"..data.name, fn, foodassets, foodprefabsdeps)
end

if IsDLCInstalled(CAPY_DLC) then
-- clean up foods
for k,v in pairs(specialtyfoods) do
	v.name = k
	v.weight = v.weight or 1
	v.priority = v.priority or 0
end

for k,recipe in pairs(specialtyfoods) do
	AddCookerRecipe("portablecookpot", recipe)
	AddCookerRecipe("cookpot", recipe)
end

local foodprefabs = {}

for k,v in pairs(specialtyfoods) do
	table.insert(foodprefabs, MakeSpeciallyPreparedFood(v))
	table.insert(assets, Asset("INV_IMAGE", k))
end
end

local function MyPrecious(inst)
	if TheSim:FindFirstEntityWithTag("musha_treasure") then
	local treasures = TheSim:FindFirstEntityWithTag("musha_treasure")
	local x, y, z = treasures.Transform:GetWorldPosition()
	local minimap = GetWorld().minimap.MiniMap
	minimap:ShowArea(x, y, z, 20)
	
			end

	--[[if TheSim:FindFirstEntityWithTag("buriedtreasure") then
	local treasures = TheSim:FindFirstEntityWithTag("buriedtreasure")
	local x, y, z = treasures.Transform:GetLocalPosition()
	local minimap = GetWorld().minimap.MiniMap
	local map = GetWorld().Map
	local cx, cy, cz = map:GetTileCenterPoint(x, 0, z)
	minimap:ShowArea(cx, cy, cz, 15)
	map:VisitTile(map:GetTileCoordsAtPoint(cx, cy, cz))
		end]]
	end
	
local function musha_egghunt_pass(inst, data)
	if not inst.arong_egg_hunted then
	local x,y,z = inst.Transform:GetWorldPosition()	
	local max_rad = 10000
	local ents = TheSim:FindEntities(x,y,z, max_rad, {"phoenix"})
    for k,v in pairs(ents) do 
		if v then 
		inst.yamche_egg_hunted = true
			end 
				end	
	end				
	if not inst.arong_egg_hunted then
	local x,y,z = inst.Transform:GetWorldPosition()	
	local max_rad = 10000
	local ents = TheSim:FindEntities(x,y,z, max_rad, {"arong_2"})
    for k,v in pairs(ents) do 
		if v then 
		inst.arong_egg_hunted = true
			end 
				end	
	end	
end	
	
	
local function musha_egghunt(inst, data)
		-- egghunt -- 

if GetWorld():IsCave() then
	--local player = GetPlayer()
	
	if not inst.yamche_egg_hunted then
local pop = SpawnPrefab("small_puff")
local egghunt = SpawnPrefab("musha_egg")
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,30), 30, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
	pop.Transform:SetScale(1.25, 1.25, 1.25)
	egghunt.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
	pop.Transform:SetPosition(egghunt:GetPosition():Get())	
	inst.yamche_egg_hunted = true
	inst.components.talker:Say(STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TREASURE)
	elseif not inst.arong_egg_hunted then
local pop = SpawnPrefab("small_puff")
local egghunt = SpawnPrefab("musha_egg_arong")
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,30), 30, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
	pop.Transform:SetScale(1.25, 1.25, 1.25)
	egghunt.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
	pop.Transform:SetPosition(egghunt:GetPosition():Get())
	inst.arong_egg_hunted = true
	inst.components.talker:Say(STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TREASURE)
	end	
		
elseif not GetWorld():IsCave() and not inst.components.poisonable and not SaveGameIndex:IsModeShipwrecked() and not SaveGameIndex:IsModePorkland() and not GetWorld():IsCave() then	
	if not inst.yamche_egg_hunted then
		local pos1 = inst:GetPosition()
		--local offset1 = FindWalkableOffset(pos1, math.random() * 600 * math.pi, math.random(600, 800), 500)
		local offset1 = FindWalkableOffset(pos1, math.random() * 100 * math.pi, math.random(200, 300), 150)
		local spawn_pos1 = pos1 + offset1
    
		if offset1 then 
		local egghunt = SpawnPrefab("musha_egg")
		egghunt.Transform:SetPosition(spawn_pos1:Get())
		egghunt:AddTag("treasure")
		egghunt:EggHunt()
			inst.yamche_egg_hunted = true	
			inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FIRST) 
			inst:DoTaskInTime(2, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_YAMCHE) 
			end) end)

		elseif not offset1 then 
		inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAILED)
			inst.treasure = inst.treasure + 95
	end		

	elseif not inst.arong_egg_hunted then
		local pos1 = inst:GetPosition()
		local offset1 = FindWalkableOffset(pos1, math.random() * 300 * math.pi, math.random(300, 400), 250)
		local spawn_pos1 = pos1 + offset1
    
		if  offset1 then 
		local egghunt = SpawnPrefab("musha_egg_arong")
		egghunt.Transform:SetPosition(spawn_pos1:Get())
		egghunt:AddTag("treasure")
		egghunt:EggHunt()
		inst.arong_egg_hunted = true
		inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FIRST) 
		inst:DoTaskInTime(2, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_ARONG) 
		end) end)

		elseif not offset1 then 
		inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAILED)
			inst.treasure = inst.treasure + 95
		end	
	end	
		
 
elseif not GetWorld():IsCave() and (inst.components.poisonable or SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland()) then

	if not inst.yamche_egg_hunted then
		local pos1 = inst:GetPosition()
		--local offset1 = FindGroundOffset(pos1, math.random() * 600 * math.pi, math.random(600, 800), 500)
		local offset1 = FindGroundOffset(pos1, math.random() * 100 * math.pi, math.random(200, 300), 150)
		local spawn_pos1 = pos1 + offset1
    
		if offset1 then 
		local egghunt = SpawnPrefab("musha_egg")
		egghunt.Transform:SetPosition(spawn_pos1:Get())
		egghunt:AddTag("treasure")
		egghunt:EggHunt()
			inst.yamche_egg_hunted = true	
			inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FIRST) 
			inst:DoTaskInTime(2, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_YAMCHE) 
			end) end)

		elseif not offset1 then 
		inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAILED)
			inst.treasure = inst.treasure + 95
		end		

	elseif not inst.arong_egg_hunted then
		local pos1 = inst:GetPosition()
		local offset1 = FindGroundOffset(pos1, math.random() * 300 * math.pi, math.random(300, 400), 250)
		local spawn_pos1 = pos1 + offset1
    
		if offset1 then 
		local egghunt = SpawnPrefab("musha_egg_arong")
		egghunt.Transform:SetPosition(spawn_pos1:Get())
		egghunt:AddTag("treasure")
		egghunt:EggHunt()
		inst.arong_egg_hunted = true
		inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FIRST) 
			inst:DoTaskInTime(2, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_ARONG) 
			end) end)

		elseif not offset1 then 
		inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAILED)
			inst.treasure = inst.treasure + 95
		end	
	end	

	
end	
end	
	
local function musha_treasurehunt(inst, isload)

if not inst.yamche_egg_hunted then
musha_egghunt(inst)
elseif not inst.arong_egg_hunted then
musha_egghunt(inst)
elseif inst.yamche_egg_hunted and inst.arong_egg_hunted then

	if GetWorld():IsCave() then

		local pos1 = inst:GetPosition()
		local offset1 = FindWalkableOffset(pos1, math.random() * 800 * math.pi, math.random(900, 1000), 500)
		local offset2 = FindWalkableOffset(pos1, math.random() * 200 * math.pi, math.random(250, 300), 180)
		local offset3 = FindWalkableOffset(pos1, math.random() * 2 * math.pi, math.random(25, 30), 18)
		local guard1 = FindWalkableOffset(pos1, math.random() * 1 * math.pi, math.random(1, 3), 1)
		local guard2 = FindWalkableOffset(pos1, math.random() * 1 * math.pi, math.random(1, 2), 2)
		local guard3 = FindWalkableOffset(pos1, math.random() * 1 * math.pi, math.random(1, 1), 3)	
	
		if math.random() < 0.45 and offset1 then
		inst.treasure1 = true
		inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAR) end)
			local spawn_pos1 = pos1 + offset1
			local treasure1 = SpawnPrefab("musha_treasure2")
			treasure1.Transform:SetPosition(spawn_pos1:Get())
			treasure1:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos1:Get())
			treasure1:AddTag("treasure")
			
		-- green worm
		if math.random() < 0.75 and guard1 then
		local spawn_pos1_gw = pos1 + offset1 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos1_gw = pos1 + offset1 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		end
		-- green fruit
		if math.random() < 0.2 and guard3 then
		local spawn_pos1_gw = pos1 + offset1 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		end
		
		elseif math.random() < 0.65 and not inst.treasure1 and offset2 then
		inst.treasure2 = true
		inst:DoTaskInTime(0.5, function()	inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_MED) end)
			local spawn_pos2 = pos1 + offset2
			local treasure2 = SpawnPrefab("musha_treasure2")
			treasure2.Transform:SetPosition(spawn_pos2:Get())
			treasure2:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos2:Get())
			treasure2:AddTag("treasure")

		-- green worm
		if math.random() < 0.75 and guard1 then
		local spawn_pos2_gw = pos1 + offset2 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos2_gw = pos1 + offset2 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		end
		-- green fruit
		if math.random() < 0.2 and guard3 then
		local spawn_pos2_gw = pos1 + offset2 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		end		
		
		elseif not inst.treasure1 and not inst.treasure2 and offset3 then
		inst.treasure3 = true
		inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_NEAR) end)
			local spawn_pos3 = pos1 + offset3
			local treasure3 = SpawnPrefab("musha_treasure2")
			treasure3.Transform:SetPosition(spawn_pos3:Get())
			treasure3:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos3:Get())
			treasure3:AddTag("treasure")
			
		-- green worm 
		if math.random() < 0.75 and guard1 then
		local spawn_pos3_gw = pos1 + offset3 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos3_gw = pos1 + offset3 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		end
		if math.random() < 0.2 and guard3 then
		local spawn_pos3_gw = pos1 + offset3 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		end
		
		elseif not inst.treasure1 and not inst.treasure2 and not inst.treasure3 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAILED)
			inst.treasure = inst.treasure + 90
		end
		
	elseif not inst.components.poisonable and not SaveGameIndex:IsModeShipwrecked() and not SaveGameIndex:IsModePorkland() and not GetWorld():IsCave() then

		local pos1 = inst:GetPosition()
		local offset1 = FindWalkableOffset(pos1, math.random() * 800 * math.pi, math.random(900, 1000), 500)
		local offset2 = FindWalkableOffset(pos1, math.random() * 200 * math.pi, math.random(250, 300), 180)
		local offset3 = FindWalkableOffset(pos1, math.random() * 2 * math.pi, math.random(25, 30), 18)
		local guard1 = FindWalkableOffset(pos1, math.random() * 1 * math.pi, math.random(1, 3), 1)
		local guard2 = FindWalkableOffset(pos1, math.random() * 1 * math.pi, math.random(1, 2), 2)
		local guard3 = FindWalkableOffset(pos1, math.random() * 1 * math.pi, math.random(1, 1), 3)	
	
		if math.random() < 0.45 and offset1 then
		inst.treasure1 = true
		inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAR) end)
			local spawn_pos1 = pos1 + offset1
			local treasure1 = SpawnPrefab("musha_treasure2")
			treasure1.Transform:SetPosition(spawn_pos1:Get())
			treasure1:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos1:Get())
			treasure1:AddTag("treasure")
			
		-- green worm
		if math.random() < 0.75 and guard1 then
		local spawn_pos1_gw = pos1 + offset1 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos1_gw = pos1 + offset1 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		end
		-- green fruit
		if math.random() < 0.5 and guard3 then
		local spawn_pos1_gw = pos1 + offset1 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		end
		
		elseif math.random() < 0.65 and not inst.treasure1 and offset2 then
		inst.treasure2 = true
		inst:DoTaskInTime(0.5, function()	inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_MED) end)
			local spawn_pos2 = pos1 + offset2
			local treasure2 = SpawnPrefab("musha_treasure2")
			treasure2.Transform:SetPosition(spawn_pos2:Get())
			treasure2:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos2:Get())
			treasure2:AddTag("treasure")

		-- green worm
		if math.random() < 0.75 and guard1 then
		local spawn_pos2_gw = pos1 + offset2 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos2_gw = pos1 + offset2 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		end
		-- green fruit
		if math.random() < 0.5 and guard3 then
		local spawn_pos2_gw = pos1 + offset2 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		end		
		
		elseif not inst.treasure1 and not inst.treasure2 and offset3 then
		inst.treasure3 = true
		inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_NEAR) end)
			local spawn_pos3 = pos1 + offset3
			local treasure3 = SpawnPrefab("musha_treasure2")
			treasure3.Transform:SetPosition(spawn_pos3:Get())
			treasure3:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos3:Get())
			treasure3:AddTag("treasure")
			
		-- green worm 
		if math.random() < 0.75 and guard1 then
		local spawn_pos3_gw = pos1 + offset3 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos3_gw = pos1 + offset3 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		end
		if math.random() < 0.5 and guard3 then
		local spawn_pos3_gw = pos1 + offset3 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		end
		
		elseif not inst.treasure1 and not inst.treasure2 and not inst.treasure3 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAILED)
			inst.treasure = inst.treasure + 90
		end
	
		-------------
		
	---dlc2		
	elseif inst.components.poisonable or SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() and not GetWorld():IsCave() then		
		local pos1 = inst:GetPosition()
		local offset1 = FindGroundOffset(pos1, math.random() * 800 * math.pi, math.random(900, 1000), 500)
		local offset2 = FindGroundOffset(pos1, math.random() * 200 * math.pi, math.random(250, 300), 180)
		local offset3 = FindGroundOffset(pos1, math.random() * 2 * math.pi, math.random(25, 30), 18)
		local guard1 = FindGroundOffset(pos1, math.random() * 1 * math.pi, math.random(1, 3), 1)
		local guard2 = FindGroundOffset(pos1, math.random() * 1 * math.pi, math.random(1, 2), 2)
		local guard3 = FindGroundOffset(pos1, math.random() * 1 * math.pi, math.random(1, 1), 3)	
		
		if math.random() < 0.45 and offset1 then
		inst.treasure1 = true
		inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAR) end)
			local spawn_pos1 = pos1 + offset1
			local tile = GetVisualTileType(spawn_pos1:Get())
    		local is_water = GetMap():IsWater(tile)
		if SaveGameIndex:IsModePorkland() then
			local treasure1 = SpawnPrefab("musha_treasure")
			treasure1.Transform:SetPosition(spawn_pos1:Get())
			treasure1:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos1:Get())
			treasure1:AddTag("treasure")
		else
			local treasure1 = SpawnPrefab("musha_treasure2")
			treasure1.Transform:SetPosition(spawn_pos1:Get())
			treasure1:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos1:Get())
			treasure1:AddTag("treasure")
		end	
		-- green worm
		if math.random() < 0.5 and guard1 then
		local spawn_pos1_gw = pos1 + offset1 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos1_gw = pos1 + offset1 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		end
		if math.random() < 0.25 and guard3 then
		local spawn_pos1_gw = pos1 + offset1 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		end
	
		elseif math.random() < 0.65 and not inst.treasure1 and offset2 then
		inst.treasure2 = true
		inst:DoTaskInTime(0.5, function()	inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_MED) end)
			local spawn_pos2 = pos1 + offset2
		    local tile = GetVisualTileType(spawn_pos2:Get())
    		local is_water = GetMap():IsWater(tile)
		if SaveGameIndex:IsModePorkland() then
			local treasure2 = SpawnPrefab("musha_treasure")
			treasure2.Transform:SetPosition(spawn_pos2:Get())
			treasure2:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos2:Get())
			treasure2:AddTag("treasure")
		else	
			local treasure2 = SpawnPrefab("musha_treasure2")
			treasure2.Transform:SetPosition(spawn_pos2:Get())
			treasure2:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos2:Get())
			treasure2:AddTag("treasure")
		end	
		-- green worm
		if math.random() < 0.5 and guard1 then
		local spawn_pos2_gw = pos1 + offset2 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos2_gw = pos1 + offset2 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		end
		-- green fruit
		if math.random() < 0.25 and guard3 then
		local spawn_pos2_gw = pos1 + offset2 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		end	
		
		elseif not inst.treasure1 and not inst.treasure2 and offset3 then
		inst.treasure3 = true
		inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_NEAR) end)
			local spawn_pos3 = pos1 + offset3
		    local tile = GetVisualTileType(spawn_pos3:Get())
    		local is_water = GetMap():IsWater(tile)
		if SaveGameIndex:IsModePorkland() then
			local treasure3 = SpawnPrefab("musha_treasure")
			treasure3.Transform:SetPosition(spawn_pos3:Get())
			treasure3:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos3:Get())
			treasure3:AddTag("treasure")
		else
			local treasure3 = SpawnPrefab("musha_treasure2")
			treasure3.Transform:SetPosition(spawn_pos3:Get())
			treasure3:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos3:Get())
			treasure3:AddTag("treasure")
		end
				-- green worm 
		if math.random() < 0.75 and guard1 then
		local spawn_pos3_gw = pos1 + offset3 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos3_gw = pos1 + offset3 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		end
		if math.random() < 0.5 and guard3 then
		local spawn_pos3_gw = pos1 + offset3 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		end
				
		elseif not inst.treasure1 and not inst.treasure2 and not inst.treasure3 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAILED)
			inst.treasure = inst.treasure + 90
		end
	end	
	
		-------------
		
	if TheSim:FindFirstEntityWithTag("treasure") then
	local treasures = TheSim:FindFirstEntityWithTag("treasure")
	local x, y, z = treasures.Transform:GetWorldPosition()
	local minimap = GetWorld().minimap.MiniMap
	minimap:ShowArea(x, y, z, 20)
	end
	if inst.treasure1 or inst.treasure2 or inst.treasure3 then 		
	inst.treasure1 = false
	inst.treasure2 = false
	inst.treasure3 = false
	end
end
end

local function on_treasure_hunt(inst)
if inst.components.playercontroller then
inst.components.playercontroller:Enable(false)
inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_SNIFF)
scheduler:ExecuteInTime(1.5, function() inst.sg:GoToState("peertelescope2") inst.components.talker.colour = Vector3(1, 0.85, 0.7, 1) inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FOUND) 
local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
if item then
inst.components.inventory:Unequip(EQUIPSLOTS.HANDS, true) 
inst.components.inventory:GiveItem(item)
end

scheduler:ExecuteInTime(3, function() inst.components.playercontroller:Enable(false) inst.sg:GoToState("map") inst.components.talker.colour = Vector3(1, 0.85, 0.7, 1) inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_MARK)  
scheduler:ExecuteInTime(3.5, function() inst.components.playercontroller:Enable(true) inst.components.talker.colour = Vector3(1, 1, 1, 1) musha_treasurehunt(inst) end) end) end)
end 
end
	
local function flower_shield(inst, attacked, data) 
if not inst.components.health:IsDead() and inst:HasTag("DLC") then
    if inst.strength == "Valkyrie" then
	SpawnPrefab("purple_leaves_chop").Transform:SetPosition(inst:GetPosition():Get())	
    elseif inst.strength == "normal" then
	SpawnPrefab("yellow_leaves_chop").Transform:SetPosition(inst:GetPosition():Get())
    elseif inst.strength == "full" then
	SpawnPrefab("orange_leaves_chop").Transform:SetPosition(inst:GetPosition():Get())
   -- elseif inst.strength == "berserk" then
	--SpawnPrefab("red_leaves_chop").Transform:SetPosition(inst:GetPosition():Get())
	end	end
end

local function assasin_webber(inst, data)
if inst.assain_pop then
local assasin = SpawnPrefab("assasin_webber")
local pop = SpawnPrefab("explode_small")
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
pop.Transform:SetScale(1.25, 1.25, 1.25)
assasin.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
pop.Transform:SetPosition(assasin:GetPosition():Get())
SpawnPrefab("statue_transition_2").Transform:SetPosition(assasin:GetPosition():Get()) 
SpawnPrefab("lightning_blue").Transform:SetPosition(assasin.Transform:GetWorldPosition())
 	inst:DoTaskInTime(0.5, function()  SpawnPrefab("lightning2").Transform:SetPosition(assasin:GetPosition():Get())
	inst:DoTaskInTime(0.25, function() SpawnPrefab("lightning2").Transform:SetPosition(assasin:GetPosition():Get())  end) end)
inst.count_s = inst.count_s * 0
inst.assain_pop = false	
local random1 = 0.2

if math.random() < 0.05 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP1)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP2)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP3)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP4)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP5)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP6)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP7)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP8)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP9)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP10)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP11)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP12)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP13)
else
assasin.components.talker:Say(STRINGS.MUSHA_ASSASIN_WEBBER_POP0)
end
inst:DoTaskInTime(1, function() inst.components.talker:Say(STRINGS.MUSHA_ASSASIN_SPOT)  end)
end
	end	

local function summon_drake(inst, data)
  -- moondrake
if inst.moondrake_on and not (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) then
local drake = SpawnPrefab("moonnutdrake2")
if inst:HasTag("DLC") or inst:HasTag("DLC2") then
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
	drake.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
	end
if not inst:HasTag("DLC") and not inst:HasTag("DLC2") then	
	drake.Transform:SetPosition(inst:GetPosition():Get())		
	end
	--drake.components.follower:SetLeader(inst)
	drake.slave = true
drake.sg:GoToState("enter")
drake.AnimState:PlayAnimation("enter")
if drake.components.combat then
	drake.components.combat:SuggestTarget(drake.target)
end		end
	end		
--------------------------------------------------------------------------

local MAX_TRAIL_VARIATIONS = 7
local MAX_RECENT_TRAILS = 4
local TRAIL_MIN_SCALE = 1
local TRAIL_MAX_SCALE = 1.6

local function PickTrail(inst)
    local rand = table.remove(inst.availabletrails, math.random(#inst.availabletrails))
    table.insert(inst.usedtrails, rand)
    if #inst.usedtrails > MAX_RECENT_TRAILS then
        table.insert(inst.availabletrails, table.remove(inst.usedtrails, 1))
    end
    return rand
end

local function RefreshTrail(inst, fx)
    if fx:IsValid() then
        fx:Refresh()
    else
        inst._trailtask:Cancel()
        inst._trailtask = nil
    end
end

local function DoTrail(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    --[[if inst.sg:HasStateTag("moving") then
        local theta = -inst.Transform:GetRotation() * DEGREES
        x = x + math.cos(theta)
        z = z + math.sin(theta)
    end
    local fx = SpawnPrefab("damp_trail")
    fx.Transform:SetPosition(x, 0, z)
    fx:SetVariation(PickTrail(inst), GetRandomMinMax(TRAIL_MIN_SCALE, TRAIL_MAX_SCALE), 5)]]
    if inst._trailtask ~= nil then
        inst._trailtask:Cancel()
    end
    --inst._trailtask = inst:DoPeriodicTask(5 * .5, RefreshTrail, nil, fx)
end

local BLOOM_CHOICES =
{
    ["musha_fern2"] = 7,
    ["musha_fern"] = 20,
	["apple_berry"] = 3,
	["green_fern"] = 10,
	["green_fern"] = 60,
}

local function DoPlantBloom(inst)

if not  (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) then

    local x, y, z = inst.Transform:GetWorldPosition()
    local map = GetWorld().Map
   --[[ local offset = FindValidPositionByFan(
        math.random() * 1 * PI,
        math.random() * 2,
        4,
        function(offset)
            local x1 = x + offset.x
            local z1 = z + offset.z
            return map:IsPassableAtPoint(x1, 0, z1)
                and map:IsDeployPointClear(Vector3(x1, 0, z1), nil, 1)
                and #TheSim:FindEntities(x1, 0, z1, 2.5, { "stalkerbloom" }) < 4
        end   )]]
		
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(0.5,3), 5, false, false)
local x,y,z = inst.Transform:GetWorldPosition()

    if offset ~= nil then
        SpawnPrefab(weighted_random_choice(BLOOM_CHOICES)).Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
    end	

    --[[if offset ~= nil then
        SpawnPrefab(weighted_random_choice(BLOOM_CHOICES)).Transform:SetPosition(x + offset.x, 0, z + offset.z)
    end]]
end
end

local function OnStartBlooming(inst)
    DoTrail(inst)
   -- inst._bloomtask = inst:DoPeriodicTask(3 * FRAMES, DoPlantBloom, 2 * FRAMES)
	inst._bloomtask = inst:DoPeriodicTask(10 * FRAMES, DoPlantBloom, 7 * FRAMES)
end

local function _StartBlooming(inst)
    if inst._bloomtask == nil then
        inst._bloomtask = inst:DoTaskInTime(0, OnStartBlooming)
    end
end

local function ForestOnEntityWake(inst)
    if inst._blooming then
        _StartBlooming(inst)
    end
end

local function ForestOnEntitySleep(inst)
    if inst._bloomtask ~= nil then
        inst._bloomtask:Cancel()
        inst._bloomtask = nil
    end
    if inst._trailtask ~= nil then
        inst._trailtask:Cancel()
        inst._trailtask = nil
    end
end

local function StartBlooming(inst)
    if not inst._blooming then
        inst._blooming = true
        if not inst:IsAsleep() then
            _StartBlooming(inst)
        end
    end
end

local function StopBlooming(inst)
    if inst._blooming then
        inst._blooming = false
        ForestOnEntitySleep(inst)
    end
end

--------------------------------------------------------------------------
local function summon_lighting(inst, data)

if inst.small_light then
local spore = SpawnPrefab("musha_spore")
if inst:HasTag("DLC") or inst:HasTag("DLC2") and not  (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) then
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
	spore.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
	end
if not inst:HasTag("DLC") and not inst:HasTag("DLC2") then	
	spore.Transform:SetPosition(inst:GetPosition():Get())		
	end
end
	end	
	
	
local function on_music_act4(inst)
if inst.components.playercontroller then
inst.light_on = false
inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
if not inst.DLC2 then
inst.sg:GoToState("play_flute2")
elseif inst.DLC2 or SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
inst.sg:GoToState("map")
end
inst.entity:AddLight()
inst.Light:SetRadius(1)
inst.Light:SetFalloff(.75)
inst.Light:SetIntensity(.6)
inst.Light:SetColour(90/255,90/255,90/255)
inst.Light:Enable(true)
--local hounds = SpawnPrefab("ghosthound")
inst.music_armor = true inst.switlight = false  inst.nsleep = true
scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2")
scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband")scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2") if inst:HasTag("DLC2") then if inst.components.poisonable then	inst.components.poisonable:Cure(inst) SpawnPrefab("sparklefx").Transform:SetPosition(inst:GetPosition():Get()) inst.curepoison = true end end
scheduler:ExecuteInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true) inst.components.sanity:DoDelta(10) inst.music = inst.music * 0 inst.sg:GoToState("play_horn2") SpawnPrefab("musha_spore2").Transform:SetPosition(inst:GetPosition():Get()) --[[inst.components.talker:Say("[Light Aura] -ON     \n- Sanity/Mana Regen UP    \n- Sleep/Tired Regen UP")]] inst.lightaura = true inst.small_light = true inst.moondrake_on = true
local drakeangle = math.random(1, 360)
local tentacle_frost0 = SpawnPrefab("tentacle_frost")
local tentacle_frost1 = SpawnPrefab("tentacle_frost")
local tentacle_frost2 = SpawnPrefab("tentacle_frost")
local tentacle_frost3 = SpawnPrefab("tentacle_frost")
local tentacle_frost4 = SpawnPrefab("tentacle_frost")
local tentacle_frost5 = SpawnPrefab("tentacle_frost")
local offset0 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local offset1 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local offset2 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local offset3 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local offset4 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local offset5 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
tentacle_frost0.Transform:SetPosition(x + offset0.x, y + offset0.y, z + offset0.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost0:GetPosition():Get()) 
tentacle_frost0.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
inst:DoTaskInTime( 3, function() tentacle_frost1.Transform:SetPosition(x + offset1.x, y + offset1.y, z + offset1.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost1:GetPosition():Get()) tentacle_frost1.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") end)
inst:DoTaskInTime( 6, function() tentacle_frost2.Transform:SetPosition(x + offset2.x, y + offset2.y, z + offset2.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost2:GetPosition():Get()) tentacle_frost2.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") end)
inst:DoTaskInTime( 9, function() tentacle_frost3.Transform:SetPosition(x + offset3.x, y + offset3.y, z + offset3.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost3:GetPosition():Get()) tentacle_frost3.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") end)
inst:DoTaskInTime( 12, function() tentacle_frost4.Transform:SetPosition(x + offset4.x, y + offset4.y, z + offset4.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost4:GetPosition():Get()) tentacle_frost4.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") end)
inst:DoTaskInTime( 15, function() tentacle_frost5.Transform:SetPosition(x + offset5.x, y + offset5.y, z + offset5.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost5:GetPosition():Get())  tentacle_frost5.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") end)
inst.music_armor = false scheduler:ExecuteInTime(180, function() --[[inst.components.talker:Say("[Light Aura] -off ")]] inst.lightaura = false inst.small_light = false inst.moondrake_on = false inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.Light:SetRadius(0.5) scheduler:ExecuteInTime(5, function()   inst.Light:Enable(false)  inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") inst.nsleep = false inst.curepoison = false end) end)end)end)end)end)
end end
 

local function on_music_act2(inst)
if inst.components.playercontroller then
inst.light_on = false
inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.sg:GoToState("play_flute2")

inst.entity:AddLight()
inst.Light:SetRadius(1)
inst.Light:SetFalloff(.75)
inst.Light:SetIntensity(.6)
inst.Light:SetColour(90/255,90/255,90/255)
inst.Light:Enable(true)
local hounds = SpawnPrefab("ghosthound")
inst.music_armor = true inst.switlight = false  inst.nsleep = true
scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2")
scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband")scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2") if inst:HasTag("DLC2") then if inst.components.poisonable then	inst.components.poisonable:Cure(inst) SpawnPrefab("sparklefx").Transform:SetPosition(inst:GetPosition():Get()) inst.curepoison = true end end
scheduler:ExecuteInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true) inst.components.sanity:DoDelta(10) inst.music = inst.music * 0 inst.sg:GoToState("play_horn2") SpawnPrefab("musha_spore2").Transform:SetPosition(inst:GetPosition():Get()) --[[inst.components.talker:Say("[Light Aura] -ON     \n- Sanity/Mana Regen UP    \n- Sleep/Tired Regen UP")]] inst.lightaura = true inst.small_light = true inst.moondrake_on = true hounds.Transform:SetPosition(inst:GetPosition():Get()) hounds.Transform:SetPosition(inst:GetPosition():Get())  hounds.followdog = true SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.music_armor = false scheduler:ExecuteInTime(180, function() --[[inst.components.talker:Say("[Light Aura] -off ")]] inst.lightaura = false inst.small_light = false inst.moondrake_on = false inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.Light:SetRadius(0.5) scheduler:ExecuteInTime(5, function()   inst.Light:Enable(false)  inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") inst.nsleep = false inst.curepoison = false end) end)end)end)end)end)
end end 


local function on_music_act1(inst)
if inst.components.playercontroller then
inst.light_on = false
inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.sg:GoToState("play_flute2")

inst.entity:AddLight()
inst.Light:SetRadius(1)
inst.Light:SetFalloff(.75)
inst.Light:SetIntensity(.6)
inst.Light:SetColour(90/255,90/255,90/255)
inst.Light:Enable(true)
local hounds = SpawnPrefab("ghosthound")
--inst.components.health:SetAbsorptionAmount(1)
inst.music_armor = true inst.switlight = false  inst.nsleep = true

scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2")
scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband")scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2") if inst:HasTag("DLC2") then if inst.components.poisonable then	inst.components.poisonable:Cure(inst) SpawnPrefab("sparklefx").Transform:SetPosition(inst:GetPosition():Get()) inst.curepoison = true end end
scheduler:ExecuteInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true) inst.components.sanity:DoDelta(10) inst.music = inst.music * 0 inst.sg:GoToState("play_horn2") SpawnPrefab("musha_spore2").Transform:SetPosition(inst:GetPosition():Get()) --[[inst.components.talker:Say("[Light Aura] -ON     \n- Sanity/Mana Regen UP    \n- Sleep/Tired Regen UP")]] inst.lightaura = true inst.small_light = true inst.moondrake_on = true hounds.Transform:SetPosition(inst:GetPosition():Get())  hounds.followdog = true SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.components.stamina_sleep:DoDelta(10) inst.components.fatigue_sleep:DoDelta(-10) inst.components.spellpower:DoDelta(15) inst.music_armor = false scheduler:ExecuteInTime(180, function() --[[inst.components.talker:Say("[Light Aura] -off ")]] inst.lightaura = false inst.small_light = false inst.moondrake_on = false inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.Light:SetRadius(0.5) scheduler:ExecuteInTime(5, function()   inst.Light:Enable(false)  inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") inst.nsleep = false inst.curepoison = false end) end)end)end)end)end)
end end 


local function on_music_act0(inst)
if inst.components.playercontroller then
inst.light_on = false
inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.sg:GoToState("play_flute2")

inst.entity:AddLight()
inst.Light:SetRadius(1)
inst.Light:SetFalloff(.75)
inst.Light:SetIntensity(.6)
inst.Light:SetColour(90/255,90/255,90/255)
inst.Light:Enable(true)
--local hounds = SpawnPrefab("ghosthound")
inst.music_armor = true inst.switlight = false  inst.nsleep = true
scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2")
scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband") if inst:HasTag("DLC2") then if inst.components.poisonable then	inst.components.poisonable:Cure(inst) SpawnPrefab("sparklefx").Transform:SetPosition(inst:GetPosition():Get()) inst.curepoison = true end end
scheduler:ExecuteInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true) inst.components.sanity:DoDelta(10) inst.music = inst.music * 0 inst.sg:GoToState("play_horn2") SpawnPrefab("musha_spore2").Transform:SetPosition(inst:GetPosition():Get()) --[[inst.components.talker:Say("[Light Aura] -ON     \n- Sanity/Mana Regen UP    \n- Sleep/Tired Regen UP")]] inst.lightaura = true inst.small_light = true inst.moondrake_on = true SpawnPrefab("ghosthound2").Transform:SetPosition(inst:GetPosition():Get()) inst.components.stamina_sleep:DoDelta(10)inst.components.fatigue_sleep:DoDelta(-10) inst.components.sanity:DoDelta(10) inst.music_armor = false scheduler:ExecuteInTime(180, function() --[[inst.components.talker:Say("[Light Aura] -off ")]] inst.lightaura = false inst.small_light = false inst.moondrake_on = false inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.Light:SetRadius(0.5) scheduler:ExecuteInTime(5, function()   inst.Light:Enable(false)  inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") inst.nsleep = false inst.curepoison = false end) end)end)end)end)
end end 

local function on_buff_act(inst)
local performance0 = 0.15
local performance1 = 0.2
local performance2 = 0.15
local performance4 = 0.1

if math.random() < performance0 and not inst.components.health:IsDead() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.."[0]")
on_music_act0(inst)
elseif math.random() < performance1 and not inst.components.health:IsDead() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.."[1]")
on_music_act1(inst)
elseif math.random() < performance2 and not inst.components.health:IsDead() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.."[2]")
on_music_act2(inst)
elseif math.random() < performance4 and not inst.components.health:IsDead() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.."[4]")
on_music_act4(inst)
elseif math.random() < performance0 and not inst.components.health:IsDead() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.."[0]")
on_music_act0(inst)
elseif math.random() < performance1 and not inst.components.health:IsDead() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.."[1]")
on_music_act1(inst)
elseif math.random() < performance2 and not inst.components.health:IsDead() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.."[2]")
on_music_act2(inst)
elseif math.random() < performance4 and not inst.components.health:IsDead() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.."[4]")
on_music_act4(inst)
elseif math.random() <= 1 and not inst.components.health:IsDead() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.."[1]")
on_music_act1(inst)

end 
inst.components.talker.colour = Vector3(1, 0.85, 0.75, 1)
end

local function rainy_debuff(inst, dt)

if inst.components.leader:CountFollowers("shadowminion") >= 1 then
local x,y,z = inst.Transform:GetWorldPosition()
local shadow = TheSim:FindEntities(x,y,z, 12, {"shadowminion"})
	for k,v in pairs(shadow) do
	if not v.shadow_image then
		v.shadow_image = true
		v.AnimState:SetBuild("musha_h")
		v:AddComponent("colourtweener")
		v.components.colourtweener:StartTween({1,1,1,.7}, 0)
	end
	if inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic") then
	v.components.health:Kill()
    --[[if inst.components.leader:CountFollowers("shadowminion") >= 1 then
	inst.components.leader:RemoveFollowersByTag("shadowminion")	
	v:Remove()
	end]]
	end	
	end
end



    if (inst.components.moisture and inst.components.moisture:GetMoisture() > 50) then
		inst.rainy_day = true
		
    	inst.sneeze_time = inst.sneeze_time - dt

    	if inst.sneeze_time <= 0 and not inst.warm_on then
    		
    		--GetClock():DoLightningLighting()
    		inst.sneeze_time = 30+math.random()*2

    		local pos = Vector3(inst.Transform:GetWorldPosition())
    		local damage = nil

    		-- Raining, no moisture-giving equipment on head, and moisture is increasing. Pro-rate damage based on waterproofness.
    		if GetSeasonManager():IsRaining() and inst.components.inventory:GetEquippedMoistureRate(EQUIPSLOTS.HEAD) <= 0 and inst.components.moisture:GetDelta() > 0 then
	    		local waterproofmult = (inst.components.moisture and inst.components.moisture.sheltered and inst.components.inventory) and (1 - (inst.components.inventory:GetWaterproofness() + inst.components.moisture.shelter_waterproofness)) or (inst.components.inventory and (1 - inst.components.inventory:GetWaterproofness()) or 1)
	    		damage = waterproofmult > 0 and math.min(TUNING.WX78_MIN_MOISTURE_DAMAGE, TUNING.WX78_MAX_MOISTURE_DAMAGE * waterproofmult) or 0
				inst.components.sanity:DoDelta(damage-2, false, "rain")
				
				pos.y = pos.y + 1 + math.random()*1.5
	    	else -- We have moisture-giving equipment on our head or it is not raining and we are just passively wet (but drying off). Do full damage.
	    		if inst.components.moisture:GetDelta() >= 0 then -- Moisture increasing (wearing something moisturizing)
	    			inst.components.sanity:DoDelta(TUNING.WX78_MAX_MOISTURE_DAMAGE-1, false, "water")
	    		else -- Drying damage
	    			inst.components.sanity:DoDelta(TUNING.WX78_MOISTURE_DRYING_DAMAGE-1, false, "water")
	    		end
				pos.y = pos.y + .25 + math.random()*2
	    	end
			
			if not damage or (damage and damage < 0) then
				if not inst.sleep_on and not inst.tiny_sleep and not (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating")) then
				inst.coldfever = true
				inst.sg:GoToState("sneeze")
				end	
				local waterdrop = SpawnPrefab("splash_water_drop")
				waterdrop.Transform:SetPosition(pos:Get())
			end
			
    	end
	else
	inst.rainy_day = false	
	inst.coldfever = false
    end

end

 local function onsleepheal(inst)

	if inst.AnimState:IsCurrentAnimation("bedroll_sleep_loop") or inst.sg:HasStateTag("tent") then
		if not inst.sleep_on then
		inst.sleep_on = true
		inst.musha_press = false
		end
	elseif inst.AnimState:IsCurrentAnimation("sleep_loop") then
		if not inst.tiny_sleep then
		inst.tiny_sleep = true
		inst.musha_press = false
		end
	elseif inst.AnimState:IsCurrentAnimation("idle") or inst.AnimState:IsCurrentAnimation("moving") then	
		inst.sleep_on = false
		inst.tiny_sleep = false
		inst.sleep_in = false
		inst.musha_press = false
	end
	
 if inst.sleep_no then
 inst.sleep_no = false 
end

--[[if GetClock():IsNight() and (inst.sleep_in or inst.sleep_on or inst.tiny_sleep) and not inst.warm_on and not inst.warm_tent and not inst.LightWatcher:IsInLight() then]]
if (inst.sleep_on or inst.tiny_sleep) and not inst.LightWatcher:IsInLight() then
local random1 = 0.2
inst.charging_music = false
inst.sg:GoToState("wakeup")
  inst.sleep_on = false
  inst.sleep_in = false
  inst:RemoveTag("bedroll")
  inst.tiny_sleep = false
 --inst.sleep_visual = false
 	inst.sleeping_musha = false
	inst.sleepbuff = false
	inst.musha_press = false
if math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NEED_LIGHT_1)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NEED_LIGHT_2)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NEED_LIGHT_3)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NEED_LIGHT_4)
else
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NEED_LIGHT_5)
end
inst.music_armor = false
if inst.music_check then
 inst.music_check = false
   inst:DoTaskInTime(2, function() inst.music_armor = false inst.switlight = true inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_READY)
inst.components.playercontroller:Enable(true)
inst.sg:GoToState("play_flute2")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") end)
end

elseif (inst.sleep_on or inst.tiny_sleep) and inst.components.hunger.current ==0 then
inst.charging_music = false
inst.components.talker:Say(STRINGS.MUSHA_TALK_HUNGRY)
  inst.sleep_on = false
  inst.sleep_in = false
  inst:RemoveTag("bedroll")
  inst.tiny_sleep = false
  inst.sg:GoToState("wakeup")
--  inst.sleep_visual = false
  --inst.hungry_wakeup = false
  	inst.sleeping_musha = false
	inst.sleepbuff = false
	inst.music_armor = false
	inst.musha_press = false
if inst.music_check then
 inst.music_check = false
   inst:DoTaskInTime(2, function() inst.music_armor = false inst.switlight = true inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_READY.."\n[ U ]")
inst.components.playercontroller:Enable(true)
inst.sg:GoToState("play_flute2")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") end)
end

end

if inst.sleep_on or inst.tiny_sleep then

 -- sleepbuff
 if inst.sleepbuff and not inst.warm_on and not inst.warm_tent then
		 	TUNING.SANITY_DAY_GAIN = 25/60
			TUNING.SANITY_NIGHT_LIGHT = 25/60
			TUNING.SANITY_NIGHT_DARK = 25/60
			--inst.components.health:StartRegen(1, 15)
 elseif inst.sleepbuff and (inst.warm_on or inst.warm_tent) then
 		 	TUNING.SANITY_DAY_GAIN = 1
			TUNING.SANITY_NIGHT_LIGHT = 1
			TUNING.SANITY_NIGHT_DARK = 1
			--inst.components.health:StartRegen(1, 5)
		--if inst.components.health:GetPercent() < 1 and not inst.components.health:IsDead() then
        --inst.components.health:DoDelta(1) 
		--end
		if inst.components.temperature ~= nil then
		if  inst.components.temperature:GetCurrent() < 30 then
            inst.components.temperature:SetTemperature(inst.components.temperature:GetCurrent() + 3)
        elseif inst.components.temperature:GetCurrent() > 45 then
            inst.components.temperature:SetTemperature(inst.components.temperature:GetCurrent() - 3)
        end
		end
 end
 else
inst.sleepbuff = false 
 
end
end

local function monster_test(inst, data)
--check were pigman
--[[local x,y,z = inst.Transform:GetWorldPosition()
local npig = TheSim:FindEntities(x,y,z, 20, {"pigman"})
for k,v in pairs(npig) do
if v:HasTag("changed") then
v:RemoveTag("changed")
 end end
local wpig = TheSim:FindEntities(x,y,z, 20, {"werepig"})
for k,v in pairs(wpig) do
if v:HasTag("pig2x") and not v:HasTag("changed") then
    v.components.combat:SetDefaultDamage(TUNING.WEREPIG_DAMAGE*1.25)
	v.components.combat:SetAttackPeriod(1.75)
	v.components.health:SetMaxHealth(TUNING.WEREPIG_HEALTH*2)
	v:AddTag("changed")
elseif v:HasTag("pig3x") and not v:HasTag("changed") then
    v.components.combat:SetDefaultDamage(TUNING.WEREPIG_DAMAGE*1.5)
    v.components.combat:SetAttackPeriod(1.5)
	v.components.health:SetMaxHealth(TUNING.WEREPIG_HEALTH*3)
	v:AddTag("changed")
elseif v:HasTag("pig4x") and not v:HasTag("changed") then
    v.components.combat:SetDefaultDamage(TUNING.WEREPIG_DAMAGE*2)
    v.components.combat:SetAttackPeriod(1.25)
	v.components.health:SetMaxHealth(TUNING.WEREPIG_HEALTH*4)
	v:AddTag("changed")
end 
end]]

--[[local x,y,z = inst.Transform:GetWorldPosition()
local light1 = TheSim:FindEntities(x,y,z, 20, {"musha_light"})
for k,v in pairs(light1) do
if v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("musha_light") < 1 then
inst.components.leader:AddFollower(v)
end end]]
local x,y,z = inst.Transform:GetWorldPosition()
local light2 = TheSim:FindEntities(x,y,z, 20, {"musha_light2"})
for k,v in pairs(light2) do
if v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("musha_light2") < 1 then
inst.components.leader:AddFollower(v)
end end

local x,y,z = inst.Transform:GetWorldPosition()
local yamche = TheSim:FindEntities(x,y,z, 20, {"yamche"})
for k,v in pairs(yamche) do
if v.components.follower and v.components.follower.leader and  inst.components.leader:IsFollower(v) and inst.crazy then
	if not v.crazyness then
		v.crazyness = true
	end	
elseif v and not inst.crazy and not v.peace then
	if v.crazyness then
		v.crazyness = false
	end 
	
end 
end
--[[local x,y,z = inst.Transform:GetWorldPosition()
local arong = TheSim:FindEntities(x,y,z, 20, {"arongb"})
for k,v in pairs(arong) do
if v.components.follower and v.components.follower.leader and  inst.components.leader:IsFollower(v) and inst.crazy then
	if not v.crazyness then
		v.crazyness = true
	end	
elseif v and not inst.crazy then
	if v.crazyness then
		v.crazyness = false
	end 
	
end 
end]]
end

local function TreasureSmelling(inst, data)
if inst.components.playercontroller then
inst.components.playercontroller:Enable(false)
inst.components.locomotor:Stop()
inst.sg:GoToState("talk")
inst.components.health:SetInvincible(true)
inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_SMELL.."\n( U )")
inst:DoTaskInTime( 1, function() inst.components.playercontroller:Enable(true) inst.components.health:SetInvincible(false) inst.smelling = true end)
end
end


local function sleep_test(inst, data)
--[[
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 10, {"yamche"})
for k,v in pairs(ents) do
if inst.components.leader:CountFollowers("yamche") >= 2 and v.yamche_leader then

end end 
]]
if inst.tenting then
inst.tenting = false
		if inst.components.stamina_sleep then
			inst.components.stamina_sleep:DoDelta(60)
		end
		if inst.components.fatigue_sleep then
			inst.components.fatigue_sleep:DoDelta(-100)
		end
		if inst.components.spellpower then
			inst.components.spellpower:DoDelta(50)
		end	
end

if inst.components.leader:CountFollowers("yamche") == 0 then
inst.yamche_leader = false
end
---------------- warm_on_test ----------------
if inst.DLC3 and GetWorld().components.interiorspawner ~=nil then
local interiorSpawner = GetWorld().components.interiorspawner 
if interiorSpawner.current_interior then
	local shopper = FindEntity(inst, 12, function(target) 
                return (target:HasTag("city_pig") or target:HasTag("civilized") or target:HasTag("shopkeep") or target:HasTag("atdesk")) end)	
		
	if shopper then
	inst.in_home = false
	else
	inst.in_home = true
	end
else
	inst.in_home = false
end end		

local fire = FindEntity(inst, 6, function(ent)
return ent.components.burnable and ent.components.burnable:IsBurning()
        end, {"campfire"})
local yamche_fire = FindEntity(inst, 6, function(ent)
return ent.components.burnable and ent.components.burnable:IsBurning()
        end, {"yamche"})
if not inst.in_home then		
if fire or yamche_fire then
	inst.warm_on = true
	end
if not (fire or yamche_fire) then
inst.warm_on = false
end
elseif inst.in_home then	
	inst.warm_on = true
end
---------------- ---------------- -------------

if inst.sleep_visual then
	if inst.components.hunger.current >= 160 and not inst.Valkyrieh and not (inst.berserks or inst.fberserk) then
		if inst.full_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_dst")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_dst")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_full_dst_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_full_k_dst")
			end 
		inst.full_look = false
		end
	elseif inst.components.hunger.current < 160 and not inst.Valkyrieh and not (inst.berserks or inst.fberserk) then
		if inst.normal_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal_dst")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal_dst")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal_dst_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal_k_dst")
			end 
		inst.full_look = false	
		end
	elseif inst.berserks or inst.fberserk then
		if inst.berserk_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_hunger_dst")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_hunger_dst")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_hunger_dst_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_hunger_k_dst")
			end
		inst.berserk_look = false
		end
	elseif inst.Valkyrieh and not (inst.berserks or inst.fberserk) then
		if inst.valkyrie_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_battle_dst")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_battle_dst")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_battle_dst_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_battle_k_dst")		
			end 
		 inst.valkyrie_look = false	
		 end
		end
	end

if inst.music_armor and inst:HasTag("DLC") then
inst.components.health:SetAbsorptionAmount(1)
elseif inst.music_armor and not inst:HasTag("DLC") then
inst.components.health:SetAbsorbAmount(1)
elseif not inst.music_armor and inst:HasTag("DLC") and not inst.on_sparkshield and not inst.components.health:IsDead() and not inst.Valkyrieh then
inst.components.health:SetAbsorptionAmount(0)
elseif not inst.music_armor and not inst:HasTag("DLC") and not inst.on_sparkshield and not inst.components.health:IsDead() and not inst.Valkyrieh then
inst.components.health:SetAbsorbAmount(0)
end

if GetWorld():IsCave() then
inst.in_cave = true
elseif not GetWorld():IsCave() then
inst.in_cave = false
end
--[[    local x, y, z = inst.Transform:GetWorldPosition() 
    local ents = TheSim:FindEntities(x, y, z, 6, { "monster" or "shadow" or "insect" })
    for i, v in ipairs(ents) do
	if not (v:AddTag("tree") or v:AddTag("birchnut") or v:AddTag("deciduoustree")) then
    if v.components.health and not v.components.health:IsDead() then
		inst.sleep_no = true
    elseif v.components.health and v.components.health:IsDead() then
		inst.sleep_no = false
		end
	        end 
			end]]
			local danger = FindEntity(inst, 5, function(target) 
                return (target:HasTag("monster") and not target:HasTag("player") and not inst:HasTag("spiderwhisperer"))
                    or (target:HasTag("monster") and not target:HasTag("player") and inst:HasTag("spiderwhisperer") and not target:HasTag("spider"))
                    or (target:HasTag("pig") and not target:HasTag("player") and inst:HasTag("spiderwhisperer"))
                    or (target.components.combat and target.components.combat.target == inst) end)

            local hounded = GetWorld().components.hounded

			if hounded and (hounded.warning or hounded.timetoattack <= 0) then
				if GetClock():IsDay() then
				danger = true
					end
			elseif not hounded then
				danger = false	
					end
			if danger then
			inst.sleep_no = true
			elseif not danger then
			inst.sleep_no = false
			end
			
 	local x,y,z = inst.Transform:GetWorldPosition()	
	local delta = 0
	local max_rad = 10
	local ents = TheSim:FindEntities(x,y,z, max_rad, {"fire"})
    for k,v in pairs(ents) do 
    	if v.components.burnable and v.components.burnable.burning then
    		local sz = TUNING.SANITYAURA_TINY
    		local rad = v.components.burnable:GetLargestLightRadius() or 1
    		sz = sz * ( math.min(max_rad, rad) / max_rad )
			local distsq = inst:GetDistanceSqToInst(v)
			delta = delta + sz/math.max(1, distsq)
			--[[if delta >0 then 
			inst.warm_on = true
			elseif delta <=0 then 
			inst.warm_on = false
			end]]
    	end
    end

if (inst.sleep_in or inst.tiny_sleep or inst.sleep_on )then 
	 inst.fberserk = false 
	 inst.berserks = false inst.changed_moon = false inst.moon_berserks = false
		if not inst.Valkyriech2 then
			inst.Valkyriech2 = true
		end
		inst.Valkyrieh = false
		inst.sneakaa = false
		inst.sneaka = false
        inst:RemoveTag("notarget")
end
if inst.sleep_in then 
 inst.components.playercontroller:Enable(true)
end
if inst.tiny_sleep then
inst.sg:AddStateTag("busy")
inst.components.locomotor:Stop()
end
if inst.sleep_on then 
inst.charging_music = true
inst.sg:AddStateTag("busy")
inst.components.locomotor:Stop()
--[[
if inst.AnimState:AnimDone() then
local sleep = inst.sg:GoToState("sleepin")
inst.AnimState:PlayAnimation("sleep", true)
end
]]
if not inst.sleep_visual then
		inst.sleep_visual = true inst.changed_look =true  end
--if not inst.sleeping then inst.AnimState:PlayAnimation("action_uniqueitem_pre") inst.sleeping = true end
if not inst.tiny_sleep or inst.sg:HasStateTag("bedroll") or inst:HasTag("bedroll") then
inst.sleep_on = true
inst:AddTag("bedroll")
inst.sg:RemoveStateTag("idle")
inst.sg:AddStateTag("sleeping")
inst.sg:AddStateTag("busy")
inst.sleepbuff = true
inst.sleeping_musha = true
if inst.sleeping_musha then
		if inst.dsleep_veasy then
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE*0.5)
	elseif inst.dsleep_easy then
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE*0.75)
	elseif inst.dsleep_normal then
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE) 
	elseif inst.dsleep_hard then
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE*2)
	elseif inst.dsleep_hardcore then
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE*3)
		end
end
--[[if inst.components.hunger.current <=0 then
   inst.hungry_wakeup = true end]]
if inst.AnimState:AnimDone() then
if inst.warm_on or inst.warm_tent then
inst.AnimState:PlayAnimation("bedroll_sleep_loop", true)
		if not inst.sleep_on then
		inst.sleep_on = true
		end
elseif not inst.warm_on then
inst.AnimState:PlayAnimation("sleep_loop", true)
inst.tiny_sleep = true
inst.sleep_on = false
if inst.charging_music then
inst.charging_music = false
end
end
end
	end

if inst.sleep_no then
inst.charging_music = false
if inst.sleep_in or inst.tiny_sleep and not inst.LightWatcher:IsInLight() then
  inst.sleep_on = false
  inst.sleep_in = false
  inst:RemoveTag("bedroll")
  inst.tiny_sleep = false
  inst.sg:GoToState("wakeup")
-- inst.sleep_visual = false
 	inst.sleeping_musha = false
	inst.sleepbuff = false
	inst.musha_press = false
local random1 = 0.2	
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
  inst.music_armor = false
if inst.music_check then
 inst.music_check = false
   inst:DoTaskInTime(2, function() inst.music_armor = false inst.switlight = true inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_READY.."\n[ U ]")
   inst.components.playercontroller:Enable(true)
inst.sg:GoToState("play_flute2")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") end)
end
end end
end
--[[if not inst.sleep_in and (inst.charging_music or inst.sleep_on or inst:HasTag("bedroll")) then
inst.charging_music = false
  inst.sleep_on = false
  inst:RemoveTag("bedroll")
end]]

--dlc2
if inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic") then
	if inst.sleep_visual then
inst.sleep_visual = false
	end
	--[[if not inst:HasTag("sailing") then
inst:AddTag("sailing") 
	end
	if not inst:HasTag("on_water") then
inst:AddTag("on_water") 
	end]]
else
	if not inst.sleep_visual then
	inst.sleep_visual = true inst.changed_look =true 
	end
end	
--[[if inst:HasTag("on_water") and not inst.sg:HasStateTag("boating") and not inst:HasTag("aquatic") then
inst:DoTaskInTime( 15, function() inst:RemoveTag("sailing") inst:RemoveTag("on_water") inst:RemoveTag("aquatic") end)
end]]

--smell
if inst.treasure >= 100 then 
inst.treasure_sniff_tag = true
if not inst.smelling and not inst.smelltalking then
inst.smelltalking = true
TreasureSmelling(inst)
end
elseif inst.treasure < 100 then
inst.treasure_sniff_tag = false
inst.smelling = false
inst.smelltalking = false
end 
if inst.treasure_sniff_tag and inst.treasure_sniff then 
inst.treasure = inst.treasure *0
inst.treasure_sniff_tag = false
inst.treasure_sniff = false
on_treasure_hunt(inst)
end

  --sleepy

 if inst:HasTag("ready_music") then 
 inst.switlight = true
  end
 if inst.light_on and not inst.nsleep and not inst.treasure_sniff_tag then
-- on_music_act1(inst)
 on_buff_act(inst)
end
if inst.music < 100 then
--inst.light_on = false
inst.switlight = false
end
if inst.components.stamina_sleep.current <=0 then
		if not inst.Valkyriech2 then
		inst.Valkyriech2 = true
		end
		inst.Valkyrieh = false
		inst.sneakaa = false
		inst.sneaka = false
        inst:RemoveTag("notarget")
end


--Sailing and groggy
if inst.sg:HasStateTag("sailing") then
  inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1)
  inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1)

elseif not inst.sg:HasStateTag("sailing") then 
if inst.components.stamina_sleep.current <= 30 then
	if not inst.sleep_visual then
	inst.sleep_visual = true inst.changed_look =true 
	end
	if not inst:HasTag("groggy") then
	inst:AddTag("groggy")
	end
elseif inst.components.stamina_sleep.current > 30 then
		if inst:HasTag("groggy") then
		inst:RemoveTag("groggy")
		end
end  
end

--valkyrie
if inst.valkyrie and not inst.berserk then
	
    	if inst.dtired_veasy then
	inst.components.fatigue_sleep:DoDelta(0) 	
	elseif inst.dtired_easy then
	inst.components.fatigue_sleep:DoDelta(0.001) 
	elseif inst.dtired_normal then
	inst.components.fatigue_sleep:DoDelta(0.005) 
	elseif inst.dtired_hard then
	inst.components.fatigue_sleep:DoDelta(0.01) 
	elseif inst.dtired_hardcore then
	inst.components.fatigue_sleep:DoDelta(0.02) 
		end
  inst.components.combat:SetAttackPeriod(0.1)
 
if not inst.sg:HasStateTag("sailing") and inst.components.stamina_sleep.current >= 30 then  
  inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.3)
  inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.3)	
end
end
		
-- berserk 
if not inst.valkyrie and inst.berserk then

	if not inst.fullmoon then
   	if inst.dtired_veasy then
	inst.components.fatigue_sleep:DoDelta(0)
	elseif inst.dtired_easy then
	inst.components.fatigue_sleep:DoDelta(0.001)
	elseif inst.dtired_normal then
	inst.components.fatigue_sleep:DoDelta(0.005)
	elseif inst.dtired_hard then
	inst.components.fatigue_sleep:DoDelta(0.01)
	elseif inst.dtired_hardcore then
	inst.components.fatigue_sleep:DoDelta(0.02)
	end 
	end
   inst.components.combat:SetAttackPeriod(0.1)

if not inst.sg:HasStateTag("sailing") and inst.components.stamina_sleep.current >= 30 then   
  inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.3) 
  inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.3)

end
end 
	
-- Normal (full)
if not inst.valkyrie and not inst.berserk --[[and not inst.sleep_on]] then
 
if inst.components.stamina_sleep.current >= 95 then
inst.components.combat:SetAttackPeriod(0.2)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.15 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.15 )	
end
elseif inst.components.stamina_sleep.current < 95 and inst.components.stamina_sleep.current >= 90 then
inst.components.combat:SetAttackPeriod(0.3)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.1 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.1 )	
end
elseif inst.components.stamina_sleep.current < 90 and inst.components.stamina_sleep.current >= 85 then
inst.components.combat:SetAttackPeriod(0.4)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.1 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.1 )	
end
elseif inst.components.stamina_sleep.current < 85 and inst.components.stamina_sleep.current >= 80 then
inst.components.combat:SetAttackPeriod(0.5)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.05 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.05 )	
end
elseif inst.components.stamina_sleep.current < 80 and inst.components.stamina_sleep.current >= 75 then
inst.components.combat:SetAttackPeriod(0.5)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.05 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.05 )	
end
elseif inst.components.stamina_sleep.current < 75 and inst.components.stamina_sleep.current >= 70 then
inst.components.combat:SetAttackPeriod(0.5)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1 )	
end
elseif inst.components.stamina_sleep.current < 70 and inst.components.stamina_sleep.current >= 65 then
inst.components.combat:SetAttackPeriod(0.55)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1 )	
end
elseif inst.components.stamina_sleep.current < 60 and inst.components.stamina_sleep.current >= 55 then
inst.components.combat:SetAttackPeriod(0.6)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.95 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.95 )	
end
elseif inst.components.stamina_sleep.current < 55 and inst.components.stamina_sleep.current >= 50 then
inst.components.combat:SetAttackPeriod(0.65)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.95 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.95 )	
end
elseif inst.components.stamina_sleep.current < 50 and inst.components.stamina_sleep.current >= 45 then
inst.components.combat:SetAttackPeriod(0.7)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.9 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.9 )	
end
elseif inst.components.stamina_sleep.current < 40 and inst.components.stamina_sleep.current >= 35 then
inst.components.combat:SetAttackPeriod(0.75)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.9 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.9)	
end
elseif inst.components.stamina_sleep.current < 35 and inst.components.stamina_sleep.current >= 30 then
inst.components.combat:SetAttackPeriod(0.8)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.85 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.85 )	
end
elseif inst.components.stamina_sleep.current < 30 and inst.components.stamina_sleep.current >= 25 then
inst.components.combat:SetAttackPeriod(0.85)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.6 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.6 )	
end
elseif inst.components.stamina_sleep.current < 25 and inst.components.stamina_sleep.current >= 20 then
inst.components.combat:SetAttackPeriod(0.9)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.55 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.55 )	
end
elseif inst.components.stamina_sleep.current < 20 and inst.components.stamina_sleep.current >= 15 then
inst.components.combat:SetAttackPeriod(0.95)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.5 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.5 )	
end
elseif inst.components.stamina_sleep.current < 15 and inst.components.stamina_sleep.current >= 10 then
inst.components.combat:SetAttackPeriod(1.0)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.45 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.45 )	
end
elseif inst.components.stamina_sleep.current < 10 and inst.components.stamina_sleep.current >= 5 then
inst.components.combat:SetAttackPeriod(1.0)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.4 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.4 )	
end
elseif inst.components.stamina_sleep.current < 5 and inst.components.stamina_sleep.current > 0 then
inst.components.combat:SetAttackPeriod(1)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.35 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.35 )	
end
elseif inst.components.stamina_sleep.current <= 0 then
inst.components.combat:SetAttackPeriod(1)
inst.components.combat:SetRange(2)
if not inst.sg:HasStateTag("sailing") then
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED *0.3 )
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.3 )	
end
end
end

end


  	
    local function lessercure_proc(inst, data)
	if inst.components.spellpower.current >15 and inst.components.health:GetPercent() < .2 and not inst.components.health:IsDead() then
        inst.components.health:DoDelta(40)
        inst.components.spellpower:DoDelta(-15)
inst.components.talker:Say(STRINGS.MUSHA_SKILL_RECOVERY.." !!")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
        local fx = SpawnPrefab("sparklefx")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.3, 1.3, 1.3)
        fx.Transform:SetPosition(0, -0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activelc = true
        inst:DoTaskInTime(--[[Duration]] 1, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
                inst:DoTaskInTime(--[[Cooldown]] 600, function() 	
				if not inst.activelc then
				
				end
				inst.activelc = false
				end)
            end
        end)
    end
end
    local function lessercure2_proc(inst, data)
	if inst.components.spellpower.current >15 and inst.components.health:GetPercent() < .2 and not inst.components.health:IsDead() then
        inst.components.health:DoDelta(60)
        inst.components.spellpower:DoDelta(-15)
inst.components.talker:Say(STRINGS.MUSHA_SKILL_RECOVERY.." !!")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
        local fx = SpawnPrefab("sparklefx")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.3, 1.3, 1.3)
        fx.Transform:SetPosition(0, -0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activelc = true
        inst:DoTaskInTime(--[[Duration]] 1, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
                inst:DoTaskInTime(--[[Cooldown]] 450, function() 
				if not inst.activelc then
				
				end
				inst.activelc = false
				end)
            end
        end)
    end
end


    local function cure0_proc(inst, attacked, data)
if inst.cure0 and inst.Cureo0 and inst:HasTag("DLC") and not inst.components.health:IsDead() then
	local shocking_self = SpawnPrefab("musha_spin_fx")
		shocking_self.Transform:SetPosition(inst:GetPosition():Get())
		if shocking_self then
		local follower = shocking_self.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		
	local x,y,z = inst.Transform:GetWorldPosition()	
	local ents = TheSim:FindEntities(x, y, z, 10)
for k,v in pairs(ents) do	
if inst.components.sanity and v:IsValid() and v.entity:IsVisible() and v.components.health and not v.components.health:IsDead() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("player") and not v:HasTag("companion") and not v:HasTag("stalkerminion") and not v:HasTag("structure") and v.components.combat ~= nil and (v.components.combat.target == inst or v:HasTag("monster") or v:HasTag("burn")) then
		
	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	--SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get())
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end
		
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
		v.components.health:DoDelta(-20)
		--v.components.combat:GetAttacked(inst, 10)
	
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
end
end
--inst.components.talker:Say("Shield on!!")
inst.components.spellpower:DoDelta(-30)
inst.shieldon2 = false 

      --  local fx = SpawnPrefab("sparklefx")
        local fx = SpawnPrefab("forcefieldfxx")

        --inst.components.health:DoDelta(2)
      --  inst.components.sanity:DoDelta(-1)
	inst.components.health:SetAbsorptionAmount(1)
	inst.on_sparkshield = true
if inst:HasTag("DLC2") then
if inst.components.poisonable then	inst.components.poisonable.immune = true end end
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(0.8, 0.8, 0.8)
        fx.Transform:SetPosition(0, 0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activec0 = true
   inst:DoTaskInTime(--[[Duration]] 8, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
            fx.kill_fx(fx)
	inst.components.health:SetAbsorptionAmount(0)
	inst.on_sparkshield = false
if inst:HasTag("DLC2") then
if inst.components.poisonable then	inst.components.poisonable.immune = false end end	
inst.Cureo0 = false 
inst.Cureoo0 = false 
inst.shieldon = false 
inst.effectsheild2 = true 
inst.frameon1 = false
inst.frameon2 = false
inst.frameon3 = false
inst.frameon4 = false
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_COOL_90)
                inst:DoTaskInTime(--[[Cooldown]] 90, function() inst.activec0 = false 			end)

            end
        end)
    end

if inst.cure0 and inst.Cureo0 and not inst:HasTag("DLC") and not inst.components.health:IsDead() then
	local shocking_self = SpawnPrefab("musha_spin_fx")
		shocking_self.Transform:SetPosition(inst:GetPosition():Get())
		if shocking_self then
		local follower = shocking_self.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		
	local x,y,z = inst.Transform:GetWorldPosition()	
	local ents = TheSim:FindEntities(x, y, z, 10)
for k,v in pairs(ents) do	
if inst.components.sanity and v:IsValid() and v.entity:IsVisible() and v.components.health and not v.components.health:IsDead() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("player") and not v:HasTag("companion") and not v:HasTag("stalkerminion") and not inst.sg:HasStateTag("structure") and v.components.combat ~= nil and (v.components.combat.target == inst or v:HasTag("monster") or v:HasTag("burn")) then
		
	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	--SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get())
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end
		
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
		v.components.health:DoDelta(-20)
		--v.components.combat:GetAttacked(inst, 10)
	
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
end
end
--inst.components.talker:Say("Shield on!!")
inst.components.spellpower:DoDelta(-30)
inst.shieldon2 = false 

      --  local fx = SpawnPrefab("sparklefx")
        local fx = SpawnPrefab("forcefieldfxx")

      --  inst.components.health:DoDelta(20)
      --  inst.components.sanity:DoDelta(-1)
	inst.components.health:SetAbsorbAmount(1)
	inst.on_sparkshield = true
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(0.8, 0.8, 0.8)
        fx.Transform:SetPosition(0, 0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activec0 = true
   inst:DoTaskInTime(--[[Duration]] 8, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
            fx.kill_fx(fx)
	inst.components.health:SetAbsorbAmount(0)
	inst.on_sparkshield = false
inst.Cureo0 = false 
inst.Cureoo0 = false 
inst.shieldon = false 
inst.effectsheild2 = true 
inst.frameon1 = false
inst.frameon2 = false
inst.frameon3 = false
inst.frameon4 = false
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_COOL_90)
                inst:DoTaskInTime(--[[Cooldown]] 90, function() inst.activec0 = false 			end)

            end
        end)
    end

end

    local function cure1_proc(inst, data)
	if inst.cure1 and inst.Cureo1 and inst:HasTag("DLC") and not inst.components.health:IsDead() then
	local shocking_self = SpawnPrefab("musha_spin_fx")
		shocking_self.Transform:SetPosition(inst:GetPosition():Get())
		if shocking_self then
		local follower = shocking_self.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		
	local x,y,z = inst.Transform:GetWorldPosition()	
	local ents = TheSim:FindEntities(x, y, z, 10)
for k,v in pairs(ents) do	
if inst.components.sanity and v:IsValid() and v.entity:IsVisible() and v.components.health and not v.components.health:IsDead() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("player") and not v:HasTag("companion") and not v:HasTag("stalkerminion") and not inst.sg:HasStateTag("structure") and v.components.combat ~= nil and (v.components.combat.target == inst or v:HasTag("monster") or v:HasTag("burn")) then
		
	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	--SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get())
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end
		
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
		v.components.health:DoDelta(-20)
		--v.components.combat:GetAttacked(inst, 10)
	
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
end
end
--inst.components.talker:Say("Shield on!!")
inst.components.spellpower:DoDelta(-30)
inst.shieldon2 = false 
	inst.components.health:SetAbsorptionAmount(1)
	inst.on_sparkshield = true
if inst:HasTag("DLC2") then
if inst.components.poisonable then	inst.components.poisonable.immune = true end end
      --  local fx = SpawnPrefab("sparklefx")
        local fx = SpawnPrefab("forcefieldfxx")

            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(0.8, 0.8, 0.8)
        fx.Transform:SetPosition(0, 0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activec1 = true
   inst:DoTaskInTime(--[[Duration]] 8, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
            fx.kill_fx(fx)
	inst.components.health:SetAbsorptionAmount(0)
	inst.on_sparkshield = false
if inst:HasTag("DLC2") then
if inst.components.poisonable then	inst.components.poisonable.immune = false end end	
inst.Cureo1 = false 
inst.Cureoo1 = false 
inst.shieldon = false 
inst.effectsheild2 = true 
inst.frameon1 = false
inst.frameon2 = false
inst.frameon3 = false
inst.frameon4 = false
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_COOL_75)
                inst:DoTaskInTime(--[[Cooldown]] 75, function() inst.activec1 = false 			end)

            end
        end)
    end
if inst.cure1 and inst.Cureo1 and not inst:HasTag("DLC") and not inst.components.health:IsDead() then
	local shocking_self = SpawnPrefab("musha_spin_fx")
		shocking_self.Transform:SetPosition(inst:GetPosition():Get())
		if shocking_self then
		local follower = shocking_self.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		
	local x,y,z = inst.Transform:GetWorldPosition()	
	local ents = TheSim:FindEntities(x, y, z, 10)
for k,v in pairs(ents) do	
if inst.components.sanity and v:IsValid() and v.entity:IsVisible() and v.components.health and not v.components.health:IsDead() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("player") and not v:HasTag("companion") and not v:HasTag("stalkerminion") and not inst.sg:HasStateTag("structure") and v.components.combat ~= nil and (v.components.combat.target == inst or v:HasTag("monster") or v:HasTag("burn")) then
		
	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	--SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get())
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end
		
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
		v.components.health:DoDelta(-20)
		--v.components.combat:GetAttacked(inst, 10)
	
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
end
end
--inst.components.talker:Say("Shield on!!")
inst.components.spellpower:DoDelta(-30)
inst.shieldon2 = false 
	inst.components.health:SetAbsorbAmount(1)
	inst.on_sparkshield = true
      --  local fx = SpawnPrefab("sparklefx")
        local fx = SpawnPrefab("forcefieldfxx")

            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(0.8, 0.8, 0.8)
        fx.Transform:SetPosition(0, 0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activec1 = true
   inst:DoTaskInTime(--[[Duration]] 8, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
            fx.kill_fx(fx)
	inst.components.health:SetAbsorbAmount(0)
	inst.on_sparkshield = false
inst.Cureo1 = false 
inst.Cureoo1 = false 
inst.shieldon = false 
inst.effectsheild2 = true 
inst.frameon1 = false
inst.frameon2 = false
inst.frameon3 = false
inst.frameon4 = false
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_COOL_75)
                inst:DoTaskInTime(--[[Cooldown]] 75, function() inst.activec1 = false 			end)

            end
        end)
    end

end

    local function cure2_proc(inst, data)
	if inst.cure2 and inst.Cureo2 and inst:HasTag("DLC") and not inst.components.health:IsDead() then

--inst.components.talker:Say("Shield on!!")
inst.components.spellpower:DoDelta(-30)
inst.shieldon2 = false 
	inst.components.health:SetAbsorptionAmount(1)
	inst.on_sparkshield = true
      --  local fx = SpawnPrefab("sparklefx")
        local fx = SpawnPrefab("forcefieldfxx")

            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(0.8, 0.8, 0.8)
        fx.Transform:SetPosition(0, 0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activec2 = true
   inst:DoTaskInTime(--[[Duration]] 8, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
            fx.kill_fx(fx)
	inst.components.health:SetAbsorptionAmount(0)
	inst.on_sparkshield = false
if inst:HasTag("DLC2") then
if inst.components.poisonable then	inst.components.poisonable.immune = true end end	
inst.Cureo2 = false 
inst.Cureoo2 = false 
inst.shieldon = false 
inst.effectsheild2 = true 
inst.frameon1 = false
inst.frameon2 = false
inst.frameon3 = false
inst.frameon4 = false
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_COOL_60)
                inst:DoTaskInTime(--[[Cooldown]] 60, function() inst.activec2 = false 			end)

            end
        end)
    end
	if inst.cure2 and inst.Cureo2 and not inst:HasTag("DLC") and not inst.components.health:IsDead() then

--inst.components.talker:Say("Shield on!!")
inst.components.spellpower:DoDelta(-30)
inst.shieldon2 = false 
	inst.components.health:SetAbsorbAmount(1)
	inst.on_sparkshield = true
if inst:HasTag("DLC2") then
if inst.components.poisonable then	inst.components.poisonable.immune = false end end
      --  local fx = SpawnPrefab("sparklefx")
        local fx = SpawnPrefab("forcefieldfxx")

            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(0.8, 0.8, 0.8)
        fx.Transform:SetPosition(0, 0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activec2 = true
   inst:DoTaskInTime(--[[Duration]] 8, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
            fx.kill_fx(fx)
	inst.components.health:SetAbsorbAmount(0)
	inst.on_sparkshield = false
inst.Cureo2 = false 
inst.Cureoo2 = false 
inst.shieldon = false 
inst.effectsheild2 = true 
inst.frameon1 = false
inst.frameon2 = false
inst.frameon3 = false
inst.frameon4 = false
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_COOL_60)
                inst:DoTaskInTime(--[[Cooldown]] 60, function() inst.activec2 = false 			end)
            end
        end)
    end
end

    local function healshield1_proc(inst, data)
	if inst.components.spellpower.current > 3 and inst.components.health:GetPercent() < .9 and not inst.components.health:IsDead() then
        inst.components.health:DoDelta(5)
        inst.components.spellpower:DoDelta(-1)
        local sfx = SpawnPrefab("shock_fx2")
        local fx = SpawnPrefab("sparklefx")
    inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        sfx.entity:SetParent(inst.entity)
	sfx.Transform:SetScale(1.3, 1.3, 1.3)
        sfx.Transform:SetPosition(0, -0.2, 0)
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.3, 1.3, 1.3)
        fx.Transform:SetPosition(0, -0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activeh1 = true
        inst:DoTaskInTime(--[[Duration]] 1, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
                inst:DoTaskInTime(--[[Cooldown]] 2, function() inst.activeh1 = false 			end)
            end
        end)
    end
end
    local function healshield2_proc(inst, data)
	if inst.components.spellpower.current > 3 and inst.components.health:GetPercent() < .9 and not inst.components.health:IsDead() then
        inst.components.health:DoDelta(6)
        inst.components.spellpower:DoDelta(-1)
        local sfx = SpawnPrefab("shock_fx2")
        local fx = SpawnPrefab("sparklefx")
    inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        sfx.entity:SetParent(inst.entity)
	sfx.Transform:SetScale(1.3, 1.3, 1.3)
        sfx.Transform:SetPosition(0, -0.2, 0)
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.3, 1.3, 1.3)
        fx.Transform:SetPosition(0, -0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activeh1 = true
        inst:DoTaskInTime(--[[Duration]] 1, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
                inst:DoTaskInTime(--[[Cooldown]] 2, function() inst.activeh1 = false 			end)
            end
        end)
    end
end
    local function healshield3_proc(inst, data)
	if inst.components.spellpower.current > 3 and inst.components.health:GetPercent() < .9 and not inst.components.health:IsDead() then
        inst.components.health:DoDelta(7)
        inst.components.spellpower:DoDelta(-1)
        local sfx = SpawnPrefab("shock_fx2")
        local fx = SpawnPrefab("sparklefx")
    inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        sfx.entity:SetParent(inst.entity)
	sfx.Transform:SetScale(1.3, 1.3, 1.3)
        sfx.Transform:SetPosition(0, -0.2, 0)
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.3, 1.3, 1.3)
        fx.Transform:SetPosition(0, -0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activeh3 = true
        inst:DoTaskInTime(--[[Duration]] 1, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
                inst:DoTaskInTime(--[[Cooldown]] 2, function() inst.activeh3 = false 			end)
              end
        end)
    end
end
    local function healshield4_proc(inst, data)
	if inst.components.spellpower.current > 3 and inst.components.health:GetPercent() < .9 and not inst.components.health:IsDead() then
        inst.components.health:DoDelta(8)
        inst.components.spellpower:DoDelta(-1)
        local sfx = SpawnPrefab("shock_fx2")
        local fx = SpawnPrefab("sparklefx")
    inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        sfx.entity:SetParent(inst.entity)
	sfx.Transform:SetScale(1.3, 1.3, 1.3)
        sfx.Transform:SetPosition(0, -0.2, 0)
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.3, 1.3, 1.3)
        fx.Transform:SetPosition(0, -0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
        end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
        inst.activeh4 = true
        inst:DoTaskInTime(--[[Duration]] 1, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
            if inst:IsValid() then
                inst:DoTaskInTime(--[[Cooldown]] 2, function() inst.activeh4 = false 			end)
              end
        end)
    end
end

------------------    

local function berserkattack(inst, data)
local other = data.target
	
--	SpawnPrefab("small_puff").Transform:SetPosition(other:GetPosition():Get())
     if other then
	 	local fx = SpawnPrefab("groundpoundring_fx")
		local fx2 = SpawnPrefab("collapse_small")
      --fx.entity:SetParent(other.entity)
	  fx.Transform:SetScale(0.45, 0.45, 0.45)
	  fx2.Transform:SetScale(0.6, 0.6, 0.6)
      --fx.Transform:SetPosition(0, 0, 0)
	  fx.Transform:SetPosition(other:GetPosition():Get())
	  fx2.Transform:SetPosition(other:GetPosition():Get())
--SpawnPrefab("groundpoundring_fx").Transform:SetPosition(other:GetPosition():Get())
	 end 
	--	inst:RemoveEventCallback("onhitother", berserkattack)
end

local function OnHitfreeze(inst, data)
    local other = data.target
     if other and other.components.freezable and inst.hitfreeze1 then
        other.components.freezable:AddColdness(0.2)
        --other.components.freezable:SpawnShatterFX()
     elseif other and other.components.freezable and inst.hitfreeze2 then
        other.components.freezable:AddColdness(0.23)
       -- other.components.freezable:SpawnShatterFX()
     elseif other and other.components.freezable and inst.hitfreeze3 then
        other.components.freezable:AddColdness(0.26)
       -- other.components.freezable:SpawnShatterFX()
     elseif other and other.components.freezable and inst.hitfreeze4 then
        other.components.freezable:AddColdness(0.3)
       -- other.components.freezable:SpawnShatterFX()
    end
    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
end
inst:RemoveEventCallback("onhitother", OnHitfreeze)
end

local function Call_lightining_attack(inst, data)
	 local other = data.target
	 local hitcall = 0.06

if other and math.random() < hitcall and other and other.components.health and not other:HasTag("burn") and not other:HasTag("structure") and other.components.locomotor and inst.components.sanity.current >= 10 and (other.components.burnable or other.components.freezable) then
	other:AddTag("burn")
	SpawnPrefab("sparks").Transform:SetPosition(other:GetPosition():Get())
	end
end 

local function reset_range(inst, data)
inst.components.combat:SetRange(2)
end

local function Call_lightining_check(inst, data)
if inst.level >= 10 then		
    local x, y, z = inst.Transform:GetWorldPosition() 
    local burn = TheSim:FindEntities(x, y, z, 40, { "burn" })
for i, v in ipairs(burn) do	
	if v.components.health and not v.components.health:IsDead() then
	if not v.bloom then
		if not v.shocked then
		v.shocked = true
		local debuff_0 = SpawnPrefab("debuff_short_0")
		debuff_0.Transform:SetPosition(v:GetPosition():Get())
		if debuff_0 then
		local follower = debuff_0.entity:AddFollower()
		if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		end
		v:DoTaskInTime(7, function() debuff_0:Remove() v.shocked = false end)
		end

	local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking and not v.bloom then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0 )
		end	
	v.bloom = true
	--v:DoTaskInTime(1, function() if v.bloom then v.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)
	--v:DoTaskInTime(3, function() if v.bloom then v.AnimState:SetBloomEffectHandle( "" ) end end)
	v:DoTaskInTime(15, function() if v.bloom then v:RemoveTag("burn") v.bloom = false end end )
	end
	end
	end
end	
end

local function Call_lightining_debuff(inst, data)

    local x, y, z = inst.Transform:GetWorldPosition() 
    local slow = TheSim:FindEntities(x, y, z, 25, { "slow" })
for i, v in ipairs(slow) do	
	if v.bloom then
	v.AnimState:SetBloomEffectHandle( "" ) 
	v.bloom = false
	end
	if v.components.health and not v.components.health:IsDead() and v.components.locomotor and not v:HasTag("wet") then
	v.components.locomotor.groundspeedmultiplier = 0.05
	end
end
    local x, y, z = inst.Transform:GetWorldPosition() 
    local slow_poison = TheSim:FindEntities(x, y, z, 25, { "slow_poison" })
for i, v in ipairs(slow_poison) do	
	if v.components.health and not v.components.health:IsDead() and v.components.locomotor and not v:HasTag("wet") and not v:HasTag("slow") then
	if v:HasTag("giant") or v:HasTag("epic") then
	v.components.locomotor.groundspeedmultiplier = 0.45
	else
	v.components.locomotor.groundspeedmultiplier = 0.15
	end
	end
end
    local x, y, z = inst.Transform:GetWorldPosition() 
    local slow_frozen = TheSim:FindEntities(x, y, z, 15, { "slow_frozen" })
for i, v in ipairs(slow_frozen) do	
	if v.components.health and not v.components.health:IsDead() and v.components.locomotor and not v:HasTag("wet") and not v:HasTag("slow") and not v:HasTag("slow_poison") then
	if v:HasTag("giant") or v:HasTag("epic") then
	v.components.locomotor.groundspeedmultiplier = 0.45
	else
	v.components.locomotor.groundspeedmultiplier = 0.15
	end
	end
end
	
end


	
--[[
local function Call_lightining_on(inst, data)
--local close_danger = FindEntity(inst, 3, function(target) 
--                return (target.components.combat and target.components.combat.target == inst) end)
					
   local x, y, z = inst.Transform:GetWorldPosition() 
    local ents = TheSim:FindEntities(x, y, z, 18, { "burn" })
    for i, v in ipairs(ents) do	
	
	if inst.level < 430 and inst.strength == "Valkyrie" and v:HasTag("burn") and v.components.health and not v.components.health:IsDead() and inst.components.playercontroller then
		inst.components.playercontroller:Enable(false)
	inst:DoTaskInTime( 0.2, function() inst.components.playercontroller:Enable(true) end)
	inst.sg:GoToState("book2")
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	GetPlayer().SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	GetClock():DoLightningLighting(.9)
	v:DoTaskInTime(0.5, function()  SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.25, function() SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get()) SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) end)
	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	v.components.health:DoDelta(-20)
	v:RemoveTag("burn") 
	v.burn = false
		if v and v.components.freezable then
		v.components.freezable:AddColdness(1.5)
    v.components.freezable:SpawnShatterFX()
	end
		if v.components.burnable and v.components.burnable:IsBurning() then
    v.components.burnable:Extinguish()
	end
	end)
	
	elseif inst.level >= 430 and inst.level < 1880 and inst.strength == "Valkyrie" and v:HasTag("burn") and v.components.health and not v.components.health:IsDead() and inst.components.playercontroller then
		inst.components.playercontroller:Enable(false)
	inst:DoTaskInTime( 0.2, function() inst.components.playercontroller:Enable(true) end)
	inst.sg:GoToState("book2")
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
  	GetPlayer().SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	GetClock():DoLightningLighting(.9)
	v:DoTaskInTime(0.5, function()  SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.25, function() SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get()) SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) end)
	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	v.components.health:DoDelta(-25)
	v:RemoveTag("burn") 
	v.burn = false
		if v and v.components.freezable then
		v.components.freezable:AddColdness(1.5)
    v.components.freezable:SpawnShatterFX()
	end
		if v.components.burnable and v.components.burnable:IsBurning() then
    v.components.burnable:Extinguish()
	end
	end)
	
	elseif inst.level >= 1880 and inst.level < 7000 and inst.strength == "Valkyrie" and v:HasTag("burn") and v.components.health and not v.components.health:IsDead() and inst.components.playercontroller then
		inst.components.playercontroller:Enable(false)
	inst:DoTaskInTime( 0.2, function() inst.components.playercontroller:Enable(true) end)
	inst.sg:GoToState("book2")
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
  	GetPlayer().SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	GetClock():DoLightningLighting(.9)
	v:DoTaskInTime(0.5, function()  SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.25, function() SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get()) SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) end)
	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	v.components.health:DoDelta(-30)
	v:RemoveTag("burn") 
	v.burn = false
		if v and v.components.freezable then
		v.components.freezable:AddColdness(1.5)
    v.components.freezable:SpawnShatterFX()
	end
		if v.components.burnable and v.components.burnable:IsBurning() then
    v.components.burnable:Extinguish()
	end
	end)
	
	elseif inst.level >= 7000 and inst.strength == "Valkyrie" and v:HasTag("burn") and v.components.health and not v.components.health:IsDead() and inst.components.playercontroller then
		inst.components.playercontroller:Enable(false)
	inst:DoTaskInTime( 0.2, function() inst.components.playercontroller:Enable(true) end)
	inst.sg:GoToState("book2")
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
 	GetPlayer().SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	GetClock():DoLightningLighting(.9)
	v:DoTaskInTime(0.5, function()  SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.25, function() SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get()) SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get()) end)
	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	v.components.health:DoDelta(-35)
	v:RemoveTag("burn") 
	v.burn = false
		if v and v.components.freezable then
		v.components.freezable:AddColdness(1.5)
    v.components.freezable:SpawnShatterFX()
	end
		if v.components.burnable and v.components.burnable:IsBurning() then
    v.components.burnable:Extinguish()
	end
	end)
	
	end 
	end
	end
]]	
--simple lightning strike

local function OnHitlightning1(inst, data)
local other = data.target
   local pos = other:GetPosition()
if inst.lightningblue1 then
if other and other.components.health --[[and not other.components.health:IsDead()]] then
if inst:HasTag("frosta") then
 		if other.components.freezable  then
			other.components.freezable:AddColdness(0.75) end
	elseif inst:HasTag("framea") then
	if not other.components.health:IsDead() then
	other.components.health:DoDelta(-10)
	end
		if other.components.burnable and not other:HasTag("structure") then
			other.components.burnable:Ignite() end
			end
        if other.components.burnable and other.components.burnable:IsBurning() then
			other.components.burnable:Extinguish() end

        SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
		if not other.components.health:IsDead() then
        other.components.health:DoDelta(-25)
		end
		SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
			
            	local fx = SpawnPrefab("groundpoundring_fx")
				fx.Transform:SetScale(0.45, 0.45, 0.45)
				fx.Transform:SetPosition(other:GetPosition():Get())
				
    inst.components.spellpower:DoDelta(-9)
inst.components.combat:SetRange(2)
	 
inst.lightningblue1 = false
 
inst.AnimState:SetBloomEffectHandle( "" )
inst.lightning_activate = false

inst:RemoveTag("frosta")
inst:RemoveTag("framea")

if other:HasTag("burn") then
	other:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get()) 
	SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
	other:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(other:GetPosition():Get())
	  end)
	
	other.slow = true 
			if not other:HasTag("slow") then
			other:AddTag("slow") 
			end

	other.burn = false other.bloom = false 
	other:RemoveTag("burn")
		if not other:HasTag("lightninggoat") then
		other.AnimState:SetBloomEffectHandle( "" ) 
		other.bloom = false 
		end
	

	if other:HasTag("slow") and not other.components.health:IsDead() then
	
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(other:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(other.GUID, other.components.combat.hiteffectsymbol, 0, 0, 0 )
		end	
		
		if not other.shocked then
		if not other.components.health:IsDead() then
		other.components.health:DoDelta(-20)
		end
		elseif other.shocked then
		SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
		if not other.components.health:IsDead() then
		other.components.health:DoDelta(-50)
		end
		other.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(other:GetPosition():Get())
		if debuff and other:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
		follower:FollowSymbol(other.GUID, other.components.combat.hiteffectsymbol, 0,-50, 0.5 )
		inst:DoPeriodicTask(2, function() 
		if other:HasTag("slow") and not other.components.health:IsDead() then 
			other.components.health:DoDelta(-6)
			--
		end	end)
		end	
		GetWorld():DoTaskInTime(15, function() if other.components.locomotor then other.components.locomotor.groundspeedmultiplier = 1 other.slow = false other:RemoveTag("slow") debuff:Remove() end end)
		
	end
	end)
end


inst:RemoveEventCallback("onhitother", OnHitlightning1)
end
end
end

----
local function OnHitlightning2(inst, data)
local other = data.target
   local pos = other:GetPosition()
if inst.lightningblue2 then
if other and other.components.health then
	
if inst:HasTag("frosta") then
		if other.components.freezable  then
			other.components.freezable:AddColdness(0.8) end
elseif inst:HasTag("framea") then
	if not other.components.health:IsDead() then
	other.components.health:DoDelta(-16)	
	end
		if other.components.burnable and not other:HasTag("structure") then
			other.components.burnable:Ignite() end
			end
        if other.components.burnable and other.components.burnable:IsBurning() then
			other.components.burnable:Extinguish() end
		
             SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
		if not other.components.health:IsDead() then	 
        other.components.health:DoDelta(-35)
		end
SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get())
			
            	local fx = SpawnPrefab("groundpoundring_fx")
				fx.Transform:SetScale(0.45, 0.45, 0.45)
				fx.Transform:SetPosition(other:GetPosition():Get())
				
    inst.components.spellpower:DoDelta(-9)
inst.components.combat:SetRange(2)
	 
inst.lightningblue2 = false
 
inst.AnimState:SetBloomEffectHandle( "" )
inst.lightning_activate = false
inst:RemoveTag("frosta")
inst:RemoveTag("framea")

if other:HasTag("burn") then
	other:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get()) 
	SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
	other:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx2").Transform:SetPosition(other:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(other:GetPosition():Get())
	  end)
	
	other.slow = true 
			if not other:HasTag("slow") then
			other:AddTag("slow") 
			end

	other.burn = false other.bloom = false 
	other:RemoveTag("burn")
		if not other:HasTag("lightninggoat") then
		other.AnimState:SetBloomEffectHandle( "" ) 
		other.bloom = false 
		end
	

	if other:HasTag("slow") and other.components.health and not other.components.health:IsDead() then
	
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(other:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(other.GUID, other.components.combat.hiteffectsymbol, 0, 0, 0 )
		end	
		
		if not other.shocked then
		if not other.components.health:IsDead() then
		other.components.health:DoDelta(-30)
		end
		elseif other.shocked then
		SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
		if not other.components.health:IsDead() then
		other.components.health:DoDelta(-60)
		end
		other.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(other:GetPosition():Get())
		if debuff and other:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
		follower:FollowSymbol(other.GUID, other.components.combat.hiteffectsymbol, 0,-50, 0.5 )
		inst:DoPeriodicTask(2, function() 
		if other:HasTag("slow") and not other.components.health:IsDead() then 
			other.components.health:DoDelta(-8)
			--
		end	end)
		end	
		GetWorld():DoTaskInTime(15, function() if other.components.locomotor then other.components.locomotor.groundspeedmultiplier = 1 other.slow = false other:RemoveTag("slow") debuff:Remove() end end)
	
	end
	end)
end

inst:RemoveEventCallback("onhitother", OnHitlightning2)
end
end
end

local function OnHitcritical(inst, data)
local hitcriticalchance1 = 0.09
local hitcriticalchance2 = 0.11
local hitcriticalchance3 = 0.13
local hitcriticalchance4 = 0.15
if inst.strength == "Valkyrie" then
    local other = data.target
    if math.random() < hitcriticalchance1 and inst.hitcritical1 then
    SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	 inst.SoundEmitter:PlaySound("dontstarve/tentacle/tentacle_emerge")
	    other.components.health:DoDelta(-15)

     elseif math.random() < hitcriticalchance2 and inst.hitcritical2 then
      SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	 inst.SoundEmitter:PlaySound("dontstarve/tentacle/tentacle_emerge")
	    other.components.health:DoDelta(-20)

    elseif math.random() < hitcriticalchance3 and inst.hitcritical then
     SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	 inst.SoundEmitter:PlaySound("dontstarve/tentacle/tentacle_emerge")
	    other.components.health:DoDelta(-25)

    elseif math.random() < hitcriticalchance4 and inst.hitcritical4 then
       SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	 inst.SoundEmitter:PlaySound("dontstarve/tentacle/tentacle_emerge")
	    other.components.health:DoDelta(-30)

    end end
	 		inst:RemoveEventCallback("onhitother", OnHitcritical) 
end 

----------
local function fullmoon_buff(inst)
inst:DoPeriodicTask(10, function() if inst.fullmoon then 
inst.components.spellpower:DoDelta(1) 
inst.components.health:DoDelta(2)
end end)
end 

----------

    local function tryproc(inst)

 if not inst.activeh1 and math.random() < .2 and inst.healshield1 and not inst.healshield2 and not inst.healshield3 and not inst.healshield4 and not inst.components.health:IsDead() then
           healshield1_proc(inst)
 elseif not inst.activeh2 and math.random() < .25 and inst.healshield2 and not inst.healshield1 and not inst.healshield3 and not inst.healshield4   and not inst.components.health:IsDead() then
           healshield2_proc(inst)
 elseif not inst.activeh3 and math.random() < .3 and inst.healshield3 and not inst.healshield1 and not inst.healshield2 and not inst.healshield4  and not inst.components.health:IsDead() then
           healshield3_proc(inst)
 elseif not inst.activeh4 and math.random() < .35 and inst.healshield4 and not inst.healshield1 and not inst.healshield2 and not inst.healshield3  and not inst.components.health:IsDead() then
           healshield4_proc(inst)
 	elseif not inst.activelc and math.random() < .5 and inst.lessercure1 and not inst.lessercure2 and not inst.components.health:IsDead() then
           lessercure_proc(inst)
 	elseif not inst.activelc and math.random() < .5 and inst.lessercure2 and not inst.lessercure1 and not inst.components.health:IsDead() then
           lessercure2_proc(inst)
end
end


local function guardian_proc(inst, data)
if inst.guardian_pop and not inst.components.health:IsDead() then
if inst.DLC then	
inst.components.health:SetAbsorptionAmount(1)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(1)
end
inst.guard_on = true
inst.count_w = inst.count_w * 0
local assasin = SpawnPrefab("assasin_wilson")
local pop = SpawnPrefab("explode_small")
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
pop.Transform:SetScale(1.25, 1.25, 1.25)
assasin.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
pop.Transform:SetPosition(assasin:GetPosition():Get())
SpawnPrefab("statue_transition_2").Transform:SetPosition(assasin:GetPosition():Get()) 
SpawnPrefab("lightning_blue").Transform:SetPosition(assasin.Transform:GetWorldPosition())
 	inst:DoTaskInTime(0.5, function()  SpawnPrefab("lightning2").Transform:SetPosition(assasin:GetPosition():Get())
	inst:DoTaskInTime(0.25, function() SpawnPrefab("lightning2").Transform:SetPosition(assasin:GetPosition():Get())  end) end)
local random1 = 0.2

if math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_RANDOM_1)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_RANDOM_2)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_RANDOM_3)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_RANDOM_4)
elseif math.random() < random1 then
assasin.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_RANDOM_5)
else
assasin.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_RANDOM_6)
end

if math.random() < 0.3 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_MUSHA_1)
elseif math.random() < 0.3  then
inst.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_MUSHA_2)
elseif math.random() < 0.3  then
inst.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_MUSHA_3)
elseif math.random() < 0.3  then
inst.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_MUSHA_4)
elseif math.random() < 0.3  then
inst.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_MUSHA_5)
elseif math.random() < 0.3  then
inst.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_MUSHA_6)
else
inst.components.talker:Say(STRINGS.MUSHA_TALK_WILSON_MUSHA_1)
end

end
if not inst.components.health:IsDead() then
inst.components.health:DoDelta(20) end
local fx = SpawnPrefab("forcefieldfxx")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
fx.Transform:SetScale(0.7, 0.7, 0.7)
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
if not inst.components.health:IsDead() then
inst.components.health:SetInvincible(true)
end
inst:DoTaskInTime(--[[Duration]] 3, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
inst.components.health:SetInvincible(false)
if inst:IsValid() then
fx.kill_fx(fx)
if inst.DLC then	
inst.components.health:SetAbsorptionAmount(0)
elseif not inst.DLC then
inst.components.health:SetAbsorbAmount(0)
end

inst:DoTaskInTime(--[[Cooldown]] 600, function() inst.guard_on = false inst.guardian_pop = false end)
end end) 
 end 
 
local function guard(inst)
if not inst.no_assasin then
inst.count_w = inst.count_w + 1
if not inst.berserks and not inst.fberserk and not inst.guard_on and inst.components.health:GetPercent() < .3 and inst.count_w >=90 and math.random() < .1 then

inst.guardian_pop = true
            guardian_proc(inst)
    end end 
	end

    local function shieldproc(inst)

---shield cooltime
	if not inst.activec0 and inst.cure0 and not inst.cure1 and not inst.cure2 and not inst.shieldon and not inst.components.health:IsDead() then
           cure0_proc(inst)
	inst.Cureoo0 = true 
	inst.shieldon2 = true 
	inst.effectsheild = true 

	--inst.components.talker:Say("Charged [Shield]\n((T))")

    elseif not inst.activec1 and inst.cure1 and not inst.cure0 and not inst.cure2 and not inst.shieldon and not inst.components.health:IsDead() then
           cure1_proc(inst)
	inst.Cureoo1 = true 
	inst.shieldon2 = true 
	inst.effectsheild = true 

	---inst.components.talker:Say("Charged [Shield]\n((T))")

    elseif not inst.activec2 and inst.cure2 and not inst.cure0 and not inst.cure1 and not inst.shieldon and not inst.components.health:IsDead() then
           cure2_proc(inst)
	inst.Cureoo2 = true 
	inst.shieldon2 = true 
	inst.effectsheild = true 

	---inst.components.talker:Say("Charged [Shield]\n((T))")


end
if inst.Cureo0 and inst.shieldon2 
then
           cure0_proc(inst)
	inst.shieldon = true 
inst.effectsheild = false 


elseif inst.Cureo1 and inst.shieldon2 
then

           cure1_proc(inst)
	inst.shieldon = true 
inst.effectsheild = false 

elseif inst.Cureo2 and inst.shieldon2 
then

           cure2_proc(inst)
	inst.shieldon = true 
inst.effectsheild = false 

elseif inst.effectsheild and inst.effectsheild2 
then
	local sparks = SpawnPrefab("sparks")
	local pos = Vector3(inst.Transform:GetWorldPosition())
	sparks.Transform:SetPosition(pos:Get())
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_FULL)
inst.effectsheild2 = false 
        end
    end

local function powerattack(inst, data)

local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
if weapon and weapon.components.weapon and not weapon:HasTag("electric_weapon") and not (inst.lightningblue1 or inst.lightningblue2) then
weapon.components.weapon.stimuli = nil 
end

if inst.Valkyrieh and inst.lightningblue1 then
   inst:ListenForEvent("onhitother", OnHitlightning1)

elseif inst.Valkyrieh and inst.lightningblue2 then
    inst:ListenForEvent("onhitother", OnHitlightning2)

elseif not inst.Valkyrieh then
	if inst.lightning_activate or inst.lightningblue1 or inst.lightningblue2 then
	inst.lightning_activate = false
	inst:RemoveTag("frosta")
	inst:RemoveTag("framea")
	inst.lightningblue1 = false 
	inst.lightningblue2 = false 
--inst.AnimState:SetBloomEffectHandle( "" )
inst.components.combat:SetRange(2)
    inst:RemoveEventCallback("onhitother", OnHitlightning1)
    inst:RemoveEventCallback("onhitother", OnHitlightning2)
	end
end
end
--------------------------------------

local function sneakattack(inst, data)
--local another = inst.data
local other = data.target
if not inst.sneaka and inst.sneakaa then
	if inst.backstab1 then
	inst.components.sanity:DoDelta(40)
	elseif inst.backstab1 then
	inst.components.sanity:DoDelta(80)
	elseif inst.backstab1 then
	inst.components.sanity:DoDelta(120)
	end
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.sneakaa = false 
	inst.sneaka = false
	inst:RemoveTag("notarget") 
	
elseif inst.sneaka and inst.sneakaa and (other:HasTag("no_target") or other:HasTag("structure") or other:HasTag("wall") or other:HasTag("pillarretracting") or other:HasTag("tentacle_pillar") or other:HasTag("arm")) then
	if inst.backstab1 then
	inst.components.sanity:DoDelta(40)
	elseif inst.backstab1 then
	inst.components.sanity:DoDelta(80)
	elseif inst.backstab1 then
	inst.components.sanity:DoDelta(120)
	end
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_NOT_CREATURE)
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.sneakaa = false 
	inst.sneaka = false
	inst:RemoveTag("notarget") 
	
elseif inst.sneaka and inst.sneakaa and not (other:HasTag("no_target") and other:HasTag("structure") and other:HasTag("wall") and other:HasTag("pillarretracting") and other:HasTag("tentacle_pillar") and other:HasTag("arm")) then
	
	--sneak attack lv 1
if inst.sneaka and inst.backstab1 and inst.sneakaa then

if not other.sg:HasStateTag("attack") and not other.sg:HasStateTag("shield") and not other.sg:HasStateTag("moving") and not other.sg:HasStateTag("frozen") then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.sneakaa = false 
	inst.sneaka = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS)
        other.components.health:DoDelta(-300)
	local dark1 = SpawnPrefab("statue_transition")
	local pos = Vector3(other.Transform:GetWorldPosition())
	dark1.Transform:SetPosition(pos:Get())
	dark1.Transform:SetScale(0.5,4,0.5)
	local fx = SpawnPrefab("explode_small")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
		inst:RemoveTag("notarget") 
        other.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_impact_sleep")
	--inst.components.sanityaura.penalty = 0
	--inst.components.sanity:RecalculatePenalty()
	inst.components.sanity:DoDelta(40)

elseif other.sg:HasStateTag("frozen") then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
inst.sneakaa = false 
inst.sneaka = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS.."\n"..STRINGS.MUSHA_TALK_SNEAK_FROZEN)
        other.components.health:DoDelta(-150)
	local dark1 = SpawnPrefab("statue_transition")
	local pos = Vector3(other.Transform:GetWorldPosition())
	dark1.Transform:SetPosition(pos:Get())
	dark1.Transform:SetScale(0.5,4,0.5)
	local fx = SpawnPrefab("explode_small")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
		
inst:RemoveTag("notarget") 
        other.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_impact_sleep")
	--inst.components.sanityaura.penalty = 0
	--inst.components.sanity:RecalculatePenalty()
	inst.components.sanity:DoDelta(40)

    elseif other.sg:HasStateTag("attack") or other.sg:HasStateTag("shield") or other.sg:HasStateTag("moving") and not other.sg:HasStateTag("frozen") then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
inst.sneakaa = false 
inst.sneaka = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_FAILED)
	local fx = SpawnPrefab("splash")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
	inst:RemoveTag("notarget") 
	--inst:DoTaskInTime(0.5, function() inst.sleep_visual = true inst.changed_look =true  inst.sg:GoToState("knockout") inst.tiny_sleep = true end)
end
	
--sneak attack lv 2
elseif inst.sneaka and inst.backstab2 and inst.sneakaa then
	    if not other.sg:HasStateTag("attack") and not other.sg:HasStateTag("shield") and not other.sg:HasStateTag("moving") and not other.sg:HasStateTag("frozen") then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
inst.sneakaa = false 
inst.sneaka = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS)
        other.components.health:DoDelta(-600)
	local dark1 = SpawnPrefab("statue_transition")
	local pos = Vector3(other.Transform:GetWorldPosition())
	dark1.Transform:SetPosition(pos:Get())
	dark1.Transform:SetScale(0.5,4,0.5)
	local fx = SpawnPrefab("explode_small")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
	inst:RemoveTag("notarget") 
        other.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_impact_sleep")
	inst.components.sanity:DoDelta(80)

elseif other.sg:HasStateTag("frozen") then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
inst.sneakaa = false 
inst.sneaka = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS.."\n"..STRINGS.MUSHA_TALK_SNEAK_FROZEN)
        other.components.health:DoDelta(-250)
	local dark1 = SpawnPrefab("statue_transition")
	local pos = Vector3(other.Transform:GetWorldPosition())
	dark1.Transform:SetPosition(pos:Get())
	dark1.Transform:SetScale(0.5,4,0.5)
	local fx = SpawnPrefab("explode_small")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
inst:RemoveTag("notarget") 
        other.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_impact_sleep")
	inst.components.sanity:DoDelta(80)

    elseif other.sg:HasStateTag("attack") or other.sg:HasStateTag("shield") or other.sg:HasStateTag("moving") then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
inst.sneakaa = false 
inst.sneaka = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_FAILED)
	local fx = SpawnPrefab("splash")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
	inst:RemoveTag("notarget") 
		
	--inst:DoTaskInTime(0.5, function() inst.sleep_visual = true inst.changed_look =true  inst.sg:GoToState("knockout") inst.tiny_sleep = true end)

end
--sneak attack lv 3
elseif inst.sneaka and inst.backstab3 and inst.sneakaa then
    if not other.sg:HasStateTag("attack") and not other.sg:HasStateTag("shield") and not other.sg:HasStateTag("moving") and not other.sg:HasStateTag("frozen") then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
inst.sneakaa = false 
inst.sneaka = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS)
        other.components.health:DoDelta(-800)
	local dark1 = SpawnPrefab("statue_transition")
	local pos = Vector3(other.Transform:GetWorldPosition())
	dark1.Transform:SetPosition(pos:Get())
	dark1.Transform:SetScale(0.5,4,0.5)
	local fx = SpawnPrefab("explode_small")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
	inst:RemoveTag("notarget") 
        other.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_impact_sleep")
	inst.components.sanity:DoDelta(120)

elseif other.sg:HasStateTag("frozen") then 
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
inst.sneakaa = false 
inst.sneaka = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS.."\n"..STRINGS.MUSHA_TALK_SNEAK_FROZEN)
        other.components.health:DoDelta(-400)
	local dark1 = SpawnPrefab("statue_transition")
	local pos = Vector3(other.Transform:GetWorldPosition())
	dark1.Transform:SetPosition(pos:Get())
	dark1.Transform:SetScale(0.5,4,0.5)
	local fx = SpawnPrefab("explode_small")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
	inst:RemoveTag("notarget") 
        other.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_impact_sleep")
	inst.components.sanity:DoDelta(120)

    elseif other.sg:HasStateTag("attack") or other.sg:HasStateTag("shield") or other.sg:HasStateTag("moving") then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
inst.sneakaa = false 
inst.sneaka = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_FAILED)
	local fx = SpawnPrefab("splash")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
	inst:RemoveTag("notarget") 
	--inst:DoTaskInTime(0.5, function() inst.sleep_visual = true inst.changed_look =true  inst.sg:GoToState("knockout") inst.tiny_sleep = true end)
end
    end
end
	end

local function fsneakattack(inst, data)
    if inst.sneakaa then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
inst.sneakaa = false 
inst.sneaka = false
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_ATTACKED)
inst:RemoveTag("notarget") 
    end
end

local function shadows(inst, data)

if inst.components.hunger.current >= 160 then
		inst.full_look = true
		inst.normal_look = false
elseif inst.components.hunger.current < 160 then
		inst.full_look = false
		inst.normal_look = true
end
	
if inst.level >= 432 and inst.shadowb and inst.shadows and inst.components.sanity:GetMaxSanity() >= 50 and inst.components.health.currenthealth >= 40 then

        			inst.level = inst.level - 2

    local bunsin = SpawnPrefab("shadowmusha")
	local dark2 = SpawnPrefab("statue_transition_2")
	
	if inst:HasTag("DLC") or inst:HasTag("DLC2") then
local drakeangle = math.random(1, 360)
local offset = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
	bunsin.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
	dark2.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
	end
if not inst:HasTag("DLC") and not inst:HasTag("DLC2") then	
	bunsin.Transform:SetPosition(inst:GetPosition():Get())
	dark2.Transform:SetPosition(inst:GetPosition():Get())
	end
	bunsin.sg:GoToState("wakeup")
        bunsin.components.follower:SetLeader(inst)
        inst.components.health:DoDelta(-20)
        inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")

	--levelexp(inst)	

end
inst.shadows = false 
end


local function ondeath(inst)
inst.components.leader:RemoveAllFollowers()
inst.components.leader:RemoveFollower("yamche")
inst.components.leader:RemoveFollower("companion")

local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 12, {"yamche"})
for k,v in pairs(ents) do
if v.components.resurrector and not v.no_resurrect then
v.components.resurrector.active = true
v.resurrect_on = true
end end

	--level 1
	if not inst.no_panalty then
if inst.level <5 then
	inst.level = inst.level - 1
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -1 ") end)
	levelexp(inst)
	
	--level 2
elseif inst.level >=5 and inst.level <10  then
	inst.level = inst.level - 3
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -3 ") end)
	levelexp(inst)
	
	--level 3
elseif inst.level >=10 and inst.level <30  then
	inst.level = inst.level - 6
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -6 ") end)
	levelexp(inst)
	
	--level 4
elseif inst.level >=30 and inst.level <50  then
	inst.level = inst.level - 9
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -9 ") end)

	levelexp(inst)
	
	--level 5
elseif inst.level >=50 and inst.level <80  then
	inst.level = inst.level - 12
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -12 ") end)
	levelexp(inst)
	
	--level 6
elseif inst.level >=80 and inst.level <125  then
	inst.level = inst.level - 16
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -16 ") end)
	levelexp(inst)
		
	--level 7
elseif inst.level >=125 and inst.level <200  then
	inst.level = inst.level - 20
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -20 ") end)
	levelexp(inst)
	
	--level 8
elseif inst.level >=200 and inst.level <340  then
	inst.level = inst.level - 24
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -24 ") end)
	levelexp(inst)
		
	--level 9
elseif inst.level >=340 and inst.level <430  then
	inst.level = inst.level - 28
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -28 ") end)
	levelexp(inst)
	
	--level 10
elseif inst.level >=430 and inst.level <530  then
	inst.level = inst.level - 32
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -32 ") end)
	levelexp(inst)
	
	--level 11
elseif inst.level >=530 and inst.level <640  then
	inst.level = inst.level - 37
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -37 ") end)
	levelexp(inst)
	
	--level 12
elseif inst.level >=640 and inst.level <760  then
	inst.level = inst.level - 42
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -42 ") end)
	levelexp(inst)
	
	--level 13
elseif inst.level >=760 and inst.level <890  then
	inst.level = inst.level - 47
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -47 ") end)
	levelexp(inst)
	
	--level 14
elseif inst.level >=890 and inst.level <1030  then
	inst.level = inst.level - 52
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -52 ") end)
	levelexp(inst)
	
	--level 15
elseif inst.level >=1030 and inst.level <1180  then
	inst.level = inst.level - 57
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -57 ") end)
	levelexp(inst)
	
	--level 16
elseif inst.level >=1180 and inst.level <1340  then
	inst.level = inst.level - 63
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -63 ") end)
	levelexp(inst)
	
	--level 17
elseif inst.level >=1340 and inst.level <1510  then
	inst.level = inst.level - 69
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -69 ") end)
	levelexp(inst)
	
	--level 18
elseif inst.level >=1510 and inst.level <1690  then
	inst.level = inst.level - 75
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -75 ") end)
	levelexp(inst)
	
	--level 19
elseif inst.level >=1690 and inst.level <1880  then
	inst.level = inst.level - 81
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -81 ") end)
	levelexp(inst)
	
	--level 20
elseif inst.level >=1880 and inst.level <2080  then
	inst.level = inst.level - 87
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -87 ") end)
	levelexp(inst)
	
	--level 21
elseif inst.level >=2080 and inst.level <2290  then
	inst.level = inst.level - 94
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -94 ") end)
	levelexp(inst)
	
	--level 22
elseif inst.level >=2290 and inst.level <2500  then
	inst.level = inst.level - 111
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -111 ") end)
	levelexp(inst)
	
	--level 23
elseif inst.level >=2500 and inst.level <2850  then
	inst.level = inst.level - 118
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -118 ") end)
	levelexp(inst)
	
	--level 24
elseif inst.level >=2850 and inst.level <3200  then
	inst.level = inst.level - 125
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -125 ") end)
	levelexp(inst)
	
	--level 25
elseif inst.level >=3200 and inst.level <3700  then
	inst.level = inst.level - 132
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -132 ") end)
	levelexp(inst)
	
	--level 26
elseif inst.level >=3700 and inst.level <4200  then
	inst.level = inst.level - 140
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -140 ") end)
	levelexp(inst)
	
	--level 27
elseif inst.level >=4200 and inst.level <4700  then
	inst.level = inst.level - 150
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -150 ") end)
	levelexp(inst)
	
	--level 28
elseif inst.level >=4700 and inst.level <5500 then
	inst.level = inst.level - 160
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -160 ") end)
	levelexp(inst)
	
	--level 29
elseif inst.level >=5500 and inst.level <7000 then
	inst.level = inst.level - 170
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -170 ") end)
	levelexp(inst)
	
	-- level 30
elseif inst.level >=7000  then
	inst.level = inst.level - 200
	inst:DoTaskInTime( 10, function() inst.components.talker:Say(STRINGS.MUSHA_DEATH_PENALTY.." -200 ") end)
	levelexp(inst)
end end
end

local function applystats(inst)
if not (inst.lightaura or inst.sleepbuff) then	
if inst.easys then
	if GetWorld():IsCave() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_NIGHT_LIGHT = 13/60
			TUNING.SANITY_NIGHT_DARK = 0/60

		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.8)
			TUNING.SANITY_NIGHT_LIGHT = 4/60
			TUNING.SANITY_NIGHT_DARK = -6/60

		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 16/60
			TUNING.SANITY_NIGHT_DARK = 10/60

		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2 )
			TUNING.SANITY_NIGHT_LIGHT = 30/60
			TUNING.SANITY_NIGHT_DARK = 30/60
			--inst.components.temperature.hurtrate = 0
		end
		
	elseif not GetWorld():IsCave() then

    if GetClock():IsDay() then
		if inst.strength == "full" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.2)
			TUNING.SANITY_DAY_GAIN = 30/60
		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_DAY_GAIN = 10/60
		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_DAY_GAIN = 22/60
		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2)
			TUNING.SANITY_DAY_GAIN = 30/60
			--inst.components.temperature.hurtrate = 0
		end

 	elseif GetClock():IsDusk() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.1)
			TUNING.SANITY_NIGHT_LIGHT = 16/60
			TUNING.SANITY_NIGHT_MID = 12/60
		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.9)
			TUNING.SANITY_NIGHT_LIGHT = 10/60
			TUNING.SANITY_NIGHT_MID = 0/60
		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 22/60
			TUNING.SANITY_NIGHT_MID = 16/60
		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2)
			TUNING.SANITY_NIGHT_LIGHT = 30/60
			TUNING.SANITY_NIGHT_MID = 30/60
			--inst.components.temperature.hurtrate = 0
		end

    elseif GetClock():IsNight() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_NIGHT_LIGHT = 13/60
			TUNING.SANITY_NIGHT_DARK = 0/60

		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.8)
			TUNING.SANITY_NIGHT_LIGHT = 4/60
			TUNING.SANITY_NIGHT_DARK = -6/60

		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 16/60
			TUNING.SANITY_NIGHT_DARK = 10/60

		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2 )
			TUNING.SANITY_NIGHT_LIGHT = 30/60
			TUNING.SANITY_NIGHT_DARK = 30/60
			--inst.components.temperature.hurtrate = 0
		end
	end	
	end
	end
if inst.normals then

	if GetWorld():IsCave() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_NIGHT_LIGHT = 3/60
			TUNING.SANITY_NIGHT_DARK = 0/60

		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.8)
			TUNING.SANITY_NIGHT_LIGHT = -6/60
			TUNING.SANITY_NIGHT_DARK = -12/60

		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 6/60
			TUNING.SANITY_NIGHT_DARK = 3/60

		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2 )
			TUNING.SANITY_NIGHT_LIGHT = 20/60
			TUNING.SANITY_NIGHT_DARK = 20/60
			--inst.components.temperature.hurtrate = 0
		end
		
	elseif not GetWorld():IsCave() then
    if GetClock():IsDay() then
		if inst.strength == "full" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.2)
			TUNING.SANITY_DAY_GAIN = 20/60
		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_DAY_GAIN = 0/60
		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_DAY_GAIN = 12/60
		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2)
			TUNING.SANITY_DAY_GAIN = 20/60
			--inst.components.temperature.hurtrate = 0
		end

 	elseif GetClock():IsDusk() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.1)
			TUNING.SANITY_NIGHT_LIGHT = 6/60
			TUNING.SANITY_NIGHT_MID = 2/60
		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.9)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_MID = -6/60
		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 12/60
			TUNING.SANITY_NIGHT_MID = 6/60
		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2)
			TUNING.SANITY_NIGHT_LIGHT = 20/60
			TUNING.SANITY_NIGHT_MID = 20/60
			--inst.components.temperature.hurtrate = 0
		end

    elseif GetClock():IsNight() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_NIGHT_LIGHT = 3/60
			TUNING.SANITY_NIGHT_DARK = 0/60

		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.8)
			TUNING.SANITY_NIGHT_LIGHT = -6/60
			TUNING.SANITY_NIGHT_DARK = -12/60

		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 6/60
			TUNING.SANITY_NIGHT_DARK = 3/60

		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2 )
			TUNING.SANITY_NIGHT_LIGHT = 20/60
			TUNING.SANITY_NIGHT_DARK = 20/60
			--inst.components.temperature.hurtrate = 0
		end
	end	
	end
	end
	
if inst.hards then
	if GetWorld():IsCave() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_DARK = -5/60

		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.8)
			TUNING.SANITY_NIGHT_LIGHT = -8/60
			TUNING.SANITY_NIGHT_DARK = -15/60

		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_DARK = 0/60

		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2 )
			TUNING.SANITY_NIGHT_LIGHT = 10/60
			TUNING.SANITY_NIGHT_DARK = 10/60
			--inst.components.temperature.hurtrate = 0
		end
		
	elseif not GetWorld():IsCave() then
    if GetClock():IsDay() then
		if inst.strength == "full" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.2)
			TUNING.SANITY_DAY_GAIN = 12/60
		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_DAY_GAIN = 0/60
		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_DAY_GAIN = 6/60
		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2)
			TUNING.SANITY_DAY_GAIN = 10/60
			--inst.components.temperature.hurtrate = 0
		end

 	elseif GetClock():IsDusk() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.1)
			TUNING.SANITY_NIGHT_LIGHT = 6/60
			TUNING.SANITY_NIGHT_MID = 0/60
		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.9)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_MID = -10/60
		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 12/60
			TUNING.SANITY_NIGHT_MID = 6/60
		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2)
			TUNING.SANITY_NIGHT_LIGHT = 10/60
			TUNING.SANITY_NIGHT_MID = 10/60
			--inst.components.temperature.hurtrate = 0
		end

    elseif GetClock():IsNight() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_DARK = -5/60

		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.8)
			TUNING.SANITY_NIGHT_LIGHT = -8/60
			TUNING.SANITY_NIGHT_DARK = -15/60

		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_DARK = 0/60

		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2 )
			TUNING.SANITY_NIGHT_LIGHT = 10/60
			TUNING.SANITY_NIGHT_DARK = 10/60
			--inst.components.temperature.hurtrate = 0
		end
	end		
	end
	end
if inst.hardcores then
	if GetWorld():IsCave() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_DARK = -12/60

		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.8)
			TUNING.SANITY_NIGHT_LIGHT = -10/60
			TUNING.SANITY_NIGHT_DARK = -20/60

		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_DARK = 0/60

		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2 )
			TUNING.SANITY_NIGHT_LIGHT = 0
			TUNING.SANITY_NIGHT_DARK = 0
			--inst.components.temperature.hurtrate = 0
		end
		
	elseif not GetWorld():IsCave() then
    if GetClock():IsDay() then
		if inst.strength == "full" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.2)
			TUNING.SANITY_DAY_GAIN = 8/60
		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_DAY_GAIN = 0/60
		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_DAY_GAIN = 0/60
		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2)
			TUNING.SANITY_DAY_GAIN = 0
			--inst.components.temperature.hurtrate = 0
		end

 	elseif GetClock():IsDusk() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.1)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_MID = -3/60
		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.9)
			TUNING.SANITY_NIGHT_LIGHT = -3/60
			TUNING.SANITY_NIGHT_MID = -15/60
		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_MID = 0/60
		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2)
			TUNING.SANITY_NIGHT_LIGHT = 0
			TUNING.SANITY_NIGHT_MID = 0
			--inst.components.temperature.hurtrate = 0
		end

    elseif GetClock():IsNight() then
		if inst.strength == "full" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_DARK = -12/60

		elseif inst.strength == "normal" then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.8)
			TUNING.SANITY_NIGHT_LIGHT = -10/60
			TUNING.SANITY_NIGHT_DARK = -20/60

		elseif inst.strength == "Valkyrie" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_DARK = 0/60

		elseif inst.strength == "berserk" then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2 )
			TUNING.SANITY_NIGHT_LIGHT = 0
			TUNING.SANITY_NIGHT_DARK = 0
			--inst.components.temperature.hurtrate = 0
		end
	end			
	end
	end
				
elseif inst.lightaura and not inst.sleepbuff then	
		
		--[[if inst.components.spellpower ~= nil and inst.components.spellpower.current <100 then
		inst.components.spellpower:DoDelta(1)
		end]]
		
  		if inst.strength == "full" then
			if not inst.sleeping_musha then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.3) end
			TUNING.SANITY_DAY_GAIN = 60/60
			TUNING.SANITY_NIGHT_LIGHT = 60/60
			TUNING.SANITY_NIGHT_DARK = 20/60
		elseif inst.strength == "normal" then	
			if not inst.sleeping_musha then	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE) end
			TUNING.SANITY_DAY_GAIN = 35/60
			TUNING.SANITY_NIGHT_LIGHT = 35/60
			TUNING.SANITY_NIGHT_DARK = 10/60			
		elseif inst.strength == "Valkyrie" then
			if not inst.sleeping_musha then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5) end
			TUNING.SANITY_DAY_GAIN = 40/60
			TUNING.SANITY_NIGHT_LIGHT = 40/60
			TUNING.SANITY_NIGHT_DARK = 15/60			
		elseif inst.strength == "berserk" then
			if not inst.sleeping_musha then
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2) end
			TUNING.SANITY_DAY_GAIN = 60/60
			TUNING.SANITY_NIGHT_LIGHT = 60/60
			TUNING.SANITY_NIGHT_DARK = 20/60			
			--inst.components.temperature.hurtrate = 0
		end
		end			
	end

local function consume_stamina(inst, data)


if inst.components.stamina_sleep.current <= 40 or inst.components.fatigue_sleep.current >= 80 then
	if not inst:HasTag("groggy_2") and not inst.sleep_on and not inst.tiny_sleep then
		inst:AddTag("groggy_2")
	if not inst.talk_warning_sleep then	
			if math.random() < 0.2 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_0)
			elseif math.random() < 0.2 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_2)
			elseif math.random() < 0.2 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_5)
			elseif math.random() < 0.2 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_4)
			else
			inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_2)
			end 
		inst.talk_warning_sleep = true
	end
	end
else
	if inst:HasTag("groggy_2") then
		inst:RemoveTag("groggy_2")
	end
	if inst.components.stamina_sleep.current > 80 or inst.components.fatigue_sleep.current < 20 then
	inst.talk_warning_sleep = false
	end
end

if inst.lightaura then
	if inst.components.spellpower ~= nil and inst.components.spellpower.current <100 then
			if inst.dmana_veasy then
			inst.components.spellpower:DoDelta(4)
			elseif inst.dmana_easy then
			inst.components.spellpower:DoDelta(3)
			elseif inst.dmana_normal then
			inst.components.spellpower:DoDelta(2)
			elseif inst.dmana_hard then
			inst.components.spellpower:DoDelta(1)
			elseif inst.dmana_hardcore then
			inst.components.spellpower:DoDelta(1)
			else
			inst.components.spellpower:DoDelta(1)
			end	
	end
--[[if inst.components.stamina_sleep.current < 100 then
inst.components.stamina_sleep:DoDelta(0.2)  end
if inst.components.fatigue_sleep.current > 0 then
inst.components.fatigue_sleep:DoDelta(-0.5)  end]]
end

local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 18, {"moondrake2"})
for k,v in pairs(ents) do
if inst.moondrake_on then
if not inst:HasTag("aquatic") then
v.inst_in = false
elseif inst:HasTag("aquatic") then
v.components.follower:SetLeader(nil)
v.inst_in = true
v.sg:GoToState("exit")
end 
if v.inst_in and v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) then 
inst.components.leader:AddFollower(v)
end
elseif not inst.moondrake_on and not v.inst_in and not v.slave then
v.components.follower:SetLeader(nil)
v.inst_in = true
v.sg:GoToState("exit")
end 
end

if inst.charging_music and inst.music < 100 then
--check_music(inst)
end
if inst.charging_music and inst.music >= 100 then	
inst.music_check = true
--inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
elseif inst.music < 100 then
inst.music_check = false 
end
--[[if not (inst.warm_on or inst.warm_tent) and (inst.sleep_on or inst.sleep_in or inst.tiny_sleep) and inst.components.stamina_sleep.current < 100 then
 	if inst.dsleep_veasy then
	inst.components.stamina_sleep:DoDelta(2)
	elseif inst.dsleep_easy then
	inst.components.stamina_sleep:DoDelta(1.5)
	elseif inst.dsleep_normal then
	inst.components.stamina_sleep:DoDelta(1)
	elseif inst.dsleep_hard then
	inst.components.stamina_sleep:DoDelta(0.5)
	elseif inst.dsleep_hardcore then
	inst.components.stamina_sleep:DoDelta(0.25)
end
elseif (inst.warm_on or inst.warm_tent) and inst.tiny_sleep and inst.components.stamina_sleep.current < 100 then
 	if inst.dsleep_veasy then
	inst.components.stamina_sleep:DoDelta(2)
	elseif inst.dsleep_easy then
	inst.components.stamina_sleep:DoDelta(1.5)
	elseif inst.dsleep_normal then
	inst.components.stamina_sleep:DoDelta(1)
	elseif inst.dsleep_hard then
	inst.components.stamina_sleep:DoDelta(0.5)
	elseif inst.dsleep_hardcore then
	inst.components.stamina_sleep:DoDelta(0.25)
end
elseif (inst.warm_on or inst.warm_tent) and inst.sleep_on and inst.components.stamina_sleep.current < 100 then
 	if inst.dsleep_veasy then
	inst.components.stamina_sleep:DoDelta(4)
	elseif inst.dsleep_easy then
	inst.components.stamina_sleep:DoDelta(2.5)
	elseif inst.dsleep_normal then
	inst.components.stamina_sleep:DoDelta(1.5)
	elseif inst.dsleep_hard then
	inst.components.stamina_sleep:DoDelta(1)
	elseif inst.dsleep_hardcore then
	inst.components.stamina_sleep:DoDelta(0.5)
end
end]]
--[[if not (inst.warm_on or inst.warm_tent) and (inst.sleep_on or inst.sleep_in or inst.tiny_sleep) and inst.components.fatigue_sleep.current > 0 then
	if inst.dsleep_veasy then
	inst.components.fatigue_sleep:DoDelta(-3)
	elseif inst.dsleep_easy then
	inst.components.fatigue_sleep:DoDelta(-2)
	elseif inst.dsleep_normal then
	inst.components.fatigue_sleep:DoDelta(-1.25)
	elseif inst.dsleep_hard then
	inst.components.fatigue_sleep:DoDelta(-0.75)
	elseif inst.dsleep_hardcore then
	inst.components.fatigue_sleep:DoDelta(-0.5)
end
elseif (inst.warm_on or inst.warm_tent) and inst.tiny_sleep and inst.components.fatigue_sleep.current > 0 then
	if inst.dsleep_veasy then
	inst.components.fatigue_sleep:DoDelta(-3)
	elseif inst.dsleep_easy then
	inst.components.fatigue_sleep:DoDelta(-2)
	elseif inst.dsleep_normal then
	inst.components.fatigue_sleep:DoDelta(-1.25)
	elseif inst.dsleep_hard then
	inst.components.fatigue_sleep:DoDelta(-0.75)
	elseif inst.dsleep_hardcore then
	inst.components.fatigue_sleep:DoDelta(-0.5)
end
elseif (inst.warm_on or inst.warm_tent) and inst.sleep_on and inst.components.fatigue_sleep.current > 0 then
	if inst.dsleep_veasy then
	inst.components.fatigue_sleep:DoDelta(-5)
	elseif inst.dsleep_easy then
	inst.components.fatigue_sleep:DoDelta(-3)
	elseif inst.dsleep_normal then
	inst.components.fatigue_sleep:DoDelta(-2)
	elseif inst.dsleep_hard then
	inst.components.fatigue_sleep:DoDelta(-1.5)
	elseif inst.dsleep_hardcore then
	inst.components.fatigue_sleep:DoDelta(-1)
	end
end]]
if not inst.sleep_in then
	inst.sleeping_musha = false
	inst.sleepbuff = false
 --[[ if inst.sg:HasStateTag("moving") then
	if inst.sleep_visual then
    inst.sleep_visual = false 
	end end]]
if GetClock():IsDay() and inst.components.stamina_sleep.current > 0 then
	--[[if inst.dsleep_veasy then
	inst.components.stamina_sleep:DoDelta(0)	
	elseif inst.dsleep_easy then
	inst.components.stamina_sleep:DoDelta(-0.005)
	elseif inst.dsleep_normal then
	inst.components.stamina_sleep:DoDelta(-0.005)
	elseif inst.dsleep_hard then
	inst.components.stamina_sleep:DoDelta(-0.01)
	elseif inst.dsleep_hardcore then
	inst.components.stamina_sleep:DoDelta(-0.015)
	end]]
elseif GetClock():IsDusk() and inst.components.stamina_sleep.current >0 then
	if inst.dsleep_veasy then
	inst.components.stamina_sleep:DoDelta(0)
	elseif inst.dsleep_easy then
	inst.components.stamina_sleep:DoDelta(-0.01)
	elseif inst.dsleep_normal then
	inst.components.stamina_sleep:DoDelta(-0.02)
	elseif inst.dsleep_hard then
	inst.components.stamina_sleep:DoDelta(-0.03)
	elseif inst.dsleep_hardcore then
	inst.components.stamina_sleep:DoDelta(-0.04)
	end
elseif GetClock():IsNight() and inst.components.stamina_sleep.current >0 then
 	if inst.dsleep_veasy then
	inst.components.stamina_sleep:DoDelta(0)
	elseif inst.dsleep_easy then
	inst.components.stamina_sleep:DoDelta(-0.05)
	elseif inst.dsleep_normal then
	inst.components.stamina_sleep:DoDelta(-0.1)
	elseif inst.dsleep_hard then
	inst.components.stamina_sleep:DoDelta(-0.15)
	elseif inst.dsleep_hardcore then
	inst.components.stamina_sleep:DoDelta(-0.2)
	end
end 

-- sniff

if inst.treasure <100 and (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing")) then 
	if inst.dsniff_easy then
 inst.treasure = inst.treasure + 0.1
	elseif inst.dsniff_normal then
 inst.treasure = inst.treasure + 0.05
	elseif inst.dsniff_hard then
 inst.treasure = inst.treasure + 0.025
	elseif inst.dsniff_hardcore then
 inst.treasure = inst.treasure + 0.01
	end
 
end 
 

if inst.components.fatigue_sleep and inst.sg:HasStateTag("moving") and not inst.sg:HasStateTag("sailing") then
	if inst.dsleep_veasy then
	inst.components.fatigue_sleep:DoDelta(0)
	elseif inst.dsleep_easy then
	inst.components.fatigue_sleep:DoDelta(0.05)
	elseif inst.dsleep_normal then
	inst.components.fatigue_sleep:DoDelta(0.1)
	elseif inst.dsleep_hard then
	inst.components.fatigue_sleep:DoDelta(0.2)
	elseif inst.dsleep_hardcore then
	inst.components.fatigue_sleep:DoDelta(0.4)
	end
end

if inst.components.fatigue_sleep and inst.sg:HasStateTag("attack") then
	if inst.dsleep_veasy then
	inst.components.fatigue_sleep:DoDelta(0.025)
	elseif inst.dsleep_easy then
	inst.components.fatigue_sleep:DoDelta(0.05)
	elseif inst.dsleep_normal then
	inst.components.fatigue_sleep:DoDelta(0.1)
	elseif inst.dsleep_hard then
	inst.components.fatigue_sleep:DoDelta(0.15)
	elseif inst.dsleep_hardcore then
	inst.components.fatigue_sleep:DoDelta(0.2)
	end
end
if inst.components.fatigue_sleep and (inst.sg:HasStateTag("chopping") or inst.sg:HasStateTag("mining") or  inst.sg:HasStateTag("hammering") or inst.sg:HasStateTag("digging") or inst.sg:HasStateTag("netting") or inst.sg:HasStateTag("fishing") or inst.sg:HasStateTag("reading")) then
	if inst.dsleep_veasy then
	inst.components.fatigue_sleep:DoDelta(0.01)
	elseif inst.dsleep_easy then
	inst.components.fatigue_sleep:DoDelta(0.1)
	elseif inst.dsleep_normal then
	inst.components.fatigue_sleep:DoDelta(0.3)
	elseif inst.dsleep_hard then
	inst.components.fatigue_sleep:DoDelta(0.5)
	elseif inst.dsleep_hardcore then
	inst.components.fatigue_sleep:DoDelta(0.8)
	end
end	
if inst.backstab1 and inst.sneakaa and (inst.sg:HasStateTag("chopping") or inst.sg:HasStateTag("mining") or  inst.sg:HasStateTag("hammering") or inst.sg:HasStateTag("digging") or inst.sg:HasStateTag("netting") or inst.sg:HasStateTag("fishing") or inst.sg:HasStateTag("reading")) then
		inst.sneakaa = false
		inst.sneaka = false
  inst:RemoveTag("hide")
        inst:RemoveTag("notarget")
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
         inst.components.sanity:DoDelta(40)

elseif inst.backstab2 and inst.sneakaa and (inst.sg:HasStateTag("chopping") or inst.sg:HasStateTag("mining") or  inst.sg:HasStateTag("hammering") or inst.sg:HasStateTag("digging") or inst.sg:HasStateTag("netting") or inst.sg:HasStateTag("fishing") or inst.sg:HasStateTag("reading")) then
		inst.sneakaa = false
		inst.sneaka = false
        inst:RemoveTag("notarget")
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
         inst.components.sanity:DoDelta(80)

elseif inst.backstab3  and inst.sneakaa and (inst.sg:HasStateTag("chopping") or inst.sg:HasStateTag("mining") or  inst.sg:HasStateTag("hammering") or inst.sg:HasStateTag("digging") or inst.sg:HasStateTag("netting") or inst.sg:HasStateTag("fishing") or inst.sg:HasStateTag("reading")) then
		inst.sneakaa = false
		inst.sneaka = false
        inst:RemoveTag("notarget")
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0)
         inst.components.sanity:DoDelta(120)
end

if inst.components.fatigue_sleep.current >30 and not inst.sg:HasStateTag("walking") and not inst.sg:HasStateTag("running") and not inst.sg:HasStateTag("moving") and not inst.sg:HasStateTag("attack") and not inst.sg:HasStateTag("chopping") and not inst.sg:HasStateTag("mining") and not  inst.sg:HasStateTag("hammering") and not inst.sg:HasStateTag("digging") and not inst.sg:HasStateTag("netting") and not inst.sg:HasStateTag("fishing") then
	if inst.dsleep_veasy then
	inst.components.fatigue_sleep:DoDelta(-0.2)
	elseif inst.dsleep_easy then
	inst.components.fatigue_sleep:DoDelta(-0.1)
	elseif inst.dsleep_normal then
	inst.components.fatigue_sleep:DoDelta(-0.05)
	elseif inst.dsleep_hard then
	inst.components.fatigue_sleep:DoDelta(-0.025)
	elseif inst.dsleep_hardcore then
	inst.components.fatigue_sleep:DoDelta(-0.01)
	end
end
end
if inst.components.stamina_sleep.current > 0 and not inst.sleep_on and not inst.tiny_sleep then
	if inst.components.fatigue_sleep.current <25 then
		inst.warnning_tired = false 
	elseif inst.components.fatigue_sleep.current >=100 then
		if not inst.warnning_tired then
			if math.random() < 0.2 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_0)
			elseif math.random() < 0.2 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_2)
			elseif math.random() < 0.2 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_5)
			elseif math.random() < 0.2 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_4)
			else
			inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_2)
			end 
			inst.warnning_tired = true 
			inst:DoTaskInTime(60, function() inst.warnning_tired = false end) 
			end
	end
	
if inst.dtired_veasy then 
	if inst.components.fatigue_sleep.current >=10 and inst.components.fatigue_sleep.current <20 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.01)
elseif inst.components.fatigue_sleep.current >=20 and inst.components.fatigue_sleep.current <30 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.015)
elseif inst.components.fatigue_sleep.current >=30 and inst.components.fatigue_sleep.current <40 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.02)
elseif inst.components.fatigue_sleep.current >=40 and inst.components.fatigue_sleep.current <50 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.025)
elseif inst.components.fatigue_sleep.current >=50 and inst.components.fatigue_sleep.current <60 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.03)
elseif inst.components.fatigue_sleep.current >=60 and inst.components.fatigue_sleep.current <70 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.035)
elseif inst.components.fatigue_sleep.current >=70 and inst.components.fatigue_sleep.current <80 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.04)
elseif inst.components.fatigue_sleep.current >=80 and inst.components.fatigue_sleep.current <90 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.045)
elseif inst.components.fatigue_sleep.current >=90 and inst.components.fatigue_sleep.current <100 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.05)
elseif inst.components.fatigue_sleep.current >=100 then
inst.components.stamina_sleep:DoDelta(-0.2)
end 

elseif inst.dtired_easy then
	if inst.components.fatigue_sleep.current >=10 and inst.components.fatigue_sleep.current <20 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.01)
elseif inst.components.fatigue_sleep.current >=20 and inst.components.fatigue_sleep.current <30 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.02)
elseif inst.components.fatigue_sleep.current >=30 and inst.components.fatigue_sleep.current <40 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.03)
elseif inst.components.fatigue_sleep.current >=40 and inst.components.fatigue_sleep.current <50 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.04)
elseif inst.components.fatigue_sleep.current >=50 and inst.components.fatigue_sleep.current <60 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.05)
elseif inst.components.fatigue_sleep.current >=60 and inst.components.fatigue_sleep.current <70 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.06)
elseif inst.components.fatigue_sleep.current >=70 and inst.components.fatigue_sleep.current <80 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.07)
elseif inst.components.fatigue_sleep.current >=80 and inst.components.fatigue_sleep.current <90 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.08)
elseif inst.components.fatigue_sleep.current >=90 and inst.components.fatigue_sleep.current <100 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.09)
elseif inst.components.fatigue_sleep.current >=100 then
inst.components.stamina_sleep:DoDelta(-0.4)
end 

elseif inst.dtired_normal then
	if inst.components.fatigue_sleep.current >=10 and inst.components.fatigue_sleep.current <20 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.015)
elseif inst.components.fatigue_sleep.current >=20 and inst.components.fatigue_sleep.current <30 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.025)
elseif inst.components.fatigue_sleep.current >=30 and inst.components.fatigue_sleep.current <40 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.035)
elseif inst.components.fatigue_sleep.current >=40 and inst.components.fatigue_sleep.current <50 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.045)
elseif inst.components.fatigue_sleep.current >=50 and inst.components.fatigue_sleep.current <60 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.055)
elseif inst.components.fatigue_sleep.current >=60 and inst.components.fatigue_sleep.current <70 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.065)
elseif inst.components.fatigue_sleep.current >=70 and inst.components.fatigue_sleep.current <80 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.075)
elseif inst.components.fatigue_sleep.current >=80 and inst.components.fatigue_sleep.current <90 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.085)
elseif inst.components.fatigue_sleep.current >=90 and inst.components.fatigue_sleep.current <100 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.095)
elseif inst.components.fatigue_sleep.current >=100 then
inst.components.stamina_sleep:DoDelta(-0.8)
end  

elseif inst.dtired_hard then
	if inst.components.fatigue_sleep.current >=10 and inst.components.fatigue_sleep.current <20 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.02)
elseif inst.components.fatigue_sleep.current >=20 and inst.components.fatigue_sleep.current <30 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.04)
elseif inst.components.fatigue_sleep.current >=30 and inst.components.fatigue_sleep.current <40 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.06)
elseif inst.components.fatigue_sleep.current >=40 and inst.components.fatigue_sleep.current <50 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.08)
elseif inst.components.fatigue_sleep.current >=50 and inst.components.fatigue_sleep.current <60 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.1)
elseif inst.components.fatigue_sleep.current >=60 and inst.components.fatigue_sleep.current <70 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.12)
elseif inst.components.fatigue_sleep.current >=70 and inst.components.fatigue_sleep.current <80 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.14)
elseif inst.components.fatigue_sleep.current >=80 and inst.components.fatigue_sleep.current <90 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.16)
elseif inst.components.fatigue_sleep.current >=90 and inst.components.fatigue_sleep.current <100 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.2)
elseif inst.components.fatigue_sleep.current >=100 then
inst.components.stamina_sleep:DoDelta(-1.6)
end  
	
elseif inst.dtired_hardcore then
	if inst.components.fatigue_sleep.current >=10 and inst.components.fatigue_sleep.current <20 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.03)
elseif inst.components.fatigue_sleep.current >=20 and inst.components.fatigue_sleep.current <30 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.06)
elseif inst.components.fatigue_sleep.current >=30 and inst.components.fatigue_sleep.current <40 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.09)
elseif inst.components.fatigue_sleep.current >=40 and inst.components.fatigue_sleep.current <50 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.12)
elseif inst.components.fatigue_sleep.current >=50 and inst.components.fatigue_sleep.current <60 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.15)
elseif inst.components.fatigue_sleep.current >=60 and inst.components.fatigue_sleep.current <70 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.18)
elseif inst.components.fatigue_sleep.current >=70 and inst.components.fatigue_sleep.current <80 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.21)
elseif inst.components.fatigue_sleep.current >=80 and inst.components.fatigue_sleep.current <90 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.24)
elseif inst.components.fatigue_sleep.current >=90 and inst.components.fatigue_sleep.current <100 and not inst.sleep_on and not inst.tiny_sleep then
inst.components.stamina_sleep:DoDelta(-0.3)
elseif inst.components.fatigue_sleep.current >=100 then
inst.components.stamina_sleep:DoDelta(-2.5)
end  
	end

end

inst.components.talker.colour = Vector3(1, 1, 1, 1)
inst.components.talker.fontsize = 30

if inst.strength == "Valkyrie" and not inst.sleep_on and not inst.tiny_sleep and inst.components.fatigue_sleep.current < 100 then
	if inst.dtired_veasy then
	inst.components.fatigue_sleep:DoDelta(0.02)
	elseif inst.dtired_easy then
	inst.components.fatigue_sleep:DoDelta(0.05)
	elseif inst.dtired_normal then
	inst.components.fatigue_sleep:DoDelta(0.1)
	elseif inst.dtired_hard then
	inst.components.fatigue_sleep:DoDelta(0.15)
	elseif inst.dtired_hardcore then
	inst.components.fatigue_sleep:DoDelta(0.2)
	end
elseif inst.strength == "berserk" and not inst.sleep_on and not inst.tiny_sleep and inst.components.fatigue_sleep.current < 100 then
if not inst.fullmoon then
	if inst.dtired_veasy then
	inst.components.fatigue_sleep:DoDelta(0.01)
	elseif inst.dtired_easy then
	inst.components.fatigue_sleep:DoDelta(0.025)
	elseif inst.dtired_normal then
	inst.components.fatigue_sleep:DoDelta(0.05)
	elseif inst.dtired_hard then
	inst.components.fatigue_sleep:DoDelta(0.075)
	elseif inst.dtired_hardcore then
	inst.components.fatigue_sleep:DoDelta(0.1)
	end
	end
end

if inst.sneakaa and inst.components.fatigue_sleep.current < 100 and not inst.sleep_on and not inst.tiny_sleep then 
	if inst.dtired_veasy then
	inst.components.fatigue_sleep:DoDelta(0.01)
	elseif inst.dtired_easy then
	inst.components.fatigue_sleep:DoDelta(0.025)
	elseif inst.dtired_normal then
	inst.components.fatigue_sleep:DoDelta(0.05)
	elseif inst.dtired_hard then
	inst.components.fatigue_sleep:DoDelta(0.075)
	elseif inst.dtired_hardcore then
	inst.components.fatigue_sleep:DoDelta(0.1)
	end
end

if inst.Cureo0 or inst.Cureo1 or inst.Cureo2 and inst.components.stamina_sleep.current < 100 then
	if inst.dtired_veasy then
	inst.components.fatigue_sleep:DoDelta(0.05)
	elseif inst.dtired_easy then
	inst.components.fatigue_sleep:DoDelta(0.1)
	elseif inst.dtired_normal then
	inst.components.fatigue_sleep:DoDelta(0.2)
	elseif inst.dtired_hard then
	inst.components.fatigue_sleep:DoDelta(0.3)
	elseif inst.dtired_hardcore then
	inst.components.fatigue_sleep:DoDelta(0.4)
	end
end	

end


local function dizzy(inst)

local dizzy = 0.1
if inst.components.stamina_sleep.current <= 0 and not inst.dizzy and math.random() < dizzy and not inst.components.health:IsDead() and not (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("attack")) and not inst.sleep_on and not inst.sleep_in and not inst.tiny_sleep then 
	inst.dizzy = true
elseif inst.components.stamina_sleep.current > 0 and not inst.components.health:IsDead() then	
	inst.dizzy = false
	end
if inst.dizzy and inst.dizzy_on and not inst.count_dizzy then
inst.count_dizzy = true
inst:DoTaskInTime(40, function() inst.dizzy = false inst.dizzy_on = false inst.count_dizzy = false end)
end	
		
if inst.dizzy and not inst.sleep_on and not inst.sleep_in and not inst.tiny_sleep and not (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) then	
if not inst.dizzy_on then	
if math.random() < dizzy then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_0)
elseif math.random() < dizzy then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_2)
elseif math.random() < dizzy then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_3)
elseif math.random() < dizzy then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_5)
end
inst.dizzy_on = true
inst:DoTaskInTime(2, function() inst.dizzy_on = true 
		if not inst.sleep_visual then
		inst.sleep_visual = true inst.changed_look =true  end
		inst.fberserk = false 
			if not (inst.tiny_sleep or inst.sleep_on) then
			inst.sg:GoToState("knockout") 
			end
 inst.tiny_sleep = true inst.sleep_in = true end)
end 
end

if inst.components.stamina_sleep.current > 5 and inst.components.stamina_sleep.current < 30 and not inst.dizzy2 and math.random() < dizzy and not inst.components.health:IsDead() and not (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("attack")) then 
	
if not inst.sleep_on and not inst.sleep_in then
if math.random() < dizzy then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_1)
elseif math.random() < dizzy then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_2)
elseif math.random() < dizzy then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_5)
elseif math.random() < dizzy then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_6)
end
end
if not (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) and inst.sg:HasStateTag("idle") then
if not inst.sleep_visual then
		inst.sleep_visual = true inst.changed_look =true  end
if inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3 and inst.visual_hold4) then
	if math.random() < 0.3 then
		inst.AnimState:PushAnimation("mime1", false)
		elseif math.random() < 0.3 then
		inst.AnimState:PushAnimation("mime4", false)
		else
		inst.AnimState:PushAnimation("mime3", false)
	end
else
		inst.AnimState:PlayAnimation("yawn")
end
end
inst.dizzy2 = true
	inst:DoTaskInTime( 90, function() if inst.dizzy2 then inst.dizzy2 = false end end)
 end 
 end
 
local function phasechange(inst, data)
-- test
if inst.changed_look then
inst.changed_look = false
applystats(inst)
if inst.berserks or inst.fberserk or inst.fullmoon then
	inst.berserk_look = true
	inst.valkyrie_look = false
	inst.full_look = false
	inst.normal_look = false
else

if inst.Valkyrieh then
	inst.berserk_look = false
	inst.valkyrie_look = true
	inst.full_look = false
	inst.normal_look = false
else

if inst.components.hunger.current >= 160 then
	inst.berserk_look = false
	inst.valkyrie_look = false
	inst.full_look = true
	inst.normal_look = false
elseif inst.components.hunger.current < 160 then
	inst.berserk_look = false
	inst.valkyrie_look = false
	inst.full_look = false
	inst.normal_look = true
end
end
end
end


if inst.berserks or inst.fberserk or inst.fullmoon then
	--inst.berserk_look = false
	inst.valkyrie_look = false
	inst.full_look = false
	inst.normal_look = false
else

if inst.Valkyrieh then
	inst.berserk_look = false
	--inst.valkyrie_look = false
	inst.full_look = false
	inst.normal_look = false
else

if inst.components.hunger.current >= 160 then
	inst.berserk_look = false
	inst.valkyrie_look = false
	--inst.full_look = false
	inst.normal_look = false
elseif inst.components.hunger.current < 160 then
	inst.berserk_look = false
	inst.valkyrie_look = false
	inst.full_look = false
	--inst.normal_look = false
end
end
end
--------

	if inst.hardcorer and not inst:HasTag("hardcorer") then
	inst:AddTag("hardcorer") 
	elseif inst.hardr and not inst:HasTag("hardr") then
	inst:AddTag("hardr")
	elseif inst.normalr and not inst:HasTag("normalr") then
	inst:AddTag("normalr")
	end


local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
if weapon and (weapon:HasTag("range_weapon") or weapon:HasTag("speargun") or weapon:HasTag("bowm") or weapon:HasTag("blowdart") or weapon:HasTag("ranged") or weapon:HasTag("projectile")) then
	if inst.hardcorer or inst:HasTag("hardcorer") then
	
		if not inst.DLC2 then
 	inst.components.combat.damagemultiplier = 0.75
		elseif inst.DLC2 then
	inst.components.combat:AddDamageModifier("musha", -0.25)
			end
	elseif inst.hardr or inst:HasTag("hardr") then
		if not inst.DLC2 then
 	inst.components.combat.damagemultiplier = 1
		elseif inst.DLC2 then
	inst.components.combat:AddDamageModifier("musha", 0)
			end
	elseif inst.normalr or inst:HasTag("normalr") then
		if not inst.DLC2 then
 	inst.components.combat.damagemultiplier = 1.5
		elseif inst.DLC2 then
	inst.components.combat:AddDamageModifier("musha", 0.5)
			end
		end
	
else
	if inst:HasTag("helld") then
		if not inst.DLC2 then
 	inst.components.combat.damagemultiplier = 0.2
		elseif inst.DLC2 then
	inst.components.combat:AddDamageModifier("musha", -0.8)
		end
	elseif inst:HasTag("hardcored") then
		if not inst.DLC2 then
 	inst.components.combat.damagemultiplier = 0.35
		elseif inst.DLC2 then
	inst.components.combat:AddDamageModifier("musha", -0.65)
		end
	elseif inst:HasTag("hardd") then
		if not inst.DLC2 then
 	inst.components.combat.damagemultiplier = 0.5
		elseif inst.DLC2 then
	inst.components.combat:AddDamageModifier("musha", -0.5)
		end
	elseif inst:HasTag("normald") then
		if not inst.DLC2 then
 	inst.components.combat.damagemultiplier = 0.75
		elseif inst.DLC2 then
	inst.components.combat:AddDamageModifier("musha", -0.25)
		end
	elseif inst:HasTag("easyd") then
		if not inst.DLC2 then
 	inst.components.combat.damagemultiplier = 1
		elseif inst.DLC2 then
	inst.components.combat:AddDamageModifier("musha", 0)
		end
	elseif inst:HasTag("veasyd") then
		if not inst.DLC2 then
 	inst.components.combat.damagemultiplier = 1.5
		elseif inst.DLC2 then
	inst.components.combat:AddDamageModifier("musha", 0.5)
		end
	end
end

if not inst.sleep_visual then	
	if not inst.Valkyrieh and inst.components.hunger.current >= 160 and not inst.berserks and not inst.fberserk then
		if inst.full_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_full_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_full_k")
			end 
		inst.full_look = false
		end
	elseif not inst.Valkyrieh and inst.components.hunger.current < 160 and not inst.berserks and not inst.fberserk then
		if inst.normal_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal_k")
			end
		inst.normal_look = false		
		end 			
	end
end
	
--[[valkyrie status and DLC]]

if inst.Valkyrieh then
   inst:ListenForEvent("onhitother", OnHitcritical)
elseif not inst.Valkyrieh then
	inst:RemoveEventCallback("onhitother", OnHitcritical) 
end

if inst:HasTag("DLC") and not inst.on_sparkshield and not inst.components.health:IsDead() and not inst.music_armor then

if inst.Valkyrieh and inst.components.health:GetPercent() < .3 then

	inst.components.health:SetAbsorptionAmount(0.5)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .3 and inst.components.health:GetPercent() < .4 then

	inst.components.health:SetAbsorptionAmount(0.45)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .4 and inst.components.health:GetPercent() < .5 then

	inst.components.health:SetAbsorptionAmount(0.4)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .5 and inst.components.health:GetPercent() < .6 then

	inst.components.health:SetAbsorptionAmount(0.35)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .6 and inst.components.health:GetPercent() < .7 then

	inst.components.health:SetAbsorptionAmount(0.3)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .7 and inst.components.health:GetPercent() < .8 then

	inst.components.health:SetAbsorptionAmount(0.25)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .8 and inst.components.health:GetPercent() <= 1 then

	inst.components.health:SetAbsorptionAmount(0.2)

	elseif inst.berserkarmor and inst.crazy and not inst.Valkyrieh then

	inst.components.health:SetAbsorptionAmount(0.2)

	elseif not inst.berserkarmor and inst.crazy  then

	inst.components.health:SetAbsorptionAmount(0)

	elseif not inst.Valkyrieh and not inst.crazy  then

	inst.components.health:SetAbsorptionAmount(0)

	end


--[[valkyrie status and Orizinal]]


if not inst:HasTag("DLC") and not inst.on_sparkshield and not inst.components.health:IsDead() and not inst.music_armor then
if inst.Valkyrieh and not inst.sleepbuff then

end
if inst.Valkyrieh and inst.components.health:GetPercent() < .3 then
	inst.components.health:SetAbsorbAmount(0.5)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .3 and inst.components.health:GetPercent() < .4 then
	inst.components.health:SetAbsorbAmount(0.45)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .4 and inst.components.health:GetPercent() < .5 then
	inst.components.health:SetAbsorbAmount(0.4)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .5 and inst.components.health:GetPercent() < .6 then
	inst.components.health:SetAbsorbAmount(0.35)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .6 and inst.components.health:GetPercent() < .7 then
	inst.components.health:SetAbsorbAmount(0.3)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .7 and inst.components.health:GetPercent() < .8 then
	inst.components.health:SetAbsorbAmount(0.25)
elseif inst.Valkyrieh and inst.components.health:GetPercent() >= .8 and inst.components.health:GetPercent() <= 1 then
	inst.components.health:SetAbsorbAmount(0.2)

	elseif inst.berserkarmor and inst.crazy and not inst.Valkyrieh then

	inst.components.health:SetAbsorbAmount(0.2)

	elseif not inst.Valkyrieh and not  inst.berserkarmor and not inst.crazy then

	inst.components.health:SetAbsorbAmount(0)

	end 
end
end
		
if inst.strength == "full" then
inst.valkyrie = false
inst.berserk = false
inst.normal = true
if not inst.sleep_visual then 
		if inst.full_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_full_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_full_k")
			end	
		inst.full_look = false	
		end	
			
end			
	if inst.valkyrie_mood and inst.Valkyrieh and not inst.berserks and not inst.fberserk then

			inst.strength = "Valkyrie"
inst.valkyrie = true
inst.berserk = false
inst.normal = false
	if not inst.change_voice then inst.soundsname = "willow" end
inst.crazy = false
    --inst.components.combat:SetAttackPeriod(.15)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(2, .5)
			else
			inst.components.combat:SetAreaDamage(0, 0)
			end
    
    inst:RemoveEventCallback("onhitother", berserkattack)
    inst:RemoveEventCallback("onhitother", OnHitfreeze)
   -- inst:ListenForEvent("onhitother", OnHitcritical)

inst.components.health.fire_damage_scale = 0
inst.components.temperature.hurtrate = 0.5
	--local sparks = SpawnPrefab("sparks")
	--local pos = Vector3(inst.Transform:GetWorldPosition())
	--sparks.Transform:SetPosition(pos:Get())

if not inst.sleep_visual then		
		if inst.valkyrie_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_battle")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_battle")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_battle_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_battle_k")
			end
		inst.valkyrie_look = false			
		end
end			
		elseif inst.components.hunger.current < 160 and inst.components.hunger.current > 40 and not inst.Valkyrieh and not inst.berserks and not inst.fberserk then

			inst.strength = "normal"
inst.valkyrie = false
inst.berserk = false	
inst.normal = true
	if not inst.change_voice then inst.soundsname = "willow" end
inst.crazy = false
    --inst.components.combat:SetAttackPeriod(.5)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(2, .5)
			else
			inst.components.combat:SetAreaDamage(0, 0)
			end
    
    inst:RemoveEventCallback("onhitother", berserkattack)
    inst:RemoveEventCallback("onhitother", OnHitfreeze)

inst.components.health.fire_damage_scale = 1
inst.components.temperature.hurtrate = 0.5
	
		
if not inst.sleep_visual then	
		if inst.normal_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal_k")
			end
		inst.normal_look = false			
		end
end			
		elseif inst.berserks or inst.fberserk then
 
			inst.strength = "berserk"
inst.valkyrie = false
inst.berserk = true
inst.normal = false
	if not inst.change_voice then inst.soundsname = "wendy" end
	if not inst.crazy then
	inst.crazy = true
	end

    --inst.components.combat:SetAttackPeriod(.05)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(4, .5)
			else
			inst.components.combat:SetAreaDamage(2.5, .5)
			end
    
    inst:ListenForEvent("onhitother", berserkattack)
    inst:ListenForEvent("onhitother", OnHitfreeze)

inst.components.health.fire_damage_scale = 1
inst.components.temperature.hurtrate = 0
	inst.Valkyrieh = false 
	if not inst.Valkyriech2 then
	inst.Valkyriech2 = true
	end 
	SpawnPrefab("statue_transition").Transform:SetPosition(inst:GetPosition():Get())

			inst.components.talker:Say(STRINGS.MUSHA_TALK_GRRR)
if not inst.sleep_visual then		
		if inst.valkyrie_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_battle")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_battle")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_battle_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_battle_k")
			end
		inst.valkyrie_look = false			
		end
end
end

else
if inst.strength == "Valkyrie" then
inst.valkyrie = true
inst.berserk = false
inst.normal = false

if not inst.sleep_visual then
		if inst.valkyrie_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_battle")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_battle")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_battle_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_battle_k")
			end
		inst.valkyrie_look = false			
			end
end			
		if inst.components.hunger.current < 160 and inst.Valkyriech2 and not inst.berserks and not inst.fberserk then

			inst.strength = "normal"
inst.valkyrie = false
inst.berserk = false
inst.normal = true
	if not inst.change_voice then inst.soundsname = "willow" end
inst.crazy = false
    --inst.components.combat:SetAttackPeriod(.5)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(2, .5)
			else
			inst.components.combat:SetAreaDamage(0, 0)
			end
inst.components.combat:SetRange(2)
    
    inst:RemoveEventCallback("onhitother", berserkattack)
    inst:RemoveEventCallback("onhitother", OnHitfreeze)
inst.components.health.fire_damage_scale = 1
inst.components.temperature.hurtrate = 0.5
		inst.Valkyrieh = false

if not inst.sleep_visual then	
		if inst.normal_look then		
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal_k")
			end
		inst.normal_look = false			
			end
end			
		elseif inst.components.hunger.current > 160 and inst.Valkyriech2 and not inst.fberserk and not inst.berserks then

			inst.strength = "full"
inst.valkyrie = false
inst.berserk = false
inst.normal = true
	if not inst.change_voice then inst.soundsname = "willow" end
inst.crazy = false
    --inst.components.combat:SetAttackPeriod(.6)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(2, .5)
			else
			inst.components.combat:SetAreaDamage(0, 0)
			end
inst.components.combat:SetRange(2)
    
    inst:RemoveEventCallback("onhitother", berserkattack)
    inst:RemoveEventCallback("onhitother", OnHitfreeze)
inst.components.health.fire_damage_scale = 1
inst.components.temperature.hurtrate = 0.5
		inst.Valkyrieh = false

if not inst.sleep_visual then
		if inst.full_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_full_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_full_k")
			end
		inst.full_look = false
			
			end
end			


		elseif inst.berserks or inst.fberserk then
 		inst.lightningblue1 = false
		inst.lightningblue2 = false
			inst.strength = "berserk"
inst.valkyrie = false
inst.berserk = true
inst.normal = false
	if not inst.change_voice then inst.soundsname = "wendy" end
	if not inst.crazy then
	inst.crazy = true
	end
    --inst.components.combat:SetAttackPeriod(.05)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(4, .5)
			else
			inst.components.combat:SetAreaDamage(2.5, .5)
			end
inst.components.combat:SetRange(2)
    
    inst:ListenForEvent("onhitother", berserkattack)
    inst:ListenForEvent("onhitother", OnHitfreeze)
inst.components.health.fire_damage_scale = 1
inst.components.temperature.hurtrate = 0
	inst.Valkyrieh = false 
	if not inst.Valkyriech2 then
	inst.Valkyriech2 = true
	end 
	SpawnPrefab("statue_transition").Transform:SetPosition(inst:GetPosition():Get())

			inst.components.talker:Say(STRINGS.MUSHA_TALK_GRRR)
if not inst.sleep_visual then		
		if inst.berserk_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_hunger")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_hunger")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_hunger_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_hunger_k")
			end
		inst.berserk_look = false		
			end
		end
end
else
if inst.strength == "normal" then
inst.valkyrie = false
inst.berserk = false
inst.normal = true
if not inst.sleep_visual then
		if inst.normal_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal_k")
			end
		inst.normal_look = false				
			end
end			
	if inst.Valkyrieh and not inst.berserks and not inst.fberserk then

			inst.strength = "Valkyrie"
inst.valkyrie = true
inst.berserk = false
inst.normal = false
	if not inst.change_voice then inst.soundsname = "willow" end
inst.crazy = false
    --inst.components.combat:SetAttackPeriod(.15)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(2, .5)
			else
			inst.components.combat:SetAreaDamage(0, 0)
			end
    
    inst:RemoveEventCallback("onhitother", berserkattack)
    inst:RemoveEventCallback("onhitother", OnHitfreeze)
    --inst:ListenForEvent("onhitother", OnHitcritical)

inst.components.health.fire_damage_scale = 0
inst.components.temperature.hurtrate = 0.5
	--local sparks = SpawnPrefab("sparks")
	--local pos = Vector3(inst.Transform:GetWorldPosition())
	--sparks.Transform:SetPosition(pos:Get())

		
if not inst.sleep_visual then		
		if inst.valkyrie_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_battle")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_battle")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_battle_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_battle_k")
			end
		inst.valkyrie_look = false	
		end
end			
		elseif inst.components.hunger.current > 160 and not inst.Valkyrieh and not inst.berserks and not inst.fberserk then

			inst.strength = "full"
inst.valkyrie = false
inst.berserk = false	
inst.normal = true
	if not inst.change_voice then inst.soundsname = "willow" end
inst.crazy = false
    --inst.components.combat:SetAttackPeriod(.6)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(2, .5)
			else
			inst.components.combat:SetAreaDamage(0, 0)
			end
    
    inst:RemoveEventCallback("onhitother", berserkattack)
    inst:RemoveEventCallback("onhitother", OnHitfreeze)

inst.components.health.fire_damage_scale = 1
	
		
if not inst.sleep_visual then		
		if inst.full_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_full_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_full_k")
			end
		inst.full_look = false	
			end
end			
		elseif inst.berserks or inst.fberserk then
 
			inst.strength = "berserk"
inst.valkyrie = false
inst.berserk = true
inst.normal = false
	if not inst.change_voice then inst.soundsname = "wendy" end
	if not inst.crazy then
	inst.crazy = true
	end
    --inst.components.combat:SetAttackPeriod(.05)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(4, .5)
			else
			inst.components.combat:SetAreaDamage(2.5, .5)
			end
    
    inst:ListenForEvent("onhitother", berserkattack)
    inst:ListenForEvent("onhitother", OnHitfreeze)
	SpawnPrefab("statue_transition").Transform:SetPosition(inst:GetPosition():Get())

inst.components.health.fire_damage_scale = 1
inst.components.temperature.hurtrate = 0
	inst.Valkyrieh = false 
	if not inst.Valkyriech2 then
	inst.Valkyriech2 = true
	end 
	
			inst.components.talker:Say(STRINGS.MUSHA_TALK_GRRR)
if not inst.sleep_visual then	
		if inst.berserk_look then	
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_hunger")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_hunger")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_hunger_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_hunger_k")
			end
		inst.berserk_look = false					
			end
		end
end		
else
if inst.strength == "berserk" then
inst.valkyrie = false
inst.berserk = true
inst.normal = false
if not inst.sleep_visual then
		if inst.berserk_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_hunger")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_hunger")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_hunger_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_hunger_k")
			end
		inst.berserk_look = false		
			end
end		

--berserk
	
	if inst.components.hunger.current > 160 and not inst.berserks and not inst.fberserk then
			inst.strength = "full"
inst.valkyrie = false
inst.berserk = false
inst.normal = true
	if not inst.change_voice then inst.soundsname = "willow" end
		inst.berserks = false 
		inst.fberserk = false 
inst.crazy = false
    --inst.components.combat:SetAttackPeriod(.6)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(2, .5)
			else
			inst.components.combat:SetAreaDamage(0, 0)
			end
    
    inst:RemoveEventCallback("onhitother", berserkattack)
    inst:RemoveEventCallback("onhitother", OnHitfreeze)
	local dark2 = SpawnPrefab("statue_transition_2")
	local pos = Vector3(inst.Transform:GetWorldPosition())
	dark2.Transform:SetPosition(pos:Get())
inst.components.health.fire_damage_scale = 1
inst.components.temperature.hurtrate = 0.5
	
	inst.components.talker:Say(STRINGS.MUSHA_TALK_WAKE_BERSERK)
if not inst.sleep_visual then	
		if inst.full_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_full_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_full_k")
			end
		inst.full_look = false			
			end
end			
	elseif inst.components.hunger.current < 160 and not inst.berserks and not inst.fberserk then

			inst.strength = "normal"
inst.valkyrie = false
inst.berserk = false
inst.normal = true
	if not inst.change_voice then inst.soundsname = "willow" end
		inst.berserks = false 
		inst.fberserk = false 
inst.crazy = false
    --inst.components.combat:SetAttackPeriod(.5)
if weapon and weapon:HasTag("frost_hammer") and not weapon.boost then
			inst.components.combat:SetAreaDamage(2, .5)
			else
			inst.components.combat:SetAreaDamage(0, 0)
			end
    
    inst:RemoveEventCallback("onhitother", berserkattack)
    inst:RemoveEventCallback("onhitother", OnHitfreeze)
	local dark2 = SpawnPrefab("statue_transition_2")
	local pos = Vector3(inst.Transform:GetWorldPosition())
	dark2.Transform:SetPosition(pos:Get())
inst.components.health.fire_damage_scale = 1
inst.components.temperature.hurtrate = 0.5
	
	inst.components.talker:Say(STRINGS.MUSHA_TALK_WAKE_BERSERK)
if not inst.sleep_visual then	
		if inst.normal_look then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3) then
			inst.AnimState:SetBuild("musha_normal_sw2")
			elseif inst.set_on and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal_k")
			end
		inst.normal_look = false		
			end
	end			
end
	end
	end
	end
end
	

end

local function music_start(inst)
if not inst.SoundEmitter:PlayingSound("mushamusic") then
--local work1 = "dontstarve/music/music_work"
--local work2 = "dontstarve/music/music_work_winter"
--local work3 = "dontstarve_DLC001/music/music_work_spring"
--local work4 = "dontstarve_DLC001/music/music_work_summer"
local epicfight1 = "dontstarve/music/music_epicfight"
local epicfight2 = "dontstarve/music/music_epicfight_winter"
local epicfight3 = "dontstarve_DLC001/music/music_epicfight_spring"
local epicfight4 = "dontstarve_DLC001/music/music_epicfight_summer"
local danger1 = "dontstarve/music/music_danger"
local danger2 = "dontstarve/music/music_danger_winter"
local danger3 = "dontstarve_DLC001/music/music_danger_spring"
local danger4 = "dontstarve_DLC001/music/music_danger_summer"
local moonbase1 = "dontstarve/music/music_epicfight_moonbase"
local moonbase2 = "dontstarve/music/music_epicfight_moonbase_b"
--local toadstool = "dontstarve/music/music_epicfight_toadboss"
--local beequeen = "dontstarve/music/music_epicfight_4"
local dragonfly = "dontstarve/music/music_epicfight_3"
local shadowchess = "dontstarve/music/music_epicfight_ruins"
local klaus = "dontstarve/music/music_epicfight_5a"
local klaus2 = "dontstarve/music/music_epicfight_5b"
--local antlion = "dontstarve/music/music_epicfight_antlion"
--local stalker = "dontstarve/music/music_epicfight_stalker"
--local stalker2 = "dontstarve/music/music_epicfight_stalker_b"
local default = "dontstarve/music/music_epicfight_ruins"

local epicf1 = "dontstarve_DLC002/music/music_epicfight_season_1"
local epicf2 = "dontstarve_DLC002/music/music_epicfight_season_2"
local epicf3 = "dontstarve_DLC002/music/music_epicfight_season_3"
local epicf4 = "dontstarve_DLC002/music/music_epicfight_season_4"
local dangerf1 = "dontstarve_DLC002/music/music_danger_season_1"
local dangerf2 = "dontstarve_DLC002/music/music_danger_season_2"
local dangerf3 = "dontstarve_DLC002/music/music_danger_season_3"
local dangerf4 = "dontstarve_DLC002/music/music_danger_season_4"
local surfd = "dontstarve_DLC002/music/music_surfing_day", "surfing"
local surfn = "dontstarve_DLC002/music/music_surfing_night", "surfing"


	
if math.random() < 0.15 and inst.DLC then
inst.SoundEmitter:PlaySound("dontstarve/music/music_hoedown","mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 1")
--[[elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(stalker,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 2")
elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(stalker2,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 3")
elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(antlion,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 4")]]
elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(epicfight1,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 5")
elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(epicfight2,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 6")
elseif math.random() < 0.2 and inst.DLC then
inst.SoundEmitter:PlaySound(epicfight3,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 7")
elseif math.random() < 0.2 and inst.DLC then
inst.SoundEmitter:PlaySound(epicfight4,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 8")
elseif math.random() < 0.1 then
inst.SoundEmitter:PlaySound(danger1,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 9")
elseif math.random() < 0.1 then
inst.SoundEmitter:PlaySound(danger2,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 10")
elseif math.random() < 0.1 and inst.DLC then
inst.SoundEmitter:PlaySound(danger3,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 11")
elseif math.random() < 0.1 and inst.DLC then
inst.SoundEmitter:PlaySound(danger4,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 12")
elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(moonbase1,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 13")
elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(moonbase2,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 14")
--[[elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(toadstool,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 15")
elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(beequeen,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 16")]]
elseif math.random() < 0.2 and inst.DLC then
inst.SoundEmitter:PlaySound(dragonfly,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 17")
elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(shadowchess,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 18")
elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(klaus,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 19")
elseif math.random() < 0.2 then
inst.SoundEmitter:PlaySound(klaus2,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 20")

elseif math.random() < 0.2 and inst.DLC2 then
inst.SoundEmitter:PlaySound(epicf1,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 21")
elseif math.random() < 0.2 and inst.DLC2 then
inst.SoundEmitter:PlaySound(epicf2,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 22")
elseif math.random() < 0.2 and inst.DLC2 then
inst.SoundEmitter:PlaySound(epicf3,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 23")
elseif math.random() < 0.2 and inst.DLC2 then
inst.SoundEmitter:PlaySound(epicf4,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 24")
elseif math.random() < 0.2 and inst.DLC2 then
inst.SoundEmitter:PlaySound(dangerf1,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 25")
elseif math.random() < 0.2 and inst.DLC2 then
inst.SoundEmitter:PlaySound(dangerf2,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 26")
elseif math.random() < 0.2 and inst.DLC2 then
inst.SoundEmitter:PlaySound(dangerf3,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 27")
elseif math.random() < 0.2 and inst.DLC2 then
inst.SoundEmitter:PlaySound(dangerf4,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 28")
elseif math.random() < 0.2 and inst.DLC2 then
inst.SoundEmitter:PlaySound(surfd,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 29")
elseif math.random() < 0.2 and inst.DLC2 then
inst.SoundEmitter:PlaySound(surfn,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 30")

else
inst.SoundEmitter:PlaySound(default,"mushamusic")
inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC.." 24")
--[[
GetWorld():PushEvent("enabledynamicmusic", false)
if not inst.SoundEmitter:PlayingSound("beavermusic") then
inst.SoundEmitter:PlaySound("dontstarve/music/music_hoedown", "beavermusic")
end
]]
end

end
end

  --------------------------------------------------------------
local function musha_taste(inst)
	if inst.components.hunger.current > 50 then
	inst.zero_hungry = false
	end
	
	if inst.berserk and not inst.berserk_state then
	inst.full_state = false
	inst.normal_state = false
	inst.hungry_state = false
	inst.berserk_state = true
	inst.components.eater:SetOmnivore(true)
	inst.components.eater.strongstomach = true
	
	elseif not inst.berserk and not inst.full_state and inst.components.hunger.current > 180 then
	inst.full_state = true
	inst.normal_state = false
	inst.hungry_state = false
	inst.berserk_state = false
	inst.components.eater.strongstomach = false
		if inst.princess_taste then
		inst.components.eater:SetOmnivore()
 		inst.components.eater.foodprefs = { "SEEDS" }
		elseif not inst.princess_taste then
		if inst.normal_taste then
		inst.components.eater:SetOmnivore(true)
		elseif inst.meat_taste then
		inst.components.eater:SetCarnivore(true)
		elseif inst.veggie_taste then
		inst.components.eater:SetVegetarian(true)
		end
		end
			
	elseif not inst.berserk and not inst.normal_state and inst.components.hunger.current <= 180 and inst.components.hunger.current > 0 then
	inst.full_state = false
	inst.normal_state = true
	inst.hungry_state = false
	inst.berserk_state = false
	inst.components.eater.strongstomach = false
		if inst.normal_taste then
		inst.components.eater:SetOmnivore(true)
		elseif inst.meat_taste then
		inst.components.eater:SetCarnivore(true)
		elseif inst.veggie_taste then
		inst.components.eater:SetVegetarian(true)
		end
		
	elseif not inst.berserk and not inst.hungry_state and inst.components.hunger.current <= 0 then
	inst.full_state = false
	inst.normal_state = false
	inst.hungry_state = true
	inst.berserk_state = false
	inst.components.eater.strongstomach = false
		if not inst.zero_hungry then
			if inst.meat_taste then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_VEGE)
			end
			if inst.veggie_taste then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_FOOD_MEAT)
			end
		inst.zero_hungry = true
		end
		inst.components.eater:SetOmnivore(true)
	end	
	
end

--------------------------------------------------------------
	
local function onpreload(inst, data)
	if data then
		if data.intro_finished then
		inst.intro_finished = true
		end
		if data.yamche_leader then
		inst.yamche_leader = data.yamche_leader
		end
		if data.yamche_egg_hunted then
		inst.yamche_egg_hunted = true
		end
		if data.arong_egg_hunted then
		inst.arong_egg_hunted = true
		end
			if data.treasure then
			inst.treasure = data.treasure
			treasure_hunt(inst)
			end
			if data.count_s then
			inst.count_s = data.count_s
			count_spider(inst)
			end
			if data.count_w then
			inst.count_w = data.count_w
			count_wil(inst)
			end
			if data.music then
			inst.music = data.music
			fullcharged_music(inst)
			end
			
			if data.level then
			inst.level = data.level
			levelexp(inst)
--
			if data.health and data.health.health then inst.components.health.currenthealth = data.health.health end
			--if data.hunger and data.hunger.hunger then inst.components.hunger.current = data.hunger.hunger end
--
			if data.sanity and data.sanity.current then inst.components.sanity.current = data.sanity.current end
			inst.components.health:DoDelta(0)
			--inst.components.hunger:DoDelta(0)
			inst.components.sanity:DoDelta(0)
end
	end
		end
  
  
 local function onsave(inst, data)
 	data.intro_finished = inst.intro_finished
	data.yamche_leader = inst.yamche_leader

	data.level = inst.level
	data.music = inst.music
	data.count_s = inst.count_s
	data.count_w = inst.count_w
	data.treasure = inst.treasure
	data.yamche_egg_hunted = inst.yamche_egg_hunted
	data.arong_egg_hunted = inst.arong_egg_hunted
	end

	
	
local fn = function(inst)

	if not inst.change_voice then inst.soundsname = "willow" end
    inst.entity:AddMiniMapEntity()
	inst.entity:AddMiniMapEntity():SetPriority( 6 )
	inst.MiniMapEntity:SetIcon( "mushas.tex" )
	inst.level = 0
	
			inst.music = 0
			inst.count_s = 15
			inst.count_w = 50
			inst.treasure = 95
			
	inst.components.eater:SetOnEatFn(expeat)
	inst:ListenForEvent("hungerdelta", musha_taste)
	inst.components.eater.stale_hunger = TUNING.WICKERBOTTOM_STALE_FOOD_HUNGER
    inst.components.eater.stale_health =  TUNING.WICKERBOTTOM_STALE_FOOD_HEALTH
    inst.components.eater.spoiled_hunger = TUNING.WICKERBOTTOM_SPOILED_FOOD_HUNGER
    inst.components.eater.spoiled_health = TUNING.WICKERBOTTOM_SPOILED_FOOD_HEALTH

	
inst:ListenForEvent("levelup", levelexp)

	--inst:ListenForEvent("assasin", count_spider)
	--inst:ListenForEvent("treasure", treasure_hunt)
	
	inst.strength = "normal"
	--levelexp(inst)
	inst.components.hunger:SetMax(200)

 --inst.components.combat.damagemultiplier = TUNING.WENDY_DAMAGE_MULT
inst:AddTag("musha")
inst:AddTag("pirate")
--inst:AddTag("yamcheb")
inst.effectsheild2 = true 
inst.musha_level1 = true 
--inst.shadowb = true 
inst:AddTag("ghoundb") 

inst.shadowb = true


--end
    --inst:AddComponent("talker")
    --inst.components.talker.ontalk = ontalk
	--inst:AddComponent("sleeper")
  --  inst.components.talker.fontsize = 30
   -- inst.components.talker.font = TALKINGFONT
    --inst.components.talker.colour = Vector3(1, 0.75, 1, 1)

--   inst:AddComponent("sanityaura")
	inst:AddComponent("colourtweener")
   inst:ListenForEvent("onhitother", sneakattack)
   inst:ListenForEvent("attacked", fsneakattack)

   
-----------light on
    inst.entity:AddLight()
	inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(185/255,175/255,170/255)
	inst.Light:Enable(false)
	inst.entity:AddLightWatcher() 
        inst.procfn = function() tryproc(inst) end
        inst:ListenForEvent("attacked", inst.procfn)
		
        inst.guardianfn = function() guard(inst) end
        inst:ListenForEvent("attacked", inst.guardianfn)
		
        inst.shieldfn = function() shieldproc(inst) end
inst:ListenForEvent( "healthdelta", inst.shieldfn )
inst:ListenForEvent( "hungerdelta", inst.shieldfn )

	inst:AddComponent("playerlightningtarget")
--------------------------------------------------------------
--test bird
--[[
    inst:AddComponent("childspawner")
    inst.components.childspawner.childname = "musha_tall2"
    inst.components.childspawner:StartSpawning()
    inst.components.childspawner.maxchildren = 1
]]--

    ----------------------------------------------------------
   -- inst.userfunctions =    {updatestats = updatestats}

	--inst.components.eater.strongstomach = true

--inst:ListenForEvent("attacked", on_shard_shield)
--inst:ListenForEvent( "attacked", fshieldupgrade)
--inst:ListenForEvent("hungerdelta", removeskill)
--inst:ListenForEvent("healthdelta", removeskill)
--applystats(inst)
inst:ListenForEvent("hungerdelta", applystats)
inst:ListenForEvent("hungerdelta", shadows)
--inst:ListenForEvent("hungerdelta", active_sparkshield)

inst.powerattack = inst:DoPeriodicTask(0, powerattack)
inst.phasechange = inst:DoPeriodicTask(0, phasechange)
inst.sleep_test = inst:DoPeriodicTask(0, sleep_test)
inst.monster_test = inst:DoPeriodicTask(1, monster_test)
inst.consume_sleep1 = inst:DoPeriodicTask(1, consume_stamina)
inst.sleepheal = inst:DoPeriodicTask(6,onsleepheal)
inst.summon_drake = inst:DoPeriodicTask(6,summon_drake)
inst.summon_lighting = inst:DoPeriodicTask(15,summon_lighting)
inst.assasin_webber = inst:DoPeriodicTask(15,assasin_webber)
inst.berserk_changer = inst:DoPeriodicTask(1,berserk_changer)
inst.dizzy = inst:DoPeriodicTask(15,dizzy)
MyPrecious(inst) --treasure
--musha_egghunt_pass(inst)

inst.wakefn = function(attacked, data)
if data and data.attacker and (inst.sleep_on or inst.tiny_sleep) and not inst.components.health:IsDead() then
  inst.sleep_on = false
  inst.sleep_in = false
  inst:RemoveTag("bedroll")
  inst.tiny_sleep = false
  inst:RemoveTag("bedrolll")
  inst.music_check = false
  inst.sg:GoToState("wakeup")
  inst.music_armor = false
  inst.musha_press = false
 elseif inst.components.health:IsDead() or inst.sg:HasStateTag("hit") then   
  inst.sleep_on = false
  inst.sleep_in = false
  inst:RemoveTag("bedroll")
  inst.tiny_sleep = false
  inst:RemoveTag("bedrolll")
  inst.music_check = false
  inst.sg:RemoveStateTag("sleeping")
  inst.musha_press = false
end
 --inst:DoTaskInTime( 1, function() if not inst.sleep_in then inst.sleep_visual = false end end)
end

inst:ListenForEvent("attacked", inst.wakefn, inst)

inst.Call_lightining_defense = function(attacked, data)
 local hitcall = 0.5
if inst.LightWatcher:IsInLight() and data and math.random() < hitcall and not inst:HasTag("fa_poison") then
if data.attacker and (data.attacker.components.burnable or data.attacker.components.freezable) and data.attacker.components.health and not data.attacker:HasTag("thorny") and not data.attacker:HasTag("shadowcreature") and not data.attacker:HasTag("burn") and data.attacker.components.locomotor and inst.components.sanity.current >= 10 then
		data.attacker:AddTag("burn") 
		SpawnPrefab("sparks").Transform:SetPosition(data.attacker:GetPosition():Get())
		-- data.attacker.burn = true
end end	
end
inst:ListenForEvent( "attacked", inst.Call_lightining_defense,inst)
---------------------------------------

inst.Onframeshield_d = function(attacked, data)
 local hitcall = 0.5
if inst.on_sparkshield and not inst:HasTag("fa_poison") then
if data and data.attacker and data.attacker.components.health and data.attacker.components.burnable and not data.attacker:HasTag("thorny") and not data.attacker:HasTag("shadowcreature") and not data.attacker:HasTag("burn") then

	if inst.fshield1 and inst.frameon1 then
    data.attacker.components.health:DoDelta(-10)
            data.attacker.components.burnable:Ignite()
			data.attacker:AddTag("burn") 
	elseif inst.fshield2 and inst.frameon2 then
    data.attacker.components.health:DoDelta(-14)
            data.attacker.components.burnable:Ignite()
			data.attacker:AddTag("burn") 
	elseif inst.fshield3 and inst.frameon3 then
    data.attacker.components.health:DoDelta(-18)
            data.attacker.components.burnable:Ignite()
			data.attacker:AddTag("burn") 
	elseif inst.fshield4 and inst.frameon4 then
    data.attacker.components.health:DoDelta(-22)
            data.attacker.components.burnable:Ignite()
			data.attacker:AddTag("burn") 
end
	if data.attacker and data.attacker.components.burnable and data.attacker.components.burnable:IsBurning() then
        data.attacker.components.burnable:Extinguish()
    end 
end 
end	
end
inst:ListenForEvent( "attacked", inst.Onframeshield_d,inst)


---berserk shield
inst.Onfreeze = function(attacked, data)
 local hitcall = 0.5
if inst.strength == "berserk" and not inst:HasTag("fa_poison") then
if data and data.attacker and data.attacker.components.freezable then
data.attacker.components.freezable:AddColdness(0.3)
            data.attacker.components.freezable:SpawnShatterFX()
end 
end
end
inst:ListenForEvent( "attacked", inst.Onfreeze,inst)

----------------------------

inst.Sparkshield_heal = function(attacked, data)
 local hitcall = 0.5
if inst.on_sparkshield --[[and not inst:HasTag("fa_poison")]] then
if inst.components.health and not inst.components.health:IsDead() then
if inst.level < 430  then
inst.components.health:DoDelta(6)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.level >= 430 then
inst.components.health:DoDelta(7)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.level >= 1880 then
inst.components.health:DoDelta(8)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.level >= 7000 then
inst.components.health:DoDelta(9)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
end
end 
end	
end
inst:ListenForEvent( "attacked", inst.Sparkshield_heal,inst)

inst.on_sparkshield_d = function(attacked, data)
 local hitcall = 0.5
if inst.on_sparkshield and not inst:HasTag("fa_poison") then
if data.attacker and data.attacker.components.burnable and data.attacker.components.health and not data.attacker:HasTag("thorny") and not data.attacker:HasTag("shadowcreature") then
if inst.level < 430  then
inst.components.health:DoDelta(6)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.level >= 430 then
inst.components.health:DoDelta(7)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.level >= 1880 then
inst.components.health:DoDelta(8)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.level >= 7000 then
inst.components.health:DoDelta(9)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
end
end 
elseif inst.on_sparkshield and inst:HasTag("fa_poison") and inst.fa_poison.components then
inst.fa_poison.components.spell:OnFinish()
end	
end
inst:ListenForEvent( "attacked", inst.on_sparkshield_d,inst)
--------------

inst.on_shard_freeze = function(attacked, data)
--local attacker = data.attacker
local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
if not inst:HasTag("fa_poison") and data.attacker and not data.attacker:HasTag("thorny") and not data.attacker:HasTag("shadowcreature") and data.attacker.components.health then
if weapon and weapon:HasTag("frost_hammer") then
	if inst.f_attack and data.attacker and data.attacker.components.freezable then
	local prefab = "icespikes_fx_"..math.random(1,4)
    local fx = SpawnPrefab(prefab)
    local shards = math.random(0.75,1.25)
 	fx.Transform:SetScale(shards, shards, shards)
	fx.Transform:SetPosition(data.attacker:GetPosition():Get())
	
            data.attacker.components.freezable:AddColdness(0.4)
            data.attacker.components.freezable:SpawnShatterFX()
    end 
end	
	if data.attacker and data.attacker.components.burnable and data.attacker.components.burnable:IsBurning() then
        data.attacker.components.burnable:Extinguish()
    end
end		
end
inst:ListenForEvent("attacked", inst.on_shard_freeze, inst)

 inst:ListenForEvent("onhitother", reset_range)
inst:ListenForEvent( "onhitother", Call_lightining_attack)
inst.Call_lightining_check = inst:DoPeriodicTask(0.5,Call_lightining_check)
inst.Call_lightining_debuff = inst:DoPeriodicTask(0,Call_lightining_debuff)

  --  inst:ListenForEvent("attacked", flower_shield)
 		--[[inst:ListenForEvent( "dusktime", function() applystats(inst) end , GetWorld())
        inst:ListenForEvent( "daytime", function() applystats(inst) end , GetWorld())
        inst:ListenForEvent( "nighttime", function() applystats(inst) end , GetWorld())
         applystats(inst)]]
		 
 inst:ListenForEvent("nighttime", function(global, data)
	if GetClock():GetMoonPhase() == "full" and not inst.sleep_in and not inst.tiny_sleep and not inst.sleep_on then
		--inst.berserks = true
		--inst.changed_moon = true
		fullmoon_buff(inst)
		--inst.fullmoon = true
	elseif GetClock():GetMoonPhase() ~= "full" then
		--inst.fullmoon = false 
			end end
				, GetWorld())
				
inst:ListenForEvent("daytime", function() inst.fullmoon = false inst.berserks = false
if inst.changed_moon and not (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) then
		inst.berserks = false
		inst.fberserk = false
		if not inst.sleep_visual then
		inst.sleep_visual = true inst.changed_look =true  end 
			if not (inst.tiny_sleep or inst.sleep_on) then
			inst.sg:GoToState("knockout") 
			end
		inst.tiny_sleep = true inst.sleep_in = true
		inst.changed_moon = false	
		inst.components.health:SetInvincible(true)
		inst:DoTaskInTime(3, function() inst.components.health:SetInvincible(false)	end)
		end
		end, GetWorld())
inst:ListenForEvent("dusktime", function() inst.fullmoon = false inst.berserks = false
if inst.changed_moon and not (inst.sg:HasStateTag("rowing") or inst.sg:HasStateTag("sailing") or inst.sg:HasStateTag("sail") or inst.sg:HasStateTag("row") or inst.sg:HasStateTag("boating") or inst:HasTag("aquatic")) then
		inst.berserks = false
		inst.fberserk = false
		if not inst.sleep_visual then
		inst.sleep_visual = true inst.changed_look =true  end 
			if not (inst.tiny_sleep or inst.sleep_on) then
			inst.sg:GoToState("knockout") 
			end
		inst.tiny_sleep = true inst.sleep_in = true
		inst.changed_moon = false	
		inst.components.health:SetInvincible(true)
		inst:DoTaskInTime(3, function() inst.components.health:SetInvincible(false)	end)
		end
		end, GetWorld())
			
	inst:AddComponent("reader")
	
	inst:AddComponent("stamina_sleep")
	inst:AddComponent("fatigue_sleep")
	
    inst:AddComponent("spellpower")
	
	--inst.components.spellpower:SetMax(100)
	inst.components.spellpower:SetPercent(0.5)
	
	--inst.components.builder.science_bonus = 1
	local booktab = {str = STRINGS.TABS.BOOKS, sort=999, icon = "tab_book.tex"}
	inst.components.builder:AddRecipeTab(booktab)

	Recipe("book_birds", {Ingredient("papyrus", 2), Ingredient("bird_egg", 2)}, booktab, {SCIENCE = 0, MAGIC = 0, ANCIENT = 0})
	Recipe("book_gardening", {Ingredient("papyrus", 2), Ingredient("seeds", 1), Ingredient("poop", 1)}, booktab, {SCIENCE = 1, MAGIC = 0})
	Recipe("book_sleep", {Ingredient("papyrus", 2), Ingredient("nightmarefuel", 2)}, booktab, {SCIENCE = 0, MAGIC = 1})
	Recipe("book_brimstone", {Ingredient("papyrus", 2), Ingredient("redgem", 1)}, booktab, {SCIENCE = 2, MAGIC = 0})
	--Recipe("book_tentacles", {Ingredient("papyrus", 2), Ingredient("tentaclespots", 1)}, booktab, {SCIENCE = 3})
    if SaveGameIndex:IsModeShipwrecked() then
   		Recipe("book_meteor", {Ingredient("papyrus", 2), Ingredient("obsidian", 2)}, booktab, {SCIENCE = 2, MAGIC = 0})
    else
      	Recipe("book_tentacles", {Ingredient("papyrus", 2), Ingredient("tentaclespots", 1)}, booktab, {SCIENCE = 2, MAGIC = 0})
    end	
		Recipe("amulet", {Ingredient("goldnugget", 4), Ingredient("nightmarefuel", 2),Ingredient("redgem", 1)}, RECIPETABS.MAGIC, {SCIENCE = 2, MAGIC = 0})
		
	if SaveGameIndex:IsModeShipwrecked() then
	--inst.components.resurrectable.cantdrown = true
	inst.uncovered_treasure = false

	end
	

-------------

	inst.usedtrails = {}
    inst.availabletrails = {}
    for i = 1, MAX_TRAIL_VARIATIONS do
        table.insert(inst.availabletrails, i)
    end

    inst._blooming = false
    inst.DoTrail = DoTrail
    inst.StartBlooming = StartBlooming
    inst.StopBlooming = StopBlooming
    inst.OnEntityWake = ForestOnEntityWake
    inst.OnEntitySleep = ForestOnEntitySleep
    --StartBlooming(inst)
	
	inst.shield_aura = inst:DoPeriodicTask(3, function()
if inst.on_sparkshield then
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(inst:GetPosition():Get())
			if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0 )
			end
		--local fx_2 = SpawnPrefab("groundpoundring_fx")
			--fx_2.Transform:SetScale(0.4, 0.4, 0.4)
			--fx_2.Transform:SetPosition(inst:GetPosition():Get())
			
	local x,y,z = inst.Transform:GetWorldPosition()	
	local ents = TheSim:FindEntities(x, y, z, 10)
for k,v in pairs(ents) do	
if v:IsValid() and v.entity:IsVisible() and v.components.health and not v.components.health:IsDead() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("player") and not v:HasTag("companion") and not v:HasTag("stalkerminion") and not inst.sg:HasStateTag("structure") and v.components.combat ~= nil and (v.components.combat.target == inst or v:HasTag("monster") or v:HasTag("burn")) then
	
	if inst.level then --< 430 then

	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	SpawnPrefab("shock_fx2").Transform:SetPosition(v:GetPosition():Get())
	
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
		v.components.health:DoDelta(-15)
		--v.components.combat:GetAttacked(inst, 10)
	end
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
	
	
end
end
end
	end)
	
	inst.check_aura = inst:DoPeriodicTask(2, function()	
	 
	if inst.lightaura then
		if inst.components.temperature ~= nil then
		if  inst.components.temperature:GetCurrent() < 5 then
            inst.components.temperature:SetTemperature(inst.components.temperature:GetCurrent() + 2)
        elseif inst.components.temperature:GetCurrent() > 45 then
            inst.components.temperature:SetTemperature(inst.components.temperature:GetCurrent() - 2)
        end
		end
		StartBlooming(inst)
		
		if not inst.music_q then
		inst.SoundEmitter:KillSound("mushamusic")
		inst.music_q = true
        --GetWorld():PushEvent("enabledynamicmusic", false)
		music_start(inst)
   
		end
		
    else
		StopBlooming(inst)
		
		if inst.music_q then
		inst.music_q = false
		--GetWorld():PushEvent("enabledynamicmusic", true)
		inst.keep_check = true	
		inst.components.talker:Say(STRINGS.MUSHA_MUSIC_DYNAMIC_OFF)
		inst.SoundEmitter:KillSound("mushamusic")
			inst:DoTaskInTime( 0.5, function() if inst.keep_check then
			inst.keep_check = false end end)
		end
		end
	end)
	
	-------------
inst.time_perfomance = inst:DoPeriodicTask(1.2,function()
	if inst.charging_music and inst.music < 100 then
	
	if inst.dmusic_veasy then
inst.music = inst.music + 1.5
  elseif inst.dmusic_easy then
inst.music = inst.music + 1  
  elseif inst.dmusic_normal then
inst.music = inst.music + 0.5 
  elseif inst.dmusic_hard then
inst.music = inst.music + 0.25
  elseif inst.dmusic_hardcore then
inst.music = inst.music + 0.1
	end

		fullcharged_music(inst)
	
	end	
	end)
	
inst.health_regen_check = inst:DoPeriodicTask(0.5, function()
if not inst.on_sparkshield and not inst.sleepbuff and not inst.components.health:IsDead() then

inst.shr = false
inst.sshr = false

if inst.normal and not inst.valkyrie and not inst.berserk then
if not inst.nhr then
inst.regen_switch = false
end
inst.nhr = true
inst.bhr = false
inst.vhr = false
if not inst.regen_switch then
	inst.regen_switch = true
	inst.components.health:StartRegen(0, 0)
end	

elseif inst.valkyrie and not inst.normal and not inst.berserk then
if not inst.vhr then
inst.regen_switch = false
end
inst.vhr = true
inst.bhr = false
inst.nhr = false
if not inst.regen_switch then
inst.regen_switch = true
inst.components.health:StartRegen(1, 6)
end

elseif inst.berserk and not inst.normal and not inst.valkyrie then
if not inst.bhr then
inst.regen_switch = false
end
inst.bhr = true
inst.vhr = false
inst.nhr = false
if not inst.regen_switch then
inst.regen_switch = true
	inst.components.health:StartRegen(1, 1.5)
end
end

elseif not inst.on_sparkshield and inst.sleepbuff and not inst.components.health:IsDead() then
if not inst.shr then
inst.regen_switch = false
end
inst.shr = true
inst.sshr = false
inst.nhr = false
inst.bhr = false
inst.vhr = false
	if not inst.regen_switch then
	inst.regen_switch = true
		if inst.sleep_on then
		inst.components.health:StartRegen(1, 6)
		elseif inst.tiny_sleep then
		inst.components.health:StartRegen(1, 15)
		end
	end	


elseif inst.on_sparkshield and not inst.sleepbuff and not inst.components.health:IsDead() then
if not inst.sshr then
inst.regen_switch = false
end
inst.sshr = true
inst.shr = false
inst.nhr = false
inst.bhr = false
inst.vhr = false

	if not inst.regen_switch then
	inst.regen_switch = true
	if inst.hpregen1 then
	inst.components.health:StartRegen(1, 0.5)
	elseif inst.hpregen2 then
	inst.components.health:StartRegen(1, 0.25)
	elseif inst.hpregen3 then
	inst.components.health:StartRegen(2, 0.25)
	elseif inst.hpregen4 then
	inst.components.health:StartRegen(3, 0.25)
	end
	end
end
end)

--check yamche
inst:DoTaskInTime(2, function()
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 20, {"phoenix"})
for k,v in pairs(ents) do
if --[[not v.im_ready and]] not v.campfire then
if v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("phoenix") == 0 and not v.hat then
if v.components.sleeper:IsAsleep() then
v.components.sleeper:WakeUp()
end
	if not v.campfire then	
	--v.yamche = true
	end
inst.components.leader:AddFollower(v)
v.components.follower:SetLeader(inst)
	--[[if not v.components.staycommand then
	v:AddComponent("staycommand") 
	end
	v.components.staycommand:SetStaying(false)]]
	v.stay = false
	v.peace = false
	v.active_hunt = false
	v.defense = false
	
	if v.components.container then 
	v.components.container.canbeopened = true
	end
	if inst.components.leader:CountFollowers("phoenix") == 1 then
	v.yamche_leader = true v.yamche_leader_tag = true
	end
end
end
end
end)

local x,y,z = inst.Transform:GetWorldPosition()
local bodyguard = TheSim:FindEntities(x,y,z, 20, {"bodyguard_w"})
	for k,v in pairs(bodyguard) do
	if v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("bodyguard") < 1 then
	inst.components.leader:AddFollower(v)
	end end

local x,y,z = inst.Transform:GetWorldPosition()
local shadow = TheSim:FindEntities(x,y,z, 20, {"shadowminion"})
	for k,v in pairs(shadow) do
	if v.components.follower then
	inst.components.leader:IsFollower(v) 
		v.AnimState:SetBuild("musha_h")
		v:AddComponent("colourtweener")
		v.components.colourtweener:StartTween({1,1,1,.7}, 0)
		v.Transform:SetScale(0.9, 0.9, 0.9)
	end	end

inst.sneeze_time = 30
inst:DoPeriodicTask(1, function() rainy_debuff(inst, 1) end)

	--inst.OnLoad = OnLoad
	levelexp(inst)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
	
    --inst:ListenForEvent("entity_death", function(wrld, data) onkilll(inst, data) end, GetWorld())
	inst:ListenForEvent("killed", onkilll)
inst:ListenForEvent("death", ondeath)


-- Division StateGraph
	

if SaveGameIndex:IsModePorkland() or SaveGameIndex:GetCurrentMode() == "porkland" then	
		inst.DLC3 = true
		inst.DLC2 = true
		inst:AddTag("DLC2")
		inst.DLC = true
		inst:AddTag("DLC")
		inst:SetStateGraph("SGmusha_dlc3")
		inst:AddComponent("driver")
		inst.components.driver.landstategraph = "SGmusha_dlc3"
		inst.components.driver.boatingstategraph = "SGmushaboating_dlc3"
		inst:DoTaskInTime( 1, function()
		inst.components.talker:Say(STRINGS.MUSHA_TALK_CHECK_DLC.."\n:DLC3")
		end)
		
		
elseif SaveGameIndex:IsModeShipwrecked() or (SaveGameIndex:GetCurrentMode() == "shipwrecked" or SaveGameIndex:GetCurrentMode() == "volcano") then
	if not inst.components.shopper then
		inst.DLC2 = true
		inst:AddTag("DLC2")
		inst.DLC = true
		inst:AddTag("DLC")
		inst:SetStateGraph("SGmusha_dlc2")
		inst:AddComponent("driver")
		inst.components.driver.landstategraph = "SGmusha_dlc2"
		inst.components.driver.boatingstategraph = "SGmushaboating_dlc2"
		inst:DoTaskInTime( 1, function()
		inst.components.talker:Say(STRINGS.MUSHA_TALK_CHECK_DLC.."\n:DLC2")
		end)
		
	elseif inst.components.shopper then
		inst.DLC3 = true
		inst.DLC2 = true
		inst:AddTag("DLC2")
		inst.DLC = true
		inst:AddTag("DLC")
		inst:SetStateGraph("SGmusha_dlc3")
		inst:AddComponent("driver")
		inst.components.driver.landstategraph = "SGmusha_dlc3"
		inst.components.driver.boatingstategraph = "SGmushaboating_dlc3"
		inst:DoTaskInTime( 1, function()
		inst.components.talker:Say(STRINGS.MUSHA_TALK_CHECK_DLC.."\n:DLC3")
		end)
	end
elseif (SaveGameIndex:GetCurrentMode() == "survival" or SaveGameIndex:GetCurrentMode() == "cave") then
	
	if inst.components.moisture and not inst.components.poisonable and not inst.components.shopper then
		inst:SetStateGraph("SGmusha")
		inst.DLC = true
		inst:AddTag("DLC")
		inst:DoTaskInTime( 1, function()
		inst.components.talker:Say(STRINGS.MUSHA_TALK_CHECK_DLC.."\n:DLC1")
		end)
	elseif inst.components.poisonable and not inst.components.shopper then
		inst.DLC2 = true
		inst:AddTag("DLC2")
		inst.DLC = true
		inst:AddTag("DLC")
		inst:SetStateGraph("SGmusha_dlc2")
		inst:AddComponent("driver")
		inst.components.driver.landstategraph = "SGmusha_dlc2"
		inst.components.driver.boatingstategraph = "SGmushaboating_dlc2"
		inst:DoTaskInTime( 1, function()
		inst.components.talker:Say(STRINGS.MUSHA_TALK_CHECK_DLC.."\n:DLC2")
		end)
	elseif inst.components.shopper then
		inst.DLC3 = true
		inst.DLC2 = true
		inst:AddTag("DLC2")
		inst.DLC = true
		inst:AddTag("DLC")
		inst:SetStateGraph("SGmusha_dlc3")
		inst:AddComponent("driver")
		inst.components.driver.landstategraph = "SGmusha_dlc3"
		inst.components.driver.boatingstategraph = "SGmushaboating_dlc3"
		inst:DoTaskInTime( 1, function()
		inst.components.talker:Say(STRINGS.MUSHA_TALK_CHECK_DLC.."\n:DLC3")
		end)
	end

	if not inst.components.moisture then
		inst:SetStateGraph("SGmusha_nodlc")
		inst:DoTaskInTime( 1, function()
		inst.components.talker:Say(STRINGS.MUSHA_TALK_CHECK_DLC.."\n:Nothing")
		end)
	end 	
end

		return inst

end

--------------------------------------------------------------
--[[
STRINGS.CHARACTER_TITLES.musha = "Puppy Princess Musha"
STRINGS.CHARACTER_NAMES.musha = "musha"
STRINGS.CHARACTER_DESCRIPTIONS.musha = "Level(L) Skill(K) Visual(P) Sleep(T) Shield(C) Valkyrie(V) Strike(R) Music(U) Shadow(G) Yamche(X) Battle(Z) Gather(B) Dall(N) Arong(Y)"
STRINGS.CHARACTER_QUOTES.musha = "\"Crown is Mine ! \""
STRINGS.CHARACTERS.musha = {}
STRINGS.CHARACTERS.musha.DESCRIBE = {}
]]

return MakePlayerCharacter("musha",  nil, assets, fn)--, start_inv)
