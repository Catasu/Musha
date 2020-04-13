local EggHunt = GetModConfigData("egghunter")
local SpawnPrefab = GLOBAL.SpawnPrefab

local ROG = 0
 if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then  
		ROG = 1
end 

local CAPY = 0
 if GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then  
		CAPY = 1
end 

local PORK = 0
 if GLOBAL.IsDLCEnabled(GLOBAL.PORKLAND_DLC) then  
		PORK = 1
end 

local function Mushaintro(inst)
    if GLOBAL.GetPlayer().prefab == "musha" then

	inst.components.maxwelltalker.speeches.SANDBOX_1 =
        {
        appearsound = "dontstarve/maxwell/appear_adventure",
			  voice = "dontstarve/maxwell/talk_LP_world2",
		 appearanim = "appear2",
		   idleanim = "idle2_loop",
	 dialogpreanim = "dialog2_pre",
	    dialoganim ="dialog2_loop",
	dialogpostanim = "dialog2_pst",
	 disappearanim = "disappear2",
     disableplayer = true,
         skippable = true,
			{string = "So good of you to visit my dear",
                wait = 3,
                anim = nil,
                sound = nil,
            },
			{string = "...not that you had a lot of choice in the matter.",
                wait = 3,
                anim = nil,
                sound = nil,
            },
			{string = "Meet the other guests and entertain yourself.",
                wait = 3,
                anim = nil,
                sound = nil,
            },
			{string = "Do take care, they aren't used to meeting a princess.",
                wait = 3,
                anim = nil,
                sound = nil,
            },
			{string = "I wouldn't want anything unfortunate to happen to you...",
                wait = 3,
                anim = dialog2_loop,
                sound = nil,
            },
			}
    end
end

AddPrefabPostInit("maxwellintro", Mushaintro)


if EggHunt == "ya_hunt" or EggHunt == "no_egg" or EggHunt == "no_y_egg" or EggHunt == "no_a_egg" then
local function Mushaintro2(inst)
    if GLOBAL.GetPlayer().prefab == "musha" and not GLOBAL.GetPlayer().intro_finished then
	GLOBAL.GetPlayer().intro_finished = true
	 local player = GLOBAL.GetPlayer()
	--local yamche = SpawnPrefab("musha_egg")
	--local arong = SpawnPrefab("musha_egg_arong")
	--player.components.inventory:GiveItem(yamche)
	--player.components.inventory:GiveItem(arong)	 

local armor = SpawnPrefab("musha_chest")
local drakeangle = math.random(1, 360)
local offset = GLOBAL.FindWalkableOffset(player:GetPosition(), drakeangle*GLOBAL.DEGREES, math.random(2,4), 1, false, false)
local x,y,z = player.Transform:GetWorldPosition()
armor.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
armor.AnimState:PlayAnimation("open")

if armor.components.container then
	 local crown = SpawnPrefab("hat_mprincess")
	 local dust1 = SpawnPrefab("glowdust")
	 local dust2 = SpawnPrefab("glowdust")
	 local dust3 = SpawnPrefab("glowdust")
	 local blueprint1 = SpawnPrefab("backpack_blueprint")
	 local blueprint2 = SpawnPrefab("waxwelljournal")
	armor.components.container:GiveItem(crown)
	armor.components.container:GiveItem(dust1)
	armor.components.container:GiveItem(dust2) 
	armor.components.container:GiveItem(dust3)  
	armor.components.container:GiveItem(blueprint1)
	armor.components.container:GiveItem(blueprint2)
	if PORK == 1 then
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("telescope")
local item3 = SpawnPrefab("coconut")
local item4 = SpawnPrefab("tunacan")
local item5 = SpawnPrefab("oinc")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)
	elseif CAPY == 1 then
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("telescope")
local item3 = SpawnPrefab("coconut")
local item4 = SpawnPrefab("tunacan")
local item5 = SpawnPrefab("dubloon")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)
	else
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("twigs")
local item3 = SpawnPrefab("log")
local item4 = SpawnPrefab("flint")
local item5 = SpawnPrefab("tunacan")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)	
	end
end
	end 
