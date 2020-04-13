
local Difficult = GetModConfigData("difficultover")

-- difficult enemies

function giants_1x(inst)
  inst:AddTag("giant1x")
end
function deerclops_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.DEERCLOPS_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.75)
  inst:AddTag("giant2x")
end
function bearger_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.BEARGER_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.75)
  inst:AddTag("giant2x")
end
function dragonfly_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.DRAGONFLY_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.25)
  inst:AddTag("giant2x")
end
function moose_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.MOOSE_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.75)
  inst:AddTag("giant2x")
end
function mossling_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.MOSSLING_HEALTH*2.5)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*1.5)
  inst:AddTag("small_giant2x")
end
function deerclops_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.DEERCLOPS_HEALTH*4.5)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(2.6)
  inst:AddTag("giant3x")
end
function bearger_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.BEARGER_HEALTH*4.5)
    inst.components.combat:SetDefaultDamage(TUNING.BEARGER_DAMAGE*2.5)
    inst.components.combat:SetRange(TUNING.BEARGER_ATTACK_RANGE, TUNING.BEARGER_MELEE_RANGE)
    inst.components.combat:SetAttackPeriod(2.6)
  inst:AddTag("giant3x")
end
function dragonfly_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.DRAGONFLY_HEALTH*4.5)
    inst.components.combat:SetDefaultDamage(TUNING.DRAGONFLY_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(2.1)
  inst:AddTag("giant3x")
end
function moose_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.MOOSE_HEALTH*4.5)
    inst.components.combat:SetDefaultDamage(TUNING.MOOSE_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(2.6)
   inst:AddTag("giant3x")
end
function mossling_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.MOSSLING_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.MOSSLING_DAMAGE*2.5)
   inst:AddTag("small_giant3x")
end
function deerclops_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.DEERCLOPS_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*3)
 --   inst.components.combat:SetAreaDamage(TUNING.DEERCLOPS_AOE_RANGE, TUNING.DEERCLOPS_AOE_SCALE)
    inst.components.combat:SetAttackPeriod(2.3)
   inst:AddTag("giant4x")
end
function bearger_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.BEARGER_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.BEARGER_DAMAGE*3)
    inst.components.combat:SetRange(TUNING.BEARGER_ATTACK_RANGE, TUNING.BEARGER_MELEE_RANGE)
 --   inst.components.combat:SetAreaDamage(6, 0.8)
    inst.components.combat:SetAttackPeriod(2.3)
   inst:AddTag("giant4x")
end
function dragonfly_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.DRAGONFLY_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.DRAGONFLY_DAMAGE*3)
   -- inst.components.combat:SetAreaDamage(6, 0.8)
    inst.components.combat:SetAttackPeriod(1.8)
   inst:AddTag("giant4x")
end
function moose_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.MOOSE_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.MOOSE_DAMAGE*3)
    inst.components.combat:SetAttackPeriod(2.3)
    inst:AddTag("giant4x")
end
function mossling_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.MOSSLING_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.MOSSLING_DAMAGE*3)
    inst:AddTag("small_giant4x")
end

------------
function nspider_1x(inst)
    inst:AddTag("spider1x")
	inst:AddTag("spider_c")
end
function nspider_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HEALTH*2)
    inst:AddTag("spider2x")
	inst:AddTag("spider_c")
end
function wspider_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*2)
    inst:AddTag("spider2x")
	inst:AddTag("spider_c")
end
function qspider_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDERQUEEN_HEALTH*2)
    inst:AddTag("small_giant2x")
	inst:AddTag("spider_c")
end
function chspider_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HIDER_HEALTH*2)
    inst:AddTag("spider2x")
	inst:AddTag("spider_c")
end
function csspider_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_SPITTER_HEALTH*2)
    inst:AddTag("spider2x")
	inst:AddTag("spider_c")
end
function cdspider_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*2)
     inst:AddTag("spider2x")
	 inst:AddTag("spider_c")
end
function nspider_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(2.75)
     inst:AddTag("spider3x")
	 inst:AddTag("spider_c")
end
function wspider_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_WARRIOR_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(3.75 + math.random()*2)
     inst:AddTag("spider3x")
	 inst:AddTag("spider_c")
end
function qspider_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDERQUEEN_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDERQUEEN_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(2.75)
     inst:AddTag("small_giant3x")
	 inst:AddTag("spider_c")
end
function chspider_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HIDER_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_HIDER_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(2.75)
     inst:AddTag("spider3x")
	 inst:AddTag("spider_c")
end
function csspider_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_SPITTER_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_SPITTER_DAMAGE_MELEE*1.5)
    inst.components.combat:SetAttackPeriod(3.75 + math.random()*2)
     inst:AddTag("spider3x")
	 inst:AddTag("spider_c")
end
function cdspider_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_WARRIOR_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(2.5 + math.random()*2)
     inst:AddTag("spider3x")
	 inst:AddTag("spider_c")
end
function nspider_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HEALTH*4.5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.5)
     inst:AddTag("spider4x")
	 inst:AddTag("spider_c")
end
function wspider_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*4.5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_WARRIOR_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(3 + math.random()*2)
     inst:AddTag("spider4x")
	 inst:AddTag("spider_c")
end
function qspider_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDERQUEEN_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDERQUEEN_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(2.25)
     inst:AddTag("small_giant4x")
	 inst:AddTag("spider_c")
end
function chspider_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HIDER_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_HIDER_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.25)
     inst:AddTag("spider4x")
	 inst:AddTag("spider_c")
end
function csspider_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_SPITTER_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_SPITTER_DAMAGE_MELEE*3)
    inst.components.combat:SetAttackPeriod(2.5 + math.random()*2)
        inst:AddTag("spider4x")
		inst:AddTag("spider_c")
end
function cdspider_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_WARRIOR_DAMAGE*3)
    inst.components.combat:SetAttackPeriod(1.5 + math.random()*2)
        inst:AddTag("spider4x")
		inst:AddTag("spider_c")
end
------
function hound_1x(inst)
        inst:AddTag("hound1x")
end
function nhound_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.HOUND_HEALTH*2)
        inst:AddTag("hound2x")
end
function fhound_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.FIREHOUND_HEALTH*2)
        inst:AddTag("hound2x")
end
function ihound_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.ICEHOUND_HEALTH*2)
        inst:AddTag("hound2x")
end
function warg_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.WARG_HEALTH*2)
        inst:AddTag("small_giant2x")
