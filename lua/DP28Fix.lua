-- DP28 was hardcoded to vanilla magazine parts
function DP28RaycastWeaponBase:get_magazine_object()
    for _, part_id in ipairs(tweak_data.weapon.factory.wpn_fps_lmg_dp28.uses_parts) do
        if tweak_data.weapon.factory.parts[part_id] and tweak_data.weapon.factory.parts[part_id].type and tweak_data.weapon.factory.parts[part_id].type == "magazine" then
            if self._parts[part_id] then
                return self._parts[part_id]
            end
        end
    end
end
