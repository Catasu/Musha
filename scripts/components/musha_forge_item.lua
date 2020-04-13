local Musha_forge_item =
    Class(
    function(self, inst, data)
        self.inst = inst
    end
)

function Musha_forge_item:LevelMAX(value)
    local result
    if value == 0 then
        result = math.ceil(5 / 5) * 5
    elseif value <= 10 then
        result = math.ceil(value / 5) * 5
    elseif value <= 110 then
        result = math.ceil((value - 10) / 20) * 20 + 10
    elseif value <= 410 then
        result = math.ceil((value - 110) / 60) * 60 + 110
    elseif value <= 1010 then
        result = math.ceil((value - 410) / 120) * 120 + 410
    elseif value <= 2010 then
        result = math.ceil((value - 1010) / 200) * 200 + 1010
    elseif value <= 3210 then
        result = math.ceil((value - 2010) / 280) * 280 + 2010
    elseif value <= 4000 then
        result = math.ceil((value - 3210) / 395) * 395 + 3210
    end
    return result
end

function Musha_forge_item:ArmorLevel(value)
    local result
    if value <= 10 then
        result = math.ceil(value / 5)
    elseif value <= 110 then
        result = math.ceil((value - 10) / 20) + 2
    elseif value <= 410 then
        result = math.ceil((value - 110) / 60) + 7
    elseif value <= 1010 then
        result = math.ceil((value - 410) / 120) + 12
    elseif value <= 2010 then
        result = math.ceil((value - 1010) / 200) + 17
    elseif value <= 3210 then
        result = math.ceil((value - 2010) / 280) + 22
    elseif value <= 4000 then
        result = math.ceil((value - 3210) / 395) + 27
    elseif value > 4000 then
        result = 30
    end
    return result
end

function Musha_forge_item:Random_EXP(inst)
    local lucky = math.random()
    if lucky < 0.12 then
        return 8
    elseif lucky < 0.2 then
        return 5
    elseif lucky < 0.3 then
        return 4
    elseif lucky < 1 then
        return 1
    end
end

function Musha_forge_item:Report_Armor_data(inst)
    local armor_level = self:ArmorLevel(inst.level)
    local armor_data = inst.components.armor.absorb_percent
    local Armor_Max_Level = self:LevelMAX(inst.level)
    local EXP = inst.level
    inst.components.talker:Say(inst:GetDisplayName "\n" .. "(Lv-" .. armor_level .. ")" .. "\n" .. STRINGS.MUSHA_ARMOR .. " (" .. armor_data .. ")\n" .. STRINGS.MUSHA_ITEM_GROWPOINTS .. "\n" .. EXP .. "/" .. Armor_Max_Level)
end

function Musha_forge_item:Mushaforge(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local forge = TheSim:FindEntities(x, y, z, 6, {"musha_forge"})
    if next(forge) ~= nil then
        return true
    -- else
    -- return false
    end
    return false
end

function Musha_forge_item:LevelPatch(inst, data)
    local Armor_Max_Level = self:LevelMAX(inst.level)
    if Armor_Max_Level ~= nil then
        if inst.level > Armor_Max_Level or inst.level == Armor_Max_Level then
            local Temporary_variable = Armor_Max_Level + 1
            Armor_Max_Level = self:LevelMAX(Temporary_variable)
        end
    elseif Armor_Max_Level == nil then
        Armor_Max_Level = 5
    end
    return Armor_Max_Level
end

function Musha_forge_item:GetEXP(inst)
    local Exp = self:Random_EXP()
    local armor_level = self:ArmorLevel(inst.level)
    if inst.level < 4000 then
        SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get())

        if self:Mushaforge(inst) and inst.action_forge then
            Exp = Exp * 5
            inst.level = inst.level + Exp
		elseif self:Mushaforge(inst) and not inst.action_forge then
            Exp = Exp * 5
            inst.level = inst.level + Exp
            local Armor_Max_Level = (self:LevelPatch(inst))
            inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
            inst.components.talker:Say(STRINGS.MUSHA_TALK_FORGE_LUCKY .. "\n+(" .. Exp .. ")\n[" .. STRINGS.MUSHA_ITEM_GROWPOINTS .. "]" .. (inst.level) .. "/" .. Armor_Max_Level)
        else
            inst.level = inst.level + Exp
            local Armor_Max_Level = (self:LevelPatch(inst))
            if Exp ~= 1 then
                inst.components.talker:Say(inst:GetDisplayName "\n" .. "(Lv-" .. armor_level .. ")" .. "\n" .. STRINGS.MUSHA_ITEM_LUCKY .. "[" .. Exp .. "]\n" .. (inst.level) .. "/" .. Armor_Max_Level)
            else
                inst.components.talker:Say(inst:GetDisplayName "\n" .. "(Lv-" .. armor_level .. ")" .. "\n" .. STRINGS.MUSHA_ITEM_GROWPOINTS .. "[1]\n" .. (inst.level) .. "/" .. Armor_Max_Level)
            end
        end
    else
        inst.components.talker:Say(STRINGS.MUSHA_LEVEL_INFORMATION)
    end
