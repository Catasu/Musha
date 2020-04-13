
local trace = function() end

local function DoFoleySounds(inst)

	for k,v in pairs(inst.components.inventory.equipslots) do
		if v.components.inventoryitem and v.components.inventoryitem.foleysound then
			inst.SoundEmitter:PlaySound(v.components.inventoryitem.foleysound)
		end
	end

    if inst.prefab == "wx78" then
        inst.SoundEmitter:PlaySound("dontstarve/movement/foley/wx78")
    end
end

local function SetSleeperSleepState(inst)
  --  if inst.components.grue ~= nil then
  --  end
   inst.sleepbuff = true
   inst.sleeping_musha = true
 if inst.sleeping_musha then
inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5) end
     
   --inst.components.hunger:Resume()
if inst.components.hunger.current <=0 then
   inst.hungry_wakeup = true end

end

local function SetSleeperAwakeState(inst)
	inst.sleeping_musha = false
	inst.sleepbuff = false
	
    --if inst:HasTag("sleep_visual") then
    --inst:RemoveTag("sleep_visual") end
 
end
local actionhandlers = 
{
    ActionHandler(ACTIONS.CHOP, 
        function(inst) 
            if not inst.sg:HasStateTag("prechop") then 
                if inst.sg:HasStateTag("chopping") then
                    return "chop"
                else
                    return "chop_start"
                end
            end 
        end),
     ActionHandler(ACTIONS.HACK, 
        function(inst) 
		local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and not weapon:HasTag("fire_spear") then
            if not inst.sg:HasStateTag("prehack") then 
                if inst.sg:HasStateTag("hacking") then
                    return "hack"
                else
                    return "hack_start"
                end
 			end
			end
        end),
    ActionHandler(ACTIONS.MINE, 
        function(inst) 
            if not inst.sg:HasStateTag("premine") then 
                if inst.sg:HasStateTag("mining") then
                    return "mine"
                else
                    return "mine_start"
                end
            end 
        end),
    ActionHandler(ACTIONS.HAMMER, 
        function(inst) 
            if not inst.sg:HasStateTag("prehammer") then 
                if inst.sg:HasStateTag("hammering") then
                    return "hammer"
                else
                    return "hammer_start"
                end
            end 
        end),
	ActionHandler(ACTIONS.TERRAFORM,
		function(inst)
			return "terraform"
		end), 
	
	ActionHandler(ACTIONS.DIG, 
        function(inst) 
		local weapon = inst.components.combat and inst.components.combat:GetWeapon()
            if weapon and not weapon:HasTag("fire_spear") then
            if not inst.sg:HasStateTag("predig") then 
                if inst.sg:HasStateTag("digging") then
                    return "dig"
                else
                    return "dig_start"
                end
			end	
            end 
        end),        
    ActionHandler(ACTIONS.NET, 
        function(inst)
            if not inst.sg:HasStateTag("prenet") then 
                if inst.sg:HasStateTag("netting") then
                    return "bugnet"
                else
                    return "bugnet_start"
                end
            end
        end),        
    ActionHandler(ACTIONS.FISH, "fishing_pre"),
    
    ActionHandler(ACTIONS.FISHOCEAN, "fish_ocean"),

	ActionHandler(ACTIONS.FERTILIZE, "doshortaction"),
    ActionHandler(ACTIONS.SMOTHER, "dolongaction"),
    ActionHandler(ACTIONS.MANUALEXTINGUISH, "dolongaction"),
    ActionHandler(ACTIONS.RANGEDSMOTHER, "attack"),
	ActionHandler(ACTIONS.TRAVEL, "doshortaction"),
    ActionHandler(ACTIONS.LIGHT, "give"),
    ActionHandler(ACTIONS.UNLOCK, "give"),
    ActionHandler(ACTIONS.TURNOFF, "give"),
    ActionHandler(ACTIONS.TURNON, "give"),
    ActionHandler(ACTIONS.TOGGLEOFF, "give"),
    ActionHandler(ACTIONS.TOGGLEON, "give"),
    ActionHandler(ACTIONS.ADDFUEL, "doshortaction"),
    ActionHandler(ACTIONS.ADDWETFUEL, "doshortaction"),
    ActionHandler(ACTIONS.REPAIR, "dolongaction"),
    ActionHandler(ACTIONS.REPAIRBOAT, "dolongaction"),
    
    ActionHandler(ACTIONS.READ, "book"),
    ActionHandler(ACTIONS.READMAP, "map"),

    ActionHandler(ACTIONS.MAKEBALLOON, "makeballoon"),
    ActionHandler(ACTIONS.DEPLOY, "doshortaction"),
    ActionHandler(ACTIONS.DEPLOY_AT_RANGE, "doshortaction"),    
    ActionHandler(ACTIONS.LAUNCH, "dolongaction"),
    ActionHandler(ACTIONS.RETRIEVE, "dolongaction"),
    ActionHandler(ACTIONS.STORE, "doshortaction"),
    ActionHandler(ACTIONS.DROP, "doshortaction"),
    ActionHandler(ACTIONS.MURDER, "dolongaction"),
    ActionHandler(ACTIONS.UPGRADE, "dolongaction"),

    -------------------------------------
    ActionHandler(ACTIONS.MOUNT, "jumponboatstart"),
    --ActionHandler(ACTIONS.MOUNT, "dolongaction"),
    
    ----------------------------------------

   	ActionHandler(ACTIONS.ACTIVATE, 
        function(inst, action)
            if action.target.components.activatable then
                if action.target.components.activatable.quickaction then
                    return "doshortaction"
                else
                    return "dolongaction"
                end
            end
        end),
    ActionHandler(ACTIONS.PICK, 
        function(inst, action)
            if action.target.components.pickable then
                if action.target.components.pickable.quickpick then
                    return "doshortaction"
                else
                    return "dolongaction"
                end
            end
        end),
        
    ActionHandler(ACTIONS.SLEEPIN, 
		function(inst, action)
			if action.invobject then
                if action.invobject.onuse then
                    action.invobject.onuse()
                end
				return "bedroll"
			else
				return "doshortaction"
			end
		
		end),

    ActionHandler(ACTIONS.TAKEITEM, "dolongaction" ),
    
    ActionHandler(ACTIONS.BUILD, 
        function(inst, action)
            if not inst.sg:HasStateTag("busy") then
                return "dolongaction"
            end
        end),
    ActionHandler(ACTIONS.SHAVE, "shave"),
    ActionHandler(ACTIONS.COOK, "dolongaction"),
    
    ActionHandler(ACTIONS.PICKUP,
        function(inst, action)
            if action.target.components.inventoryitem then
                if action.target.components.inventoryitem.longpickup then
                    return "dolongaction"
                end
            end
            return "doshortaction"
        end),

    ActionHandler(ACTIONS.CHECKTRAP, "doshortaction"),
    ActionHandler(ACTIONS.RUMMAGE, "doshortaction"),
    ActionHandler(ACTIONS.BAIT, "doshortaction"),
    ActionHandler(ACTIONS.HEAL, "dolongaction"),
    ActionHandler(ACTIONS.CUREPOISON,
        function(inst, action)
            local target = action.target

            if not target or target == inst then
                return "curepoison"
            else
                return "give"
            end
        end),
    ActionHandler(ACTIONS.SEW, "dolongaction"),
    ActionHandler(ACTIONS.TEACH, "dolongaction"),
    ActionHandler(ACTIONS.RESETMINE, "dolongaction"),
    ActionHandler(ACTIONS.EAT, 
        function(inst, action)
            if inst.sg:HasStateTag("busy") then
                return nil
            end
            --[[local obj = action.target or action.invobject
            if not (obj and obj.components.edible) then
                return nil
            end]]
			local obj = action.target or action.invobject
            if obj == nil or obj.components.edible == nil then
                return
            elseif not inst.components.eater:CanEat(obj) then
                inst:PushEvent("wonteatfood", { food = obj })
                return
            end
            
            if inst.components.eater:CanEat(obj) and obj.components.edible.foodtype == "MEAT" then
                return "eat"
			elseif inst.components.eater:CanEat(obj) and obj.components.edible.foodtype == "VEGGIE" and obj.components.edible.hungervalue >= 25 then
                return "eat"
            elseif inst.components.eater:CanEat(obj) and obj.components.edible.foodtype == "VEGGIE" and obj.components.edible.hungervalue < 25 then
                return "quickeat"
			elseif inst.components.eater:CanEat(obj) and not obj.components.edible.foodtype ~= "MEAT" and obj.components.edible.foodtype ~= "VEGGIE" then
                return "quickeat"	
            else
                inst:PushEvent("canteatfood", {food = obj})
                return nil
            end
        end),
    ActionHandler(ACTIONS.GIVE, "give"),
    ActionHandler(ACTIONS.PLANT, "doshortaction"),
    ActionHandler(ACTIONS.HARVEST, "dolongaction"),
    ActionHandler(ACTIONS.PLAY, function(inst, action)
        if action.invobject then
            if action.invobject:HasTag("flute") then
                return "play_flute"
            elseif action.invobject:HasTag("horn") then
                return "play_horn"
            elseif action.invobject:HasTag("bell") then
                return "play_bell"
			elseif action.invobject:HasTag("flute2") then
                return "play_flute2"
            elseif action.invobject:HasTag("horn2") then
                return "play_horn2"
            end
        end
    end),
    ActionHandler(ACTIONS.FAN, function(inst, action)
        return "use_fan"
    end),
    ActionHandler(ACTIONS.JUMPIN, "jumpin"),
    ActionHandler(ACTIONS.DRY, "doshortaction"),
    ActionHandler(ACTIONS.CASTSPELL, 
        function(inst, action) 
            return action.invobject.components.spellcaster.castingstate or "castspell"
        end),
    ActionHandler(ACTIONS.PEER, "peertelescope"),
    ActionHandler(ACTIONS.BLINK, "quicktele"),
    ActionHandler(ACTIONS.COMBINESTACK, "doshortaction"),
    ActionHandler(ACTIONS.BURY, "dolongaction"),
    ActionHandler(ACTIONS.FEED, "dolongaction"),
    ActionHandler(ACTIONS.STICK, "doshortaction"),
    ActionHandler(ACTIONS.THROW, "throw"),
}

   
local events=
{

    EventHandler("locomote", function(inst)
        local is_attacking = inst.sg:HasStateTag("attack")
        local is_busy = inst.sg:HasStateTag("busy")
        if is_attacking or is_busy then return end
        local is_moving = inst.sg:HasStateTag("moving")
        local is_running = inst.sg:HasStateTag("running")
        local should_move = inst.components.locomotor:WantsToMoveForward()
        local should_run = inst.components.locomotor:WantsToRun()

        if is_moving and not should_move then
            if is_running then
                inst.sg:GoToState("run_stop")
            else
                inst.sg:GoToState("walk_stop")
            end
        elseif (not is_moving and should_move) or (is_moving and should_move and is_running ~= should_run) then
            if should_run then
                inst.sg:GoToState("run_start")
            else
                inst.sg:GoToState("walk_start")
            end
        end 
    end),
    
    EventHandler("transform_werebeaver", function(inst, data)
        if inst.components.beaverness then
            TheCamera:SetDistance(14)
            inst.sg:GoToState("werebeaver")

        end
    end),

    EventHandler("blocked", function(inst, data)
        if not inst.components.health:IsDead() then
            if inst.sg:HasStateTag("shell") then
                inst.sg:GoToState("shell_hit")
            end
        end
    end),
	
	EventHandler("mindcontrol", function(inst)
        if not (inst.sg:HasStateTag("busy") or inst.components.health:IsDead()) then
            inst.sg:GoToState("mindcontrol")
        end
    end),
	
    EventHandler("attacked", function(inst, data)
		if not inst.components.health:IsDead() then
		if inst.on_sparkshield or inst.f_attack then
			inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/spark")
			else
			if data.attacker and (data.attacker:HasTag("insect") or data.attacker:HasTag("twister"))then
                local is_idle = inst.sg:HasStateTag("idle")
                if not is_idle then
                    -- avoid stunlock when attacked by bees/mosquitos
                    -- don't go to full hit state, just play sounds

                    inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")        
                    
                    if inst.prefab ~= "wes" then
                        local sound_name = inst.soundsname or inst.prefab
                        local path = inst.talker_path_override or "dontstarve/characters/"
                        local equippedHat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
                        if equippedHat and equippedHat:HasTag("muffler") then
                            inst.SoundEmitter:PlaySound(path..sound_name.."/gasmask_hurt")
                        else
                            local sound_event = path..sound_name.."/hurt"
                            inst.SoundEmitter:PlaySound(inst.hurtsoundoverride or sound_event)
                        end
                    end
                    return
                end
			end
            if inst.sg:HasStateTag("shell") then
                inst.sg:GoToState("shell_hit")
            else
                if data.stimuli and data.stimuli == "electric" and not inst.components.inventory:IsInsulated() then
                    inst.sg:GoToState("electrocute")
                else
                    inst.sg:GoToState("hit")
                end
            end
		end
		end
	end),

    EventHandler("doattack", function(inst)
        if not inst.components.health:IsDead() and not inst.sg:HasStateTag("attack") then
            local weapon = inst.components.combat and inst.components.combat:GetWeapon()
            if weapon and weapon:HasTag("blowdart") then
                inst.sg:GoToState("blowdart")
            elseif weapon and weapon:HasTag("thrown") then
                inst.sg:GoToState("throw")
            elseif weapon and weapon:HasTag("speargun") then 
                inst.sg:GoToState("speargun")
			elseif weapon and weapon:HasTag("bowm") --[[and not inst.valkyrie]] then 	
				inst.sg:GoToState("bowm2")
			--elseif weapon and weapon:HasTag("bowm") and inst.valkyrie then 	
				--inst.sg:GoToState("bowm3")
			elseif weapon and not weapon:HasTag("bowm") and not weapon:HasTag("phoenix_axe") and not weapon:HasTag("frost_hammer") and (inst:HasTag("frosta") or inst:HasTag("framea")) and not inst:HasTag("lightningblue1") and not inst:HasTag("lightningblue2") and not inst.sneaka then 	
				inst.sg:GoToState("attack2")
			elseif weapon and not weapon:HasTag("bowm") and weapon:HasTag("musha_items") and inst.sneaka then 	
				inst.sg:GoToState("attack2")
			elseif weapon and weapon:HasTag("frost_hammer") and not inst.sneaka then 	 	
				inst.sg:GoToState("attack2")
			elseif weapon and weapon:HasTag("phoenix_pickaxe") and not inst.sneaka then 	 	
				inst.sg:GoToState("attack2")
			elseif weapon and weapon:HasTag("frost_spear") and not inst.sneaka then 	 	
				inst.sg:GoToState("attack2")	
				--[[
			elseif weapon and weapon:HasTag("frost_hammer") and not inst.valkyrie and not inst.berserk and not inst.sneaka then 	 	
				inst.sg:GoToState("attack2")	
			elseif weapon and weapon:HasTag("frost_hammer") and inst.valkyrie and inst.beresrk and not inst.sneaka then 	
				inst.sg:GoToState("attack")]]
            else
                inst.sg:GoToState("attack")
            end
        end
    end),

    --[[EventHandler("dowhiff", function(inst)
        if not inst.components.health:IsDead() then
            local weapon = inst.components.combat and inst.components.combat:GetWeapon()
            if weapon and weapon:HasTag("blowdart") then
                inst.sg:GoToState("blowdart")
            elseif weapon and weapon:HasTag("thrown") then
                inst.sg:GoToState("throw")
            else
                inst.sg:GoToState("attack")
            end
        end
    end),
    --]]

    EventHandler("equip", function(inst, data)
        if inst.sg:HasStateTag("idle") then
			if data.eslot == EQUIPSLOTS.HANDS then
				inst.sg:GoToState("item_out")
			else
				inst.sg:GoToState("item_hat")
			end
        end
    end),
    
    EventHandler("unequip", function(inst, data)
        
        if inst.sg:HasStateTag("idle") then

			if data.eslot == EQUIPSLOTS.HANDS then
				if data.slip then
                    inst.sg:GoToState("tool_slip")
                else
                    inst.sg:GoToState("item_in")
                end
			else
				inst.sg:GoToState("item_hat")
			end
        end
    end),
    
    EventHandler("death", function(inst, data)
        inst.components.playercontroller:Enable(false)

        if data.cause == "drowning" then
            inst.sg:GoToState("death_boat")
            local sound_name = inst.soundsname or inst.prefab
            local path = inst.talker_path_override or "dontstarve_DLC002/characters/"
            inst.SoundEmitter:PlaySound(path..sound_name.."/sinking_death")
        else
            inst.sg:GoToState("death")
            local sound_name = inst.soundsname or inst.prefab
            local path = inst.talker_path_override or "dontstarve/characters/"
            if inst.prefab ~= "wes" then
                inst.SoundEmitter:PlaySound(path..sound_name.."/death_voice")
            end
        end

        inst.SoundEmitter:PlaySound("dontstarve/wilson/death")
    end),

    EventHandler("ontalk", function(inst, data)
        if inst.sg:HasStateTag("idle") then
            if inst.prefab == "wes" then
				inst.sg:GoToState("mime")
            else
				inst.sg:GoToState("talk", data.noanim)
			end
        end
        
    end),

       
    EventHandler("wakeup",
        function(inst)
            inst.sg:GoToState("wakeup")
        end),        
    EventHandler("powerup",
        function(inst)
            if GetTick() > 0 then
                inst.sg:GoToState("powerup")
            end
        end),        
    EventHandler("powerdown",
        function(inst)
            inst.sg:GoToState("powerdown")
        end),        
       
    EventHandler("readytocatch",
		function(inst)
			inst.sg:GoToState("catch_pre")
		end),        
        
    EventHandler("toolbroke",
		function(inst, data)
			inst.sg:GoToState("toolbroke", data.tool)
		end),        

    EventHandler("umbrellaranout",
        function(inst, data)
            if not inst.components.inventory:IsItemEquipped(data.umbrella) then
                local sameTool = inst.components.inventory:FindItem(function(item)
                    return item.prefab == "umbrella" or item.prefab == "grass_umbrella" or item.prefab == "palmleaf_umbrella"
                end)
                if sameTool then
                    inst.components.inventory:Equip(sameTool)
                end
            end
        end),

    EventHandler("torchranout",
        function(inst, data)
            if not inst.components.inventory:IsItemEquipped(data.torch) then
                local sameTool = inst.components.inventory:FindItem(function(item)
                    return item.prefab == data.torch.prefab
                end)
                if sameTool then
                    inst.components.inventory:Equip(sameTool)
                end
            end
        end),

    EventHandler("armorbroke",
		function(inst, data)
			inst.sg:GoToState("armorbroke", data.armor)
		end),        
        
    EventHandler("fishingcancel",
		function(inst)
		    if inst.sg:HasStateTag("fishing") then
			    inst.sg:GoToState("fishing_pst")
			end
		end),
		
  	   EventHandler("knockedout",
        function(inst)
            if inst.sg:HasStateTag("knockout") then
                inst.sg.statemem.cometo = nil
            elseif not (inst.sg:HasStateTag("sleeping") or inst.sg:HasStateTag("bedroll") or inst.sg:HasStateTag("tent") or inst.sg:HasStateTag("waking")) then
                inst.sg:GoToState("knockout")
            end
        end),
		
    EventHandler("freeze", 
        function(inst)
            if inst.components.health and inst.components.health:GetPercent() > 0 then
                inst.sg:GoToState("frozen")
            end
        end),
	
	EventHandler("wonteatfood",
        function(inst)
            if inst.components.health ~= nil and not inst.components.health:IsDead() then
                --inst.sg:GoToState("refuseeat")
				inst.sg:GoToState("mindcontrol")
			if inst.princess_taste and inst.components.hunger.current > 180 then
			inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_FULLBELLY"))
			else
			inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_HATEFOOD"))
			end	
            end
        end),
		
     EventHandler("vacuum_in", 
        function(inst)
           if inst.components.health and not 
            inst.components.health:IsDead() and not 
            inst.sg:HasStateTag("vacuum_in") then 
                inst.sg:GoToState("vacuumedin")
            end          
        end),

      EventHandler("vacuum_held", 
        function(inst)
           if inst.components.health and not 
            inst.components.health:IsDead() and not 
            inst.sg:HasStateTag("vacuum_held") then 
                inst.sg:GoToState("vacuumedheld")
            end          
        end),

      EventHandler("vacuum_out", 
        function(inst, data)
           if inst.components.health and not 
            inst.components.health:IsDead() and not 
            inst.sg:HasStateTag("vacuum_out") then 
                inst.sg:GoToState("vacuumedout", data)
            end          
        end),
      EventHandler("shipwrecked_portal",
        function(inst, data)
            if inst.components.health and not 
            inst.components.health:IsDead() then
                inst.sg:GoToState("player_portal_shipwrecked_pre")
            end
        end),
}

