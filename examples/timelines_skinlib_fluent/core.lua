if SkinLib then
    local m_fps = SL_Material:new("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")
    local m_tps = SL_Material:new("wpn_third_pis_welrod",
        "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
        "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
        "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")

    local part_body = SL_Part:new("wpn_fps_pis_welrod_body_standard_timelines","wpn_fps_pis_welrod", "wpn_fps_pis_welrod_body_standard")
    :add_fps_material(m_fps)
    :add_tps_material(m_tps)

    local part_bolt = SL_Part:new("wpn_fps_pis_welrod_bolt_standard_timelines", "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_bolt_standard")
    :add_fps_material(m_fps)
    :add_tps_material(m_tps)

    local part_m = SL_Part:new("wpn_fps_pis_welrod_m_standard_timelines", "wpn_fps_pis_welrod","wpn_fps_pis_welrod_m_standard")
    :add_fps_material(m_fps)
    :add_tps_material(m_tps)

    local part_catch = SL_Part:new("wpn_fps_pis_welrod_catch_timelines", "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_catch")
    :add_fps_material(m_fps)
    :add_tps_material(m_tps)

    local part_trigger = SL_Part:new("wpn_fps_pis_welrod_trigger_timelines", "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_trigger")
    :add_fps_material(m_fps)
    :add_tps_material(m_tps)

    local part_safety = SL_Part:new("wpn_fps_pis_welrod_safety_timelines", "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_safety"):add_fps_material(m_fps):add_tps_material(m_tps)

    local skin = SL_Skin:new("sx2_ws_welrod_timelines", "welrod")
    :set_name_id("sx2_ws_welrod_timelines")
    :set_weapon_desc_id("sx2_ws_welrod_timelines_desc")
    :set_weapon_name_id("sx2_ws_welrod_timelines_name")
    :set_gold_price(50)
    :set_droppable(true)
    :set_rarity("RARITY_COMMON")
    :add_part(part_body)
    :add_part(part_bolt)
    :add_part(part_m)
    :add_part(part_catch)
    :add_part(part_trigger)
    :add_part(part_safety)
    SkinLib.AddSkin(skin)
end