end
AddPrefabPostInit("wallyintro", Mushaintro2)
AddPrefabPostInit("maxwellintro", Mushaintro2)
AddPrefabPostInit("porkland_intro", Mushaintro2)
end

if EggHunt == "y_hunted" then
local function Mushaintro2(inst)
     if GLOBAL.GetPlayer().prefab == "musha" and not GLOBAL.GetPlayer().intro_finished then
	GLOBAL.GetPlayer().intro_finished = true
	local player = GLOBAL.GetPlayer()
	--local yamche = SpawnPrefab("musha_egg")
	local arong = SpawnPrefab("musha_egg_arong")
	--player.components.inventory:GiveItem(yamche)
	player.components.inventory:GiveItem(arong)	 
local armor = SpawnPrefab("musha_chest")
local drakeangle = math.random(1, 360)
local offset = GLOBAL.FindWalkableOffset(player:GetPosition(), drakeangle*GLOBAL.DEGREES, math.random(2,4), 1, false, false)
local x,y,z = player.Transform:GetWorldPosition()
armor.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
armor.AnimState:PlayAnimation("open")

if armor.components.container then
	 local crown = SpawnPrefab("hat_mprincess")
	 local dust1 = SpawnPrefab("glowdust")
	 local dust2 = SpawnPrefab("glowdust")
	 local dust3 = SpawnPrefab("glowdust")
	 local blueprint1 = SpawnPrefab("backpack_blueprint")
	 local blueprint2 = SpawnPrefab("waxwelljournal")
	armor.components.container:GiveItem(crown)
	armor.components.container:GiveItem(dust1)
	armor.components.container:GiveItem(dust2) 
	armor.components.container:GiveItem(dust3)  
	armor.components.container:GiveItem(blueprint1)
	armor.components.container:GiveItem(blueprint2)
	if PORK == 1 then
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("telescope")
local item3 = SpawnPrefab("coconut")
local item4 = SpawnPrefab("tunacan")
local item5 = SpawnPrefab("oinc")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)
	elseif CAPY == 1 then
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("telescope")
local item3 = SpawnPrefab("coconut")
local item4 = SpawnPrefab("tunacan")
local item5 = SpawnPrefab("dubloon")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)
	else
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("twigs")
local item3 = SpawnPrefab("log")
local item4 = SpawnPrefab("flint")
local item5 = SpawnPrefab("tunacan")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)	
	end
end
	end 
end
AddPrefabPostInit("wallyintro", Mushaintro2)
AddPrefabPostInit("maxwellintro", Mushaintro2)
AddPrefabPostInit("porkland_intro", Mushaintro2)
end
if EggHunt == "a_hunted" then
local function Mushaintro2(inst)
     if GLOBAL.GetPlayer().prefab == "musha" and not GLOBAL.GetPlayer().intro_finished then
	GLOBAL.GetPlayer().intro_finished = true
	local player = GLOBAL.GetPlayer()
	local yamche = SpawnPrefab("musha_egg")
	--local arong = SpawnPrefab("musha_egg_arong")
	player.components.inventory:GiveItem(yamche)
	--player.components.inventory:GiveItem(arong)	 
local armor = SpawnPrefab("musha_chest")
local drakeangle = math.random(1, 360)
local offset = GLOBAL.FindWalkableOffset(player:GetPosition(), drakeangle*GLOBAL.DEGREES, math.random(2,4), 1, false, false)
local x,y,z = player.Transform:GetWorldPosition()
armor.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
armor.AnimState:PlayAnimation("open")

if armor.components.container then
	 local crown = SpawnPrefab("hat_mprincess")
	 local dust1 = SpawnPrefab("glowdust")
	 local dust2 = SpawnPrefab("glowdust")
	 local dust3 = SpawnPrefab("glowdust")
	 local blueprint1 = SpawnPrefab("backpack_blueprint")
	 local blueprint2 = SpawnPrefab("waxwelljournal")
	armor.components.container:GiveItem(crown)
	armor.components.container:GiveItem(dust1)
	armor.components.container:GiveItem(dust2) 
	armor.components.container:GiveItem(dust3)  
	armor.components.container:GiveItem(blueprint1)
	armor.components.container:GiveItem(blueprint2)
	if PORK == 1 then
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("telescope")
local item3 = SpawnPrefab("coconut")
local item4 = SpawnPrefab("tunacan")
local item5 = SpawnPrefab("oinc")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)
	elseif CAPY == 1 then
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("telescope")
local item3 = SpawnPrefab("coconut")
local item4 = SpawnPrefab("tunacan")
local item5 = SpawnPrefab("dubloon")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)
	else
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("twigs")
local item3 = SpawnPrefab("log")
local item4 = SpawnPrefab("flint")
local item5 = SpawnPrefab("tunacan")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)	
	end