end

function nhound_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.HOUND_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.HOUND_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(1.75)
        inst:AddTag("hound3x")
end
function fhound_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.FIREHOUND_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.FIREHOUND_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(1.75)
        inst:AddTag("hound3x")
end
function ihound_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.ICEHOUND_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.ICEHOUND_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(1.75)
        inst:AddTag("hound3x")
end
function warg_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.WARG_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.WARG_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(2.75)
        inst:AddTag("small_giant3x")
end

function nhound_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.HOUND_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.HOUND_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(1.5)
        inst:AddTag("hound4x")
end
function fhound_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.FIREHOUND_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.FIREHOUND_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(1.5)
        inst:AddTag("hound4x")
end
function ihound_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.ICEHOUND_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.ICEHOUND_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(1.5)
        inst:AddTag("hound4x")
end
function warg_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.WARG_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.WARG_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(2.5)
        inst:AddTag("small_giant4x")
end
function tentacle_1x(inst)
        inst:AddTag("spider1x")
end
function tentacle_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.TENTACLE_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.TENTACLE_DAMAGE*1.5)
        inst:AddTag("spider2x")
end
function tentacle_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.TENTACLE_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.TENTACLE_DAMAGE*2)
        inst:AddTag("spider3x")
end
function tentacle_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.TENTACLE_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.TENTACLE_DAMAGE*2.5)
        inst:AddTag("spider4x")
end
function rook_1x(inst)
        inst:AddTag("spider1x")
end
function rook_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.ROOK_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.ROOK_DAMAGE*1.5)
        inst:AddTag("spider2x")
end
function rook_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.ROOK_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.ROOK_DAMAGE*2)
        inst:AddTag("spider3x")
end
function rook_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.ROOK_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.ROOK_DAMAGE*3)
        inst:AddTag("spider4x")
end
function minotaur_1x(inst)
        inst:AddTag("spider1x")
end
function minotaur_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.MINOTAUR_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.MINOTAUR_DAMAGE*1.5)
        inst:AddTag("spider2x")
end
function minotaur_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.MINOTAUR_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.MINOTAUR_DAMAGE*2)
        inst:AddTag("spider3x")
end
function minotaur_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.MINOTAUR_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.MINOTAUR_DAMAGE*2.5)
        inst:AddTag("spider4x")
end
function bishop_1x(inst)
        inst:AddTag("spider1x")
end
function bishop_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.BISHOP_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.BISHOP_DAMAGE*1.2)
        inst:AddTag("spider2x")
end
function bishop_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.BISHOP_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.BISHOP_DAMAGE*1.6)
        inst:AddTag("spider3x")
end
function bishop_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.BISHOP_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.BISHOP_DAMAGE*2)
        inst:AddTag("spider4x")
end
function tallbird_1x(inst)
        inst:AddTag("spider1x")
end
function tallbird_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.TALLBIRD_HEALTH*2)
        inst:AddTag("spider2x")
end
function tallbird_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.TALLBIRD_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.TALLBIRD_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(1.75)
        inst:AddTag("spider3x")
end
function tallbird_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.TALLBIRD_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.TALLBIRD_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(1.5)
        inst:AddTag("spider4x")
end
function leif_1x(inst)
        inst:AddTag("small_giant1x")
    inst.components.health:SetMaxHealth(TUNING.LEIF_HEALTH)
end
function leif_2x(inst)
        inst:AddTag("small_giant2x")
    inst.components.health:SetMaxHealth(TUNING.LEIF_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.LEIF_DAMAGE*1.25)
end
function leif_3x(inst)
        inst:AddTag("small_giant3x")
    inst.components.health:SetMaxHealth(TUNING.LEIF_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.LEIF_DAMAGE*1.75)
end
function leif_4x(inst)
        inst:AddTag("small_giant4x")
    inst.components.health:SetMaxHealth(TUNING.LEIF_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.LEIF_DAMAGE*2.25)
end
function birchnutdrake_1x(inst)
        inst:AddTag("spider1x")
    inst.components.health:SetMaxHealth(50)
end
function birchnutdrake_2x(inst)
        inst:AddTag("spider2x")
    inst.components.health:SetMaxHealth(100)
end
function birchnutdrake_3x(inst)
        inst:AddTag("spider3x")
    inst.components.health:SetMaxHealth(150)
    inst.components.combat:SetDefaultDamage(10)
end
function birchnutdrake_4x(inst)
        inst:AddTag("spider4x")
    inst.components.health:SetMaxHealth(200)
    inst.components.combat:SetDefaultDamage(15)
end
function merm_1x(inst)
        inst:AddTag("spider1x")
    inst.components.health:SetMaxHealth(TUNING.MERM_HEALTH)
end
function merm_2x(inst)
        inst:AddTag("spider2x")
    inst.components.health:SetMaxHealth(TUNING.MERM_HEALTH*2)
end
function merm_3x(inst)
        inst:AddTag("spider3x")
    inst.components.health:SetMaxHealth(TUNING.MERM_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.MERM_DAMAGE*1.5)
end
function merm_4x(inst)
        inst:AddTag("spider4x")
    inst.components.health:SetMaxHealth(TUNING.MERM_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.MERM_DAMAGE*2)
end
function bat_1x(inst)
        inst:AddTag("spider1x")
    inst.components.health:SetMaxHealth(TUNING.BAT_HEALTH)
end
function bat_2x(inst)
        inst:AddTag("spider2x")
    inst.components.health:SetMaxHealth(TUNING.BAT_HEALTH*2)
end
function bat_3x(inst)
        inst:AddTag("spider3x")
    inst.components.health:SetMaxHealth(TUNING.BAT_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.BAT_DAMAGE*1.5)
end
function bat_4x(inst)
        inst:AddTag("spider4x")
    inst.components.health:SetMaxHealth(TUNING.BAT_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.BAT_DAMAGE*2)
end
function monkey_1x(inst)
        inst:AddTag("spider1x")
    inst.components.health:SetMaxHealth(TUNING.MONKEY_HEALTH)
end
function monkey_2x(inst)
        inst:AddTag("spider2x")
    inst.components.health:SetMaxHealth(TUNING.MONKEY_HEALTH*2)
end
function monkey_3x(inst)
        inst:AddTag("spider3x")
    inst.components.health:SetMaxHealth(TUNING.MONKEY_HEALTH*3)