end

return Musha_forge_item

    elseif value <= 3210 then
        result = math.ceil((value - 2010) / 280) + 22
    elseif value <= 4000 then
        result = math.ceil((value - 3210) / 395) + 27
    elseif value > 4000 then
        result = 30
    end
    return result
end

function Musha_forge_item:Random_EXP(inst)
    local lucky = math.random()
    if lucky < 0.12 then
        return 8
    elseif lucky < 0.2 then
        return 5
    elseif lucky < 0.3 then
        return 4
    elseif lucky < 1 then
        return 1
    end
end

function Musha_forge_item:Report_Armor_data(inst)
    local armor_level = self:ArmorLevel(inst.level)
    local armor_data = inst.components.armor.absorb_percent
    local Armor_Max_Level = self:LevelMAX(inst.level)
    local EXP = inst.level
    inst.components.talker:Say(inst:GetDisplayName "\n" .. "(Lv-" .. armor_level .. ")" .. "\n" .. STRINGS.MUSHA_ARMOR .. " (" .. armor_data .. ")\n" .. STRINGS.MUSHA_ITEM_GROWPOINTS .. "\n" .. EXP .. "/" .. Armor_Max_Level)
end

function Musha_forge_item:Mushaforge(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local forge = TheSim:FindEntities(x, y, z, 6, {"musha_forge"})
    if next(forge) ~= nil then
        return true
    -- else
    -- return false
    end
    return false
end

function Musha_forge_item:LevelPatch(inst, data)
    local Armor_Max_Level = self:LevelMAX(inst.level)
    if Armor_Max_Level ~= nil then
        if inst.level > Armor_Max_Level or inst.level == Armor_Max_Level then
            local Temporary_variable = Armor_Max_Level + 1
            Armor_Max_Level = self:LevelMAX(Temporary_variable)
        end
    elseif Armor_Max_Level == nil then
        Armor_Max_Level = 5
    end
    return Armor_Max_Level
end

function Musha_forge_item:GetEXP(inst)
    local Exp = self:Random_EXP()
    local armor_level = self:ArmorLevel(inst.level)
    if inst.level < 4000 then
        SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get())

        if self:Mushaforge(inst) then
            Exp = Exp * 5
            inst.level = inst.level + Exp
            local Armor_Max_Level = (self:LevelPatch(inst))
            inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
            inst.components.talker:Say(STRINGS.MUSHA_TALK_FORGE_LUCKY .. "\n+(" .. Exp .. ")\n[" .. STRINGS.MUSHA_ITEM_GROWPOINTS .. "]" .. (inst.level) .. "/" .. Armor_Max_Level)
        else
            inst.level = inst.level + Exp
            local Armor_Max_Level = (self:LevelPatch(inst))
            if Exp ~= 1 then
                inst.components.talker:Say(inst:GetDisplayName "\n" .. "(Lv-" .. armor_level .. ")" .. "\n" .. STRINGS.MUSHA_ITEM_LUCKY .. "[" .. Exp .. "]\n" .. (inst.level) .. "/" .. Armor_Max_Level)
            else
                inst.components.talker:Say(inst:GetDisplayName "\n" .. "(Lv-" .. armor_level .. ")" .. "\n" .. STRINGS.MUSHA_ITEM_GROWPOINTS .. "[1]\n" .. (inst.level) .. "/" .. Armor_Max_Level)
            end
        end
    else
        inst.components.talker:Say(STRINGS.MUSHA_LEVEL_INFORMATION)
    end
end

return Musha_forge_item
