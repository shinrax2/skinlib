Hooks:Add("SkinLibCollectData", "TimelinesWelrod.SkinLibCollectData",
    function(self)
        -- define first person material
        local m_fps = SL_Material:new("wpn_fps_pis_welrod", -- material_name
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm", -- bump_normal_texture
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df", -- diffuse_texture
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm") -- material_texture (gloss-specular-map)
        -- define third person material (optional)
        local m_tps = SL_Material:new("wpn_third_pis_welrod", -- material_name
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/wpn_fps_pis_welrod_nm", -- bump_normal_texture
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_df", -- diffuse_texture
            "units/upd_017/weapons/wpn_fps_pis_welrod_pts/textures/timelines_welrod_gsm") -- material_texture (gloss-specular-map)

        -- register new skin
        self.RegisterSkin(
            SL_Skin:new("sx2_ws_welrod_timelines", "welrod") -- define new skin
                :set_name_id("sx2_ws_welrod_timelines") -- set skin name id
                :set_weapon_desc_id("sx2_ws_welrod_timelines_desc") -- set skin weapon description id
                :set_weapon_name_id("sx2_ws_welrod_timelines_name") -- set skin weapon name id
                :set_gold_price(50) -- set gold price, setting this makes skin buyable
                :set_droppable(true) -- set droppability, setting this to true makes the skin droppable
                :set_rarity(LootDropTweakData.RARITY_COMMON) -- set skin drop rarity, possible values: LootDropTweakData.RARITY_COMMON, LootDropTweakData.RARITY_UNCOMMON, LootDropTweakData.RARITY_RARE
                :add_parts({ -- add new parts to skin
                    SL_Part:new( -- define new part
                        "wpn_fps_pis_welrod_body_standard_timelines", -- part id
                        "wpn_fps_pis_welrod", -- weapon factory id
                        "wpn_fps_pis_welrod_body_standard") -- base part id
                            :add_fps_material(m_fps) -- adds first person material to part
                            :add_tps_material(m_tps), -- adds third person material to part
                    SL_Part:new(
                        "wpn_fps_pis_welrod_bolt_standard_timelines",
                        "wpn_fps_pis_welrod",
                        "wpn_fps_pis_welrod_bolt_standard")
                            :add_fps_material(m_fps)
                            :add_tps_material(m_tps),
                    SL_Part:new(
                        "wpn_fps_pis_welrod_m_standard_timelines",
                        "wpn_fps_pis_welrod",
                        "wpn_fps_pis_welrod_m_standard")
                            :add_fps_material(m_fps)
                            :add_tps_material(m_tps),
                    SL_Part:new(
                        "wpn_fps_pis_welrod_catch_timelines",
                        "wpn_fps_pis_welrod",
                        "wpn_fps_pis_welrod_catch")
                            :add_fps_material(m_fps)
                            :add_tps_material(m_tps),
                    SL_Part:new(
                        "wpn_fps_pis_welrod_trigger_timelines",
                        "wpn_fps_pis_welrod",
                        "wpn_fps_pis_welrod_trigger")
                            :add_fps_material(m_fps)
                            :add_tps_material(m_tps),
                    SL_Part:new(
                        "wpn_fps_pis_welrod_safety_timelines",
                        "wpn_fps_pis_welrod",
                        "wpn_fps_pis_welrod_safety")
                            :add_fps_material(m_fps)
                            :add_tps_material(m_tps)
                })
        )
    end
)