end
function monkey_4x(inst)
        inst:AddTag("spider4x")
    inst.components.health:SetMaxHealth(TUNING.MONKEY_HEALTH*4)
end
function walrus_1x(inst)
        inst:AddTag("spider1x")
    inst.components.health:SetMaxHealth(TUNING.WALRUS_HEALTH)
end
function walrus_2x(inst)
        inst:AddTag("spider2x")
    inst.components.health:SetMaxHealth(TUNING.WALRUS_HEALTH*3)
	inst.components.combat:SetDefaultDamage(TUNING.WALRUS_DAMAGE*1.1)
end
function walrus_3x(inst)
        inst:AddTag("spider3x")
    inst.components.health:SetMaxHealth(TUNING.WALRUS_HEALTH*4)
	inst.components.combat:SetDefaultDamage(TUNING.WALRUS_DAMAGE*1.4)
    inst.components.locomotor.runspeed = 6
    inst.components.locomotor.walkspeed = 2
end
function walrus_4x(inst)
        inst:AddTag("spider4x")
    inst.components.health:SetMaxHealth(TUNING.WALRUS_HEALTH*6)
	inst.components.combat:SetDefaultDamage(TUNING.WALRUS_DAMAGE*1.8)
    inst.components.locomotor.runspeed = 8
    inst.components.locomotor.walkspeed = 2
end
function eyeplant_1x(inst)
    inst:AddTag("spider1x")
end
function eyeplant_2x(inst)
        inst:AddTag("spider2x")
    inst.components.health:SetMaxHealth(TUNING.EYEPLANT_HEALTH*2)
end
function eyeplant_3x(inst)
        inst:AddTag("spider3x")
    inst.components.health:SetMaxHealth(TUNING.EYEPLANT_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.EYEPLANT_DAMAGE*1.5)
end
function eyeplant_4x(inst)
        inst:AddTag("spider4x")
    inst.components.health:SetMaxHealth(TUNING.EYEPLANT_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.EYEPLANT_DAMAGE*2)
end

function snake_1x(inst)
	inst:AddTag("spider1x")
end
function snake_2x(inst)
        inst:AddTag("spider1x")
    inst.components.health:SetMaxHealth(TUNING.SNAKE_HEALTH*2)
end
function snake_3x(inst)
        inst:AddTag("spider1x")
    inst.components.health:SetMaxHealth(TUNING.SNAKE_HEALTH*3.5)
    inst.components.combat:SetDefaultDamage(TUNING.SNAKE_DAMAGE*1.5)
	inst.components.combat:SetAttackPeriod(2)  --3
end
function snake_4x(inst)
        inst:AddTag("spider2x")
    inst.components.health:SetMaxHealth(TUNING.SNAKE_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.SNAKE_DAMAGE*2.25)
	inst.components.combat:SetAttackPeriod(1.5)
end


function whale_blue_1x(inst)
		inst:AddTag("small_giant1x")
end
function whale_blue_2x(inst)
        inst:AddTag("small_giant2x")
 	inst.components.health:SetMaxHealth(TUNING.WHALE_BLUE_HEALTH*3)
	--inst.Transform:SetScale(1.5,1.5,1.5)
end
function whale_blue_3x(inst)
        inst:AddTag("small_giant3x")
 inst.components.health:SetMaxHealth(TUNING.WHALE_BLUE_HEALTH*5)
		inst.components.combat:SetDefaultDamage(TUNING.WHALE_BLUE_DAMAGE*1.5)
	--inst.Transform:SetScale(1.8,1.8,1.8)
end
function whale_blue_4x(inst)
        inst:AddTag("small_giant4x")
 inst.components.health:SetMaxHealth(TUNING.WHALE_BLUE_HEALTH*7)
		inst.components.combat:SetDefaultDamage(TUNING.WHALE_BLUE_DAMAGE*2)
	--inst.Transform:SetScale(2.1,2.1,2.1)
end
function whale_white_1x(inst)
	inst:AddTag("small_giant1x")
end
function whale_white_2x(inst)
        inst:AddTag("small_giant2x")
 	inst.components.health:SetMaxHealth(TUNING.WHALE_WHITE_HEALTH*3)
	--inst.Transform:SetScale(1.5,1.5,1.5)
end
function whale_white_3x(inst)
        inst:AddTag("small_giant3x")
 inst.components.health:SetMaxHealth(TUNING.WHALE_WHITE_HEALTH*5)
		inst.components.combat:SetDefaultDamage(TUNING.WHALE_WHITE_DAMAGE*1.5)
	--inst.Transform:SetScale(1.8,1.8,1.8)
end
function whale_white_4x(inst)
        inst:AddTag("small_giant4x")
 inst.components.health:SetMaxHealth(TUNING.WHALE_WHITE_HEALTH*7)
		inst.components.combat:SetDefaultDamage(TUNING.WHALE_WHITE_DAMAGE*2)
	--inst.Transform:SetScale(2.1,2.1,2.1)
end

--tigershark

function tigershark_1x(inst)
	inst:AddTag("small_giant1x")
end
function tigershark_2x(inst)
	inst:AddTag("small_giant2x")
     inst.components.health:SetMaxHealth(TUNING.TIGERSHARK_HEALTH*3) 
	    inst.components.combat:SetDefaultDamage(TUNING.TIGERSHARK_DAMAGE*1.25)
		inst.components.combat:SetAttackPeriod(2.8)
end
function tigershark_3x(inst)
	inst:AddTag("small_giant3x")
     inst.components.health:SetMaxHealth(TUNING.TIGERSHARK_HEALTH*5) 
	    inst.components.combat:SetDefaultDamage(TUNING.TIGERSHARK_DAMAGE*1.5)
		inst.components.combat:SetAttackPeriod(2.6)
end
function tigershark_4x(inst)
	inst:AddTag("small_giant4x")
     inst.components.health:SetMaxHealth(TUNING.TIGERSHARK_HEALTH*8) 
	    inst.components.combat:SetDefaultDamage(TUNING.TIGERSHARK_DAMAGE*2)
		inst.components.combat:SetAttackPeriod(2.4)
end
--Pigman

function pigman_1x(inst)
	inst:AddTag("pig1x")
end
function pigman_2x(inst)
	inst:AddTag("pig2x")
 end
function pigman_3x(inst)
	inst:AddTag("pig3x")
 end
function pigman_4x(inst)
	inst:AddTag("pig4x")
 end

