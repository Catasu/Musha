--working on ..

local EventHandler = GLOBAL.EventHandler
local State = GLOBAL.State
local TheInput = GLOBAL.TheInput
local TimeEvent = GLOBAL.TimeEvent
local SpawnPrefab = GLOBAL.SpawnPrefab
local FRAMES = GLOBAL.FRAMES
local EQUIPSLOTS = GLOBAL.EQUIPSLOTS

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

local function DoYawnSound(inst)
    if inst.yawnsoundoverride ~= nil then
        inst.SoundEmitter:PlaySound(inst.yawnsoundoverride)
    elseif not inst:HasTag("mime") then
        inst.SoundEmitter:PlaySound((inst.talker_path_override or "dontstarve/characters/")..(inst.soundsname or inst.prefab).."/yawn")
    end
end

AddStategraphEvent("wilson",  EventHandler("doattack", 
		function(inst)
        if not inst.components.health:IsDead() and not inst.sg:HasStateTag("attack") and not inst.sg:HasStateTag("sneeze") then
            local weapon = inst.components.combat and inst.components.combat:GetWeapon()
            if weapon and weapon:HasTag("blowdart") then
                inst.sg:GoToState("blowdart")
            elseif weapon and weapon:HasTag("thrown") then
                inst.sg:GoToState("throw")
            elseif weapon and weapon:HasTag("speargun") then 
                inst.sg:GoToState("speargun")
            elseif weapon and weapon:HasTag("blunderbuss") then 
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
    end)
		)
	


local idlem = State(
{name = "idle",
        tags = {"idle", "canrotate"},
        onenter = function(inst, pushanim)
            
            inst.components.locomotor:Stop()
            if inst.wantstosneeze and not inst:HasTag("tiny_sleep") and not inst:HasTag("sleep_on") then  
                inst.sg:GoToState("sneeze")
            end

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
    }
	)
AddStategraphState("wilson", idlem)	

local funnyidlem = State(
{
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
            elseif inst.components.sanity:GetPercent() < .05 then
				inst.AnimState:PlayAnimation("idle_inaction_sanity")
            elseif inst:HasTag("groggy") or inst:HasTag("groggy_2") or inst:HasTag("heavy_chest") then
                inst.AnimState:PlayAnimation("idle_groggy01_pre")
                inst.AnimState:PushAnimation("idle_groggy01_loop")
                inst.AnimState:PushAnimation("idle_groggy01_pst", false)                
            else
                inst.AnimState:PlayAnimation("idle_inaction")
            end
        end,

        events=
        {
            EventHandler("animqueueover", function(inst) inst.sg:GoToState("idle") end ),
        },
        
    }
	)
AddStategraphState("wilson", funnyidlem)		

	local mwakeup = State(
{name = "wakeup",

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

    }
	)
AddStategraphState("wilson", mwakeup)	

local chopm = State(
{name = "chop",
        tags = {"prechop", "chopping", "working"},
        onenter = function(inst)
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
				local item = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
				if item then
				inst.sg:GoToState("hit")
				inst.components.inventory:Unequip(GLOBAL.EQUIPSLOTS.HANDS, true) 
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
    }
	)
AddStategraphState("wilson", chopm)		

local mine_startm = State(
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
    }
	)
AddStategraphState("wilson", mine_startm)		

