local function bp_unpack(blueprint_string, factory_id)
	local factory = tweak_data.weapon.factory
	local index_table = string.split(blueprint_string, " ")
	local blueprint = {}
	local part_id

	for _, part_index in ipairs(index_table) do
		part_id = factory[factory_id].uses_parts[tonumber(part_index)]

		if part_id then
			table.insert(blueprint, part_id)
		end
	end

	return blueprint
end

local function bp_pack(blueprint, factory_id)
	local factory = tweak_data.weapon.factory
	local index_table = {}

	for i, part_id in ipairs(factory[factory_id] and factory[factory_id].uses_parts or {}) do
		index_table[part_id] = i
	end

	local s = ""

	for _, part_id in ipairs(blueprint) do
		if index_table[part_id] then
			s = s .. tostring(index_table[part_id]) .. " "
		else
			Application:error("[WeaponFactoryManager:blueprint_to_string] Part do not exist in weapon's uses_parts!", "factory_id", factory_id, "part_id", part_id)
		end
	end

	return s
end

function PlayerInventory:_send_equipped_weapon(send_equipped_weapon_type)
	send_equipped_weapon_type = send_equipped_weapon_type or PlayerInventory.SEND_WEAPON_TYPE_PLAYER_PRIMARY_SECONDARY

	local equipped_weapon_category_id = self:equipped_selection()
	local equipped_weapon_identifier = self:equipped_unit():base():get_name_id()

	if equipped_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_GRENADES_ID or equipped_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
		send_equipped_weapon_type = PlayerInventory.SEND_WEAPON_TYPE_PLAYER_MELEE_GRENADE
	end

	if send_equipped_weapon_type == PlayerInventory.SEND_WEAPON_TYPE_TEAMAI_COPS then
		for i, weap_name in ipairs(tweak_data.character.weap_unit_names) do
			if weap_name == self:equipped_unit():name() then
				equipped_weapon_identifier = tostring(i)
			end
		end
	end

	local blueprint_string = self:equipped_unit():base().blueprint_to_string and self:equipped_unit():base():blueprint_to_string() or ""
	local cosmetics_id = self:equipped_unit():base().get_cosmetics_id and self:equipped_unit():base():get_cosmetics_id()

	local factory_id = SkinLib.weaponid2factoryid(equipped_weapon_identifier)
	if factory_id ~= false  and factory_id ~= nil and blueprint_string ~= "" then
		blueprint_string = bp_pack(SkinLib._clean_blueprint(bp_unpack(blueprint_string, factory_id), factory_id), factory_id)
	end


	self._unit:network():send("set_equipped_weapon", send_equipped_weapon_type, equipped_weapon_category_id, equipped_weapon_identifier, blueprint_string, cosmetics_id)
end