--dragoon

function dragoon_1x(inst)
	inst:AddTag("spider1x")
end
function dragoon_2x(inst)
	inst:AddTag("spider2x")
	inst.components.health:SetMaxHealth(TUNING.DRAGOON_HEALTH*3)
	inst.components.combat:SetDefaultDamage(TUNING.DRAGOON_DAMAGE*1.2)
end
function dragoon_3x(inst)
	inst:AddTag("spider3x")
	inst.components.health:SetMaxHealth(TUNING.DRAGOON_HEALTH*5)
	inst.components.combat:SetDefaultDamage(TUNING.DRAGOON_DAMAGE*1.5)
end
function dragoon_4x(inst)
	inst:AddTag("spider4x")
	inst.components.health:SetMaxHealth(TUNING.DRAGOON_HEALTH*7)
	inst.components.combat:SetDefaultDamage(TUNING.DRAGOON_DAMAGE*2)
end

--treeguard
function treeguard_1x(inst)
        inst:AddTag("small_giant1x")
end
function treeguard_2x(inst)
        inst:AddTag("small_giant2x")
	inst.components.combat:SetDefaultDamage(TUNING.PALMTREEGUARD_DAMAGE*1.3)
     inst.components.health:SetMaxHealth(TUNING.PALMTREEGUARD_HEALTH*2.5)
end
function treeguard_3x(inst)
        inst:AddTag("small_giant3x")
	inst.components.combat:SetDefaultDamage(TUNING.PALMTREEGUARD_DAMAGE*1.6)
     inst.components.health:SetMaxHealth(TUNING.PALMTREEGUARD_HEALTH*5)
end
function treeguard_4x(inst)
        inst:AddTag("small_giant4x")
	inst.components.combat:SetDefaultDamage(TUNING.PALMTREEGUARD_DAMAGE*2)
    inst.components.health:SetMaxHealth(TUNING.PALMTREEGUARD_HEALTH*8)
end

--knightboat
function knightboat_1x(inst)
        inst:AddTag("spider1x")
end
function knightboat_2x(inst)
        inst:AddTag("spider2x")
	inst.components.locomotor.walkspeed = 5
    inst.components.locomotor.runspeed = 9
	inst.components.health:SetMaxHealth(1500)	
	inst.components.combat:SetAttackPeriod(5)
end
function knightboat_3x(inst)
        inst:AddTag("spider3x")
	inst.components.locomotor.walkspeed = 6
    inst.components.locomotor.runspeed = 11
	inst.components.health:SetMaxHealth(3000)	
	inst.components.combat:SetAttackPeriod(3)
end
function knightboat_4x(inst)
        inst:AddTag("spider4x")
	inst.components.locomotor.walkspeed = 7
    inst.components.locomotor.runspeed = 13
	inst.components.health:SetMaxHealth(4500)	
	inst.components.combat:SetAttackPeriod(1)
end

function twister_seal_1x(inst)
inst:AddTag("small_giant1x")
end
function twister_seal_2x(inst)
inst:AddTag("small_giant2x")
inst.components.health:SetMaxHealth(TUNING.TWISTER_SEAL_HEALTH*2.2)
end
function twister_seal_3x(inst)
inst:AddTag("small_giant3x")
inst.components.health:SetMaxHealth(TUNING.TWISTER_SEAL_HEALTH*3.3)
end
function twister_seal_4x(inst)
inst:AddTag("small_giant4x")
inst.components.health:SetMaxHealth(TUNING.TWISTER_SEAL_HEALTH*4.4)
end

function kraken_1x(inst)
inst:AddTag("small_giant1x")
end

function kraken_2x(inst)
inst:AddTag("giant1x")
inst.components.health:SetMaxHealth(3000)
end

function kraken_3x(inst)
inst:AddTag("giant2x")
inst.components.health:SetMaxHealth(6000)
end

function kraken_4x(inst)
inst:AddTag("giant3x")
inst.components.health:SetMaxHealth(9000)
end

if Difficult == "monster1x" then

AddPrefabPostInit("deerclops", giants_1x)
AddPrefabPostInit("bearger", giants_1x)
AddPrefabPostInit("dragonfly", giants_1x)
AddPrefabPostInit("moose", giants_1x)
AddPrefabPostInit("spider", nspider_1x)
AddPrefabPostInit("spider_warrior", spider_1x)
AddPrefabPostInit("spiderqueen", spider_1x)
AddPrefabPostInit("spider_hider", spider_1x)
AddPrefabPostInit("spider_spitter", spider_1x)
AddPrefabPostInit("spider_dropper", spider_1x)
AddPrefabPostInit("hound", hound_1x)
AddPrefabPostInit("firehound", hound_1x)
AddPrefabPostInit("icehound", hound_1x)
AddPrefabPostInit("warg", hound_1x)
AddPrefabPostInit("tentacle", tentacle_1x)
AddPrefabPostInit("rook", rook_1x)
AddPrefabPostInit("rook_nightmare", rook_1x)
AddPrefabPostInit("minotaur", minotaur_1x)
AddPrefabPostInit("bishop", bishop_1x)
AddPrefabPostInit("bishop_nightmare", bishop_1x)
AddPrefabPostInit("tallbird", tallbird_1x)
AddPrefabPostInit("leif", leif_1x)
AddPrefabPostInit("leif_sparse", leif_1x)
AddPrefabPostInit("merm", merm_1x)
AddPrefabPostInit("birchnutdrake", birchnutdrake_1x)
AddPrefabPostInit("bat", bat_1x)
AddPrefabPostInit("walrus", walrus_1x)
AddPrefabPostInit("monkey", monkey_1x)
AddPrefabPostInit("eyeplant", eyeplant_1x)
AddPrefabPostInit("snake", snake_1x)
AddPrefabPostInit("snake_poison", snake_1x)
AddPrefabPostInit("snake_fire", snake_1x)
AddPrefabPostInit("whale_blue", whale_blue_1x)
AddPrefabPostInit("whale_white", whale_white_1x)
AddPrefabPostInit("dragoon", dragoon_1x)
AddPrefabPostInit("knightboat", knightboat_1x)
AddPrefabPostInit("treeguard", treeguard_1x)
AddPrefabPostInit("tigershark", tigershark_1x)
AddPrefabPostInit("twister_seal", twister_seal_1x)
AddPrefabPostInit("kraken", kraken_1x)
AddPrefabPostInit("pigman", pigman_1x)
AddPrefabPostInit("crocodog", hound_1x)
end
if Difficult == "monster2x" then

