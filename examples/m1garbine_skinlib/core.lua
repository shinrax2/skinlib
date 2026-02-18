Hooks:Add("SkinLibCollectData", "M1Garbine.SkinLibCollectData",
    function(self)
    local b_short = SL_Part:new("wpn_fps_ass_carbine_b_short_garbine", "wpn_fps_ass_carbine", "wpn_fps_ass_carbine_b_short")
        --:add_unit("units/vanilla/weapon/wpn_fps_ass_carbine_pts/wpn_fps_ass_carbine_b_short_garbine")

    local b_medium = SL_Part:new("wpn_fps_ass_carbine_b_medium_garbine", "wpn_fps_ass_carbine", "wpn_fps_ass_carbine_b_medium")
        --:add_unit("units/vanilla/weapon/wpn_fps_ass_carbine_pts/wpn_fps_ass_carbine_b_medium_garbine")

    local b_standard = SL_Part:new("wpn_fps_ass_carbine_b_standard_garbine", "wpn_fps_ass_carbine", "wpn_fps_ass_carbine_b_standard")
        --:add_unit("units/vanilla/weapon/wpn_fps_ass_carbine_pts/wpn_fps_ass_carbine_b_standard_garbine")

    local body_standard = SL_Part:new("wpn_fps_ass_carbine_body_standard_garbine", "wpn_fps_ass_carbine", "wpn_fps_ass_carbine_body_standard")
        --:add_unit("units/vanilla/weapon/wpn_fps_ass_carbine_pts/wpn_fps_ass_carbine_body_standard_garbine")
        --:add_third_unit("units/vanilla/weapon/wpn_fps_ass_carbine_pts/wpn_fps_ass_carbine_body_standard_garbine")
        :add_fps_material(
            SL_Material:new("wpn_fps_ass_carbine_body_standard",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_standard_nm",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_standard_garbine_df",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_standard_gsm")
        )
        :add_fps_material(
            SL_Material:new("wpn_fps_ass_carbine_upper",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_upper_nm",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_upper_df",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_upper_gsm")
        )

    --[[{
        part_id = "wpn_fps_ass_carbine_body_standard_garbine",
        weapon_factory_id = "wpn_fps_ass_carbine",
        base_part = "wpn_fps_ass_carbine_body_standard",
        unit = "units/vanilla/weapon/wpn_fps_ass_carbine_pts/wpn_fps_ass_carbine_body_standard_garbine",
        fps = {
            wpn_fps_ass_carbine_body_standard = {
                bump_normal_texture = "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_standard_nm",
                diffuse_texture = "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_standard_garbine_df",
                material_texture = "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_standard_gsm"
            },
        },
    }]]

    local body_wooden = SL_Part:new("wpn_fps_ass_carbine_body_wooden_garbine", "wpn_fps_ass_carbine", "wpn_fps_ass_carbine_body_wooden")
        --:add_unit("units/vanilla/weapon/wpn_fps_ass_carbine_pts/wpn_fps_ass_carbine_body_wooden_garbine")
        --:add_third_unit("units/vanilla/weapon/wpn_fps_ass_carbine_pts/wpn_fps_ass_carbine_body_wooden_garbine")
        :add_fps_material(
            SL_Material:new("wpn_fps_ass_carbine_body_wooden",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_wooden_nm",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_wooden_garbine_df",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_wooden_gsm")
        )
        :add_fps_material(
            SL_Material:new("wpn_fps_ass_carbine_upper",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_upper_nm",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_upper_df",
            "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_upper_gsm")
        )
    --[[{
        part_id = "wpn_fps_ass_carbine_body_wooden_garbine",
        weapon_factory_id = "wpn_fps_ass_carbine",
        base_part = "wpn_fps_ass_carbine_body_wooden",
        unit = "units/vanilla/weapon/wpn_fps_ass_carbine_pts/wpn_fps_ass_carbine_body_wooden_garbine",
        fps = {
            wpn_fps_ass_carbine_body_wooden = {
                bump_normal_texture = "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_wooden_nm",
                diffuse_texture = "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_wooden_garbine_df",
                material_texture = "units/vanilla/weapons/wpn_fps_ass_carbine_pts/textures/wpn_fps_ass_carbine_body_wooden_gsm"
            },
        },
    }]]



    local skin = SL_Skin:new("sx2_ws_m1garbine", "carbine")
        :set_name_id("sx2_ws_m1garbine")
        :set_weapon_name_id("sx2_ws_m1garbine_name")
        :set_weapon_desc_id("sx2_ws_m1garbine_desc")
        :set_gold_price(1)
        :add_parts({
            b_short,
            b_medium,
            b_standard,
            body_standard,
            body_wooden
        })

        self.RegisterSkin(skin)
end)