local minem = State(
{name = "mine",
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
                    if inst.sg.statemem.action.target:HasTag("mech") then
                    else
					    local fx = SpawnPrefab("mining_fx")
					    fx.Transform:SetPosition(inst.sg.statemem.action.target:GetPosition():Get())
                    end
				end
                inst:PerformBufferedAction() 
                inst.sg:RemoveStateTag("premine") 
				local weapon = inst.components.combat and inst.components.combat:GetWeapon()
				local weapon = inst.components.combat and inst.components.combat:GetWeapon()
				if weapon and weapon:HasTag("musha_items") and weapon.components.fueled and not weapon.broken then
				weapon.components.fueled:DoDelta(-80000)
				elseif weapon and weapon:HasTag("musha_items") and weapon.components.fueled and weapon.broken then
				local item = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
				if item then
				inst.sg:GoToState("hit")
				inst.components.inventory:Unequip(GLOBAL.EQUIPSLOTS.HANDS, true) 
				inst.components.inventory:GiveItem(item)
				end
				end


                if inst.sg.statemem.action and inst.sg.statemem.action.target and inst.sg.statemem.action.target:HasTag("mech") then
                    inst.SoundEmitter:PlaySound("dontstarve/impacts/impact_mech_med_sharp")
                    inst.SoundEmitter:PlaySound("dontstarve_DLC003/creatures/enemy/metal_robot/green")
                elseif inst.sg.statemem.action and inst.sg.statemem.action.target and inst.sg.statemem.action.target.prefab == "rock_ice" then
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
    }
	)
AddStategraphState("wilson", minem)		
	
local hammer_startm = State(
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
    }
	)
AddStategraphState("wilson", hammer_startm)		

local hammerm = State(
{name = "hammer",
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
				local item = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
				if item then
				inst.sg:GoToState("hit")
				inst.components.inventory:Unequip(GLOBAL.EQUIPSLOTS.HANDS, true) 
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
    }
	)
AddStategraphState("wilson", hammerm)		

local digm = State(
 {name = "dig",
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
				local item = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
				if item then
				inst.sg:GoToState("hit")
				inst.components.inventory:Unequip(GLOBAL.EQUIPSLOTS.HANDS, true) 
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
    } 
	)
AddStategraphState("wilson", digm)		

local refuse_eat = State(
{name = "refuseeat",
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
    }
	)
AddStategraphState("wilson", refuse_eat)		
			
local mindcontrol = State(
{name = "mindcontrol",
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
    }
	)
AddStategraphState("wilson", mindcontrol)	

		
local mtalk = State(
{name = "talk",
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
            local equippedHat = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HEAD)

            if equippedHat and equippedHat:HasTag("muffler") then
                inst.SoundEmitter:PlaySound(path..sound_name.."/gasmask_talk", "talk")

            elseif inst.talksoundoverride then
                inst.SoundEmitter:PlaySound(inst.talksoundoverride, "talk")
            else
                inst.SoundEmitter:PlaySound(path..sound_name.."/talk_LP", "talk")
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
    }
	)
AddStategraphState("wilson", mtalk)	




local peertelescope2 = State(
{name = "peertelescope2",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
           -- inst.sg.statemem.action = inst:GetBufferedAction()
           -- local act = inst:GetBufferedAction()
			local item = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) 
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
	           if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
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
    }
	)
AddStategraphState("wilson", peertelescope2)	


local play_flute2 = State(
{name = "play_flute2",
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
            if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
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
    }
	)
AddStategraphState("wilson", play_flute2)	

local book2 = State(
{name = "book2",
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

            if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
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
    }
	)
AddStategraphState("wilson", book2)	

local map = State(
{name = "map",
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
            if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
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
    }
	)
AddStategraphState("wilson", map)	

local bowm3 = State(
{name = "bowm3",
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
    }
	)
AddStategraphState("wilson", bowm3)	

local bowm2 = State(
{name = "bowm2",
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
    }
	)
AddStategraphState("wilson", bowm2)	

local attack2 = State(
{name = "attack2",
        tags = {"attack", "notalking", "abouttoattack", "busy"},
        
        onenter = function(inst)
			inst.f_attack = true
			inst:DoTaskInTime(1.6, function(inst) inst.f_attack = false end )
            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
            local weapon = inst.components.combat:GetWeapon()
            local otherequipped = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)

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
    }
	)
AddStategraphState("wilson", attack2)	

local attacking = State(
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
    }
	)
AddStategraphState("wilson", attacking)	