AddPrefabPostInit("deerclops", deerclops_2x)
AddPrefabPostInit("bearger", bearger_2x)
AddPrefabPostInit("dragonfly", dragonfly_2x)
AddPrefabPostInit("moose", moose_2x)
AddPrefabPostInit("mossling", mossling_2x)
AddPrefabPostInit("spider", nspider_2x)
AddPrefabPostInit("spider_warrior", wspider_2x)
AddPrefabPostInit("spiderqueen", qspider_2x)
AddPrefabPostInit("spider_hider", chspider_2x)
AddPrefabPostInit("spider_spitter", csspider_2x)
AddPrefabPostInit("spider_dropper", cdspider_2x)
AddPrefabPostInit("hound", nhound_2x)
AddPrefabPostInit("firehound", fhound_2x)
AddPrefabPostInit("icehound", ihound_2x)
AddPrefabPostInit("warg", warg_2x)
AddPrefabPostInit("tentacle", tentacle_2x)
AddPrefabPostInit("rook", rook_2x)
AddPrefabPostInit("rook_nightmare", rook_2x)
AddPrefabPostInit("minotaur", minotaur_2x)
AddPrefabPostInit("bishop", bishop_2x)
AddPrefabPostInit("bishop_nightmare", bishop_2x)
AddPrefabPostInit("tallbird", tallbird_2x)
AddPrefabPostInit("leif", leif_2x)
AddPrefabPostInit("leif_sparse", leif_2x)
AddPrefabPostInit("merm", merm_2x)
AddPrefabPostInit("birchnutdrake", birchnutdrake_2x)
AddPrefabPostInit("bat", bat_2x)
AddPrefabPostInit("walus", walrus_2x)
AddPrefabPostInit("monkey", monkey_2x)
AddPrefabPostInit("eyeplant", eyeplant_2x)
AddPrefabPostInit("snake", snake_2x)
AddPrefabPostInit("snake_poison", snake_2x)
AddPrefabPostInit("snake_fire", snake_2x)
AddPrefabPostInit("snake_amphibious", snake_2x)
AddPrefabPostInit("whale_blue", whale_blue_2x)
AddPrefabPostInit("whale_white", whale_white_2x)
AddPrefabPostInit("dragoon", dragoon_2x)
AddPrefabPostInit("knightboat", knightboat_2x)
AddPrefabPostInit("treeguard", treeguard_2x)
AddPrefabPostInit("tigershark", tigershark_2x)
AddPrefabPostInit("twister_seal", twister_seal_2x)
AddPrefabPostInit("kraken", kraken_2x)
AddPrefabPostInit("pigman", pigman_2x)
AddPrefabPostInit("crocodog", nhound_2x)
end
if Difficult == "monster3x" then

AddPrefabPostInit("deerclops", deerclops_3x)
AddPrefabPostInit("bearger", bearger_3x)
AddPrefabPostInit("dragonfly", dragonfly_3x)
AddPrefabPostInit("moose", moose_3x)
AddPrefabPostInit("mossling", mossling_3x)
AddPrefabPostInit("spider", nspider_3x)
AddPrefabPostInit("spider_warrior", wspider_3x)
AddPrefabPostInit("spiderqueen", qspider_3x)
AddPrefabPostInit("spider_hider", chspider_3x)
AddPrefabPostInit("spider_spitter", csspider_3x)
AddPrefabPostInit("spider_dropper", cdspider_3x)
AddPrefabPostInit("hound", nhound_3x)
AddPrefabPostInit("firehound", fhound_3x)
AddPrefabPostInit("icehound", ihound_3x)
AddPrefabPostInit("warg", warg_3x)
AddPrefabPostInit("tentacle", tentacle_3x)
AddPrefabPostInit("rook", rook_3x)
AddPrefabPostInit("rook_nightmare", rook_3x)
AddPrefabPostInit("minotaur", minotaur_3x)
AddPrefabPostInit("bishop", bishop_3x)
AddPrefabPostInit("bishop_nightmare", bishop_3x)
AddPrefabPostInit("tallbird", tallbird_3x)
AddPrefabPostInit("leif", leif_3x)
AddPrefabPostInit("leif_sparse", leif_3x)
AddPrefabPostInit("merm", merm_3x)
AddPrefabPostInit("birchnutdrake", birchnutdrake_3x)
AddPrefabPostInit("bat", bat_3x)
AddPrefabPostInit("walus", walrus_3x)
AddPrefabPostInit("monkey", monkey_3x)
AddPrefabPostInit("eyeplant", eyeplant_3x)
AddPrefabPostInit("snake", snake_3x)
AddPrefabPostInit("snake_poison", snake_3x)
AddPrefabPostInit("snake_fire", snake_3x)
AddPrefabPostInit("snake_amphibious", snake_3x)
AddPrefabPostInit("whale_blue", whale_blue_3x)
AddPrefabPostInit("whale_white", whale_white_3x)
AddPrefabPostInit("dragoon", dragoon_3x)
AddPrefabPostInit("knightboat", knightboat_3x)
AddPrefabPostInit("treeguard", treeguard_3x)
AddPrefabPostInit("tigershark", tigershark_3x)
AddPrefabPostInit("twister_seal", twister_seal_3x)
AddPrefabPostInit("kraken", kraken_3x)
AddPrefabPostInit("pigman", pigman_3x)
AddPrefabPostInit("crocodog", nhound_3x)
end
if Difficult == "monster4x" then

