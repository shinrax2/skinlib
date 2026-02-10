-- copy of table.merge since we run before its defined by SBLT
local function merge(og_table, new_table)
	if not new_table then
		return og_table
	end

	for i, data in pairs(new_table) do
		i = type(data) == "table" and data.index or i
		if type(data) == "table" and type(og_table[i]) == "table" then
			og_table[i] = merge(og_table[i], data)
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
            local unique_materials = {}

            local materials_fps = part.params.fps or {}
            local materials_tps = part.params.tps or {}

            -- fps
            for name, _ in pairs(materials_fps) do
                m_fps[name] = {}
                m_fps[name].bump_normal_texture = part.params.fps[name].bump_normal_texture or nil
                m_fps[name].diffuse_texture = part.params.fps[name].diffuse_texture or nil
                m_fps[name].material_texture = part.params.fps[name].material_texture or nil
                m_fps[name].reflection_texture = part.params.fps[name].reflection_texture or nil
                unique_materials = SkinLib._add_unique_material(unique_materials, name)
            end
            -- tps
            if part.params.tps ~= nil then
                for name, _ in pairs(materials_tps) do
                    -- tps provided
                    m_tps[name] = {}
                    m_tps[name].bump_normal_texture = part.params.tps[name].bump_normal_texture or nil
                    m_tps[name].diffuse_texture = part.params.tps[name].diffuse_texture or nil
                    m_tps[name].material_texture = part.params.tps[name].material_texture or nil
                    m_tps[name].reflection_texture = part.params.tps[name].reflection_texture or nil
                    unique_materials = SkinLib._add_unique_material(unique_materials, name)
                end
            else
                -- use fps as tps
                m_tps = m_fps
            end
            -- insert into uses_parts
            table.insert(self[part.params.weapon_factory_id].uses_parts, part.params.part_id)

            -- insert part
            self.parts[part.params.part_id] = deep_clone(self.parts[part.params.base_part])
            if #unique_materials ~= 0 then
                self.parts[part.params.part_id].materials_fps = merge(self.parts[part.params.base_part].materials_fps or {}, m_fps)
                self.parts[part.params.part_id].materials_tps = merge(self.parts[part.params.base_part].materials_tps or {}, m_tps)
                self.parts[part.params.part_id].unique_materials = unique_materials
            end
            if part.params.unit ~= nil then
                self.parts[part.params.part_id].unit = part.params.unit
            end
            if part.params.third_unit ~= nil then
                self.parts[part.params.part_id].third_unit = part.params.third_unit
            end

            -- extra fields for network stuff
            self.parts[part.params.part_id].custom = true
            self.parts[part.params.part_id].base_part = part.params.base_part

            SkinLib._set_injected_part(id)
        end
    end
end)
