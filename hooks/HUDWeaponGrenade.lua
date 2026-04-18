Hooks:PostHook(HUDWeaponGrenade, "_create_icon", "SkinLib.HUDWeaponGrenade._create_icon", function (self)
	local applied_skin = managers.weapon_inventory:get_applied_weapon_skin(string.sub(self:name_id(), 12)) -- TODO: find better way from bm_grenade_d343 to d343
    if applied_skin  ~= nil then
        if tweak_data.weapon.weapon_skins[applied_skin].hud_icon then
			self._icon:set_image(
				type(tweak_data.weapon.weapon_skins[applied_skin].hud_icon) == "table" and tweak_data.weapon.weapon_skins[applied_skin].hud_icon.texture or tweak_data.weapon.weapon_skins[applied_skin].hud_icon,
				type(tweak_data.weapon.weapon_skins[applied_skin].hud_icon) == "table" and tweak_data.weapon.weapon_skins[applied_skin].hud_icon.texture_rect or nil
			)
        end
    end
end)