AddPrefabPostInit("deerclops", deerclops_4x)
AddPrefabPostInit("bearger", bearger_4x)
AddPrefabPostInit("dragonfly", dragonfly_4x)
AddPrefabPostInit("moose", moose_4x)
AddPrefabPostInit("mossling", mossling_4x)
AddPrefabPostInit("spider", nspider_4x)
AddPrefabPostInit("spider_warrior", wspider_4x)
AddPrefabPostInit("spiderqueen", qspider_4x)
AddPrefabPostInit("spider_hider", chspider_4x)
AddPrefabPostInit("spider_spitter", csspider_4x)
AddPrefabPostInit("spider_dropper", cdspider_4x)
AddPrefabPostInit("hound", nhound_4x)
AddPrefabPostInit("firehound", fhound_4x)
AddPrefabPostInit("icehound", ihound_4x)
AddPrefabPostInit("warg", warg_4x)
AddPrefabPostInit("tentacle", tentacle_4x)
AddPrefabPostInit("rook", rook_4x)
AddPrefabPostInit("rook_nightmare", rook_4x)
AddPrefabPostInit("minotaur", minotaur_4x)
AddPrefabPostInit("bishop", bishop_4x)
AddPrefabPostInit("bishop_nightmare", bishop_4x)
AddPrefabPostInit("tallbird", tallbird_4x)
AddPrefabPostInit("leif", leif_4x)
AddPrefabPostInit("leif_sparse", leif_4x)
AddPrefabPostInit("merm", merm_4x)
AddPrefabPostInit("birchnutdrake", birchnutdrake_4x)
AddPrefabPostInit("bat", bat_4x)
AddPrefabPostInit("walus", walrus_4x)
AddPrefabPostInit("monkey", monkey_4x)
AddPrefabPostInit("eyeplant", eyeplant_4x)
AddPrefabPostInit("snake", snake_4x)
AddPrefabPostInit("snake_poison", snake_4x)
AddPrefabPostInit("snake_fire", snake_4x)
AddPrefabPostInit("snake_amphibious", snake_4x)
AddPrefabPostInit("whale_blue", whale_blue_4x)
AddPrefabPostInit("whale_white", whale_white_4x)
AddPrefabPostInit("dragoon", dragoon_4x)
AddPrefabPostInit("knightboat", knightboat_4x)
AddPrefabPostInit("treeguard", treeguard_4x)
AddPrefabPostInit("tigershark", tigershark_4x)
AddPrefabPostInit("twister_seal", twister_seal_4x)
AddPrefabPostInit("kraken", kraken_4x)
AddPrefabPostInit("pigman", pigman_4x)
AddPrefabPostInit("crocodog", nhound_4x)
end 


--ghost
function ghost_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.GHOST_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.GHOST_DAMAGE*1.5)
    inst:AddTag("spider2x")
end
function ghost_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.GHOST_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.GHOST_DAMAGE*2)
    inst:AddTag("spider3x")
end
function ghost_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.GHOST_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.GHOST_DAMAGE*3)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("ghost", ghost_2x)
AddPrefabPostInit("pirateghost", ghost_2x)
AddPrefabPostInit("pigghost", ghost_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("ghost", ghost_3x)
AddPrefabPostInit("pirateghost", ghost_3x)
AddPrefabPostInit("pigghost", ghost_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("ghost", ghost_4x)
AddPrefabPostInit("pirateghost", ghost_4x)
AddPrefabPostInit("pigghost", ghost_4x)
end

--antman
function antman_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.ANTMAN_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.ANTMAN_DAMAGE*1.5)
    inst:AddTag("spider2x")
end
function antman_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.ANTMAN_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.ANTMAN_DAMAGE*2)
    inst:AddTag("spider3x")
end
function antman_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.ANTMAN_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.ANTMAN_DAMAGE*3)
    inst:AddTag("spider4x")
end
function antmanw_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.ANTMAN_WARRIOR_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.ANTMAN_WARRIOR_DAMAGE*1.5)
    inst:AddTag("spider2x")
end
function antmanw_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.ANTMAN_WARRIOR_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.ANTMAN_WARRIOR_DAMAGE*2)
    inst:AddTag("spider3x")
end
function antmanw_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.ANTMAN_WARRIOR_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.ANTMAN_WARRIOR_DAMAGE*3)
    inst:AddTag("spider4x")
end
function antmanq_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.ANTQUEEN_HEALTH*2)
    inst:AddTag("giant2x")
end
function antmanq_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.ANTQUEEN_HEALTH*3)
    inst:AddTag("giant3x")
