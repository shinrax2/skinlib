Hooks:Add("SkinLibCollectData", "TimelinesWelrod.SkinLibCollectData",
    function(self)
        local m_fps = SL_Material:new("wpn_fps_pis_welrod",
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")
        local m_tps = SL_Material:new("wpn_third_pis_welrod",
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm",
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df",
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm")

        self.RegisterSkin(SL_Skin:new("sx2_ws_welrod_timelines", "welrod")
            :set_name_id("sx2_ws_welrod_timelines")
            :set_weapon_desc_id("sx2_ws_welrod_timelines_desc")
            :set_weapon_name_id("sx2_ws_welrod_timelines_name")
            :set_gold_price(50)
            :set_droppable(true)
            :set_rarity(LootDropTweakData.RARITY_COMMON)
            :add_parts({
                SL_Part:new("wpn_fps_pis_welrod_body_standard_timelines",
                    "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_body_standard")
                    :add_fps_material(m_fps):add_tps_material(m_tps),
                SL_Part:new("wpn_fps_pis_welrod_bolt_standard_timelines",
                    "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_bolt_standard")
                    :add_fps_material(m_fps):add_tps_material(m_tps),
                SL_Part:new("wpn_fps_pis_welrod_m_standard_timelines",
                    "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_m_standard")
                    :add_fps_material(m_fps):add_tps_material(m_tps),
                SL_Part:new("wpn_fps_pis_welrod_catch_timelines",
                    "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_catch")
                    :add_fps_material(m_fps):add_tps_material(m_tps),
                SL_Part:new("wpn_fps_pis_welrod_trigger_timelines",
                    "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_trigger")
                    :add_fps_material(m_fps):add_tps_material(m_tps),
                SL_Part:new("wpn_fps_pis_welrod_safety_timelines",
                    "wpn_fps_pis_welrod", "wpn_fps_pis_welrod_safety")
                    :add_fps_material(m_fps):add_tps_material(m_tps)
            }))
    end
)
