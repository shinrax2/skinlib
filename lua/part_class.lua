_G.SL_Part = _G.SL_Part or class()

local sl_part_head = "[SkinLib_Part][_validate]: "
local ids_texture = Idstring("texture")
local ids_unit = Idstring("unit")

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

function SL_Part:_validate(factory)
    local valid = true

    -- does part_id already exist?
    if factory.parts[self._part.part_id] ~= nil then
        log(sl_part_head .. "part_id is already in use! '" .. self._part.part_id .. "'")
        valid = false
    end

    -- is weapon_factory_id valid?
    if not factory[self._part.weapon_factory_id] then
        log(sl_part_head .. "weapon_factory_id is invalid! '" .. self._part.weapon_factory_id .. "'")
        valid = false
    end

    -- does base_part exist?
    if not factory.parts[self._part.base_part] then
        log(sl_part_head .. "base_part does not exist! '" .. self._part.base_part .. "'")
        valid = false
    end

    -- set textures loaded?
    -- fps
    if self._part.fps then
        for mat, data in pairs(self._part.fps) do
            for typ, texture in pairs(data) do
                if not DB:has(ids_texture, texture) then
                    log(sl_part_head .. "part_id: '" .. self._part.part_id .. "' material: '" .. mat .. "' type: '" .. typ .. "' texture: '" .. texture .. "'")
                    valid = false
                end
            end
        end
    end

    -- tps
    if self._part.tps then
        for mat, data in pairs(self._part.tps) do
            for typ, texture in pairs(data) do
                if not DB:has(ids_texture, texture) then
                    log(sl_part_head .. "part_id: '" .. self._part.part_id .. "' material: '" .. mat .. "' type: '" .. typ .. "' texture: '" .. texture .. "'")
                    valid = false
                end
            end
        end
    end

    -- set unit loaded?

    -- set third_unit loaded?


    return valid
end

-- PUBLIC

function SL_Part:add_fps_material(material_name, bump_normal, diffuse, material_texture, reflection_texture)
    if not self._part.fps then
        self._part.fps = {}
    end
    if not self._part.fps[material_name] then
        self._part.fps[material_name] = {}
    end
    if bump_normal then
        self._part.fps[material_name].bump_normal_texture = bump_normal
    end
    if diffuse then
        self._part.fps[material_name].diffuse_texture = diffuse
    end
    if material_texture then
        self._part.fps[material_name].material_texture = material_texture
    end
    if reflection_texture then
        self._part.fps[material_name].reflection_texture = reflection_texture
    end
    return self
end

function SL_Part:add_tps_material(material_name, bump_normal, diffuse, material_texture, reflection_texture)
    if not self._part.tps then
        self._part.tps = {}
    end
    if not self._part.tps[material_name] then
        self._part.tps[material_name] = {}
    end
    if bump_normal  then
        self._part.tps[material_name].bump_normal_texture = bump_normal
    end
    if diffuse then
        self._part.tps[material_name].diffuse_texture = diffuse
    end
    if material_texture then
        self._part.tps[material_name].material_texture = material_texture
    end
    if reflection_texture then
        self._part.tps[material_name].reflection_texture = reflection_texture
    end
    return self
end

function SL_Part:add_unit(unit)
    if unit then
        self._part.unit = unit
    end
    return self
end

function SL_Part:add_third_unit(unit)
    if unit then
        self._part.third_unit = unit
    end
    return self
end