local sneeze = State(
{name = "sneeze",
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
                --local equippedHat = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HEAD)
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
               
    }
	)
AddStategraphState("wilson", sneeze)	

local bedroll2 = State(
{name = "bedroll2",
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
    }
	)
AddStategraphState("wilson", bedroll2)	

local yawn = State(
{name = "yawn",
        tags = { "busy", "yawn", "pausepredict" },

        onenter = function(inst, data)
            ForceStopHeavyLifting(inst)
            inst.components.locomotor:Stop()
            inst:ClearBufferedAction()

            if data ~= nil and
                data.grogginess ~= nil and
                data.grogginess > 0 and
                inst.components.grogginess ~= nil then
                --Because we have the yawn state tag, we will not get
                --knocked out no matter what our grogginess level is.
                inst.sg.statemem.groggy = true
                inst.sg.statemem.knockoutduration = data.knockoutduration
                inst.components.grogginess:AddGrogginess(data.grogginess, data.knockoutduration)
            end

            inst.AnimState:PlayAnimation("yawn")
        end,

        timeline =
        {
            TimeEvent(.1, function(inst)
                local mount = inst.components.rider:GetMount()
                if mount ~= nil and mount.sounds ~= nil and mount.sounds.yell ~= nil then
                    inst.SoundEmitter:PlaySound(mount.sounds.yell)
                end
            end),
            TimeEvent(15 * FRAMES, DoYawnSound),
        },

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:RemoveStateTag("yawn")
                    inst.sg:GoToState("idle")
                end
            end),
        },

        onexit = function(inst)
            if inst.sg.statemem.groggy and
                not inst.sg:HasStateTag("yawn") and
                inst.components.grogginess ~= nil then
                --Add a little grogginess to see if it triggers
                --knock out now that we don't have the yawn tag
                inst.components.grogginess:AddGrogginess(.01, inst.sg.statemem.knockoutduration)
            end
        end,
    }
	)
AddStategraphState("wilson", yawn)	

local knockout = State(
{name = "knockout",
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
    }
	)
AddStategraphState("wilson", knockout)	

local peertelescope = State(
{name = "peertelescope",
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
                
                local telescope = inst.sg.statemem.action.invobject or inst.sg.statemem.action.doer.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
                if telescope and telescope.components.finiteuses then
                    -- this is here because the telescope still needs to exist while playing the put away animation
                    --telescope.components.finiteuses:Use()
                end

                inst.sg:GoToState("idle")

            end ),
        },
    }
	)
AddStategraphState("wilson", peertelescope)	

-----boat

local function DoAttackFn(inst, data)
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
			elseif weapon and not weapon:HasTag("bowm") and not weapon:HasTag("frost_hammer") and (inst:HasTag("frosta") or inst:HasTag("framea")) and not inst:HasTag("lightningblue1") and not inst:HasTag("lightningblue2") and not inst.sneaka then 	
				inst.sg:GoToState("attack2")
			elseif weapon and not weapon:HasTag("bowm") and weapon:HasTag("musha_items") and inst.sneaka then 	
				inst.sg:GoToState("attack2")
			elseif weapon and weapon:HasTag("frost_hammer") and not inst.sneaka then 	 	
				inst.sg:GoToState("attack2")
			elseif weapon and weapon:HasTag("phoenix_axe") and not inst.sneaka then 	 	
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
end

AddStategraphEvent("wilsonboating",  EventHandler("doattack",  DoAttackFn))


local book2_onboat = State(
{name = "book2",
        tags = {"doing"--[[,"busy"]]},
        
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
			inst.components.playercontroller:Enable(true) end)
			inst:DoTaskInTime( 5, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
			inst.components.health:SetInvincible(false)
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

            if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
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
    }
	)
AddStategraphState("wilsonboating", book2_onboat)	

