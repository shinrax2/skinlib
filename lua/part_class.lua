_G.SL_Part = _G.SL_Part or class()

-- PRIVATE

function SL_Part:init(part_id, weapon_factory_id, base_part)
    self._part = {}
    self._part.part_id = part_id
    self._part.weapon_factory_id = weapon_factory_id
    self._part.base_part = base_part
end

function SL_Part:_to_tbl()
    return self._part
end

function SL_Part:_add_material(view_type, material_name, bump_normal, diffuse, material_texture, reflection_texture)
    --[[SkinLib._validate_material({
        name = material_name or nil,
        bump_normal = bump_normal or nil,
        diffuse = diffuse or nil,
        material = material_texture or nil,
        reflection = reflection_texture or nil
    })]]
    if not self._part[view_type] then
        self._part[view_type] = {}
    end
    if not self._part[view_type][material_name] then
        self._part[view_type][material_name] = {}
    end
    if bump_normal then
        self._part[view_type][material_name].bump_normal_texture = bump_normal
    end
    if diffuse then
        self._part[view_type][material_name].diffuse_texture = diffuse
    end
    if material_texture then
        self._part[view_type][material_name].material_texture = material_texture
    end
    if reflection_texture then
        self._part[view_type][material_name].reflection_texture = reflection_texture
    end
    if not self._part.materials then
        self._part.materials = {}
    end
    if not self._part.materials[view_type] then
        self._part.materials[view_type] = {}
    end
    if self._part.materials[view_type] then
        local found = false
        for _, v in ipairs(self._part.materials[view_type]) do
            if v == material_name then
                found = true
                break
            end
        end
        if not found then
            table.insert(self._part.materials[view_type], material_name)
        end
    end
    return self
end

function SL_Part:_base_part()
    return self._part.base_part
end

function SL_Part:_part_id()
    return self._part.part_id
end

-- PUBLIC

---Adds first person material to part, first argument can be string or SL_Material instance
---@param material_name string|table
---@param bump_normal string|nil
---@param diffuse string|nil
---@param material_texture string|nil
---@param reflection_texture string|nil
---@return table
function SL_Part:add_fps_material(material_name, bump_normal, diffuse, material_texture, reflection_texture)
    if type(material_name) == "table" then
        return self:_add_material("fps", material_name:name(), material_name:bump_normal(), material_name:diffuse(), material_name:material(), material_name:reflection())
    else
        return self:_add_material("fps", material_name, bump_normal, diffuse, material_texture, reflection_texture)
    end
end

---Adds third person material to part, first argument can be string or SL_Material instance
---@param material_name string|table
---@param bump_normal string|nil
---@param diffuse string|nil
---@param material_texture string|nil
---@param reflection_texture string|nil
---@return table
function SL_Part:add_tps_material(material_name, bump_normal, diffuse, material_texture, reflection_texture)
    if type(material_name) == "table" then
        return self:_add_material("tps", material_name:name(), material_name:bump_normal(), material_name:diffuse(), material_name:material(), material_name:reflection())
    else
        return self:_add_material("tps", material_name, bump_normal, diffuse, material_texture, reflection_texture)
    end
end

---Adds unit to part
---@param unit string
---@return table
function SL_Part:add_unit(unit)
    if unit then
        self._part.unit = unit
    end
    return self
end

---Adds third person unit to part
---@param unit string
---@return table
function SL_Part:add_third_unit(unit)
    if unit then
        self._part.third_unit = unit
    end
    return self
end
