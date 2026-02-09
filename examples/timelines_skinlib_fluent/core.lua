local part_body = SL_Part:new("wpn_fps_pis_welrod_body_standard_timelines","wpn_fps_pis_welrod", "wpn_fps_pis_welrod_body_standard")
part_body:add_fps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")
part_body:add_tps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")

local part_bolt = SL_Part:new("wpn_fps_pis_welrod_bolt_standard_timelines", "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_bolt_standard")
part_bolt:add_fps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")
part_bolt:add_tps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")

local part_m = SL_Part:new("wpn_fps_pis_welrod_m_standard_timelines", "wpn_fps_pis_welrod","wpn_fps_pis_welrod_m_standard")
part_m:add_fps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")
part_m:add_tps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")

local part_catch = SL_Part:new("wpn_fps_pis_welrod_catch_timelines", "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_catch")
part_catch:add_fps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")
part_catch:add_tps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")

local part_trigger = SL_Part:new("wpn_fps_pis_welrod_trigger_timelines", "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_trigger")
part_trigger:add_fps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")
part_trigger:add_tps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")

local part_safety = SL_Part:new("wpn_fps_pis_welrod_safety_timelines", "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_safety")
part_safety:add_fps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")
part_safety:add_tps_material("wpn_fps_pis_welrod",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
    "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")

local skin = {
    skin_id = "sx2_ws_welrod_timelines",
    name_id = "sx2_ws_welrod_timelines",
    weapon_id = "welrod",
    weapon_desc_id = "sx2_ws_welrod_timelines_desc",
    weapon_name_id = "sx2_ws_welrod_timelines_name",
    replaces_parts = {
        wpn_fps_pis_welrod_body_standard = "wpn_fps_pis_welrod_body_standard_timelines",
        wpn_fps_pis_welrod_bolt_standard = "wpn_fps_pis_welrod_bolt_standard_timelines",
        wpn_fps_pis_welrod_m_standard = "wpn_fps_pis_welrod_m_standard_timelines",
        wpn_fps_pis_welrod_catch = "wpn_fps_pis_welrod_catch_timelines",
        wpn_fps_pis_welrod_trigger = "wpn_fps_pis_welrod_trigger_timelines",
        wpn_fps_pis_welrod_safety = "wpn_fps_pis_welrod_safety_timelines",
    },
    gold_price = 50,
    droppable = true,
    rarity = "RARITY_COMMON"
}

if SkinLib then
    SkinLib.AddPart(part_body)
    SkinLib.AddPart(part_bolt)
    SkinLib.AddPart(part_m)
    SkinLib.AddPart(part_catch)
    SkinLib.AddPart(part_trigger)
    SkinLib.AddPart(part_safety)
    SkinLib.AddSkin(skin)
end