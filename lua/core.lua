dofile(ModPath .. "lua/part_class.lua")
dofile(ModPath .. "lua/skin_class.lua")
dofile(ModPath .. "lua/material_class.lua")

_G.SkinLib = _G.SkinLib or {}
SkinLib.path = ModPath
SkinLib.data = SavePath
SkinLib._skins = {}
SkinLib._injected_skins = {}
SkinLib._parts = {}
SkinLib._injected_parts = {}

-- PRIVATE

function SkinLib._is_skin_injected(skin_id)
    for _, id in pairs(SkinLib._injected_skins) do
        if id == skin_id then
            return true
        end
    end
    return false
end

function SkinLib._is_part_injected(part_id)
    for _, id in pairs(SkinLib._injected_parts) do
        if id == part_id then
            return true
        end
    end
    return false
end

function SkinLib._get_skins()
    return SkinLib._skins
end

function SkinLib._get_parts()
    return SkinLib._parts
end

function SkinLib._set_injected_skin(skin_id)
    table.insert(SkinLib._injected_skins, skin_id)
end

function SkinLib._set_injected_part(part_id)
    table.insert(SkinLib._injected_parts, part_id)
end

function SkinLib._add_skin(skin)
    SkinLib._skins[skin.id] = skin
end

function SkinLib._add_part(part, id)
    SkinLib._parts[part.id] = part
end

function SkinLib._add_unique_material(unique_material, material)
    local inserted = false
    for _, m in ipairs(unique_material) do
        if m == material then
            inserted = true
        end
    end
    if not inserted then
        table.insert(unique_material, material)
    end
    return unique_material
end

-- PUBLIC

function SkinLib.AddSkin(params)
    local skin = {}
    if params._parts then
        for _, part in ipairs(params:_parts()) do
            SkinLib.AddPart(part)
        end
    end
    if type(params) == "table" and params._to_tbl then
        skin._cls = deep_clone(params)
        params = params:_to_tbl()
    end
    skin.params = params
    skin.id = params.skin_id
    SkinLib._add_skin(skin)
end

function SkinLib.AddPart(params)
    local part = {}
    if type(params) == "table" and params._to_tbl then
        part._cls = deep_clone(params)
        params = params:_to_tbl()
    end
    part.params = params
    part.id = params.part_id
    SkinLib._add_part(part)
end