local statue_symbols = 
{
    "ww_head",
    "ww_limb",
    "ww_meathand",
    "ww_shadow",
    "ww_torso",
    "frame",
    "rope_joints",
    "swap_grown"
}


local states= 
{

    State{
        name = "mount",
        onenter = function(inst)
            --inst.components.playercontroller:Enable(false)
            inst:PerformBufferedAction()
           -- inst.components.playercontroller:Enable(false)
            --inst.components.vehiclecontroller:Enable(true)
        end, 

        onexit = function(inst)
        end, 
    },

    State{

         name = "dismount", 
         onenter = function(inst)
            --inst.components.playercontroller:Enable(false)
            inst:PerformBufferedAction()
            --inst.components.playercontroller:Enable(true)
        end, 

        onexit = function(inst)
        end, 
    },

    

    State{
        name = "wakeup",

        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
			SetSleeperAwakeState(inst)
            if inst.AnimState:IsCurrentAnimation("bedroll") or
                inst.AnimState:IsCurrentAnimation("bedroll_sleep_loop") then
                inst.AnimState:PlayAnimation("bedroll_wakeup")
            elseif not (inst.AnimState:IsCurrentAnimation("bedroll_wakeup") or
                        inst.AnimState:IsCurrentAnimation("wakeup")) then
                inst.AnimState:PlayAnimation("wakeup")
            end
            --inst.components.health:SetInvincible(true)
        end,
        
        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
            --inst.components.health:SetInvincible(false)
        end,
        
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },

    },

    State{
        name = "vacuumedin",
        tags = {"busy", "vacuum_in", "canrotate"},
        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("flying_pre")
            inst.AnimState:PlayAnimation("flying_loop", true)
        end,

        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
        end,
    },

     State{
        name = "vacuumedheld",
        tags = {"busy", "vacuum_held"},
        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
            inst.DynamicShadow:Enable(false)
            inst:Hide()
        end,
        
        onexit = function(inst)
            inst:Show()
            inst.DynamicShadow:Enable(true)
            inst.components.playercontroller:Enable(true)
        end,
    },

    State{
        name = "vacuumedout",
        tags = {"busy", "vacuum_out", "canrotate"},

        onenter = function(inst, data)
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("flying_loop", true)
            inst.Physics:SetMotorVelOverride(math.cos(data.angle) * data.speed, 0, math.sin(data.angle) * data.speed)

            inst.sg:SetTimeout(FRAMES*10)
        end,

        ontimeout = function(inst)
            inst.Physics:ClearMotorVelOverride()

            local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if item then
               inst.components.inventory:DropItem(item)
            end

            for i = 1, 4 do
                item = nil 
                local slot = math.random(1,inst.components.inventory:GetNumSlots())
                item = inst.components.inventory:GetItemInSlot(slot)
                if item then 
                    inst.components.inventory:DropItem(item, true, true)
                end 
            end

            inst.Physics:SetMotorVel(0,0,0)
            inst.sg:GoToState("vacuumedland")
            inst:DoTaskInTime(5, function(inst) inst:RemoveTag("NOVACUUM")end )
        end,

        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
        end,
    },

    State{
        name = "vacuumedland",
        tags = {"busy"},
        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("flying_land")
            inst.components.health:SetInvincible(true)
        end,
        
        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
            inst.components.health:SetInvincible(false)
        end,
        
        events =
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },

    State{
        name = "powerup",
        tags = {"busy"},
        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("powerup")
            inst.components.health:SetInvincible(true)
        end,
        
        onexit = function(inst)
            inst.components.health:SetInvincible(false)
            
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },
    State{
        name = "powerdown",
        tags = {"busy"},
        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("powerdown")
            inst.components.health:SetInvincible(true)
        end,
        
        onexit = function(inst)
            inst.components.health:SetInvincible(false)
            
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },

    State{
        name = "electrocute",
        tags = {"busy"},
        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("shock")
            inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
            inst.fx = SpawnPrefab("shock_fx")

            inst.fx.Transform:SetRotation(inst.Transform:GetRotation())

            local pos = inst:GetPosition()
            inst.fx.Transform:SetPosition(pos.x, pos.y, pos.z)
            if inst.prefab ~= "wx78" then
                inst.Light:Enable(true)
            end
            if inst.prefab ~= "wes" then
                local sound_name = inst.soundsname or inst.prefab
                local path = inst.talker_path_override or "dontstarve/characters/"
                local equippedHat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
                if equippedHat and equippedHat:HasTag("muffler") then
                    inst.SoundEmitter:PlaySound(path..sound_name.."/gasmask_hurt")
                else
                    local sound_event = path..sound_name.."/hurt"
                    inst.SoundEmitter:PlaySound(inst.hurtsoundoverride or sound_event)
                end
            end
        end,

        onexit = function(inst)
            if inst.prefab ~= "wx78" then
                inst.Light:Enable(false)
            end
            inst.AnimState:ClearBloomEffectHandle()
            inst.fx:Remove()
        end,
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("electrocute_pst")
            end),
        },
    },
    State{
        name = "electrocute_pst",
        tags = {"busy"},
        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("shock_pst")
        end,
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle") 
            end),
        },
    },

    
    State{
        name = "caveenter",
        
        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("enter")
            inst.components.health:SetInvincible(true)
        end,
        
        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
            inst.components.health:SetInvincible(false)
        end,
        
        timeline=
        {
            TimeEvent(11*FRAMES, function(inst) 
                inst.SoundEmitter:PlaySound("dontstarve/movement/bodyfall_dirt")
            end),
		},        
        
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },

    },    
    
    State{
        name = "failadventure",
        
        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("wakeup")
        end,
        
        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
            inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_ADVENTUREFAIL"))
        end,
        
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },

    },    
    
    State{
        name = "rebirth",
        
        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("rebirth")
            
            inst.components.hunger:Pause()
            for k,v in pairs(statue_symbols) do
                inst.AnimState:OverrideSymbol(v, "wilsonstatue", v)
            end
        end,
        
        timeline=
        {
            TimeEvent(16*FRAMES, function(inst) 
                inst.SoundEmitter:PlaySound("dontstarve/common/dropwood")
            end),
            TimeEvent(45*FRAMES, function(inst) 
                inst.SoundEmitter:PlaySound("dontstarve/common/dropwood")
            end),
            TimeEvent(92*FRAMES, function(inst) 
                inst.SoundEmitter:PlaySound("dontstarve/common/rebirth")
            end),
        },
        
        onexit = function(inst)
            inst.components.hunger:Resume()
            for k,v in pairs(statue_symbols) do
                inst.AnimState:ClearOverrideSymbol(v)
            end
        
            inst.components.playercontroller:Enable(true)
        end,
        
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },

    },    

    State{
        name = "sleep",
        
        onenter = function(inst)
            inst.AnimState:PlayAnimation("sleep")
            inst.components.playercontroller:Enable(false)
        --    inst.components.health:SetInvincible(true)
        end,

        onexit=function(inst)
        --    inst.components.health:SetInvincible(false)
            inst.components.playercontroller:Enable(true)
        end,

    },

    State{
        name = "sleepin",
        
        onenter = function(inst)
            inst.AnimState:PlayAnimation("sleep")
            inst.components.locomotor:Stop()
            --inst.Controller:Enable(false)
            --inst.AnimState:Hide()
            inst:PerformBufferedAction()             
        end,
        
        onexit= function(inst)
            --inst.Controller:Enable(true)
            --inst.AnimState:Show()
        end,

    },
    
    State{
        name = "death_instant",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.last_death_position = inst:GetPosition()
            inst.AnimState:Hide("swap_arm_carry")
            inst.AnimState:PlayAnimation("death")
            inst.AnimState:SetTime(10)
        end,
    },

    State{
        name = "death",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.last_death_position = inst:GetPosition()
            inst.AnimState:Hide("swap_arm_carry")
            inst.AnimState:PlayAnimation("death")
        end,
    },

    State{
        name = "death_boat",
        tags = {"busy"},

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.Physics:Stop()
            inst.last_death_position = inst:GetPosition()
            inst.AnimState:Hide("swap_arm_carry")
            inst.AnimState:PlayAnimation("boat_death")

            local death_fx = SpawnPrefab("boat_death")
            death_fx.Transform:SetPosition(inst:GetPosition():Get())


            local sound_name = inst.soundsname or inst.prefab
            local path =  "dontstarve_DLC002/characters/vanilla/"
            if inst.prefab ~= "wes" then
                inst.SoundEmitter:PlaySound(path..sound_name.."_drown_voice")
            end
        end,

        onexit= function(inst) 
            inst.DynamicShadow:Enable(true) 
        end,

        timeline=
        {
            TimeEvent(50*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/boat_sinking_shadow")
            end),
            TimeEvent(70*FRAMES, function(inst)
                inst.DynamicShadow:Enable(false)
            end),
        },
    },

     State{
        name = "werebeaver_death_boat",
        tags = {"busy"},

        onenter = function(inst)
            --inst.components.driver:SplitFromVehicle()
            --inst.components.driver:CombineWithVehicle()
            inst.components.locomotor:Stop()
            inst.last_death_position = inst:GetPosition()
            inst.AnimState:SetBuild("werebeaver_boat_death") --This animation is in it's own build and bank because?
            inst.AnimState:SetBank("werebeaver_boat_death") -- It gets set back in the resurrectable component, kind of ugly 
            inst.AnimState:PlayAnimation("boat_death")
            inst.SoundEmitter:PlaySound("dontstarve_DLC002/characters/woody/warebeaver_sinking_death")
        end,

        onexit= function(inst) 
            inst.DynamicShadow:Enable(true) 
        end,

        timeline=
        {
            TimeEvent(70*FRAMES, function(inst)
                inst.DynamicShadow:Enable(false)
            end),
        },
    },

   State{
        name = "idle",
        tags = {"idle", "canrotate"},
        onenter = function(inst, pushanim)
            
            inst.components.locomotor:Stop()

            local equippedArmor = inst.components.inventory and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.BODY)

            -- if equippedArmor and equippedArmor:HasTag("shell") then
            --     inst.sg:GoToState("shell_enter")
            --     return
            -- end
            
    --         local equippedHat = inst.components.inventory and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    --         if equippedHat and equippedHat:HasTag("hide") then
				-- inst.sg:GoToState("hide")
				-- return
    --         end
            
            if equippedArmor and equippedArmor:HasTag("band") then
                inst.sg:GoToState("enter_onemanband")
                return
            end

            local anims = {}
            
            local anim = "idle_loop"
            
            if not inst.components.sanity:IsSane() then
				table.insert(anims, "idle_sanity_pre")
				table.insert(anims, "idle_sanity_loop")
            elseif inst.components.temperature:IsFreezing() then
				table.insert(anims, "idle_shiver_pre")
				table.insert(anims, "idle_shiver_loop")
            elseif inst.components.temperature:IsOverheating() then
                table.insert(anims, "idle_hot_pre")
                table.insert(anims, "idle_hot_loop")
			elseif inst:HasTag("groggy") then
                table.insert(anims, "idle_groggy_pre")
                table.insert(anims, "idle_groggy")  
			elseif inst:HasTag("groggy_2") then
                table.insert(anims, "idle_groggy_pre")
                table.insert(anims, "idle_groggy")  
			elseif inst:HasTag("heavy_chest") then
                table.insert(anims, "idle_groggy_pre")
                table.insert(anims, "idle_groggy")  
			elseif inst.rainy_day then
                table.insert(anims, "idle_groggy_pre")
                table.insert(anims, "idle_groggy")			
            else
				table.insert(anims, "idle_loop")
            end
            
            if pushanim then
                for k,v in pairs (anims) do
					inst.AnimState:PushAnimation(v, k == #anims)
				end
            else
                inst.AnimState:PlayAnimation(anims[1], #anims == 1)
                for k,v in pairs (anims) do
					if k > 1 then
						inst.AnimState:PushAnimation(v, k == #anims)
					end
				end
            end
            
            inst.sg:SetTimeout(math.random()*4+2)
        end,
        
        ontimeout= function(inst)
            if inst.components.temperature:GetCurrent() > 70 then
                return 
            end
            inst.sg:GoToState("funnyidle")
        end,
    },

    State{
        
        name = "funnyidle",
        tags = {"idle", "canrotate"},
        onenter = function(inst)
        
            if inst.components.poisonable:IsPoisoned() then
                inst.AnimState:PlayAnimation("idle_poison_pre")
                inst.AnimState:PushAnimation("idle_poison_loop")
                inst.AnimState:PushAnimation("idle_poison_pst", false)
			elseif inst.components.temperature:GetCurrent() < 10 then
				inst.AnimState:PlayAnimation("idle_shiver_pre")
				inst.AnimState:PushAnimation("idle_shiver_loop")
				inst.AnimState:PushAnimation("idle_shiver_pst", false)
            elseif inst.components.temperature:GetCurrent() > 60 then
                --plug in overheats once they're done
                inst.AnimState:PlayAnimation("idle_hot_pre")
                inst.AnimState:PushAnimation("idle_hot_loop")
                inst.AnimState:PushAnimation("idle_hot_pst", false)
			elseif inst.components.hunger:GetPercent() < TUNING.HUNGRY_THRESH then
                inst.AnimState:PlayAnimation("hungry")
                inst.SoundEmitter:PlaySound("dontstarve/wilson/hungry")    
			elseif inst:HasTag("groggy") or inst:HasTag("groggy_2") or inst:HasTag("heavy_chest") then
                inst.AnimState:PlayAnimation("idle_groggy01_pre")
                inst.AnimState:PushAnimation("idle_groggy01_loop")
                inst.AnimState:PushAnimation("idle_groggy01_pst", false)	
            elseif inst.components.sanity:GetPercent() < .05 then
				inst.AnimState:PlayAnimation("idle_inaction_sanity")
            else
                inst.AnimState:PlayAnimation("idle_inaction")
            end
        end,

        events=
        {
            EventHandler("animqueueover", function(inst) inst.sg:GoToState("idle") end ),
        },
        
    },
    
    
    State{ name = "chop_start",
        tags = {"prechop", "chopping", "working"},
        onenter = function(inst)
				local weapon = inst.components.combat and inst.components.combat:GetWeapon()
					if weapon and weapon:HasTag("phoenix_axe") and weapon.pick then
					inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe", "phoenixaxe")
					end
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation(inst.prefab == "woodie" and "woodie_chop_pre" or "chop_pre")
        end,
        
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) inst.sg:GoToState("chop") end),
        },
		onexit = function(inst)
 			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("phoenix_axe") and weapon.pick and not weapon.broken then  
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe2", "phoenixaxe")
			elseif weapon and weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe_broken", "phoenixaxe")
			end
        end
    },
    
    State{
        name = "chop",
        tags = {"prechop", "chopping", "working"},
        onenter = function(inst)
		local weapon = inst.components.combat and inst.components.combat:GetWeapon()
					if weapon and weapon:HasTag("phoenix_axe") and weapon.pick then
					inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe", "phoenixaxe")
					end
			inst.sg.statemem.action = inst:GetBufferedAction()
            inst.AnimState:PlayAnimation(inst.prefab == "woodie" and "woodie_chop_loop" or "chop_loop")            
        end,
        
        timeline=
        {
            TimeEvent(2*FRAMES, function(inst) 
                if inst.prefab == "woodie" then
                    inst:PerformBufferedAction() 
                end
            end),

            TimeEvent(5*FRAMES, function(inst)
                if inst.prefab == "woodie" then
                    inst.sg:RemoveStateTag("prechop")
                end
            end),

            TimeEvent(10*FRAMES, function(inst)
                if inst.prefab == "woodie" and
                   (TheInput:IsControlPressed(CONTROL_PRIMARY) or TheInput:IsControlPressed(CONTROL_ACTION) or TheInput:IsControlPressed(CONTROL_CONTROLLER_ACTION)) and 
                    inst.sg.statemem.action and 
                    inst.sg.statemem.action:IsValid() and 
                    inst.sg.statemem.action.target and 
                    inst.sg.statemem.action.target:IsActionValid(inst.sg.statemem.action.action) and 
                    inst.sg.statemem.action.target.components.workable then
                        inst:ClearBufferedAction()
                        inst:PushBufferedAction(inst.sg.statemem.action)
                end
            end),

            
            TimeEvent(5*FRAMES, function(inst) 
                if inst.prefab ~= "woodie" then
                    inst:PerformBufferedAction() 
                end
            end),


            TimeEvent(9*FRAMES, function(inst)
                if inst.prefab ~= "woodie" then
                    inst.sg:RemoveStateTag("prechop")
                end
            end),
            
            TimeEvent(14*FRAMES, function(inst)
                if inst.prefab ~= "woodie" and
                    (TheInput:IsMouseDown(MOUSEBUTTON_LEFT) or TheInput:IsControlPressed(CONTROL_ACTION) or TheInput:IsControlPressed(CONTROL_CONTROLLER_ACTION)) and 
                    inst.sg.statemem.action and 
                    inst.sg.statemem.action:IsValid() and 
                    inst.sg.statemem.action.target and 
                    inst.sg.statemem.action.target:IsActionValid(inst.sg.statemem.action.action) and 
                    inst.sg.statemem.action.target.components.workable then
                        inst:ClearBufferedAction()
                        inst:PushBufferedAction(inst.sg.statemem.action)
                end
            end),

            TimeEvent(16*FRAMES, function(inst) 
                inst.sg:RemoveStateTag("chopping")
				local weapon = inst.components.combat and inst.components.combat:GetWeapon()
				if weapon and weapon:HasTag("musha_items") and weapon.components.fueled and not weapon.broken then
				weapon.components.fueled:DoDelta(-80000)
				elseif weapon and weapon:HasTag("musha_items") and weapon.components.fueled and weapon.broken then
				local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
				if item then
				inst.sg:GoToState("hit")
				inst.components.inventory:Unequip(EQUIPSLOTS.HANDS, true) 
				inst.components.inventory:GiveItem(item)
				end
				end
            end),

        },
        
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) 
                --inst.AnimState:PlayAnimation("chop_pst") 
                inst.sg:GoToState("idle")
			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("phoenix_axe") and weapon.pick and not weapon.broken then   
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe2", "phoenixaxe")
			elseif weapon and weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe_broken", "phoenixaxe")
			end
				
            end ),

        },  
		onexit = function(inst)
 			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("phoenix_axe") and weapon.pick and not weapon.broken then  
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe2", "phoenixaxe")
			elseif weapon and weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe_broken", "phoenixaxe")
			end
        end	
    },


      State{ name = "hack_start",
        tags = {"prehack", "hacking", "working"},
        onenter = function(inst)
		local weapon = inst.components.combat and inst.components.combat:GetWeapon()
        if weapon and not weapon:HasTag("fire_spear") then
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("chop_pre")
		end	
        end,
        
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) inst.sg:GoToState("hack") end),
        },
    },
    
    State{
        name = "hack",
        tags = {"prehack", "hacking", "working"},
        onenter = function(inst)
            inst.sg.statemem.action = inst:GetBufferedAction()
            inst.AnimState:PlayAnimation("chop_loop")            
        end,
        
        timeline=
        {
                       
            TimeEvent(5*FRAMES, function(inst) 
                inst:PerformBufferedAction() 
            end),


            TimeEvent(9*FRAMES, function(inst)
                inst.sg:RemoveStateTag("prehack")
				local weapon = inst.components.combat and inst.components.combat:GetWeapon()
				if weapon and weapon:HasTag("musha_items") and weapon.components.fueled and not weapon.broken then
				weapon.components.fueled:DoDelta(-80000)
				elseif weapon and weapon:HasTag("musha_items") and weapon.components.fueled and weapon.broken then
				local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
				if item then
				inst.sg:GoToState("hit")
				inst.components.inventory:Unequip(EQUIPSLOTS.HANDS, true) 
				inst.components.inventory:GiveItem(item)
				end
				end
            end),
            
            TimeEvent(14*FRAMES, function(inst)
                    if (TheInput:IsMouseDown(MOUSEBUTTON_LEFT) or TheInput:IsControlPressed(CONTROL_ACTION) or TheInput:IsControlPressed(CONTROL_CONTROLLER_ACTION)) and 
                    inst.sg.statemem.action and 
                    inst.sg.statemem.action:IsValid() and 
                    inst.sg.statemem.action.target and 
                    inst.sg.statemem.action.target:IsActionValid(inst.sg.statemem.action.action) and 
                    inst.sg.statemem.action.target.components.hackable then
                        inst:ClearBufferedAction()
                        inst:PushBufferedAction(inst.sg.statemem.action)
                end
            end),

            TimeEvent(16*FRAMES, function(inst) 
                inst.sg:RemoveStateTag("hacking")
            end),

        },
        
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) 
                --inst.AnimState:PlayAnimation("chop_pst") 
                inst.sg:GoToState("idle")
            end ),
            
        },        
    },
    
    
    State{ name = "mine_start",
        tags = {"premine", "working"},
        onenter = function(inst)
		local weapon = inst.components.combat and inst.components.combat:GetWeapon()
					if weapon and weapon:HasTag("phoenix_axe") and weapon.axe then
					inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe2", "phoenixaxe")
					end
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("pickaxe_pre")
        end,
        
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) inst.sg:GoToState("mine") end),
        },
		onexit = function(inst)
 			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("phoenix_axe") and weapon.axe and not weapon.broken then  
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe", "phoenixaxe")
			elseif weapon and weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe_broken", "phoenixaxe")
			end
        end
    },
    
    State{
        name = "mine",
        tags = {"premine", "mining", "working"},
        onenter = function(inst)
		local weapon = inst.components.combat and inst.components.combat:GetWeapon()
					if weapon and weapon:HasTag("phoenix_axe") and weapon.axe then
					inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe2", "phoenixaxe")
					end
			inst.sg.statemem.action = inst:GetBufferedAction()
            inst.AnimState:PlayAnimation("pickaxe_loop")
        end,

        timeline=
        {
            TimeEvent(9*FRAMES, function(inst) 
                if inst.sg.statemem.action and inst.sg.statemem.action.target then
					local fx = SpawnPrefab("mining_fx")
					fx.Transform:SetPosition(inst.sg.statemem.action.target:GetPosition():Get())
				end
                inst:PerformBufferedAction() 
                inst.sg:RemoveStateTag("premine") 
				local weapon = inst.components.combat and inst.components.combat:GetWeapon()
				local weapon = inst.components.combat and inst.components.combat:GetWeapon()
				if weapon and weapon:HasTag("musha_items") and weapon.components.fueled and not weapon.broken then
				weapon.components.fueled:DoDelta(-80000)
				elseif weapon and weapon:HasTag("musha_items") and weapon.components.fueled and weapon.broken then
				local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
				if item then
				inst.sg:GoToState("hit")
				inst.components.inventory:Unequip(EQUIPSLOTS.HANDS, true) 
				inst.components.inventory:GiveItem(item)
				end
				end
                if inst.sg.statemem.action and inst.sg.statemem.action.target and inst.sg.statemem.action.target.prefab == "rock_ice" then
                    inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/iceboulder_hit")
                elseif inst.sg.statemem.action and inst.sg.statemem.action.target and inst.sg.statemem.action.target.prefab == "coralreef" then
                    inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/coral_hit_mine_pick")
                elseif inst.sg.statemem.action and inst.sg.statemem.action.target and inst.sg.statemem.action.target.prefab == "rock_charcoal" then
                    inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/charcoal_mine")
                else
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/use_pick_rock")
                end
            end),
            
            TimeEvent(14*FRAMES, function(inst)
				if (TheInput:IsControlPressed(CONTROL_PRIMARY) or
				   TheInput:IsControlPressed(CONTROL_ACTION)  or TheInput:IsControlPressed(CONTROL_CONTROLLER_ACTION)) and 
					inst.sg.statemem.action and 
					inst.sg.statemem.action.target and 
					inst.sg.statemem.action.target:IsActionValid(inst.sg.statemem.action.action) and 
					inst.sg.statemem.action.target.components.workable then
						inst:ClearBufferedAction()
						inst:PushBufferedAction(inst.sg.statemem.action)
				end
            end),
            
        },
        
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) 
                inst.AnimState:PlayAnimation("pickaxe_pst") 
                inst.sg:GoToState("idle", true)
				local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("phoenix_axe") and weapon.axe then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe", "phoenixaxe")
			elseif weapon and weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe_broken", "phoenixaxe")
			end
            end ),
            
        }, 
		onexit = function(inst)
 			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("phoenix_axe") and weapon.axe and not weapon.broken then  
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe", "phoenixaxe")
			elseif weapon and weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe_broken", "phoenixaxe")
			end
        end		
    },
    
    
    State{ name = "hammer_start",
        tags = {"prehammer", "working"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("pickaxe_pre")
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("hammer") end),
        },
    },
    
    State{
        name = "hammer",
        tags = {"prehammer", "hammering", "working"},
        onenter = function(inst)
			inst.sg.statemem.action = inst:GetBufferedAction()
            inst.AnimState:PlayAnimation("pickaxe_loop")
        end,

        timeline=
        {
            TimeEvent(9*FRAMES, function(inst) 
                inst:PerformBufferedAction() 
                inst.sg:RemoveStateTag("prehammer") 
                inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")
				local weapon = inst.components.combat and inst.components.combat:GetWeapon()
				if weapon and weapon:HasTag("musha_items") and weapon.components.fueled and not weapon.broken then
				weapon.components.fueled:DoDelta(-80000)
				elseif weapon and weapon:HasTag("musha_items") and weapon.components.fueled and weapon.broken then
				local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
				if item then
				inst.sg:GoToState("hit")
				inst.components.inventory:Unequip(EQUIPSLOTS.HANDS, true) 
				inst.components.inventory:GiveItem(item)
				end
				end
            end),
            
            TimeEvent(14*FRAMES, function(inst)
            
				if (TheInput:IsControlPressed(CONTROL_SECONDARY) or
				   TheInput:IsControlPressed(CONTROL_ACTION) or TheInput:IsControlPressed(CONTROL_CONTROLLER_ALTACTION)) and 
					inst.sg.statemem.action and 
					inst.sg.statemem.action.target and 
					inst.sg.statemem.action.target:IsActionValid(inst.sg.statemem.action.action, true) and 
					inst.sg.statemem.action.target.components.workable then
						inst:ClearBufferedAction()
						inst:PushBufferedAction(inst.sg.statemem.action)
				end
            end),
            
        },
        
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) 
                inst.AnimState:PlayAnimation("pickaxe_pst") 
                inst.sg:GoToState("idle", true)
            end ),
        },        
    }, 
    
    State{
        name = "hide",
        tags = {"idle", "hiding"},
        onenter = function(inst)
            
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("hide")
			inst.SoundEmitter:PlaySound("dontstarve/movement/foley/hidebush")
            inst:AddTag("notarget")
        end,
        
        onexit = function(inst)
            inst:RemoveTag("notarget")
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("hide_idle") end),
        },
    },

    State{
        name = "hide_idle",
        tags = {"idle", "hiding"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("hide_idle", true)
            inst:AddTag("notarget")
        end,
        
        onexit = function(inst)
            inst:RemoveTag("notarget")
        end,
        
    },

    State{
        name = "shell_enter",
        tags = {"idle", "hiding", "shell"},
        onenter = function(inst)            
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("hideshell")
            
        end,
        timeline =
        {
            TimeEvent(6*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/movement/foley/hideshell")    
            end),
        },        
        
        onexit = function(inst)

        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("shell_idle") end),
        },
    },

    State{
        name = "shell_idle",
        tags = {"idle", "hiding", "shell"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("hideshell_idle", true)
        end,
        
        onexit = function(inst)
        end,
        
    },

    State{
        name = "shell_hit",
        tags = {"busy", "hiding", "shell"},
        
        onenter = function(inst)
            inst:ClearBufferedAction()
            inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")        
            inst.AnimState:PlayAnimation("hitshell")
            --local sound_name = inst.soundsname or inst.prefab
            --local sound_event = "dontstarve/characters/"..sound_name.."/hurt"
            --inst.SoundEmitter:PlaySound(sound_event)
            inst.components.locomotor:Stop()         
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("shell_idle") end ),
        }, 
        
        timeline =
        {
            TimeEvent(3*FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
            end),
        },        
               
    },

	State{ name = "terraform",
		tags = {"busy"},
		
		onenter = function(inst)
			inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("shovel_pre")
			inst.AnimState:PushAnimation("shovel_loop")
			inst.AnimState:PushAnimation("shovel_pst", false)
		end,
		
        timeline=
        {
            TimeEvent(25*FRAMES, function(inst) 
                inst:PerformBufferedAction() 
                inst.sg:RemoveStateTag("busy") 
                inst.SoundEmitter:PlaySound("dontstarve/wilson/dig")
            end),
		},
        
        events=
        {
            EventHandler("animqueueover", function(inst) inst.sg:GoToState("idle") end),
        },
	},
	
	State{ name = "dig_start",
        tags = {"predig", "working"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
		local weapon = inst.components.combat and inst.components.combat:GetWeapon()
            if weapon and weapon:HasTag("frost_spear") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear_2r", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			end
            inst.AnimState:PlayAnimation("shovel_pre")
        end,
        
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) inst.sg:GoToState("dig") end),
        },
		
		onexit = function(inst)
 			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("frost_spear") then 
			if weapon:HasTag("frost_spear") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear2", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			else
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			end
			end
        end
    },
    
    State{
        name = "dig",
        tags = {"predig", "digging", "working"},
        onenter = function(inst)
			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
            if weapon and weapon:HasTag("frost_spear") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear_2r", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			end
            inst.AnimState:PlayAnimation("shovel_loop")
			inst.sg.statemem.action = inst:GetBufferedAction()
        end,

        timeline=
        {
            TimeEvent(15*FRAMES, function(inst) 
--[[                if inst.sg.statemem.action and inst.sg.statemem.action.target then
					local fx = SpawnPrefab("shovel_dirt")
					fx.Transform:SetPosition( inst.sg.statemem.action.target.Transform:GetWorldPosition() )
				end
--]]                
                inst:PerformBufferedAction() 
                inst.sg:RemoveStateTag("predig") 
                inst.SoundEmitter:PlaySound("dontstarve/wilson/dig")
				local weapon = inst.components.combat and inst.components.combat:GetWeapon()
				if weapon and weapon:HasTag("musha_items") and weapon.components.fueled and not weapon.broken then
				weapon.components.fueled:DoDelta(-80000)
				elseif weapon and weapon:HasTag("musha_items") and weapon.components.fueled and weapon.broken then
				local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
				if item then
				inst.sg:GoToState("hit")
				inst.components.inventory:Unequip(EQUIPSLOTS.HANDS, true) 
				inst.components.inventory:GiveItem(item)
				end
				end              
            end),
            
            TimeEvent(35*FRAMES, function(inst)
				if (TheInput:IsMouseDown(MOUSEBUTTON_RIGHT) or
				   TheInput:IsControlPressed(CONTROL_ACTION)  or TheInput:IsControlPressed(CONTROL_CONTROLLER_ACTION)) and 
					inst.sg.statemem.action and 
					inst.sg.statemem.action.target and 
					inst.sg.statemem.action.target:IsActionValid(inst.sg.statemem.action.action, true) and
					inst.sg.statemem.action.target.components.workable then
						inst:ClearBufferedAction()
						inst:PushBufferedAction(inst.sg.statemem.action)
				end
            end),
            
        },
        
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) 
                inst.AnimState:PlayAnimation("shovel_pst") 
                inst.sg:GoToState("idle", true)
            end ),
            
        },        
		onexit = function(inst)
 			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("frost_spear") then 
			if weapon:HasTag("frost_spear") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear2", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			else
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			end
			end
        end
    },       

   State{ name = "bugnet_start",
        tags = {"prenet", "working"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("bugnet_pre")
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("bugnet") end),
        },
    },
    
    State{
        name = "bugnet",
        tags = {"prenet", "netting", "working"},
        onenter = function(inst)
            inst.AnimState:PlayAnimation("bugnet")
            inst.SoundEmitter:PlaySound("dontstarve/wilson/use_bugnet")
        end,

        timeline=
        {
            TimeEvent(10*FRAMES, function(inst) 
                inst:PerformBufferedAction() 
                inst.sg:RemoveStateTag("prenet") 
                inst.SoundEmitter:PlaySound("dontstarve/wilson/dig")
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst) 
                inst.sg:GoToState("idle", true)
            end ),
        },        
    },       
    
    State {
        name = "fish_ocean",
        tags = {"busy", "fishing"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:Hide("RIPPLES")
            inst.AnimState:PlayAnimation("fishing_pre") --24
            inst.AnimState:PushAnimation("fishing_idle") --38
            inst.AnimState:PushAnimation("fishing_idle") 
            inst.AnimState:PushAnimation("bite_heavy_pre") --4
            inst.AnimState:PushAnimation("bite_heavy_loop") --13
            inst.AnimState:PushAnimation("bite_heavy_loop")
            inst.AnimState:PushAnimation("fish_catch", false) --13
        end,

        timeline = 
        {
            TimeEvent(13*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_cast") end),
            TimeEvent(15*FRAMES, function(inst) inst:PerformBufferedAction() end),
            
            TimeEvent(24*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_baitsplash") end),

            TimeEvent(100*FRAMES, function(inst) 
                inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_fishinwater", "splash")
                inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_strain", "strain")
            end),
            
            TimeEvent(130*FRAMES, function(inst) 
                inst.SoundEmitter:KillSound("splash")
                inst.SoundEmitter:KillSound("strain")
            end),

            TimeEvent(138*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_fishcaught") end),

            TimeEvent(143*FRAMES, function(inst) inst.sg:RemoveStateTag("fishing") end),
            TimeEvent(149*FRAMES, function(inst)
                local equippedTool = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
                if equippedTool and equippedTool.components.fishingrod then
                    equippedTool.components.fishingrod:CollectFlotsam()
                end
            end),
        },

        events =
        {
            EventHandler("animqueueover", function(inst) inst.sg:GoToState("idle") end),
        },

    },
    
   State{ name = "fishing_pre",
        tags = {"prefish", "fishing"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("fishing_pre")
        end,
        
        timeline = 
        {
            TimeEvent(13*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_cast") end),
            TimeEvent(15*FRAMES, function(inst) inst:PerformBufferedAction() end),
        },
        
        events=
        {
            EventHandler("animover", function(inst) 
                inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_baitsplash")
                inst.sg:GoToState("fishing")
            end ),
        },        
    },
    
    State{
        name = "fishing",
        tags = {"fishing"},
        onenter = function(inst, pushanim)
            if pushanim then
                if type(pushanim) == "string" then
                    inst.AnimState:PlayAnimation(pushanim)
                end
                inst.AnimState:PushAnimation("fishing_idle", true)
            else
                inst.AnimState:PlayAnimation("fishing_idle", true)
            end
            local equippedTool = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if equippedTool and equippedTool.components.fishingrod then
                equippedTool.components.fishingrod:WaitForFish()
            end
        end,
        
        events=
        {
            EventHandler("fishingnibble", function(inst) inst.sg:GoToState("fishing_nibble") end ),
            EventHandler("fishingloserod", function(inst) inst.sg:GoToState("loserod")end),
        },
    },
    
    State{ name = "fishing_pst",
        tags = {},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("fishing_pst")
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },
    },
    
    State{
        name = "fishing_nibble",
        tags = {"fishing", "nibble"},
        onenter = function(inst)
            inst.AnimState:PlayAnimation("bite_light_pre")
            inst.AnimState:PushAnimation("bite_light_loop", true)
            inst.sg:SetTimeout(1 + math.random())
            inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_fishinwater", "splash")
        end,
        
        onexit = function(inst)
            inst.SoundEmitter:KillSound("splash")
        end,
        
        ontimeout = function(inst)
            inst.sg:GoToState("fishing", "bite_light_pst")
        end,
        
        events = 
        {
            EventHandler("fishingstrain", function(inst) inst.sg:GoToState("fishing_strain") end),
        },
    }, 
    
    State{
        name = "fishing_strain",
        tags = {"fishing"},
        onenter = function(inst)
            inst.AnimState:PlayAnimation("bite_heavy_pre")
            inst.AnimState:PushAnimation("bite_heavy_loop", true)
            inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_fishinwater", "splash")
            inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_strain", "strain")
        end,
        
        onexit = function(inst)
            inst.SoundEmitter:KillSound("splash")
            inst.SoundEmitter:KillSound("strain")
        end,
        
        events = 
        {
            EventHandler("fishingcatch", function(inst, data)
                inst.sg:GoToState("catchfish", data.build)
            end),
            EventHandler("fishingloserod", function(inst)
                inst.sg:GoToState("loserod")
            end),

        },
    },
    
    State{
        name = "catchfish",
        tags = {"fishing", "catchfish", "busy"},
        onenter = function(inst, build)
            inst.AnimState:PlayAnimation("fish_catch")
            print("Using ", build, " to swap out fish01")
            inst.AnimState:OverrideSymbol("fish01", build, "fish01")
            
            -- inst.AnimState:OverrideSymbol("fish_body", build, "fish_body")
            -- inst.AnimState:OverrideSymbol("fish_eye", build, "fish_eye")
            -- inst.AnimState:OverrideSymbol("fish_fin", build, "fish_fin")
            -- inst.AnimState:OverrideSymbol("fish_head", build, "fish_head")
            -- inst.AnimState:OverrideSymbol("fish_mouth", build, "fish_mouth")
            -- inst.AnimState:OverrideSymbol("fish_tail", build, "fish_tail")
        end,
        
        onexit = function(inst)
            inst.AnimState:ClearOverrideSymbol("fish01")
            -- inst.AnimState:ClearOverrideSymbol("fish_body")
            -- inst.AnimState:ClearOverrideSymbol("fish_eye")
            -- inst.AnimState:ClearOverrideSymbol("fish_fin")
            -- inst.AnimState:ClearOverrideSymbol("fish_head")
            -- inst.AnimState:ClearOverrideSymbol("fish_mouth")
            -- inst.AnimState:ClearOverrideSymbol("fish_tail")
        end,

        timeline=
        {
            TimeEvent(8*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_fishcaught") end),
            TimeEvent(10*FRAMES, function(inst) inst.sg:RemoveStateTag("fishing") end),
            TimeEvent(23*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_fishland") end),
            TimeEvent(24*FRAMES, function(inst)
                local equippedTool = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
                if equippedTool and equippedTool.components.fishingrod then
                    equippedTool.components.fishingrod:Collect()
                end
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst) 
                inst.sg:GoToState("idle")
            end ),
        },        
    },       
    
    State{
        name = "loserod",
        tags = {"busy"},
        onenter = function(inst)
            local equippedTool = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if equippedTool and equippedTool.components.fishingrod then
                equippedTool.components.fishingrod:Release()
                equippedTool:Remove()
            end
            inst.AnimState:PlayAnimation("fish_nocatch")
        end,

        timeline=
        {
            TimeEvent(4*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/fishingpole_lostrod") end),
        },
        
        events=
        {
            EventHandler("animover", function(inst) 
                inst.sg:GoToState("idle")
            end ),
        },        
    },       
    
    
    State{
        name = "eat",
        tags ={"busy"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            local is_gear = inst:GetBufferedAction() and inst:GetBufferedAction().invobject and inst:GetBufferedAction().invobject.components.edible and inst:GetBufferedAction().invobject.components.edible.foodtype == "GEARS"

            if not is_gear then
                inst.SoundEmitter:PlaySound("dontstarve/wilson/eat", "eating")    
            end
			
				--[[inst:AddTag("sleep_visual")
                inst.AnimState:PlayAnimation("eat_pre")
                inst.AnimState:PushAnimation("eat", false)]]
			inst.AnimState:PlayAnimation("eat")
       
            inst.components.hunger:Pause()
        end,

       timeline =
        {
            TimeEvent(28 * FRAMES, function(inst)
                if inst.sg.statemem.feed ~= nil then
                    inst.components.eater:Eat(inst.sg.statemem.feed, inst.sg.statemem.feeder)
                else
                    inst:PerformBufferedAction()
                end
            end),

            TimeEvent(30 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
                inst.sg:RemoveStateTag("pausepredict")
            end),

            TimeEvent(70 * FRAMES, function(inst)
                inst.SoundEmitter:KillSound("eating")
            end),
        },

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },

        onexit = function(inst)
            inst.SoundEmitter:KillSound("eating")
            inst.components.hunger:Resume()
            if inst.sg.statemem.feed ~= nil and inst.sg.statemem.feed:IsValid() then
                inst.sg.statemem.feed:Remove()
            end
        end,
    },    
    
   State{
        name = "quickeat",
        tags ={"busy"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            local is_gear = inst:GetBufferedAction() and inst:GetBufferedAction().invobject and inst:GetBufferedAction().invobject.components.edible and inst:GetBufferedAction().invobject.components.edible.foodtype == "GEARS"
            if not is_gear then
                inst.SoundEmitter:PlaySound("dontstarve/wilson/eat", "eating")    
            end
			--[[inst:AddTag("sleep_visual")
                inst.AnimState:PlayAnimation("quick_eat_pre")
                inst.AnimState:PushAnimation("quick_eat", false)]]
			inst.AnimState:PlayAnimation("quick_eat")
 
            inst.components.hunger:Pause()
        end,

		timeline =
        {
            TimeEvent(12 * FRAMES, function(inst)
                if inst.sg.statemem.feed ~= nil then
                    inst.components.eater:Eat(inst.sg.statemem.feed, inst.sg.statemem.feeder)
                else
                    inst:PerformBufferedAction()
                end
                inst.sg:RemoveStateTag("busy")
            end),
        },

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },

        onexit = function(inst)
            inst.SoundEmitter:KillSound("eating")
            inst.components.hunger:Resume()
            if inst.sg.statemem.feed ~= nil and inst.sg.statemem.feed:IsValid() then
                inst.sg.statemem.feed:Remove()
            end
        end,
 
    },     
      
	State{
        name = "refuseeat",
        tags = { "busy" },

        onenter = function(inst)
			inst.components.locomotor:Stop()
			inst:AddTag("sleep_visual")
			inst.AnimState:PlayAnimation("refuseeat", true)
			inst.sg:SetTimeout(22 * FRAMES)

			if inst.princess_taste and inst.components.hunger.current > 180 then
			inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_FULLBELLY"))
			else
			inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_HATEFOOD"))
			end
			
        end,

 		timeline=
        {	
           
            TimeEvent(22*FRAMES, function( inst )
			inst.sg:RemoveStateTag("busy")
            end),
			
        },
 
        ontimeout = function(inst)
            inst.sg:GoToState("idle", true)
        end,

        onexit = function(inst)
            inst.SoundEmitter:KillSound("talk")
        end,
		events=
        {
            EventHandler("animqueueover", function(inst) inst.sg:GoToState("idle") end),
        },
    },
	
    State{
        name = "mindcontrol",
        tags = { "busy" },

        onenter = function(inst)
			inst.components.locomotor:Stop()
			inst:AddTag("sleep_visual")
			if not inst.AnimState:IsCurrentAnimation("channel_loop") then
                inst.AnimState:PlayAnimation("channel_loop", true)
				--inst.AnimState:PlayAnimation("channel_dial_loop", true)
            end
			
        end,

 		timeline=
        {	
            TimeEvent(12*FRAMES, function( inst )
			inst.sg:RemoveStateTag("busy")
            end),
            TimeEvent(22*FRAMES, function( inst )
			inst.AnimState:PlayAnimation("channel_loop", false)
            end),
			TimeEvent(24*FRAMES, function( inst )
			inst.AnimState:PlayAnimation("channel_pst")
            end),
        },
		
		EventHandler("animover", function(inst) if inst.AnimState:AnimDone() then inst.sg:GoToState("idle") end end ),
 
        ontimeout = function(inst)
  			inst.AnimState:PlayAnimation("channel_pst")
        end,
		
		events=
        {
            EventHandler("animover", function(inst) if inst.AnimState:AnimDone() then inst.sg:GoToState("idle") end end ),
        },

        onexit = function(inst)
            inst.SoundEmitter:KillSound("talk")
        end,
		events=
        {
            EventHandler("animqueueover", function(inst) inst.sg:GoToState("idle") end),
        },
    },
	
   State{
        name = "talk",
        tags = {"idle", "talking"},
        
        onenter = function(inst, noanim)
            inst.components.locomotor:Stop()
			
			if not noanim and inst.keep_check then
			for k = 1, math.random(2, 3) do
                local aname = "mime" .. tostring(math.random(7))
                if k == 1 then
                    inst.AnimState:PlayAnimation(aname, false)
                else
                    inst.AnimState:PushAnimation(aname, false)
                end
            end
			
            elseif not noanim and not inst.keep_check then
                inst.AnimState:PlayAnimation("dial_loop", true)
            end
            
            local sound_name = inst.soundsname or inst.prefab
            local path = inst.talker_path_override or "dontstarve/characters/"
            local equippedHat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
			
			if not inst.keep_check then
            if equippedHat and equippedHat:HasTag("muffler") then
                inst.SoundEmitter:PlaySound(path..sound_name.."/gasmask_talk", "talk")

            elseif inst.talksoundoverride and not inst.keep_check then
                inst.SoundEmitter:PlaySound(inst.talksoundoverride, "talk")
            else
                inst.SoundEmitter:PlaySound(path..sound_name.."/talk_LP", "talk")
            end
			end

            inst.sg:SetTimeout(1.5 + math.random()*.5)
        end,
        
        ontimeout = function(inst)
            inst.SoundEmitter:KillSound("talk")
            inst.sg:GoToState("idle")
        end,
        
        onexit = function(inst)
            inst.SoundEmitter:KillSound("talk")
        end,
        
        events=
        {
            EventHandler("donetalking", function(inst) inst.sg:GoToState("idle") end),
        },
    }, 
    
   State{
        name = "mime",
        tags = {"idle", "talking"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            
            
            for k = 1, math.random(2,3) do
				local aname = "mime" .. tostring(math.random(8))
				if k == 1 then
					inst.AnimState:PlayAnimation(aname, false)
				else
					inst.AnimState:PushAnimation(aname, false)
				end
            end
        end,
        
        events=
        {
            EventHandler("animqueueover", function(inst) inst.sg:GoToState("idle") end),
        },
    },           

    State{
        name = "doshortaction",
        tags = {"doing", "busy"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("pickup")
            inst.sg:SetTimeout(6*FRAMES)
        end,
        
        
        timeline=
        {
            TimeEvent(4*FRAMES, function( inst )
                inst.sg:RemoveStateTag("busy")
            end),
            TimeEvent(10*FRAMES, function( inst )
            inst.sg:RemoveStateTag("doing")
            inst.sg:AddStateTag("idle")
            end),
        },
        
        ontimeout = function(inst)
            inst:PerformBufferedAction()
            
        end,
        
        events=
        {
            EventHandler("animover", function(inst) if inst.AnimState:AnimDone() then inst.sg:GoToState("idle") end end ),
        },
    },
    
    
    State{
        name = "dolongaction",
        tags = {"doing", "busy"},
        
        timeline=
        {
            TimeEvent(4*FRAMES, function( inst )
                inst.sg:RemoveStateTag("busy")
            end),
        },
        
        onenter = function(inst, timeout)

            local targ = inst:GetBufferedAction() and inst:GetBufferedAction().target or nil
            if targ then targ:PushEvent("startlongaction") end
            
            inst.sg:SetTimeout(timeout or 1)
            inst.components.locomotor:Stop()
            inst.SoundEmitter:PlaySound("dontstarve/wilson/make_trap", "make")
            
            inst.AnimState:PlayAnimation("build_pre")
            inst.AnimState:PushAnimation("build_loop", true)
        end,
        
        ontimeout= function(inst)
            inst.AnimState:PlayAnimation("build_pst")
            inst.sg:GoToState("idle", false)
            inst:PerformBufferedAction()
        end,
        
        onexit= function(inst)
            inst.SoundEmitter:KillSound("make")
        end,
        
    },

    State{
        name = "makeballoon",
        tags = {"doing"},
        
        onenter = function(inst, timeout)
            
            inst.sg:SetTimeout(timeout or 1)
            inst.components.locomotor:Stop()
            inst.SoundEmitter:PlaySound("dontstarve/common/balloon_make", "make")
            inst.SoundEmitter:PlaySound("dontstarve/common/balloon_blowup")
            
            inst.AnimState:PlayAnimation("build_pre")
            inst.AnimState:PushAnimation("build_loop", true)
        end,
        
        ontimeout= function(inst)
            inst.AnimState:PlayAnimation("build_pst")
            inst.sg:GoToState("idle", false)
            inst:PerformBufferedAction()
        
        end,
        
        onexit= function(inst)
            inst.SoundEmitter:KillSound("make")
        end,
    },    
    
    State{
        name = "shave",
        tags = {"doing", "shaving"},
        
        onenter = function(inst)
            local timeout = 1
            inst.sg:SetTimeout(timeout)
            inst.components.locomotor:Stop()
            inst.SoundEmitter:PlaySound("dontstarve/wilson/shave_LP", "shave")
            
            inst.AnimState:PlayAnimation("build_pre")
            inst.AnimState:PushAnimation("build_loop", true)
        end,
        
        ontimeout = function(inst)
            inst:PerformBufferedAction()
            inst.AnimState:PlayAnimation("build_pst")
            inst.sg:GoToState("idle", false)
        end,
        
        onexit= function(inst)
            inst.SoundEmitter:KillSound("shave")
        end,
        
    },

   

    State{
        name = "enter_onemanband",
        tags = {"doing", "playing", "idle"},

        onenter = function(inst)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("idle_onemanband1_pre")
        inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
        end,

        onexit = function(inst)
        end,

        events = 
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("play_onemanband") end),
        },
    },

    State{
        name = "play_onemanband",
        tags = {"doing", "playing", "idle"},

        onenter = function(inst)

            inst.components.locomotor:Stop()
            --inst.AnimState:PlayAnimation("idle_onemanband1_pre")
            inst.AnimState:PlayAnimation("idle_onemanband1_loop")
            inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
        end,

        onexit = function(inst)
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if math.random() <= 0.15 then
                    inst.sg:GoToState("play_onemanband_stomp") -- go into stomp
                else
                    inst.sg:GoToState("play_onemanband")-- loop state again
                end
            end),
        },
    },

    State{
        name = "play_onemanband_stomp",
        tags = {"doing", "playing", "idle"},

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("idle_onemanband1_pst")
            inst.AnimState:PushAnimation("idle_onemanband2_pre")
            inst.AnimState:PushAnimation("idle_onemanband2_loop")
            inst.AnimState:PushAnimation("idle_onemanband2_pst", false)  
            inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") 
        end,

        onexit = function(inst)
        end,

        timeline=
        {
            TimeEvent(20*FRAMES, function( inst )
                inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")                
            end),

            TimeEvent(25*FRAMES, function( inst )
                inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")                
            end),
            
            TimeEvent(30*FRAMES, function( inst )
                inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")                
            end),

            TimeEvent(35*FRAMES, function( inst )
                inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")                
            end),
        },

        events = 
        {
            EventHandler("animqueueover", function(inst)
                inst.sg:GoToState("idle") 
            end),
        },
    },

    State{
        name = "play_flute",
        tags = {"doing", "playing"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("flute")
            local ba = inst:GetBufferedAction()
            inst.AnimState:OverrideSymbol("pan_flute01", ba.invobject.flutebuild or "pan_flute", ba.invobject.flutesymbol or "pan_flute01")
            inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.instrument then
                inst.components.inventory:ReturnActiveItem()
            end
        end,
        
        onexit = function(inst)
            inst.SoundEmitter:KillSound("flute")
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
        
        timeline=
        {
            TimeEvent(30*FRAMES, function(inst)
                local ba = inst:GetBufferedAction()
                if ba.invobject and ba.invobject.components.instrument and ba.invobject.components.instrument.sound then
                    inst.SoundEmitter:PlaySound(ba.invobject.components.instrument.sound, "flute")
                else
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/flute_LP", "flute")
                end
                inst:PerformBufferedAction()
            end),
            TimeEvent(85*FRAMES, function(inst)
                inst.SoundEmitter:KillSound("flute")
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },

    State{
        name = "play_horn",
        tags = {"doing", "playing"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("horn")

            local ba = inst:GetBufferedAction()
            inst.AnimState:OverrideSymbol("horn01", ba.invobject.hornbuild or "horn", ba.invobject.hornsymbol or "horn01")
            --inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.instrument then
                inst.components.inventory:ReturnActiveItem()
            end
        end,
        
        onexit = function(inst)
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
        
        timeline=
        {
            TimeEvent(21*FRAMES, function(inst)
                local ba = inst:GetBufferedAction()
                if ba.invobject and ba.invobject.components.instrument and ba.invobject.components.instrument.sound then
                    inst.SoundEmitter:PlaySound(ba.invobject.components.instrument.sound)
                else
                    inst.SoundEmitter:PlaySound("dontstarve/common/horn_beefalo")
                end
                inst:PerformBufferedAction()
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
  	    State{
        name = "peertelescope2",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
           -- inst.sg.statemem.action = inst:GetBufferedAction()
           -- local act = inst:GetBufferedAction()
			local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) 
		   	   if item and item.components.equippable then
				item.components.equippable:Unequip(inst)
				end
            inst:ForceFacePoint(inst.x, inst.y, inst.z)
            inst.components.playercontroller:Enable(false)
			inst.AnimState:OverrideSymbol("swap_object", "swap_telescope", "swap_object")
			inst.AnimState:Show("ARM_carry") 
            inst.AnimState:Hide("ARM_normal")
			
            inst.AnimState:PlayAnimation("telescope", false)
            inst.AnimState:PushAnimation("telescope_pst", false)

            inst.components.locomotor:Stop()
        end,

        timeline = 
        {
            TimeEvent(20*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/use_spyglass") end),
        },

        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
			inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
	           if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
				end
        end,

        events = {
            EventHandler("animover", function(inst)
                inst:PerformBufferedAction()
            end ),
            EventHandler("animqueueover", function(inst)
   
                inst.sg:GoToState("idle")

            end ),
        },
    },
    State{
        name = "play_flute2",
        tags = {"doing", "playing"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("flute")
            inst.AnimState:OverrideSymbol("pan_flute01", "pan_flute", "pan_flute01")
            inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.instrument then
                inst.components.inventory:ReturnActiveItem()
            end
        end,
        
        onexit = function(inst)
            inst.SoundEmitter:KillSound("flute")
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
        
        timeline=
        {
            TimeEvent(30*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/flute_LP", "flute")
                inst:PerformBufferedAction()
            end),
            TimeEvent(85*FRAMES, function(inst)
                inst.SoundEmitter:KillSound("flute")
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
    
    State{
        name = "play_horn2",
        tags = {"doing", "playing"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("horn")
            inst.AnimState:OverrideSymbol("horn01", "horn", "horn01")
            --inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.instrument then
                inst.components.inventory:ReturnActiveItem()
            end
        end,
        
        onexit = function(inst)
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
        
        timeline=
        {
            TimeEvent(21*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/horn_beefalo")
                inst:PerformBufferedAction()
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
	
	
    State{
        name = "play_bell",
        tags = {"doing", "playing"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("bell")
            inst.AnimState:OverrideSymbol("bell01", "bell", "bell01")
            --inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.instrument then
                inst.components.inventory:ReturnActiveItem()
            end
        end,
        
        onexit = function(inst)
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
        
        timeline=
        {
            TimeEvent(15*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/glommer_bell")
            end),

            TimeEvent(60*FRAMES, function(inst)
                inst:PerformBufferedAction()
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
 
    State{
        name = "play_bell",
        tags = {"doing", "playing"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("bell")
            inst.AnimState:OverrideSymbol("bell01", "bell", "bell01")
            --inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.instrument then
                inst.components.inventory:ReturnActiveItem()
            end
        end,
        
        onexit = function(inst)
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
        
        timeline=
        {
            TimeEvent(15*FRAMES, function(inst)
                local ba = inst:GetBufferedAction()
                if ba.invobject and ba.invobject.components.instrument and ba.invobject.components.instrument.sound then
                    inst.SoundEmitter:PlaySound(ba.invobject.components.instrument.sound)
                else
                    inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/glommer_bell")
                end
            end),

            TimeEvent(60*FRAMES, function(inst)
                inst:PerformBufferedAction()
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
     State{
        name = "book2",
        tags = {"busy"},
        
        onenter = function(inst)
		inst.components.health:SetInvincible(true)
		--shield --------
		inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
		local fx = SpawnPrefab("forcefieldfxx")
        fx.entity:SetParent(inst.entity)
		fx.Transform:SetScale(0.8, 0.8, 0.8)
        fx.Transform:SetPosition(0, 0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
			end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
			inst:DoTaskInTime( 3, function()
			inst.sg:RemoveStateTag("busy") end)
			inst:DoTaskInTime( 5, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
			inst.components.health:SetInvincible(false)
			inst.casting = false
            if inst:IsValid() then
            fx.kill_fx(fx) end
			end)
		-------- --------
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("book")
            inst.AnimState:OverrideSymbol("book_open", "book_uniqueitem_swap", "book_open")
            inst.AnimState:OverrideSymbol("book_closed", "book_uniqueitem_swap", "book_closed")
            inst.AnimState:OverrideSymbol("book_open_pages", "book_uniqueitem_swap", "book_open_pages")
            --inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.book then
                inst.components.inventory:ReturnActiveItem()
            end
            inst.SoundEmitter:PlaySound("dontstarve/common/use_book")
        end,
        
        onexit = function(inst)

            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
            if inst.sg.statemem.book_fx then
                inst.sg.statemem.book_fx:Remove()
                inst.sg.statemem.book_fx = nil
            end
        end,
        
        timeline=
        {
            TimeEvent(0, function(inst)
                local fxtoplay = "book_fx"
                if inst.prefab == "waxwell" then
                    fxtoplay = "waxwell_book_fx" 
                end       
                local fx = SpawnPrefab(fxtoplay)
                local pos = inst:GetPosition()
                fx.Transform:SetRotation(inst.Transform:GetRotation())
                fx.Transform:SetPosition( pos.x, pos.y - .2, pos.z ) 
                inst.sg.statemem.book_fx = fx
            end),

            TimeEvent(58*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/book_spell")
                inst:PerformBufferedAction()
                inst.sg.statemem.book_fx = nil
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
	
    State{
        name = "book",
        tags = {"doing"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("book")
            inst.AnimState:OverrideSymbol("book_open", "book_uniqueitem_swap", "book_open")
            inst.AnimState:OverrideSymbol("book_closed", "book_uniqueitem_swap", "book_closed")
            inst.AnimState:OverrideSymbol("book_open_pages", "book_uniqueitem_swap", "book_open_pages")
            --inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.book then
                inst.components.inventory:ReturnActiveItem()
            end
            inst.SoundEmitter:PlaySound("dontstarve/common/use_book")
        end,
        
        onexit = function(inst)
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
            if inst.sg.statemem.book_fx then
                inst.sg.statemem.book_fx:Remove()
                inst.sg.statemem.book_fx = nil
            end
        end,
        
        timeline=
        {
            TimeEvent(0, function(inst)
                local fxtoplay = "book_fx"
                if inst.prefab == "waxwell" then
                    fxtoplay = "waxwell_book_fx" 
                end       
                local fx = SpawnPrefab(fxtoplay)
                local pos = inst:GetPosition()
                fx.Transform:SetRotation(inst.Transform:GetRotation())
                fx.Transform:SetPosition( pos.x, pos.y - .2, pos.z ) 
                inst.sg.statemem.book_fx = fx
            end),

            TimeEvent(58*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/book_spell")
                inst:PerformBufferedAction()
                inst.sg.statemem.book_fx = nil
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },

    State{
        name = "map",
        tags = {"doing"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("scroll", false)
            inst.AnimState:OverrideSymbol("scroll", "messagebottle", "scroll")
            inst.AnimState:PushAnimation("scroll_pst", false)
            
            --inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.book then
                inst.components.inventory:ReturnActiveItem()
            end
        end,
        
        onexit = function(inst)
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
        
        timeline=
        {
            TimeEvent(24*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/treasuremap_open") end),
            TimeEvent(58*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/treasuremap_close") end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst:PerformBufferedAction()
            end),


            EventHandler("animqueueover", function(inst)
                inst.sg:GoToState("idle")
            end),

            
        },
    },    
    
    State{
        name = "blowdart",
        tags = {"attack", "notalking", "abouttoattack"},
        
        onenter = function(inst)
            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("dart")
            
            if inst.components.combat.target then
                if inst.components.combat.target and inst.components.combat.target:IsValid() then
                    inst:FacePoint(Point(inst.components.combat.target.Transform:GetWorldPosition()))
                end
            end
        end,
        
        timeline=
        {
            TimeEvent(8*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_shoot")
            end),
            TimeEvent(10*FRAMES, function(inst)
                inst.sg:RemoveStateTag("abouttoattack")
                inst.components.combat:DoAttack(inst.sg.statemem.target)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_shoot")
            end),
            TimeEvent(20*FRAMES, function(inst) inst.sg:RemoveStateTag("attack") end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
	
    State{
        name = "bowm3",
        tags = {"attack", "notalking", "abouttoattack"},
        
        onenter = function(inst)
            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
						---bowm
			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
            if weapon and weapon:HasTag("bowm") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm3", "bowm")
			end
            inst.AnimState:PlayAnimation("dart")
            
            if inst.components.combat.target then
                if inst.components.combat.target and inst.components.combat.target:IsValid() then
                    inst:FacePoint(Point(inst.components.combat.target.Transform:GetWorldPosition()))
                end
            end
        end,
        
        timeline=
        {
            TimeEvent(8*FRAMES, function(inst)
                --inst.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_shoot")
				inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/use_speargun")
            end),
            TimeEvent(10*FRAMES, function(inst)
                inst.sg:RemoveStateTag("abouttoattack")
                inst.components.combat:DoAttack(inst.sg.statemem.target)
               -- inst.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_shoot")
				inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/use_speargun")
            end),
            TimeEvent(20*FRAMES, function(inst) inst.sg:RemoveStateTag("attack") 
			
			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("bowm") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm_boost", "bowm")
			elseif weapon and not weapon:HasTag("bowm") and weapon:HasTag("musha_items") and not weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm", "bowm")
			elseif weapon and not weapon:HasTag("bowm") and weapon:HasTag("musha_items") and weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm_broken", "bowm")
			end
			end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
	
                inst.sg:GoToState("idle")
            end),
        },
    },
	
    State{
        name = "bowm2",
        tags = {"attack", "notalking", "abouttoattack"},
        
        onenter = function(inst)
            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
			---bowm
			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
            if weapon and weapon:HasTag("bowm") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm2", "bowm")
			end
            inst.AnimState:PlayAnimation("speargun")
            
            if inst.components.combat.target then
                if inst.components.combat.target and inst.components.combat.target:IsValid() then
                    inst:FacePoint(Point(inst.components.combat.target.Transform:GetWorldPosition()))
                end
            end
        end,
        
        timeline=
        {
           
            TimeEvent(12*FRAMES, function(inst)
                inst.sg:RemoveStateTag("abouttoattack")
                inst.components.combat:DoAttack(inst.sg.statemem.target)
                --inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/use_speargun")
				if math.random() < 0.55 then
				inst.SoundEmitter:PlaySound("bowm/musha/bowm/bow")
				else
				inst.SoundEmitter:PlaySound("bowm/musha/bowm/bow2")
				end
            end),
            TimeEvent(20*FRAMES, function(inst) inst.sg:RemoveStateTag("attack") 
			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("bowm") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm_boost", "bowm")
			elseif weapon and not weapon:HasTag("bowm") and weapon:HasTag("musha_items") and not weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm", "bowm")
			elseif weapon and not weapon:HasTag("bowm") and weapon:HasTag("musha_items") and weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm_broken", "bowm")
			end
			end),
        },
        
       events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
				
            end),
        },
    },

	
    State{
        name = "speargun",
        tags = {"attack", "notalking", "abouttoattack"},
        
        onenter = function(inst)
            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("speargun")
            
            if inst.components.combat.target then
                if inst.components.combat.target and inst.components.combat.target:IsValid() then
                    inst:FacePoint(Point(inst.components.combat.target.Transform:GetWorldPosition()))
                end
            end
        end,
        
        timeline=
        {
           
            TimeEvent(12*FRAMES, function(inst)
                inst.sg:RemoveStateTag("abouttoattack")
                inst.components.combat:DoAttack(inst.sg.statemem.target)
                inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/use_speargun")
            end),
            TimeEvent(20*FRAMES, function(inst) inst.sg:RemoveStateTag("attack") end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
    
    State{
        name = "throw",
        tags = {"attack", "notalking", "abouttoattack", "canrotate"},
        
        onenter = function(inst)
            local act = inst:GetBufferedAction()
            if act then
                if act.target and not act.pos then
                    act.pos = act.target:GetPosition()
                end
                inst:FacePoint(inst:GetBufferedAction().pos:Get())
            end

            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("throw")
            
            if inst.components.combat.target then
                if inst.components.combat.target and inst.components.combat.target:IsValid() then
                    inst:FacePoint(inst.components.combat.target.Transform:GetWorldPosition())
                end
            end
            
        end,
        
        timeline=
        {
            TimeEvent(7*FRAMES, function(inst)
                inst:PerformBufferedAction()
                inst.components.combat:DoAttack(inst.sg.statemem.target)
                inst.sg:RemoveStateTag("abouttoattack")
            end),
            TimeEvent(11*FRAMES, function(inst) inst.sg:RemoveStateTag("attack") end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
    
    State{
        name = "catch_pre",
        tags = {"notalking", "readytocatch"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("catch_pre")
            inst:PerformBufferedAction()
            inst.sg:SetTimeout(2)
        end,
        
        ontimeout= function(inst)
            inst.sg:GoToState("idle")
        end,
        
        events=
        {
            EventHandler("catch", function(inst)
                inst.sg:GoToState("catch")
            end),
        },
    },
    
    State{
        name = "catch",
        tags = {"busy", "notalking"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("catch")
            inst.SoundEmitter:PlaySound("dontstarve/wilson/boomerang_catch")
        end,
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },

    State{
        name = "shoot",
        tags = {"attack", "notalking", "abouttoattack", "busy"},
        
        onenter = function(inst)
            inst.AnimState:PlayAnimation("shoot")            
            if inst.components.combat.target then
                inst.components.combat:BattleCry()
                if inst.components.combat.target and inst.components.combat.target:IsValid() then
                    inst:FacePoint(Point(inst.components.combat.target.Transform:GetWorldPosition()))
                end
            end
            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()            
        end,
        
        timeline=
        {
            TimeEvent(17*FRAMES, function(inst) 
                inst.components.combat:DoAttack(inst.sg.statemem.target) 
                inst.sg:RemoveStateTag("abouttoattack") 
            end),            
            TimeEvent(20*FRAMES, function(inst)
                    inst.sg:RemoveStateTag("attack")
            end),           
            
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end ),
        },
    },    
    
    State{
        name = "attack",
        tags = {"attack", "notalking", "abouttoattack", "busy"},
        
        onenter = function(inst)
			--print(debugstack())

            local weapon = inst.components.combat:GetWeapon()
            local otherequipped = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)

            if (weapon and weapon:HasTag("gun")) or (otherequipped and otherequipped:HasTag("gun")) then
                inst.sg:GoToState("shoot")
                return
            end

            if weapon then
                inst.AnimState:PlayAnimation("atk")
				if weapon:HasTag("icestaff") then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_icestaff")
				elseif weapon:HasTag("shadow") then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_nightsword")
                elseif weapon:HasTag("firestaff") then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_firestaff")
                elseif weapon:HasTag("cutlass") then
                    inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/swordfish_sword")
                elseif weapon:HasTag("pegleg") then
                    inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/pegleg_weapon")
                else
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
                end
            elseif otherequipped and (otherequipped:HasTag("light") or otherequipped:HasTag("nopunch")) then
                inst.AnimState:PlayAnimation("atk")
                inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
            else
				inst.sg.statemem.slow = true
                inst.AnimState:PlayAnimation("punch")
                inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh")
            end
            
            if inst.components.combat.target then
                inst.components.combat:BattleCry()
                if inst.components.combat.target and inst.components.combat.target:IsValid() then
                    inst:FacePoint(Point(inst.components.combat.target.Transform:GetWorldPosition()))
                end
            end

            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
            
        end,
        
        timeline=
        {
            TimeEvent(8*FRAMES, function(inst) inst.components.combat:DoAttack(inst.sg.statemem.target) inst.sg:RemoveStateTag("abouttoattack") end),
            TimeEvent(12*FRAMES, function(inst) 
				inst.sg:RemoveStateTag("busy")
			end),				
            TimeEvent(13*FRAMES, function(inst)
				if not inst.sg.statemem.slow then
					inst.sg:RemoveStateTag("attack")
				end
            end),
            TimeEvent(24*FRAMES, function(inst)
				if inst.sg.statemem.slow then
					inst.sg:RemoveStateTag("attack")
				end
            end),
            
            
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end ),
        },
    },    
   
     State{
        name = "attack2",
        tags = {"attack", "notalking", "abouttoattack", "busy"},
        
        onenter = function(inst)
			inst.f_attack = true
			inst:DoTaskInTime(1.6, function(inst) inst.f_attack = false end )
            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
            local weapon = inst.components.combat:GetWeapon()
            local otherequipped = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)

            if weapon then
                inst.AnimState:PlayAnimation("pickaxe_pre")
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_icestaff")
           
            else
				inst.sg.statemem.slow = true
                inst.AnimState:PlayAnimation("punch")
                inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh")
            end
            
        end,
   
        events=
        {
		    EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) inst.sg:GoToState("attacking") end),
 
        },
    },   
 	    State{ name = "attacking",
        tags = {"attack", "notalking", "abouttoattack", "busy"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
			if inst.components.combat.target then
                inst.components.combat:BattleCry()
                if inst.components.combat.target and inst.components.combat.target:IsValid() then
                    inst:FacePoint(Point(inst.components.combat.target.Transform:GetWorldPosition()))
                end
            end
			 inst.AnimState:PlayAnimation("pickaxe_loop")
			 local weapon = inst.components.combat:GetWeapon()
                if weapon and weapon:HasTag("phoenix_axe") then
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_firestaff")
				else
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_icestaff")
				end
        end,
        timeline=
        {
            TimeEvent(8*FRAMES, function(inst) inst.components.combat:DoAttack(inst.sg.statemem.target) inst.sg:RemoveStateTag("abouttoattack") end),
            TimeEvent(12*FRAMES, function(inst) 
				inst.sg:RemoveStateTag("busy")
			end),				
            TimeEvent(13*FRAMES, function(inst)
				if not inst.sg.statemem.slow then
					inst.sg:RemoveStateTag("attack")
				end
            end),
            TimeEvent(24*FRAMES, function(inst)
				if inst.sg.statemem.slow then
					inst.sg:RemoveStateTag("attack")
				end
            end),
 
        },
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") inst.f_attack = false end ),
            EventHandler("animover", function(inst) 
			inst.AnimState:PlayAnimation("pickaxe_pst") 
                inst.sg:GoToState("idle", true) 
				inst.f_attack = false end),
        },
    },  
    
    State{
        name = "run_start",
        tags = {"moving", "running", "canrotate"},
        
        onenter = function(inst)
			inst.components.locomotor:RunForward()
            inst.AnimState:PlayAnimation("run_pre")
            inst.sg.mem.foosteps = 0
        end,

        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,

        events=
        {   
            EventHandler("animover", function(inst) inst.sg:GoToState("run") end ),        
        },
        
        timeline=
        {
        
            TimeEvent(4*FRAMES, function(inst)
                PlayFootstep(inst)
                DoFoleySounds(inst)
                local pos = inst:GetPosition()
                if GetWorld().Flooding and GetWorld().Flooding:OnFlood(pos.x, 0, pos.z) then 
                    local rot = inst.Transform:GetRotation()
                    local splash = SpawnPrefab("splash_footstep")
                    
                    local CameraRight = TheCamera:GetRightVec()
                    local CameraDown = TheCamera:GetDownVec()
                    local displacement = CameraRight:Cross(CameraDown) * .15
                    local pos = pos - displacement 
                    splash.Transform:SetPosition(pos.x,pos.y, pos.z)
                    splash.Transform:SetRotation(rot)
            
                end 
            end),
        },        
        
    },

    State{
        
        name = "run",
        tags = {"moving", "running", "canrotate"},
        
        onenter = function(inst) 
            inst.components.locomotor:RunForward()
            inst.AnimState:PlayAnimation("run_loop")
        end,

        onupdate = function(inst)
            inst.components.locomotor:RunForward()
            if inst.components.locomotor.timemoving >= TUNING.WILBUR_TIME_TO_RUN and inst:HasTag("monkey") then
                inst.sg:GoToState("run_monkey_start")
            end
        end,

        timeline=
        {
            TimeEvent(7*FRAMES, function(inst)
				inst.sg.mem.foosteps = inst.sg.mem.foosteps + 1
                PlayFootstep(inst, inst.sg.mem.foosteps < 5 and 1 or .6)
                DoFoleySounds(inst)
                local pos = inst:GetPosition()
                if GetWorld().Flooding and GetWorld().Flooding:OnFlood(pos.x, 0, pos.z) then 
                    local rot = inst.Transform:GetRotation()
                    local splash = SpawnPrefab("splash_footstep")
                    local CameraRight = TheCamera:GetRightVec()
                    local CameraDown = TheCamera:GetDownVec()
                    local displacement = CameraRight:Cross(CameraDown) * .15
                    local pos = pos - displacement 
                    splash.Transform:SetPosition(pos.x,pos.y, pos.z)
                    splash.Transform:SetRotation(rot)
                end 
            end),
            TimeEvent(15*FRAMES, function(inst)
                local pos = inst:GetPosition()
                if GetWorld().Flooding and GetWorld().Flooding:OnFlood(pos.x, 0, pos.z) then 
                    local rot = inst.Transform:GetRotation()
                    local splash = SpawnPrefab("splash_footstep")
                  local CameraRight = TheCamera:GetRightVec()
                    local CameraDown = TheCamera:GetDownVec()
                    local displacement = CameraRight:Cross(CameraDown) * .15
                    local pos = pos - displacement 
                    splash.Transform:SetPosition(pos.x,pos.y, pos.z)
                    splash.Transform:SetRotation(rot)
                end 
				inst.sg.mem.foosteps = inst.sg.mem.foosteps + 1
                PlayFootstep(inst, inst.sg.mem.foosteps < 5 and 1 or .6)
                DoFoleySounds(inst)
            end),
        },
        
        events=
        {   
            EventHandler("animover", function(inst) inst.sg:GoToState("run") end ),        
        },
        
        
    },
    
    State{
    
        name = "run_stop",
        tags = {"canrotate", "idle"},
        
        onenter = function(inst) 
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("run_pst")
        end,
        
        events=
        {   
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),        
        },
        
    },   

    State{
        name = "run_monkey_start",
        tags = {"moving", "running", "canrotate", "monkey"},
        
        onenter = function(inst) 
            inst.Transform:SetSixFaced()
            inst.components.locomotor:RunForward()
            inst.AnimState:SetBank("wilbur_run")
            inst.AnimState:SetBuild("wilbur_run")
            inst.AnimState:PlayAnimation("walk_monkey_pre")
        end,

        onexit = function(inst)
            inst.AnimState:SetBank("wilson")
            inst.AnimState:SetBuild(inst.prefab)
            inst.Transform:SetFourFaced()
        end,

        events=
        {   
            EventHandler("animover", function(inst) inst.sg:GoToState("run_monkey") end ),        
        },
    },

    State{
        name = "run_monkey",
        tags = {"moving", "running", "canrotate", "monkey"},
        
        onenter = function(inst) 
            inst.components.locomotor:AddSpeedModifier_Additive("WILBUR_RUN", TUNING.WILBUR_SPEED_BONUS)
            inst.components.hunger:AddBurnRateModifier("WILBUR", TUNING.WILBUR_RUN_HUNGER_RATE_MULT)

            inst.Transform:SetSixFaced()
            inst.components.locomotor:RunForward()
            inst.AnimState:SetBank("wilbur_run")
            inst.AnimState:SetBuild("wilbur_run")
            inst.AnimState:PlayAnimation("walk_monkey_loop")
            
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("TAIL_carry")
                inst.AnimState:Hide("TAIL_normal")
            end
        end,

        onexit = function(inst)
            inst.components.locomotor:RemoveSpeedModifier_Additive("WILBUR_RUN")
            inst.components.hunger:RemoveBurnRateModifier("WILBUR")

            inst.AnimState:SetBank("wilson")
            inst.AnimState:SetBuild(inst.prefab)
            inst.Transform:SetFourFaced()
            inst.AnimState:Hide("TAIL_carry")
            inst.AnimState:Show("TAIL_normal")
        end,
        
        timeline = 
        {
            TimeEvent(4*FRAMES, function(inst) PlayFootstep(inst) end),
            TimeEvent(5*FRAMES, function(inst) PlayFootstep(inst) end),
            TimeEvent(10*FRAMES, function(inst) PlayFootstep(inst) end),
            TimeEvent(11*FRAMES, function(inst) PlayFootstep(inst) end),
        },

        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,
       
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("run_monkey") end),

            EventHandler("equip", function(inst) 
                inst.AnimState:Show("TAIL_carry")
                inst.AnimState:Hide("TAIL_normal")
            end),

            EventHandler("unequip", function(inst) 
                inst.AnimState:Hide("TAIL_carry")
                inst.AnimState:Show("TAIL_normal")
            end),
        },
    },

    State{
        name="item_hat",
        tags = {"canrotate", "idle"},
        
        onenter = function(inst)
            inst.components.locomotor:StopMoving()
            inst.AnimState:PlayAnimation("item_hat")
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },
    },    
    State{
        name="item_in",
        tags = {"canrotate", "idle"},
        
        onenter = function(inst)
            inst.components.locomotor:StopMoving()
            inst.AnimState:PlayAnimation("item_in")
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },
    },    
    State{
        name="item_out",
        tags = {"canrotate", "idle"},
        
        onenter = function(inst)
            inst.components.locomotor:StopMoving()
            inst.AnimState:PlayAnimation("item_out")
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },
    },    


    State{
        name = "give",
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("give") 
        end,
        
        timeline =
        {
            TimeEvent(13*FRAMES, function(inst)
                inst:PerformBufferedAction()
            end),
        },        

        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },
    },   
	
--
   State{
        name = "bedroll",
                tags = { "busy" },
		--tags = {"busy"},

        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
            inst.components.locomotor:Stop()
           -- inst.components.health:SetInvincible(true)
			if GetClock():IsDay() then
			inst.components.playercontroller:Enable(true)
                local tosay = "ANNOUNCE_NODAYSLEEP"
                if GetWorld():IsCave() then
                    tosay = "ANNOUNCE_NODAYSLEEP_CAVE"
                end

				inst.sg:GoToState("idle")
				inst.components.talker:Say(GetString(inst.prefab, tosay))
				return
			end
		
			--[[
			local danger = FindEntity(inst, 10, function(target) 
                return (target:HasTag("monster") and not target:HasTag("player") and not inst:HasTag("spiderwhisperer"))
                    or (target:HasTag("monster") and not target:HasTag("player") and inst:HasTag("spiderwhisperer") and not target:HasTag("spider"))
                    or (target:HasTag("pig") and not target:HasTag("player") and inst:HasTag("spiderwhisperer"))
                    or (target.components.combat and target.components.combat.target == inst) end)

            local hounded = GetWorld().components.hounded

			if hounded and (hounded.warning or hounded.timetoattack <= 0) then
				danger = true
			end
			if danger then
				inst.sg:GoToState("idle")
				inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_NODANGERSLEEP"))
				return
			end
			
			-- you can still sleep if your hunger will bottom out, but not absolutely
			if inst.components.hunger.current < TUNING.CALORIES_MED then
				inst.sg:GoToState("idle")
				inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_NOHUNGERSLEEP"))
				return
			end
			]]
            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("bedroll", false)
	
            SetSleeperSleepState(inst)
        end,
		
			
        timeline =
        {
            TimeEvent(20 * FRAMES, function(inst) 
                inst.SoundEmitter:PlaySound("dontstarve/wilson/use_bedroll")
            end),
        },

        events =
        {
            EventHandler("firedamage", function(inst)
                if inst.sg:HasStateTag("sleeping") then
                    inst.sg.statemem.iswaking = true
                    inst.sg:GoToState("wakeup")
				end
            end),
            EventHandler("animqueueover", function(inst)
			
                if inst.AnimState:AnimDone() then
				
                    if GetClock():IsDay() or
                        (inst.components.health ~= nil and inst.components.health.takingfiredamage) or
                        (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
                        inst:PushEvent("performaction", { action = inst.bufferedaction })
                        inst:ClearBufferedAction()
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
					   
                    elseif inst:GetBufferedAction() then
                        inst:PerformBufferedAction() 
                        if inst.components.playercontroller ~= nil then
                            inst.components.playercontroller:Enable(true)
                        end
                        inst.sg:AddStateTag("sleeping")
 						inst.sg:AddStateTag("busy")
 						inst.AnimState:PlayAnimation("bedroll_sleep_loop", true)
                    else
						
                         inst.sg.statemem.iswaking = true
                         inst.sg:GoToState("wakeup")
                    end
                end
            end),
        },

        onexit = function(inst)
            if inst.sleepingbag ~= nil then
                --Interrupted while we are "sleeping"
                inst.sleepingbag.components.sleepingbag:DoWakeUp(true)
                inst.sleepingbag = nil
                SetSleeperAwakeState(inst)
            elseif not inst.sg.statemem.iswaking then
                --Interrupted before we are "sleeping"
                SetSleeperAwakeState(inst)
            end
        end,
    },

    State{
        name = "bedroll2",
        tags = { "bedroll", "busy"},

        onenter = function(inst)
		  inst.components.locomotor:Stop()
            --nst.components.locomotor:Clear()
            --inst:ClearBufferedAction()
	            
            --inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            --inst.AnimState:PushAnimation("bedroll", false)
			inst.AnimState:PlayAnimation("bedroll_sleep_loop", true)
			
            SetSleeperSleepState(inst)
       
			inst.sg:SetTimeout(99999999999999999999999999999999999999999999999999999999999999999999)
        end,

        ontimeout = function(inst)
            if inst.components.grogginess == nil then
                inst.sg.statemem.iswaking = true
                inst.sg:GoToState("wakeup")
            end
        end,

        events =
        {            
            EventHandler("animqueueover", function(inst)
			    
                if inst.AnimState:AnimDone() then
                         
                        inst.sg:AddStateTag("sleeping")
                        inst.sg:AddStateTag("silentmorph")
                        inst.sg:RemoveStateTag("nomorph")
                        inst.sg:RemoveStateTag("busy")
                        inst.AnimState:PlayAnimation("bedroll_sleep_loop", true)
                   
                    
                end
            end),
        },

        onexit = function(inst)
            if not inst:HasTag("sleep_on") then
                SetSleeperAwakeState(inst)
            end
        end,
    },
	
	
     State{
        name = "knockout",
        tags = { "busy", "knockout", "nopredict", "nomorph" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst:ClearBufferedAction()

            inst.sg.statemem.isinsomniac = inst:HasTag("insomniac")

            if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
                inst.sg:AddStateTag("dismounting")
                inst.AnimState:PlayAnimation("fall_off")
                inst.SoundEmitter:PlaySound("dontstarve/beefalo/saddle/dismount")
            else
                inst.AnimState:PlayAnimation(inst.sg.statemem.isinsomniac and "insomniac_dozy" or "dozy")
            end

            SetSleeperSleepState(inst)

            inst.sg:SetTimeout(99999999999999999999999999999999999999999999999999999999999999999999)
        end,

        ontimeout = function(inst)
            if inst.components.grogginess == nil then
                inst.sg.statemem.iswaking = true
                inst.sg:GoToState("wakeup")
            end
        end,

        events =
        {
            EventHandler("firedamage", function(inst)
                if inst.sg:HasStateTag("sleeping") then
                    inst.sg.statemem.iswaking = true
                    inst.sg:GoToState("wakeup")
                else
                    inst.sg.statemem.cometo = true
                end
            end),
            EventHandler("cometo", function(inst)
                if inst.sg:HasStateTag("sleeping") then
                    inst.sg.statemem.iswaking = true
                    inst.sg:GoToState("wakeup")
                else
                    inst.sg.statemem.cometo = true
                end
            end),
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    if inst.sg:HasStateTag("dismounting") then
                        inst.sg:RemoveStateTag("dismounting")
                        if inst.components.rider ~= nil then
                            inst.components.rider:ActualDismount()
                        end
                        inst.AnimState:PlayAnimation(inst.sg.statemem.isinsomniac and "insomniac_dozy" or "dozy")
                    elseif inst.sg.statemem.cometo then
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    else
                        inst.AnimState:PlayAnimation(inst.sg.statemem.isinsomniac and "insomniac_sleep_loop" or "sleep_loop", true)
                        inst.sg:AddStateTag("sleeping")
                    end
                end
            end),
        },

        onexit = function(inst)
            if inst.sg:HasStateTag("dismounting") and inst.components.rider ~= nil then
                --Interrupted
                inst.components.rider:ActualDismount()
            end
            if not inst.sg.statemem.iswaking then
                --Interrupted
                SetSleeperAwakeState(inst)
            end
        end,
    },

	State{
        name = "sneeze",
        tags = {"busy","sneeze"},
        
        onenter = function(inst)
            inst.wantstosneeze = false
            inst.SoundEmitter:PlaySound("dontstarve/wilson/hit",nil,.02)        
            inst.AnimState:PlayAnimation("sneeze")
			if not inst.coldfever then
            inst.SoundEmitter:PlaySound("dontstarve_DLC003/characters/sneeze")
			end
            inst:ClearBufferedAction()
            
            if inst.prefab ~= "wes" then
                local sound_name = inst.soundsname or inst.prefab
                local path = inst.talker_path_override or "dontstarve/characters/"
                --local equippedHat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
                --if equippedHat and equippedHat:HasTag("muffler") then
                    --inst.SoundEmitter:PlaySound(path..sound_name.."/gasmask_hurt")
                --else
                    local sound_event = path..sound_name.."/hurt"
                    inst.SoundEmitter:PlaySound(inst.hurtsoundoverride or sound_event)
                --end
            end
            inst.components.locomotor:Stop()  
				if not inst.coldfever then
            inst.components.talker:Say(GetString(inst.prefab, "ANNOUNCE_SNEEZE")) 
				end
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        }, 
        
        timeline =
        {
            TimeEvent(10*FRAMES, function(inst)
                if inst.components.hayfever and not inst.coldfever then
                    inst.components.hayfever:DoSneezeEffects()
                end
                inst.sg:RemoveStateTag("busy")
				inst.coldfever = false
				
            end),
        },        
               
    },
	
    State{
        name = "hit",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")        
            inst.AnimState:PlayAnimation("hit")
            inst:ClearBufferedAction()
            
            if inst.prefab ~= "wes" then
                local sound_name = inst.soundsname or inst.prefab
                local path = inst.talker_path_override or "dontstarve/characters/"
                local equippedHat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
                if equippedHat and equippedHat:HasTag("muffler") then
                    inst.SoundEmitter:PlaySound(path..sound_name.."/gasmask_hurt")
                else
                    local sound_event = path..sound_name.."/hurt"
                    inst.SoundEmitter:PlaySound(inst.hurtsoundoverride or sound_event)
                end
            end
            inst.components.locomotor:Stop()            
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        }, 
        
        timeline =
        {
            TimeEvent(3*FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
            end),
        },        
               
    },
    
    State{
        name = "toolbroke",
        tags = {"busy"},
        onenter = function(inst, tool)
            inst.AnimState:PlayAnimation("hit")
            inst.SoundEmitter:PlaySound("dontstarve/wilson/use_break")
            inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal") 
            local brokentool = SpawnPrefab("brokentool")
            brokentool.Transform:SetPosition(inst.Transform:GetWorldPosition() )
            inst.sg.statemem.tool = tool
        end,
        
        onexit = function(inst)
		    local sameTool = inst.components.inventory:FindItem(function(item)
		        return item.prefab == inst.sg.statemem.tool.prefab
		    end)
		    if sameTool then
		        inst.components.inventory:Equip(sameTool)
		    end

            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end

        end,
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end ),
        },
    },
    

    State{
        name = "tool_slip",
        tags = {"busy"},
        onenter = function(inst, tool)
            inst.AnimState:PlayAnimation("hit")
            inst.SoundEmitter:PlaySound("dontstarve/wilson/use_break")
            inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal") 
            local brokentool = SpawnPrefab("brokentool")
            brokentool.Transform:SetPosition(inst.Transform:GetWorldPosition() )
            inst.sg.statemem.tool = tool
        end,
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end ),
        },
    },

    State{
        name = "armorbroke",
        tags = {"busy"},
        onenter = function(inst, armor)
            inst.AnimState:PlayAnimation("hit")
            inst.SoundEmitter:PlaySound("dontstarve/wilson/use_armour_break")
            inst.sg.statemem.armor = armor
        end,
        
        onexit = function(inst)
		    local sameArmor = inst.components.inventory:FindItem(function(item)
		        return item.prefab == inst.sg.statemem.armor.prefab
		    end)
		    if sameArmor then
		        inst.components.inventory:Equip(sameArmor)
		    end
        end,
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end ),
        },
    },
    
	State{
        name = "teleportato_teleport",
        tags = {"busy"},
		onenter = function(inst)
            inst.components.locomotor:StopMoving()
			inst.components.playercontroller:Enable(false)
			inst.components.health:SetInvincible(true)
            if TUNING.DO_SEA_DAMAGE_TO_BOAT and (inst.components.driver and inst.components.driver.vehicle and inst.components.driver.vehicle.components.boathealth) then
                inst.components.driver.vehicle.components.boathealth:SetInvincible(true)
            end
			inst.AnimState:PlayAnimation("teleport")
			TheCamera:SetDistance(20)
			inst.HUD:Hide()
		end,

        onexit = function(inst)
            inst.HUD:Show()
            inst.components.playercontroller:Enable(true)
            inst.components.health:SetInvincible(false)
            if TUNING.DO_SEA_DAMAGE_TO_BOAT and (inst.components.driver and inst.components.driver.vehicle and inst.components.driver.vehicle.components.boathealth) then
                inst.components.driver.vehicle.components.boathealth:SetInvincible(false)
            end
        end,

		timeline = {
			TimeEvent(0, function(inst)
                if SaveGameIndex:IsModeShipwrecked() then
				    inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/teleportato_shipwrecked/teleportato_pulled")
                else
                    inst.SoundEmitter:PlaySound("dontstarve/common/teleportato/teleportato_pulled")
                end
			end),
			TimeEvent(82*FRAMES, function(inst)
                if SaveGameIndex:IsModeShipwrecked() then
				    inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/teleportato_shipwrecked/teleportato_under")
                else
                    inst.SoundEmitter:PlaySound("dontstarve/common/teleportato/teleportato_under")
                end
			end),
		},
	},
        
	State{
        name = "amulet_rebirth",
        tags = {"busy"},
        onenter = function(inst)
			GetClock():MakeNextDay()
			inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("amulet_rebirth")
            TheCamera:SetDistance(14)
            inst.HUD:Hide()
            inst.AnimState:OverrideSymbol("FX", "player_amulet_resurrect", "FX")
        end,
        
        onexit= function(inst)
			inst.components.hunger:SetPercent(2/3)
			inst.components.health:Respawn(TUNING.RESURRECT_HEALTH)
	        
	        if inst.components.sanity then
				inst.components.sanity:SetPercent(.5)
			end
			
			local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.BODY)
			if item and item.prefab == "amulet" then
				item = inst.components.inventory:RemoveItem(item)
				if item then
					item:Remove()
					item.persists = false
				end
			end
			--SaveGameIndex:SaveCurrent()
			inst.HUD:Show()
			TheCamera:SetDefault()
			inst.components.playercontroller:Enable(true)
            inst.AnimState:ClearOverrideSymbol("FX")
			
        end,
        
		timeline =
        {
            TimeEvent(0*FRAMES, function(inst)
                inst.stafflight = SpawnPrefab("staff_castinglight")
                local pos = inst:GetPosition()
                local colour = {150/255, 46/255, 46/255}
                inst.stafflight.Transform:SetPosition(pos.x, pos.y, pos.z)
                inst.stafflight.setupfn(inst.stafflight, colour, 1.7, 1)           

            end),

			TimeEvent(0, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/rebirth_amulet_raise") end),
			TimeEvent(60*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/rebirth_amulet_poof") end),
        
            TimeEvent(80*FRAMES, function(inst)
				local pos = Vector3(inst.Transform:GetWorldPosition())
				local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 10)
				for k,v in pairs(ents) do
					if v ~= inst and v.components.sleeper then
						v.components.sleeper:GoToSleep(20)
					end
				end
				
				
            end),
        },        
                   
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },
    },    


    State{
        name = "jumpin",
        tags = {"doing", "canrotate"},
        
        onenter = function(inst)
            inst.sg.statemem.action = inst:GetBufferedAction()
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("jump")

			inst:DoTaskInTime(4.7, function(inst) inst.SoundEmitter:PlaySound("dontstarve/movement/bodyfall_dirt", "bodyfall") end )
        end,
        
		timeline =
        {
			-- this is just hacked in here to make the sound play BEFORE the player hits the wormhole
			TimeEvent(19*FRAMES, function(inst)
                if inst.sg.statemem.action and inst.sg.statemem.action.target and inst.sg.statemem.action.target.prefab == "bermudatriangle" then
                    inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/bermudatriangle_travel", "wormhole_travel")
                else
                    inst.SoundEmitter:PlaySound("dontstarve/common/teleportworm/travel", "wormhole_travel")
                end
            end),
		},

        events=
        {
            EventHandler("animover", function(inst)
				inst:PerformBufferedAction()
				inst.sg:GoToState("idle") 
			end ),
        },
    },

    State{
        name = "castspell",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("staff") 
            local colourizefx = function(staff)
                return staff.fxcolour or {1,1,1}
            end
            inst.components.locomotor:Stop()
            --Spawn an effect on the player's location
            inst.stafffx = SpawnPrefab("staffcastfx")            

            local pos = inst:GetPosition()
            local staff = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            inst.stafffx.Transform:SetPosition(pos.x, pos.y, pos.z)
            local colour = colourizefx(staff)

            inst.stafffx.Transform:SetRotation(inst.Transform:GetRotation())
            inst.stafffx.AnimState:SetMultColour(colour[1], colour[2], colour[3], 1)
        end,

        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
            if inst.stafffx then
                inst.stafffx:Remove()
            end
        end,

        timeline = 
        {
            TimeEvent(13*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/use_gemstaff") 
            end),
            TimeEvent(0*FRAMES, function(inst)
                inst.stafflight = SpawnPrefab("staff_castinglight")
                local staff = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
                local pos = inst:GetPosition()
                local colour = staff.fxcolour or {1,1,1}
                inst.stafflight.Transform:SetPosition(pos.x, pos.y, pos.z)
                inst.stafflight.setupfn(inst.stafflight, colour, 1.9, .33)                

            end),
            TimeEvent(53*FRAMES, function(inst) inst:PerformBufferedAction() end),
        },

        events = {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle") 
            end ),
        },

    },

    State{
        name = "peertelescope",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
            inst.sg.statemem.action = inst:GetBufferedAction()
            local act = inst:GetBufferedAction()

            inst:ForceFacePoint(act.pos.x, act.pos.y, act.pos.z)
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("telescope", false)
            inst.AnimState:PushAnimation("telescope_pst", false)

            inst.components.locomotor:Stop()
        end,

        timeline = 
        {
            TimeEvent(20*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/use_spyglass") end),
        },

        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
        end,

        events = {
            EventHandler("animover", function(inst)
                inst:PerformBufferedAction()
            end ),
            EventHandler("animqueueover", function(inst)
                
                local telescope = inst.sg.statemem.action.invobject or inst.sg.statemem.action.doer.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
                if telescope and telescope.components.finiteuses then
                    -- this is here because the telescope still needs to exist while playing the put away animation
                    telescope.components.finiteuses:Use()
                end

                inst.sg:GoToState("idle")

            end ),
        },
    },

    State{
        name = "werebeaver",
        tags = {"busy"},
        onenter = function(inst)
			inst.components.beaverness.doing_transform = true
            inst.Physics:Stop() 
            inst.components.playercontroller:Enable(false)           
            inst.AnimState:PlayAnimation("transform_pre")
            inst.components.health:SetInvincible(true)
        end,
        
        onexit = function(inst)
			if not inst.components.beaverness:IsBeaver() then
				inst.components.beaverness.makebeaver(inst)
			end
			inst.components.health:SetInvincible(false)
			inst.components.playercontroller:Enable(true)
			inst.components.beaverness.doing_transform = false
        end,

        events =
        {
            EventHandler("animover", function(inst)
	            inst.components.beaverness.makebeaver(inst)
                inst.sg:GoToState("transform_pst")
            end ),
        } 
    },   

    State{
        name = "quicktele",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
            inst.AnimState:PlayAnimation("atk")
            inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
        end,

        timeline = 
        {
            TimeEvent(8*FRAMES, function(inst) inst:PerformBufferedAction() end),
        },

        events = {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle") 
            end ),
        },
    }, 

    State{
        name = "frozen",
        tags = {"busy", "frozen"},
        
        onenter = function(inst)
            inst.components.playercontroller:Enable(false)

            if inst.components.locomotor then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("frozen")
            inst.SoundEmitter:PlaySound("dontstarve/common/freezecreature")
            inst.AnimState:OverrideSymbol("swap_frozen", "frozen", "frozen")
        end,
        
        onexit = function(inst)
            inst.components.playercontroller:Enable(true)

            inst.AnimState:ClearOverrideSymbol("swap_frozen")
        end,
        
        events=
        {   
            EventHandler("onthaw", function(inst) inst.sg:GoToState("thaw") end ),        
        },
    },

    State{
        name = "thaw",
        tags = {"busy", "thawing"},
        
        onenter = function(inst) 
            inst.components.playercontroller:Enable(false)

            if inst.components.locomotor then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("frozen_loop_pst", true)
            inst.SoundEmitter:PlaySound("dontstarve/common/freezethaw", "thawing")
            inst.AnimState:OverrideSymbol("swap_frozen", "frozen", "frozen")
        end,
        
        onexit = function(inst)
            inst.components.playercontroller:Enable(true)

            inst.SoundEmitter:KillSound("thawing")
            inst.AnimState:ClearOverrideSymbol("swap_frozen")
        end,

        events =
        {   
            EventHandler("unfreeze", function(inst)
                if inst.sg.sg.states.hit then
                    inst.sg:GoToState("hit")
                else
                    inst.sg:GoToState("idle")
                end
            end),
        },
    },

    State{
        name = "use_fan",
        tags = {"doing"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()

            local fan = inst:GetBufferedAction().invobject
            if fan then
                inst.AnimState:OverrideSymbol("fan01", fan.animinfo, "fan01")
            end

            inst.AnimState:PlayAnimation("fan")
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.fan then
                inst.components.inventory:ReturnActiveItem()
            end
        end,
        
        onexit = function(inst)
            inst.SoundEmitter:KillSound("fan")
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
        
        timeline=
        {
            TimeEvent(26*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/luxury_fan", "fan") end),
            TimeEvent(70*FRAMES, function(inst)
                inst:PerformBufferedAction()
            end),
            TimeEvent(90*FRAMES, function(inst) inst.SoundEmitter:KillSound("fan") end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },



    State{
        name = "castspell_tornado",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("atk") 
            inst.components.locomotor:Stop()
            --Spawn an effect on the player's location
        end,

        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
        end,

        timeline = 
        {
            TimeEvent(5*FRAMES, function(inst) inst:PerformBufferedAction() end),
        },

        events = {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle") 
            end ),
        },

    },

    State{
        name = "jumponboatstart",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.components.locomotor:EnableGroundSpeedMultiplier(false)
            inst.AnimState:PlayAnimation("jumpboat")
            inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/boatjump_whoosh")
            local BA = inst:GetBufferedAction()
            inst.sg.statemem.startpos = inst:GetPosition()
            inst.sg.statemem.targetpos = BA.target and BA.target:GetPosition()

            RemovePhysicsColliders(inst)
            inst.components.health:SetInvincible(true)
            inst.components.playercontroller:Enable(false)
        end,

        onexit = function(inst)
        --This shouldn't actually be reached
            ChangeToCharacterPhysics(inst)
            inst.components.locomotor:Stop()
            inst.components.locomotor:EnableGroundSpeedMultiplier(true)
            inst.components.health:SetInvincible(false)
            inst.components.playercontroller:Enable(true)

        end,

        timeline =
        {
            TimeEvent(7*FRAMES, function(inst)
                inst:ForceFacePoint(inst.sg.statemem.targetpos:Get())
                local dist = inst:GetPosition():Dist(inst.sg.statemem.targetpos)
                local speed = dist / (18/30)
                inst.Physics:SetMotorVelOverride(1 * speed, 0, 0)
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                inst.components.health:SetInvincible(false)
                inst.components.playercontroller:Enable(true)
                inst.Transform:SetPosition(inst.sg.statemem.targetpos:Get())
                inst.Physics:Stop()
                ChangeToCharacterPhysics(inst)
                inst.components.locomotor:Stop()
                inst.components.locomotor:EnableGroundSpeedMultiplier(true)
                inst:PerformBufferedAction()
            end),
        },
    },

    State{
        name = "jumpoffboatstart",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst, pos)
            inst.components.locomotor:Stop()
            inst.components.locomotor:EnableGroundSpeedMultiplier(false)
            inst.AnimState:PlayAnimation("jumpboat")
            inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/boatjump_whoosh")
            inst.sg.statemem.startpos = inst:GetPosition()
            inst.sg.statemem.targetpos = pos

            RemovePhysicsColliders(inst)
            inst.components.health:SetInvincible(true)
            inst.components.playercontroller:Enable(false)
        end,

        onexit = function(inst)
        --This shouldn't actually be reached
            ChangeToCharacterPhysics(inst)
            inst.components.locomotor:Stop()
            inst.components.locomotor:EnableGroundSpeedMultiplier(true)
            inst.components.health:SetInvincible(false)
            inst.components.playercontroller:Enable(true)
        end,

        timeline =
        {
            TimeEvent(7*FRAMES, function(inst)
                inst:ForceFacePoint(inst.sg.statemem.targetpos:Get())
                local dist = inst:GetPosition():Dist(inst.sg.statemem.targetpos)
                local speed = dist / (18/30)
                inst.Physics:SetMotorVelOverride(1 * speed, 0, 0)
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                inst.Transform:SetPosition(inst.sg.statemem.targetpos:Get())
                inst.Physics:Stop()
                inst.components.health:SetInvincible(false)
                inst.sg:GoToState("jumpoffboatland")
            end),
        },
    },

    State{
        name = "jumpoffboatland",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
            inst.components.health:SetInvincible(true)
            inst.Physics:Stop()
            inst.AnimState:PushAnimation("land", false)
            inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/boatjump_to_land")
            PlayFootstep(inst)
        end,

        onexit = function(inst)
            inst.components.health:SetInvincible(false)
        end,

        events =
        {
            EventHandler("animqueueover", function(inst)
                inst:PerformBufferedAction()
                inst.sg:GoToState("idle")
            end),
        },
    },

   State{
        name = "curepoison",
        tags ={"busy"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("quick_eat")

        end,

        timeline=
        {
            TimeEvent(12*FRAMES, function(inst)
                inst:PerformBufferedAction()
                inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/player_drink")
                inst.sg:RemoveStateTag("busy")
            end),
        },

        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("celebrate") end),
        },
    },


   State{
        name = "celebrate",
        tags ={"idle"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("research")
        end,

        timeline = 
        {
            TimeEvent( 8*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/antivenom_whoosh") end),
            TimeEvent(13*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/heelclick") end),
            TimeEvent(21*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/heelclick") end),
        },

        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },

    State{
        name = "player_portal_shipwrecked_pre",
        tags = {"doing", "busy"},

        onenter = function(inst)
            inst.AnimState:PlayAnimation("idle_loop")
            inst.components.health:SetInvincible(true)

            inst.sg:SetTimeout(3.5)
        end,

        timeline = 
        {

            TimeEvent(30*FRAMES, function(inst)
                inst.AnimState:PlayAnimation("jump")
                local portal = SpawnPrefab("wormhole_shipwrecked_fx")
                portal.Transform:SetPosition((inst:GetPosition() - (TheCamera:GetDownVec() * 0.1)):Get())
            end),
        },

        onexit = function(inst)
            inst.components.health:SetInvincible(false)
        end,

        ontimeout = function(inst)
            inst.sg:GoToState("player_portal_shipwrecked_loop")
        end,
    },

    State{
        name = "player_portal_shipwrecked_loop",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
            inst.components.health:SetInvincible(true)
            inst.AnimState:PlayAnimation("shipwrecked_portal_pre")
            inst.AnimState:PushAnimation("shipwrecked_portal_loop", true)

            local target = GetClosestInstWithTag("shipwrecked_portal", inst, 5)
            inst.sg.statemem.target = target

            inst.sg.statemem.target:Hide()
            ChangeToInventoryPhysics(inst.sg.statemem.target)
            inst.Transform:SetPosition(inst.sg.statemem.target:GetPosition():Get())

            local facepoint = (inst.sg.statemem.target:GetPosition() + TheCamera:GetRightVec())
            inst:ForceFacePoint(facepoint:Get())

            inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/portal/sit")
            inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/portal/ride_LP", "ride_lp")
            inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/portal/music_LP", "music_lp")

        end,

        timeline =
        {
            TimeEvent(5*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/portal/ride_sqeak")
            end),

            TimeEvent(14*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/portal/ride_sqeak")
            end),

            TimeEvent(68*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/portal/ride_sqeak")
            end),

            TimeEvent(100*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/portal/ride_sqeak")
            end),

            TimeEvent(128*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/portal/ride_sqeak")
            end),
        },

        onexit = function(inst)
            inst.components.health:SetInvincible(false)
            inst.sg.statemem.target:Show()
            ChangeToObstaclePhysics(inst.sg.statemem.target)
            inst.SoundEmitter:KillSound("music_lp")
            inst.SoundEmitter:KillSound("ride_lp")
        end,
    },
}

return StateGraph("wilson", states, events, "idle", actionhandlers)

