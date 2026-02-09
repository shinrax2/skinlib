_G.SL_Skin = _G.SL_Skin or class()


-- PRIVATE

function SL_Skin:init(skin_id, weapon_id)
    self._skin = {}
    self._skin.skin_id = skin_id
    self._skin.weapon_id = weapon_id
end

function SL_Skin:_to_tbl()
    return self._skin
end

function SL_Skin:_validate()
    return true
end

function SL_Skin:_parts()
    return self._skin.parts
end

-- PUBLIC

function SL_Skin:set_name_id(name_id)
    if name_id then
        self._skin.name_id = name_id
    end
    return self
end

function SL_Skin:set_weapon_desc_id(w_desc_id)
    if w_desc_id then
        self._skin.weapon_desc_id = w_desc_id
    end
    return self
end

function SL_Skin:set_weapon_name_id(w_name_id)
    if w_name_id then
        self._skin.weapon_name_id = w_name_id
    end
    return self
end

function SL_Skin:set_replaces_part(base_part, replace_part)
    if not self._skin.replaces_parts then
        self._skin.replaces_parts = {}
    end
    if base_part and replace_part then
        self._skin.replaces_parts[base_part] = replace_part
    end
    return self
end

function SL_Skin:set_replaces_parts(parts)
    if parts then
        for base, replace in pairs(parts) do
            self:set_replaces_part(base, replace)
        end
    end
    return self
end

function SL_Skin:set_gold_price(price)
    if price then
        self._skin.gold_price = price
    end
    return self
end

function SL_Skin:set_droppable(droppable)
    if type(droppable) == "boolean" then
        self._skin.droppable = droppable
    end
    return self
end

function SL_Skin:set_rarity(rarity)
    if rarity then
        self._skin.rarity = rarity
    end
    return self
end

function SL_Skin:set_challenge(challenge)
    if challenge then
        self._skin.challenge = challenge
    end
    return self
end

function SL_Skin:set_icon_large(icon)
    if icon then
        self._skin.icon_large = icon
    end
    return self
end

function SL_Skin:set_replaces_unit(base_unit, replace_unit)
    if not self._skin.replaces_units then
        self._skin.replaces_units = {}
    end
    if base_unit and replace_unit then
        self._skin.replaces_units[base_unit] = replace_unit
    end
    return self
end

function SL_Skin:set_replaces_units(units)
    if units then
        for base, replace in pairs(units) do
            self:set_replaces_unit(base, replace)
        end
    end
    return self
end

function SL_Skin:add_part(part)
    if not self._skin.parts then
        self._skin.parts = {}
    end
    if not self._skin.replaces_parts then
        self._skin.replaces_parts = {}
    end
    if part._part_id and part._base_part then
        self._skin.replaces_parts[part:_base_part()] = part:_part_id()
    end
    table.insert(self._skin.parts, part)
    return self
end

function SL_Skin:add_parts(parts)
    for _, part in ipairs(parts) do
        self:add_part(part)
    end
    return self
end