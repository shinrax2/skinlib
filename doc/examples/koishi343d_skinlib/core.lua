Hooks:Add(
    "SkinLibCollectData",
    "Koishi343d_skinlib.SkinLibCollectData",
    function(self)
        local skin = SL_Skin:new("sx2_ws_d343_koishi", "d343")
        :set_name_id("sx2_ws_d343_koishi")
        :set_weapon_name_id("sx2_ws_d343_koishi_name")
        :set_weapon_desc_id("sx2_ws_d343_koishi_desc")
        :set_gold_price(1)
        :set_replaces_units({
            unit = "units/upd_003/weapons/wpn_fps_gre_d343/wpn_fps_gre_d343_koishi",
            unit_dummy = "units/upd_003/weapons/wpn_fps_gre_d343/wpn_fps_gre_d343_husk_koishi",
            unit_hand = "units/upd_003/weapons/wpn_fps_gre_d343/wpn_fps_gre_d343_hand_koishi",
        })
        :set_hud_icon("ui/atlas/koishi_d343_icon")

        self.RegisterSkin(skin)

    end
)