end
function antmanq_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.ANTQUEEN_HEALTH*4)
    inst:AddTag("giant4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("antman", antman_2x)
AddPrefabPostInit("pirateghost", antmanw_2x)
AddPrefabPostInit("antqueen", antmanq_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("antman", antman_3x)
AddPrefabPostInit("pirateghost", antmanw_3x)
AddPrefabPostInit("antqueen", antmanq_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("antman", antman_4x)
AddPrefabPostInit("pirateghost", antmanw_4x)
AddPrefabPostInit("antqueen", antmanq_4x)
end

--pigbandit
function pigb_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.PIG_HEALTH*2)
    inst:AddTag("spider2x")
end
function pigb_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.PIG_HEALTH*3)
    inst:AddTag("spider3x")
end
function pigb_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.PIG_HEALTH*4)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("pigbandit", pigb_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("pigbandit", pigb_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("pigbandit", pigb_4x)
end

--pugalisk
function pugalisk_head2x(inst)
    inst.components.health:SetMaxHealth(TUNING.PUGALISK_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.PUGALISK_DAMAGE*1.2)
	inst.components.combat.playerdamagepercent = 0.6
    inst:AddTag("giant2x")
end
function pugalisk_head3x(inst)
    inst.components.health:SetMaxHealth(TUNING.PUGALISK_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.PUGALISK_DAMAGE*1.5)
	inst.components.combat.playerdamagepercent = 0.5
    inst:AddTag("giant3x")
end
function pugalisk_head4x(inst)
    inst.components.health:SetMaxHealth(TUNING.PUGALISK_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.PUGALISK_DAMAGE*2)
	inst.components.combat.playerdamagepercent = 0.4
    inst:AddTag("giant4x")
end
function pugalisk_body2x(inst)
    inst.components.health:SetMaxHealth(15000)
    inst.components.combat:SetDefaultDamage(TUNING.PUGALISK_DAMAGE*1.2)
	inst.components.combat.playerdamagepercent = 0.6
    inst:AddTag("giant2x")
end
function pugalisk_body3x(inst)
    inst.components.health:SetMaxHealth(22000)
    inst.components.combat:SetDefaultDamage(TUNING.PUGALISK_DAMAGE*1.5)
	inst.components.combat.playerdamagepercent = 0.5
    inst:AddTag("giant3x")
end
function pugalisk_body4x(inst)
    inst.components.health:SetMaxHealth(32000)
    inst.components.combat:SetDefaultDamage(TUNING.PUGALISK_DAMAGE*2)
	inst.components.combat.playerdamagepercent = 0.4
    inst:AddTag("giant4x")
end
function pugalisk_tail2x(inst)
    inst.components.health:SetMaxHealth(15000)
    inst.components.combat:SetDefaultDamage(TUNING.PUGALISK_DAMAGE/2)
	inst.components.combat.playerdamagepercent = 0.4
    --inst:AddTag("giant2x")
end
function pugalisk_tail3x(inst)
    inst.components.health:SetMaxHealth(22000)
    inst.components.combat:SetDefaultDamage(TUNING.PUGALISK_DAMAGE)
	inst.components.combat.playerdamagepercent = 0.3
    --inst:AddTag("giant3x")
end
function pugalisk_tail4x(inst)
    inst.components.health:SetMaxHealth(32000)
    inst.components.combat:SetDefaultDamage(TUNING.PUGALISK_DAMAGE*1.3)
	inst.components.combat.playerdamagepercent = 0.2
    --inst:AddTag("giant4x")
end
function pugalisk_segment2x(inst)
    inst.components.health:SetMaxHealth(15000)
    
end
function pugalisk_segment3x(inst)
    inst.components.health:SetMaxHealth(22000)
   
end
function pugalisk_segment4x(inst)
    inst.components.health:SetMaxHealth(32000)
    
end
if Difficult == "monster2x" then
AddPrefabPostInit("pugalisk", pugalisk_head2x)
AddPrefabPostInit("pugalisk_body", pugalisk_body2x)
AddPrefabPostInit("pugalisk_tail", pugalisk_tail2x)
AddPrefabPostInit("pugalisk_segment", pugalisk_segment2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("pugalisk", pugalisk_head3x)
AddPrefabPostInit("pugalisk_body", pugalisk_body3x)
AddPrefabPostInit("pugalisk_tail", pugalisk_tail3x)
AddPrefabPostInit("pugalisk_segment", pugalisk_segment3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("pugalisk", pugalisk_head4x)
AddPrefabPostInit("pugalisk_body", pugalisk_body4x)
AddPrefabPostInit("pugalisk_tail", pugalisk_tail4x)
AddPrefabPostInit("pugalisk_segment", pugalisk_segment4x)
end

--rabid_beetle
function beetle_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.RABID_BEETLE_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.RABID_BEETLE_DAMAGE*2)
    inst:AddTag("spider2x")
end
function beetle_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.RABID_BEETLE_HEALTH*3)
	inst.components.combat:SetDefaultDamage(TUNING.RABID_BEETLE_DAMAGE*3)
    inst:AddTag("spider3x")
end
function beetle_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.RABID_BEETLE_HEALTH*4)
	inst.components.combat:SetDefaultDamage(TUNING.RABID_BEETLE_DAMAGE*4)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("rabid_beetle", beetle_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("rabid_beetle", beetle_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("rabid_beetle", beetle_4x)
end

--spider_monkey
function golira_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_MONKEY_HEALTH*2)
	inst.components.health:StartRegen(1, 20)
	inst.components.combat:SetDefaultDamage(TUNING.SPIDER_MONKEY_DAMAGE*2)
    inst:AddTag("small_giant2x")
end
function golira_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_MONKEY_HEALTH*3)
	inst.components.health:StartRegen(1, 15)
	inst.components.combat:SetDefaultDamage(TUNING.SPIDER_MONKEY_DAMAGE*3)
    inst:AddTag("small_giant3x")
end
function golira_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.SPIDER_MONKEY_HEALTH*4)
	inst.components.health:StartRegen(1, 10)
	inst.components.combat:SetDefaultDamage(TUNING.SPIDER_MONKEY_DAMAGE*4)
    inst:AddTag("small_giant4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("spider_monkey", golira_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("spider_monkey", golira_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("spider_monkey", golira_4x)
end

--scorpion
function scorpion_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.SCORPION_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.SCORPION_DAMAGE*1.5)
    inst:AddTag("spider2x")
end
function scorpion_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.SCORPION_HEALTH*3)
	inst.components.combat:SetDefaultDamage(TUNING.SCORPION_DAMAGE*2)
    inst:AddTag("spider3x")
end
function scorpion_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.SCORPION_HEALTH*4)
	inst.components.combat:SetDefaultDamage(TUNING.SCORPION_DAMAGE*3)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("scorpion", scorpion_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("scorpion", scorpion_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("scorpion", scorpion_4x)
end

--vampirebat
function vampire_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.VAMPIREBAT_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.VAMPIREBAT_DAMAGE*1.5)
    inst:AddTag("spider2x")
end
function vampire_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.VAMPIREBAT_HEALTH*3)
	inst.components.combat:SetDefaultDamage(TUNING.VAMPIREBAT_DAMAGE*2)
    inst:AddTag("spider3x")
end
function vampire_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.VAMPIREBAT_HEALTH*4)
	inst.components.combat:SetDefaultDamage(TUNING.VAMPIREBAT_DAMAGE*3)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("vampirebat", vampire_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("vampirebat", vampire_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("vampirebat", vampire_4x)
end

--mean_flytrap 
--plant monster (it can be grow up by himself)
function flytrap_2x(inst)
    inst.components.health:SetAbsorptionAmount(0.4)
    inst:AddTag("spider2x")
end
function flytrap_3x(inst)
    inst.components.health:SetAbsorptionAmount(0.55)
    inst:AddTag("spider3x")
end
function flytrap_4x(inst)
    inst.components.health:SetAbsorptionAmount(0.7)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("mean_flytrap", flytrap_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("mean_flytrap", flytrap_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("mean_flytrap", flytrap_4x)
end

--hippopotamoose
function hippo_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.HIPPO_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.HIPPO_DAMAGE*2)
    inst:AddTag("spider2x")
end
function hippo_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.HIPPO_HEALTH*3)
	inst.components.combat:SetDefaultDamage(TUNING.HIPPO_DAMAGE*3)
    inst:AddTag("spider3x")
end
function hippo_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.HIPPO_HEALTH*4)
	inst.components.combat:SetDefaultDamage(TUNING.HIPPO_DAMAGE*4)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("hippopotamoose", hippo_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("hippopotamoose", hippo_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("hippopotamoose", hippo_4x)
end

--pangolden
function pang_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.PANGOLDEN_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.PANGOLDEN_DAMAGE*1.5)
    inst:AddTag("spider2x")
end
function pang_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.PANGOLDEN_HEALTH*3)
	inst.components.combat:SetDefaultDamage(TUNING.PANGOLDEN_DAMAGE*2)
    inst:AddTag("spider3x")
end
function pang_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.PANGOLDEN_HEALTH*4)
	inst.components.combat:SetDefaultDamage(TUNING.PANGOLDEN_DAMAGE*3)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("pangolden", pang_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("pangolden", pang_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("pangolden", pang_4x)
end

--grabbing_vine
function grabbing_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.GRABBING_VINE_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.GRABBING_VINE_DAMAGE*1.5)
    inst:AddTag("spider2x")
end
function grabbing_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.GRABBING_VINE_HEALTH*3)
	inst.components.combat:SetDefaultDamage(TUNING.GRABBING_VINE_DAMAGE*2)
    inst:AddTag("spider3x")
