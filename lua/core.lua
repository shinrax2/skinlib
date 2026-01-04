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

function SkinLib._add_part(part)
    SkinLib._parts[part.id] = part
end

-- PUBLIC

function SkinLib.AddSkin(params)
    local skin = {}
    skin.params = params
    skin.id = params.skin_id
    SkinLib._add_skin(skin)
end

function SkinLib.AddSkinPart(params)
    local part = {}
    part.params = params
    part.id = params.part_id
    SkinLib._add_part(part)
end
