-- add WeaponSkin to WeaponTweakData

Hooks:PostHook(WeaponTweakData, "_init_data_weapon_skins", "SkinLib_init_data_weapon_skins", function(self)
	for id, skin in pairs(SkinLib._get_skins()) do
		if not SkinLib._is_skin_injected(id) then
			local si = {}
			si.dlc = skin.params.dlc or nil
			si.name_id = skin.params.name_id
			si.replaces_parts = skin.params.replaces_parts or nil
			si.weapon_desc_id = skin.params.weapon_desc_id or ""
			si.weapon_id = skin.params.weapon_id
			si.weapon_name_id = skin.params.weapon_name_id
			si.challenge = skin.params.challenge or nil
			si.droppable = skin.params.droppable or nil
			si.gold_price = skin.params.gold_price or nil
			si.rarity = LootDropTweakData[skin.params.rarity] or nil
			si.replaces_units = skin.params.replaces_units or nil
			si.icon_large = skin.params.icon_large or nil
			self.weapon_skins[id] = si
			SkinLib._set_injected_skin(id)
		end
	end
end)
