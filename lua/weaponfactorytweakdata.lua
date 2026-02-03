-- copy of SBLT's table.merge since that is not defined when this code is run
local function merge(og_table, new_table)
	if not new_table then
		return og_table
	end

	for i, data in pairs(new_table) do
		i = type(data) == "table" and data.index or i
		if type(data) == "table" and type(og_table[i]) == "table" then
			og_table[i] = table.merge(og_table[i], data)
		else
			og_table[i] = data
		end
	end
	return og_table
end

-- add WeaponSkinParts to WeaponFactoryTweakData

Hooks:PostHook(WeaponFactoryTweakData, "_init_weapon_skins", "SkinLib_init_weapon_skins", function(self)
    for id, part in pairs(SkinLib._get_parts()) do
        if not SkinLib._is_part_injected(id) then

            -- setup materials
            local m_fps = {}
            local m_tps = {}
            local materials_fps = part.params.fps or {}
            local materials_tps = part.params.tps or {}
            local unique_materials = {}

            -- fps
            for material, _ in pairs(materials_fps) do
                m_fps[material] = {}
                m_fps[material].bump_normal_texture = part.params.fps[material].bump_normal_texture or nil
                m_fps[material].diffuse_texture = part.params.fps[material].diffuse_texture or nil
                m_fps[material].material_texture = part.params.fps[material].material_texture or nil
                m_fps[material].reflection_texture = part.params.fps[material].reflection_texture or nil
                unique_materials = SkinLib._add_unique_material(unique_materials, material)
            end
            -- tps
            if part.params.tps ~= nil then
                for material, _ in pairs(materials_tps) do
                    -- tps provided
                    m_tps[material] = {}
                    m_tps[material].bump_normal_texture = part.params.tps[material].bump_normal_texture or nil
                    m_tps[material].diffuse_texture = part.params.tps[material].diffuse_texture or nil
                    m_tps[material].material_texture = part.params.tps[material].material_texture or nil
                    m_tps[material].reflection_texture = part.params.tps[material].reflection_texture or nil
                    unique_materials = SkinLib._add_unique_material(unique_materials, material)
                end
            else
                -- use fps as tps
                m_tps = m_fps
            end
            -- insert into uses_parts
            table.insert(self[part.params.weapon_factory_id].uses_parts, part.params.part_id)

            -- insert part
            self.parts[part.params.part_id] = deep_clone(self.parts[part.params.base_part])
            if #unique_materials > 0 then
                self.parts[part.params.part_id].materials_fps = merge(self.parts[part.params.base_part].materials_fps or {}, m_fps)
                self.parts[part.params.part_id].materials_tps = merge(self.parts[part.params.base_part].materials_tps or {}, m_tps)
                self.parts[part.params.part_id].unique_materials = unique_materials
            end

            if part.params.unit then
                self.parts[part.params.part_id].unit = part.params.unit
            end

            if part.params.third_unit then
                self.parts[part.params.part_id].third_unit = part.params.third_unit
            end

            SkinLib._set_injected_part(id)
        end
    end
end)
