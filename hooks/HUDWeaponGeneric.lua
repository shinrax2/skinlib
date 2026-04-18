function HUDWeaponGeneric:init(index, weapons_panel, tweak_data)
	HUDWeaponGeneric.super.init(self, index, weapons_panel, tweak_data)
	self:set_max_clip(tweak_data.CLIP_AMMO_MAX)

	self._index = index

	self._name_id = tweak_data.name_id

	self:_create_panel(weapons_panel)
	self:_create_icon(tweak_data.hud.icon)
	self:_create_ammo_panel(weapons_panel)
	self:_create_ammo_left_info(weapons_panel)
	self:_create_clip_left_info(weapons_panel)
	self:_create_firemodes()
	self:set_current_clip(tweak_data.CLIP_AMMO_MAX)
end

-- panel.icon:set_texture doesnt work on this?!
function HUDWeaponGeneric:_create_icon(icon)
	local icon_panel_params = {
		h = self._object:h() / 2,
		halign = "center",
		name = "icon_panel",
		valign = "top",
		w = self._object:w(),
		x = 0,
		y = 0,
	}

	self._icon_panel = self._object:panel(icon_panel_params)

	local icon_params = {
		alpha = HUDWeaponBase.ALPHA_WHEN_UNSELECTED,
		name = "weapon_icon",
		texture = tweak_data.gui.icons[icon].texture,
		texture_rect = tweak_data.gui.icons[icon].texture_rect,
	}
    local applied_skin = managers.weapon_inventory:get_applied_weapon_skin(string.sub(tostring(self._name_id), 6))
    if applied_skin  ~= nil then
        if tweak_data.weapon.weapon_skins[applied_skin].hud_icon then
            if type(tweak_data.weapon.weapon_skins[applied_skin].hud_icon) == "table" then
                icon_params.texture = tweak_data.weapon.weapon_skins[applied_skin].hud_icon.texture
                icon_params.texture_rect = tweak_data.weapon.weapon_skins[applied_skin].hud_icon.texture_rect
            else
                icon_params.texture = tweak_data.weapon.weapon_skins[applied_skin].hud_icon
                icon_params.texture_rect = nil
            end
        end
    end

	self._icon = self._icon_panel:bitmap(icon_params)

	self._icon:set_center_x(self._icon_panel:w() / 2)
	self._icon:set_center_y(self._icon_panel:h() / 2)
end