end
	end 
end
AddPrefabPostInit("wallyintro", Mushaintro2)
AddPrefabPostInit("maxwellintro", Mushaintro2)
AddPrefabPostInit("porkland_intro", Mushaintro2)
end

if EggHunt == "no_hunt" then
local function Mushaintro2(inst)
     if GLOBAL.GetPlayer().prefab == "musha" and not GLOBAL.GetPlayer().intro_finished then
	GLOBAL.GetPlayer().intro_finished = true
	local player = GLOBAL.GetPlayer()
	local yamche = SpawnPrefab("musha_egg")
	local arong = SpawnPrefab("musha_egg_arong")
	player.components.inventory:GiveItem(yamche)
	player.components.inventory:GiveItem(arong)	 
local armor = SpawnPrefab("musha_chest")
local drakeangle = math.random(1, 360)
local offset = GLOBAL.FindWalkableOffset(player:GetPosition(), drakeangle*GLOBAL.DEGREES, math.random(2,4), 1, false, false)
local x,y,z = player.Transform:GetWorldPosition()
armor.Transform:SetPosition(x + offset.x, y + offset.y, z + offset.z)
armor.AnimState:PlayAnimation("open")

if armor.components.container then
	 local crown = SpawnPrefab("hat_mprincess")
	 local dust1 = SpawnPrefab("glowdust")
	 local dust2 = SpawnPrefab("glowdust")
	 local dust3 = SpawnPrefab("glowdust")
	 local blueprint1 = SpawnPrefab("backpack_blueprint")
	 local blueprint2 = SpawnPrefab("waxwelljournal")
	armor.components.container:GiveItem(crown)
	armor.components.container:GiveItem(dust1)
	armor.components.container:GiveItem(dust2) 
	armor.components.container:GiveItem(dust3)  
	armor.components.container:GiveItem(blueprint1)
	armor.components.container:GiveItem(blueprint2)
	if PORK == 1 then
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("telescope")
local item3 = SpawnPrefab("coconut")
local item4 = SpawnPrefab("tunacan")
local item5 = SpawnPrefab("oinc")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)
	elseif CAPY == 1 then
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("telescope")
local item3 = SpawnPrefab("coconut")
local item4 = SpawnPrefab("tunacan")
local item5 = SpawnPrefab("dubloon")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)
	else
local item1 = SpawnPrefab("shovel")
local item2 = SpawnPrefab("twigs")
local item3 = SpawnPrefab("log")
local item4 = SpawnPrefab("flint")
local item5 = SpawnPrefab("tunacan")
armor.components.container:GiveItem(item1)
armor.components.container:GiveItem(item2)
armor.components.container:GiveItem(item3)
armor.components.container:GiveItem(item4)
armor.components.container:GiveItem(item5)	
	end
end
	end 
end
AddPrefabPostInit("wallyintro", Mushaintro2)
AddPrefabPostInit("maxwellintro", Mushaintro2)
AddPrefabPostInit("porkland_intro", Mushaintro2)
end

if EggHunt == "no_a_egg" or EggHunt == "a_hunted" then
local function check_egghunt(inst)
	inst.arong_egg_hunted = true
	
end
AddPrefabPostInit("musha", check_egghunt)
end
if EggHunt == "no_y_egg" or EggHunt == "y_hunted" then
local function check_egghunt(inst)
	inst.yamche_egg_hunted = true
		
end
AddPrefabPostInit("musha", check_egghunt)
end
if EggHunt == "no_hunt" or EggHunt == "no_egg" then
local function check_egghunt(inst)
	inst.yamche_egg_hunted = true
	inst.arong_egg_hunted = true
		
end
AddPrefabPostInit("musha", check_egghunt)
end