end
function grabbing_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.GRABBING_VINE_HEALTH*4)
	inst.components.combat:SetDefaultDamage(TUNING.GRABBING_VINE_DAMAGE*3)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("grabbing_vine", grabbing_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("grabbing_vine", grabbing_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("grabbing_vine", grabbing_4x)
end

--frog
function frog_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.FROG_HEALTH*1.5)
	inst.components.combat:SetDefaultDamage(TUNING.FROG_DAMAGE*1.5)
end
function frog_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.FROG_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.FROG_DAMAGE*2)
end
function frog_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.FROG_HEALTH*2.5)
	inst.components.combat:SetDefaultDamage(TUNING.FROG_DAMAGE*3)
end
if Difficult == "monster2x" then
AddPrefabPostInit("frog", frog_2x)
AddPrefabPostInit("frog_poison", frog_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("frog", frog_3x)
AddPrefabPostInit("frog_poison", frog_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("frog", frog_4x)
AddPrefabPostInit("frog_poison", frog_4x)
end

--bee
function bee_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.BEE_HEALTH*1.5)
	inst.components.combat:SetDefaultDamage(TUNING.BEE_DAMAGE*1.5)
end
function bee_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.BEE_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.BEE_DAMAGE*2)
end
function bee_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.BEE_HEALTH*2.5)
	inst.components.combat:SetDefaultDamage(TUNING.BEE_DAMAGE*3)
end
function beek_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.BEE_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.BEE_DAMAGE*2)
end
function beek_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.BEE_HEALTH*3)
	inst.components.combat:SetDefaultDamage(TUNING.BEE_DAMAGE*3)
end
function beek_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.BEE_HEALTH*4)
	inst.components.combat:SetDefaultDamage(TUNING.BEE_DAMAGE*4)
end
if Difficult == "monster2x" then
AddPrefabPostInit("bee", bee_2x)
AddPrefabPostInit("killerbee", beek_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("bee", bee_3x)
AddPrefabPostInit("killerbee", beek_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("bee", bee_4x)
AddPrefabPostInit("killerbee", beek_4x)
end

--ancient_robot
function ancient_robot_ribs_2x(inst)
	inst.components.combat:SetDefaultDamage(TUNING.ROBOT_RIBS_DAMAGE*1.5)
end
function ancient_robot_ribs_3x(inst)
 	inst.components.combat:SetDefaultDamage(TUNING.ROBOT_RIBS_DAMAGE*2)
end
function ancient_robot_ribs_4x(inst)
 	inst.components.combat:SetDefaultDamage(TUNING.ROBOT_RIBS_DAMAGE*3)
end
function ancient_robot_head_2x(inst)
	inst.components.combat:SetDefaultDamage(TUNING.ROBOT_LEG_DAMAGE*1.5)
end
function ancient_robot_head_3x(inst)
 	inst.components.combat:SetDefaultDamage(TUNING.ROBOT_LEG_DAMAGE*2)
end
function ancient_robot_head_4x(inst)
 	inst.components.combat:SetDefaultDamage(TUNING.ROBOT_LEG_DAMAGE*3)
end

if Difficult == "monster2x" then
AddPrefabPostInit("ancient_robot_ribs", ancient_robot_ribs_2x)
AddPrefabPostInit("ancient_robot_claw", ancient_robot_ribs_2x)
AddPrefabPostInit("ancient_robot_leg", ancient_robot_head_2x)
AddPrefabPostInit("ancient_robot_head", ancient_robot_head_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("ancient_robot_ribs", ancient_robot_ribs_3x)
AddPrefabPostInit("ancient_robot_claw", ancient_robot_ribs_3x)
AddPrefabPostInit("ancient_robot_leg", ancient_robot_head_3x)
AddPrefabPostInit("ancient_robot_head", ancient_robot_head_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("ancient_robot_ribs", ancient_robot_ribs_4x)
AddPrefabPostInit("ancient_robot_claw", ancient_robot_ribs_4x)
AddPrefabPostInit("ancient_robot_leg", ancient_robot_head_4x)
AddPrefabPostInit("ancient_robot_head", ancient_robot_head_4x)
end

--thunderbird
function thunderbird_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.PERD_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.PERD_DAMAGE*2)
    inst:AddTag("spider2x")
end
function thunderbird_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.PERD_HEALTH*4)
	inst.components.combat:SetDefaultDamage(TUNING.PERD_DAMAGE*3)
    inst:AddTag("spider3x")
end
function thunderbird_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.PERD_HEALTH*6)
	inst.components.combat:SetDefaultDamage(TUNING.PERD_DAMAGE*4)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("thunderbird", thunderbird_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("thunderbird", thunderbird_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("thunderbird", thunderbird_4x)
end

--bill
function bill_2x(inst)
    inst.components.health:SetMaxHealth(TUNING.BILL_HEALTH*2)
	inst.components.combat:SetDefaultDamage(TUNING.BILL_DAMAGE*2)
    inst:AddTag("spider2x")
end
function bill_3x(inst)
    inst.components.health:SetMaxHealth(TUNING.BILL_HEALTH*3)
	inst.components.combat:SetDefaultDamage(TUNING.BILL_DAMAGE*3)
    inst:AddTag("spider3x")
end
function bill_4x(inst)
    inst.components.health:SetMaxHealth(TUNING.BILL_HEALTH*5)
	inst.components.combat:SetDefaultDamage(TUNING.BILL_DAMAGE*4)
    inst:AddTag("spider4x")
end
if Difficult == "monster2x" then
AddPrefabPostInit("bill", bill_2x)
end
if Difficult == "monster3x" then
AddPrefabPostInit("bill", bill_3x)
end
if Difficult == "monster4x" then
AddPrefabPostInit("bill", bill_4x)
end