local peertelescope2_onboat = State(
{name = "peertelescope2",
        tags = {"doing", "busy", "canrotate"},

        onenter = function(inst)
           -- inst.sg.statemem.action = inst:GetBufferedAction()
           -- local act = inst:GetBufferedAction()
			local item = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) 
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
	           if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
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
    }
	)
AddStategraphState("wilsonboating", peertelescope2_onboat)	

local play_flute2_onboat = State(
{name = "play_flute2",
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
            if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
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
    }
	)
AddStategraphState("wilsonboating", play_flute2_onboat)

local play_horn2_onboat = State(
{name = "play_horn2",
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
            if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
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
    }
	)
AddStategraphState("wilsonboating", play_horn2_onboat)

local mine_start_onboat = State(
State{ name = "mine_start",
        tags = {"premine", "working"},
        onenter = function(inst)
		local weapon = inst.components.combat and inst.components.combat:GetWeapon()
					if weapon and weapon:HasTag("phoenix_axe") and weapon.axe then
					inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe2", "phoenixaxe")
					end
           -- inst.components.driver:SplitFromVehicle()
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
    }
	)
AddStategraphState("wilsonboating", mine_start_onboat)

local mine_onboat = State(
{name = "mine",
        tags = {"premine", "mining", "working"},
        onenter = function(inst)
		local weapon = inst.components.combat and inst.components.combat:GetWeapon()
					if weapon and weapon:HasTag("phoenix_axe") and weapon.axe then
					inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixaxe2", "phoenixaxe")
					end
           -- inst.components.driver:SplitFromVehicle()
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
				local item = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
				if item then
				inst.sg:GoToState("hit")
				inst.components.inventory:Unequip(GLOBAL.EQUIPSLOTS.HANDS, true) 
				inst.components.inventory:GiveItem(item)
				end
				end
                if inst.sg.statemem.action and inst.sg.statemem.action.target and inst.sg.statemem.action.target.prefab == "rock_ice" then
                    inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/iceboulder_hit")
                elseif inst.sg.statemem.action and inst.sg.statemem.action.target and inst.sg.statemem.action.target.prefab == "coralreef" then
                    inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/coral_hit_mine_pick")
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
    }
	)
AddStategraphState("wilsonboating", mine_onboat)


local bowm2_onboat = State(
{name = "bowm2",
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
    }
	)
AddStategraphState("wilsonboating", bowm2_onboat)

local attack2_onboat = State(
{name = "attack2",
        tags = {"attack", "notalking", "abouttoattack", "busy"},
        
        onenter = function(inst)
		
            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
            local weapon = inst.components.combat:GetWeapon()
            local otherequipped = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)

            if weapon then
                inst.AnimState:PlayAnimation("pickaxe_pre")
				if weapon:HasTag("frosta") then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_icestaff")
				elseif weapon:HasTag("shadow") then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_nightsword")
                elseif weapon:HasTag("framea") then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_firestaff")
                else
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
                end
            elseif otherequipped and (otherequipped:HasTag("light") or otherequipped:HasTag("nopunch")) then
                inst.AnimState:PlayAnimation("pickaxe_pre")
                inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
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
    }
	)
AddStategraphState("wilsonboating", attack2_onboat)

local attacking_onboat = State(
State{ name = "attacking",
        tags = {"attack", "notalking", "abouttoattack", "busy"},
        onenter = function(inst)
			inst.f_attack = true
			inst:DoTaskInTime(1.5, function(inst) inst.f_attack = false end )
            inst.components.locomotor:Stop()
			if inst.components.combat.target then
                inst.components.combat:BattleCry()
                if inst.components.combat.target and inst.components.combat.target:IsValid() then
                    inst:FacePoint(Point(inst.components.combat.target.Transform:GetWorldPosition()))
                end
            end
			 inst.AnimState:PlayAnimation("pickaxe_loop")
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
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") inst.f_attack = false end),
        },
    }
	)
AddStategraphState("wilsonboating", attacking_onboat)

