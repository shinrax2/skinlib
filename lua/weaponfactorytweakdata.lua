-- add WeaponSkinParts to WeaponFactoryTweakData

Hooks:PostHook(WeaponFactoryTweakData, "_init_weapon_skins", "SkinLib_init_weapon_skins", function(self)
    for id, part in pairs(SkinLib._get_parts()) do
        if not SkinLib._is_part_injected(id) then

            -- setup materials
            local m_fps = {}
            local m_tps = {}
            local materials_fps = part.params.materials.fps or {}
            local materials_tps = part.params.materials.tps or {}
            local unique_materials = {}

            -- fps
            for _, material in ipairs(materials_fps) do
                m_fps[material] = {}
                m_fps[material].bump_normal_texture = part.params.fps[material].bump_normal_texture
                m_fps[material].diffuse_texture = part.params.fps[material].diffuse_texture
                m_fps[material].material_texture = part.params.fps[material].material_texture
                m_fps[material].reflection_texture = part.params.fps[material].reflection_texture or nil
                table.insert(unique_materials, material)
            end
            -- tps
            if part.params.tps ~= nil then
                for _, material in ipairs(materials_tps) do
                    -- tps provided
                    m_tps[material] = {}
                    m_tps[material].bump_normal_texture = part.params.tps[material].bump_normal_texture
                    m_tps[material].diffuse_texture = part.params.tps[material].diffuse_texture
                    m_tps[material].material_texture = part.params.tps[material].material_texture
                    m_tps[material].reflection_texture = part.params.tps[material].reflection_texture or nil
                    table.insert(unique_materials, material)
                end
            else
                -- use fps as tps
                m_tps = m_fps
            end
            -- insert into uses_parts
            table.insert(self[part.params.weapon_factory_id].uses_parts, part.params.part_id)

            -- insert part
            self.parts[part.params.part_id] = deep_clone(self.parts[part.params.base_part])
            self.parts[part.params.part_id].materials_fps = m_fps
            self.parts[part.params.part_id].materials_tps = m_tps
            self.parts[part.params.part_id].unique_materials = unique_materials

            SkinLib._set_injected_part(id)
        end
    end
end)
