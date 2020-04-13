
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
--inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5) 
end
     
   --inst.components.hunger:Resume()
if inst.components.hunger.current <=0 then
   inst.hungry_wakeup = true end

end

local function SetSleeperAwakeState(inst)
	inst.sleeping_musha = false
	inst.sleepbuff = false
    if inst:HasTag("sleep_visual") then
    inst:RemoveTag("sleep_visual") end
 
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
	ActionHandler(ACTIONS.TRAVEL, "doshortaction"),
    ActionHandler(ACTIONS.LIGHT, "give"),
    ActionHandler(ACTIONS.UNLOCK, "give"),
    ActionHandler(ACTIONS.TURNOFF, "give"),
    ActionHandler(ACTIONS.TURNON, "give"),
    ActionHandler(ACTIONS.ADDFUEL, "doshortaction"),
    ActionHandler(ACTIONS.REPAIR, "dolongaction"),
    
    ActionHandler(ACTIONS.READ, "book"),
	
    ActionHandler(ACTIONS.MAKEBALLOON, "makeballoon"),
    ActionHandler(ACTIONS.DEPLOY, "doshortaction"),
    ActionHandler(ACTIONS.STORE, "doshortaction"),
    ActionHandler(ACTIONS.DROP, "doshortaction"),
    ActionHandler(ACTIONS.MURDER, "dolongaction"),
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
    
    ActionHandler(ACTIONS.BUILD, "dolongaction"),
    ActionHandler(ACTIONS.SHAVE, "shave"),
    ActionHandler(ACTIONS.COOK, "dolongaction"),
    ActionHandler(ACTIONS.PICKUP, "doshortaction"),
    ActionHandler(ACTIONS.CHECKTRAP, "doshortaction"),
    ActionHandler(ACTIONS.RUMMAGE, "doshortaction"),
    ActionHandler(ACTIONS.BAIT, "doshortaction"),
    ActionHandler(ACTIONS.HEAL, "dolongaction"),
    ActionHandler(ACTIONS.SEW, "dolongaction"),
    ActionHandler(ACTIONS.TEACH, "dolongaction"),
    ActionHandler(ACTIONS.RESETMINE, "dolongaction"),
    ActionHandler(ACTIONS.EAT, 
        function(inst, action)
            if inst.sg:HasStateTag("busy") then
                return nil
            end
            local obj = action.target or action.invobject
            --[[if not (obj and obj.components.edible) then
                return nil
            end]]
            
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
            end
        end
    end),
    ActionHandler(ACTIONS.JUMPIN, "jumpin"),
    ActionHandler(ACTIONS.DRY, "doshortaction"),
    ActionHandler(ACTIONS.CASTSPELL, "castspell"),
    ActionHandler(ACTIONS.BLINK, "quicktele"),
    ActionHandler(ACTIONS.COMBINESTACK, "doshortaction"),
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
			if data.attacker and data.attacker:HasTag("insect") then
                local is_idle = inst.sg:HasStateTag("idle")
                if not is_idle then
                    -- avoid stunlock when attacked by bees/mosquitos
                    -- don't go to full hit state, just play sounds

                    inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")        
                    
                    if inst.prefab ~= "wes" then
                        local sound_name = inst.soundsname or inst.prefab
                        local sound_event = "dontstarve/characters/"..sound_name.."/hurt"
                        inst.SoundEmitter:PlaySound(inst.hurtsoundoverride or sound_event)
                    end
                    return
                end
			end
            if inst.sg:HasStateTag("shell") then
                inst.sg:GoToState("shell_hit")
            else
                inst.sg:GoToState("hit")
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
			elseif weapon and weapon:HasTag("bowm") then 	
				inst.sg:GoToState("bowm2")	
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
				inst.sg:GoToState("item_in")
			else
				inst.sg:GoToState("item_hat")
			end
        end
    end),
    
    EventHandler("death", function(inst)
        inst.components.playercontroller:Enable(false)
        inst.sg:GoToState("death")
        inst.SoundEmitter:PlaySound("dontstarve/wilson/death")    
        
		local sound_name = inst.soundsname or inst.prefab
        if inst.prefab ~= "wes" then
			inst.SoundEmitter:PlaySound("dontstarve/characters/"..sound_name.."/death_voice")    
		end
        
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
		
		EventHandler("knockedout",
        function(inst)
            if inst.sg:HasStateTag("knockout") then
                inst.sg.statemem.cometo = nil
            elseif not (inst.sg:HasStateTag("sleeping") or inst.sg:HasStateTag("bedroll") or inst.sg:HasStateTag("tent") or inst.sg:HasStateTag("waking")) then
                inst.sg:GoToState("knockout")
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
        name = "wakeup",

        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
                  if inst.AnimState:IsCurrentAnimation("bedroll") or
                inst.AnimState:IsCurrentAnimation("bedroll_sleep_loop") then
                inst.AnimState:PlayAnimation("bedroll_wakeup")
            elseif not (inst.AnimState:IsCurrentAnimation("bedroll_wakeup") or
                        inst.AnimState:IsCurrentAnimation("wakeup")) then
                inst.AnimState:PlayAnimation("wakeup")
            end
            inst.components.health:SetInvincible(true)
        end,
        
        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
            inst.components.health:SetInvincible(false)
        end,
        
        
        events=
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
            inst.components.health:SetInvincible(true)
        end,

        onexit=function(inst)
            inst.components.health:SetInvincible(false)
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
        name = "death",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:Hide("swap_arm_carry")
            inst.AnimState:PlayAnimation("death")
        end,
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
            inst.sg:GoToState("funnyidle")
        end,
    },

    State{
        
        name = "funnyidle",
        tags = {"idle", "canrotate"},
        onenter = function(inst)
        
			
			if inst.components.temperature:GetCurrent() < 5 then
				inst.AnimState:PlayAnimation("idle_shiver_pre")
				inst.AnimState:PushAnimation("idle_shiver_loop")
				inst.AnimState:PushAnimation("idle_shiver_pst", false)
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
                inst.SoundEmitter:PlaySound("dontstarve/wilson/use_pick_rock")
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
        
        events=
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end ),
            EventHandler("animover", function(inst) 
                inst.AnimState:PlayAnimation("shovel_pst") 
                inst.sg:GoToState("idle", true)
            end ),
            
        },        
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
            inst.AnimState:Show("RIPPLES")
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
           -- print("Using ", build, " to swap out fish01")
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
            if not inst.keep_check then
            if inst.talksoundoverride then
                 inst.SoundEmitter:PlaySound(inst.talksoundoverride, "talk")
            else
                local sound_name = inst.soundsname or inst.prefab
                inst.SoundEmitter:PlaySound("dontstarve/characters/"..sound_name.."/talk_LP", "talk")
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
        name = "play_flute",
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
        name = "play_horn",
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
        name = "peertelescope2",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
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
            TimeEvent(2*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold") end),
			TimeEvent(20*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/smallbird/blink") end),
			
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
			TimeEvent(3*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/use_book") end)
            --TimeEvent(24*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/treasuremap_open") end),
           -- TimeEvent(58*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/treasuremap_close") end),
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
        tags = {"busy"},
        
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
    --[[State{
        name = "book",
        tags = {"doing"},
        
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("book")
            inst.AnimState:OverrideSymbol("book_open", "player_actions_uniqueitem", "book_open")
            inst.AnimState:OverrideSymbol("book_closed", "player_actions_uniqueitem", "book_closed")
            inst.AnimState:OverrideSymbol("book_open_pages", "player_actions_uniqueitem", "book_open_pages")
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
    },  ]]  
    
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
                --inst.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_shoot")
			
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
        name = "throw",
        tags = {"attack", "notalking", "abouttoattack"},
        
        onenter = function(inst)
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
            TimeEvent(7*FRAMES, function(inst) inst.components.combat:DoAttack(inst.sg.statemem.target) inst.sg:RemoveStateTag("abouttoattack") end),
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
            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
            local weapon = inst.components.combat:GetWeapon()
            local otherequipped = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)

            if weapon then
                inst.AnimState:PlayAnimation("atk")
				if weapon:HasTag("icestaff") then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_icestaff")
				elseif weapon:HasTag("shadow") then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_nightsword")
                elseif weapon:HasTag("firestaff") then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_firestaff")
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
                if weapon and weapon:HasTag("phoenix_axe") or weapon:HasTag("phoenix_pickaxe") then
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
        end,

        timeline=
        {
            TimeEvent(7*FRAMES, function(inst)
				inst.sg.mem.foosteps = inst.sg.mem.foosteps + 1
                PlayFootstep(inst, inst.sg.mem.foosteps < 5 and 1 or .6)
                DoFoleySounds(inst)
            end),
            TimeEvent(15*FRAMES, function(inst)
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
        name="item_hat",
        tags = {"idle"},
        
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
        tags = {"idle"},
        
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
        tags = {"idle"},
        
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
    
	State{
        name = "bedroll",
        
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
			local danger = FindEntity(inst, 10, function(target) return target:HasTag("monster") or target.components.combat and target.components.combat.target == inst end)
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
			end]]
			
            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PlayAnimation("bedroll")
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
			    local sound_event = "dontstarve/characters/"..sound_name.."/hurt"
                inst.SoundEmitter:PlaySound(inst.hurtsoundoverride or sound_event)
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
			inst.AnimState:PlayAnimation("teleport")
			TheCamera:SetDistance(20)
			inst.HUD:Hide()
		end,

        onexit = function(inst)
            inst.HUD:Show()
            inst.components.playercontroller:Enable(true)
            inst.components.health:SetInvincible(false)
        end,

		timeline = {
			TimeEvent(0, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/common/teleportato/teleportato_pulled")
			end),
			TimeEvent(82*FRAMES, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/common/teleportato/teleportato_under")
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
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("jump")

			inst:DoTaskInTime(4.7, function(inst) inst.SoundEmitter:PlaySound("dontstarve/movement/bodyfall_dirt", "bodyfall") end )
        end,
        
		timeline =
        {
			-- this is just hacked in here to make the sound play BEFORE the player hits the wormhole
			TimeEvent(19*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/teleportworm/travel", "wormhole_travel") end),
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
        name = "werebeaver",
        tags = {"busy"},
        onenter = function(inst)
			inst.components.beaverness.doing_transform = true
            inst.Physics:Stop() 
            inst.components.playercontroller:Enable(false)           
            inst.AnimState:PlayAnimation("transform_pre")
            --inst.components.health:SetInvincible(true)
        end,
        
        onexit = function(inst)
			if not inst.components.beaverness:IsBeaver() then
				inst.components.beaverness.makebeaver(inst)
			end
			--inst.components.health:SetInvincible(false)
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
    
}

    
return StateGraph("wilson", states, events, "idle", actionhandlers)

