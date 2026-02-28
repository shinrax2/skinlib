import xml.etree.ElementTree as ET
import json
import sys
import os

weapondir = sys.argv[1]
# https://mageddo.com/tools/json-to-lua-converter
out = "fix_unique_materials.json"
nf = []
weapons = {"wpn_fps_ass_garand":["wpn_fps_ass_garand_body_standard","wpn_fps_ass_garand_b_standard","wpn_fps_ass_garand_m_standard","wpn_fps_ass_garand_bolt_standard","wpn_fps_ass_garand_dh_standard","wpn_fps_ass_garand_extra_swiwel","wpn_fps_ass_garand_extra1_swiwel","wpn_fps_ass_garand_s_standard","wpn_fps_ass_garand_strip_standard","wpn_fps_ass_garand_ns_conical","wpn_fps_ass_garand_b_tanker","wpn_fps_ass_garand_s_cheek_rest","wpn_fps_ass_garand_s_folding","wpn_fps_ass_garand_m_bar_standard","wpn_fps_ass_garand_m_bar_extended","wpn_fps_ass_garand_golden_body_standard","wpn_fps_ass_garand_golden_b_standard","wpn_fps_ass_garand_golden_bolt_standard","wpn_fps_ass_garand_golden_dh_standard","wpn_fps_ass_garand_golden_extra_swiwel","wpn_fps_ass_garand_golden_extra1_swiwel","wpn_fps_ass_garand_golden_s_standard","wpn_fps_ass_garand_golden_strip_standard","wpn_fps_ass_garand_golden_ns_conical","wpn_fps_ass_garand_golden_b_tanker","wpn_fps_ass_garand_golden_s_folding","wpn_fps_ass_garand_golden_m_bar_standard","wpn_fps_ass_garand_golden_m_bar_extended"],"wpn_fps_sho_ithaca":["wpn_fps_sho_ithaca_m_standard","wpn_fps_sho_ithaca_b_standard","wpn_fps_sho_ithaca_body_standard","wpn_fps_sho_ithaca_lifter","wpn_fps_sho_ithaca_trigger","wpn_fps_sho_ithaca_sl_standard","wpn_fps_sho_ithaca_s_standard","wpn_fps_sho_ithaca_b_reinforced","wpn_fps_sho_ithaca_b_heat_shield","wpn_fps_sho_ithaca_ns_brake","wpn_fps_sho_ithaca_s_cheek_rest","wpn_fps_sho_ithaca_s_pistol_grip"],"wpn_fps_lmg_mg42":["wpn_fps_lmg_mg42_b_mg42","wpn_fps_lmg_mg42_n42","wpn_fps_lmg_mg42_receiver","wpn_fps_lmg_mg42_lid_standard","wpn_fps_lmg_mg42_dh_standard","wpn_fps_lmg_mg42_dh_extra","wpn_fps_lmg_mg42_m_standard","wpn_fps_lmg_mg42_handle","wpn_fps_lmg_mg42_band_1","wpn_fps_lmg_mg42_band_2","wpn_fps_lmg_mg42_band_3","wpn_fps_lmg_mg42_b_mg34","wpn_fps_lmg_mg42_n34","wpn_fps_lmg_mg42_bipod","wpn_fps_lmg_mg42_dh_mg34","wpn_fps_lmg_mg42_m_double","wpn_fps_lmg_mg42_lid_mg34"],"wpn_fps_smg_sten":["wpn_fps_smg_sten_body_standard","wpn_fps_smg_sten_b_standard","wpn_fps_smg_sten_m_short","wpn_fps_smg_sten_dh_standard","wpn_fps_smg_sten_s_standard","wpn_fps_smg_sten_m_standard","wpn_fps_smg_sten_m_standard_double","wpn_fps_smg_sten_m_long","wpn_fps_smg_sten_m_long_double","wpn_fps_smg_sten_s_wooden","wpn_fps_smg_sten_fg_wooden","wpn_fps_smg_sten_g_wooden","wpn_fps_smg_sten_ns_slanted","wpn_fps_smg_sten_body_mk3","wpn_fps_smg_sten_body_mk3_vented","wpn_fps_smg_sten_o_lee_enfield"],"wpn_fps_ass_mp44":["wpn_fps_ass_mp44_b_standard","wpn_fps_ass_mp44_body_standard","wpn_fps_ass_mp44_dh_standard","wpn_fps_ass_mp44_m_short","wpn_fps_ass_mp44_fg_standard","wpn_fps_ass_mp44_s_standard","wpn_fps_ass_mp44_m_short_double","wpn_fps_ass_mp44_m_standard","wpn_fps_ass_mp44_m_standard_double","wpn_fps_ass_mp44_o_scope"],"wpn_fps_smg_thompson":["wpn_fps_smg_thompson_body_standard","wpn_fps_smg_thompson_s_standard","wpn_fps_smg_thompson_b_standard","wpn_fps_smg_thompson_m_short","wpn_fps_smg_thompson_dh_standard","wpn_fps_smg_thompson_extra_sling","wpn_fps_smg_thompson_fg_standard","wpn_fps_smg_thompson_release_standard","wpn_fps_smg_thompson_g_standard","wpn_fps_smg_thompson_o_standard","wpn_fps_smg_thompson_b_m1928","wpn_fps_smg_thompson_body_m1928","wpn_fps_smg_thompson_o_m1928","wpn_fps_smg_thompson_m_short_double","wpn_fps_smg_thompson_m_standard","wpn_fps_smg_thompson_m_standard_double","wpn_fps_smg_thompson_m_drum","wpn_fps_smg_thompson_fg_m1928","wpn_fps_smg_thompson_ns_cutts","wpn_fps_smg_thompson_dh_m1928"],"wpn_fps_snp_kar_98k":["wpn_fps_snp_kar_98k_strip","wpn_fps_snp_kar_98k_dh_standard","wpn_fps_snp_kar_98k_bolt_standard","wpn_fps_snp_kar_98k_b_standard","wpn_fps_snp_kar_98k_body_standard","wpn_fps_snp_kar_98k_firepin","wpn_fps_snp_kar_98k_bullet","wpn_fps_snp_kar_98k_bullets","wpn_fps_snp_kar_98k_trigger","wpn_fps_snp_kar_98k_pad_standard","wpn_fps_snp_kar_98k_b_long","wpn_fps_snp_kar_98k_body_grip","wpn_fps_snp_kar_98k_pad_big","wpn_fps_snp_kar_98k_m_extended","wpn_fps_snp_kar_98k_m_long","wpn_fps_snp_kar_98k_o_scope"],"wpn_fps_sho_browning":["wpn_fps_sho_browning_m_standard","wpn_fps_sho_browning_b_standard","wpn_fps_sho_browning_body_standard","wpn_fps_sho_browning_dh_standard","wpn_fps_sho_browning_lifter","wpn_fps_sho_browning_s_standard","wpn_fps_sho_browning_slug","wpn_fps_sho_browning_m_extended","wpn_fps_sho_browning_m_long","wpn_fps_sho_browning_b_reinforced","wpn_fps_sho_browning_s_grip","wpn_fps_sho_browning_pad_big"],"wpn_fps_ass_carbine":["wpn_fps_ass_carbine_b_short","wpn_fps_ass_carbine_b_medium","wpn_fps_ass_carbine_b_standard","wpn_fps_ass_carbine_body_standard","wpn_fps_ass_carbine_dh_standard","wpn_fps_ass_carbine_bolt_standard","wpn_fps_ass_carbine_m_standard","wpn_fps_ass_carbine_g_standard","wpn_fps_ass_carbine_s_standard","wpn_fps_ass_carbine_body_wooden","wpn_fps_ass_carbine_m_extended"],"wpn_fps_lmg_m1918":["wpn_fps_lmg_m1918_body_standard","wpn_fps_lmg_m1918_b_standard","wpn_fps_lmg_m1918_ns_standard","wpn_fps_lmg_m1918_m_standard","wpn_fps_lmg_m1918_dh_standard","wpn_fps_lmg_m1918_ns_cutts","wpn_fps_lmg_m1918_g_monitor","wpn_fps_lmg_m1918_m_extended","wpn_fps_lmg_m1918_carry_handle","wpn_fps_lmg_m1918_bipod"],"wpn_fps_smg_mp38":["wpn_fps_smg_mp38_b_standard","wpn_fps_smg_mp38_body_standard","wpn_fps_smg_mp38_dh_standard","wpn_fps_smg_mp38_m_standard","wpn_fps_smg_mp38_s_standard","wpn_fps_smg_mp38_m_standard_double","wpn_fps_smg_mp38_dh_curved","wpn_fps_smg_mp38_b_compensated","wpn_fps_smg_mp38_b_fluted","wpn_fps_smg_mp38_s_wooden"],"wpn_fps_pis_c96":["wpn_fps_pis_c96_b_standard","wpn_fps_pis_c96_body_standard","wpn_fps_pis_c96_g_standard","wpn_fps_pis_c96_m_standard","wpn_fps_pis_c96_bullets_standard","wpn_fps_pis_c96_strip_standard","wpn_fps_pis_c96_bolt_standard","wpn_fps_pis_c96_hammer_standard","wpn_fps_pis_c96_b_long","wpn_fps_pis_c96_b_long_finned","wpn_fps_pis_c96_m_long","wpn_fps_pis_c96_m_extended","wpn_fps_pis_c96_s_wooden"],"wpn_fps_snp_m1903":["wpn_fps_snp_m1903_body_type_s","wpn_fps_snp_m1903_b_standard","wpn_fps_snp_m1903_bolt_firepin","wpn_fps_snp_m1903_bolt_standard","wpn_fps_snp_m1903_dh_standard","wpn_fps_snp_m1903_extra_follower","wpn_fps_snp_m1903_m_standard","wpn_fps_snp_m1903_body_type_c","wpn_fps_snp_m1903_s_cheek_rest","wpn_fps_snp_m1903_ns_mclean","wpn_fps_snp_m1903_o_scope","wpn_fps_snp_m1903_m_extended"],"wpn_fps_snp_mosin":["wpn_fps_snp_mosin_b_standard","wpn_fps_snp_mosin_body_standard","wpn_fps_snp_mosin_bolt_standard","wpn_fps_snp_mosin_dh_standard","wpn_fps_snp_mosin_m_standard","wpn_fps_snp_mosin_clip_standard","wpn_fps_snp_mosin_bullet","wpn_fps_snp_mosin_b_long","wpn_fps_snp_mosin_body_grip","wpn_fps_snp_mosin_body_target","wpn_fps_snp_mosin_o_scope"],"wpn_fps_sho_geco":["wpn_fps_sho_geco_b_standard","wpn_fps_sho_geco_s_standard","wpn_fps_sho_geco_lock","wpn_fps_sho_geco_body_standard","wpn_fps_sho_geco_shell_1","wpn_fps_sho_geco_shell_2","wpn_fps_sho_geco_trigger_1","wpn_fps_sho_geco_trigger_2","wpn_fps_sho_geco_b_short","wpn_fps_sho_geco_s_cheek_rest"],"wpn_fps_pis_webley":["wpn_fps_pis_webley_body_standard","wpn_fps_pis_webley_lock_standard","wpn_fps_pis_webley_hammer_standard","wpn_fps_pis_webley_trigger_standard","wpn_fps_pis_webley_b_standard","wpn_fps_pis_webley_m_standard","wpn_fps_pis_webley_ejector_standard","wpn_fps_pis_webley_casing_1","wpn_fps_pis_webley_casing_2","wpn_fps_pis_webley_casing_3","wpn_fps_pis_webley_casing_4","wpn_fps_pis_webley_casing_5","wpn_fps_pis_webley_casing_6","wpn_fps_pis_webley_bullet_clip","wpn_fps_pis_webley_bullets"],"wpn_fps_smg_sterling":["wpn_fps_smg_sterling_b_standard","wpn_fps_smg_sterling_body_standard","wpn_fps_smg_sterling_bolt_standard","wpn_fps_smg_sterling_m_medium","wpn_fps_smg_sterling_s_standard","wpn_fps_smg_sterling_b_long","wpn_fps_smg_sterling_m_long","wpn_fps_smg_sterling_m_long_double"],"wpn_fps_pis_welrod":["wpn_fps_pis_welrod_body_standard","wpn_fps_pis_welrod_bolt_standard","wpn_fps_pis_welrod_m_standard","wpn_fps_pis_welrod_catch","wpn_fps_pis_welrod_trigger","wpn_fps_pis_welrod_safety"],"wpn_fps_snp_lee_enfield":["wpn_fps_snp_lee_enfield_dh_standard","wpn_fps_snp_lee_enfield_b_standard","wpn_fps_snp_lee_enfield_body_standard","wpn_fps_snp_lee_enfield_firepin","wpn_fps_snp_lee_enfield_s_standard","wpn_fps_snp_lee_enfield_m_standard","wpn_fps_snp_lee_enfield_bullet","wpn_fps_snp_lee_enfield_b_long","wpn_fps_snp_lee_enfield_ns_coned","wpn_fps_snp_lee_enfield_pad_buffered","wpn_fps_snp_lee_enfield_cheek_rest","wpn_fps_snp_lee_enfield_m_extended","wpn_fps_snp_lee_enfield_o_scope"],"wpn_fps_pis_m1911":["wpn_fps_pis_m1911_body_standard","wpn_fps_pis_m1911_b_standard","wpn_fps_pis_m1911_sl_standard","wpn_fps_pis_m1911_m_standard","wpn_fps_pis_m1911_dh_hammer","wpn_fps_pis_m1911_m_extended","wpn_fps_pis_m1911_m_banana","wpn_fps_pis_m1911_ns_cutts","wpn_fps_pis_m1911_fg_tommy","wpn_fps_pis_m1911_s_wooden"],"wpn_fps_pis_shotty":["wpn_fps_pis_shotty_b_standard","wpn_fps_pis_shotty_body_standard","wpn_fps_pis_shotty_lock","wpn_fps_pis_shotty_shell_1","wpn_fps_pis_shotty_shell_2"],"wpn_fps_lmg_bren":["wpn_fps_lmg_bren_b_standard","wpn_fps_lmg_bren_body_standard","wpn_fps_lmg_bren_dh_standard","wpn_fps_lmg_bren_m_standard","wpn_fps_lmg_bren_s_standard","wpn_fps_lmg_bren_pad_standard","wpn_fps_lmg_bren_b_long","wpn_fps_lmg_bren_ns_brake","wpn_fps_lmg_bren_bipod","wpn_fps_lmg_bren_support","wpn_fps_lmg_bren_m_extended","wpn_fps_lmg_bren_pad_buffered"],"wpn_fps_pis_georg":["wpn_fps_pis_georg_body_default","wpn_fps_pis_georg_mag_default","wpn_fps_pis_georg_slide_default","wpn_fps_pis_georg_barrel_short","wpn_fps_pis_georg_barrel_long","wpn_fps_pis_georg_stock_wooden","wpn_fps_pis_georg_body_default_skin1","wpn_fps_pis_georg_slide_default_skin1","wpn_fps_pis_georg_barrel_short_skin1","wpn_fps_pis_georg_barrel_long_skin1","wpn_fps_pis_georg_mag_default_skin1","wpn_fps_pis_georg_stock_wooden_skin1","wpn_fps_pis_georg_body_default_skin2","wpn_fps_pis_georg_slide_default_skin2","wpn_fps_pis_georg_barrel_short_skin2","wpn_fps_pis_georg_barrel_long_skin2","wpn_fps_pis_georg_mag_default_skin2","wpn_fps_pis_georg_stock_wooden_skin2","wpn_fps_pis_georg_body_default_bigben","wpn_fps_pis_georg_slide_default_bigben","wpn_fps_pis_georg_barrel_short_bigben","wpn_fps_pis_georg_barrel_long_bigben","wpn_fps_pis_georg_mag_default_bigben","wpn_fps_pis_georg_stock_wooden_bigben"],"wpn_fps_sho_m1912":["wpn_fps_sho_m1912_b_standard","wpn_fps_sho_m1912_body_standard","wpn_fps_sho_m1912_bolt_standard","wpn_fps_sho_m1912_fg_standard","wpn_fps_sho_m1912_m_standard","wpn_fps_sho_m1912_s_standard","wpn_fps_sho_m1912_b_long","wpn_fps_sho_m1912_b_short","wpn_fps_sho_m1912_ns_cutts","wpn_fps_sho_m1912_s_cheek_rest","wpn_fps_sho_m1912_s_pad","wpn_fps_sho_m1912_s_pistol_grip","wpn_fps_sho_m1912_b_heat_shield","wpn_fps_sho_m1912_fg_long"],"wpn_fps_lmg_dp28":["wpn_fps_lmg_dp28_b_standard","wpn_fps_lmg_dp28_body_standard","wpn_fps_lmg_dp28_dh_standard","wpn_fps_lmg_dp28_m_strap","wpn_fps_lmg_dp28_m_casing","wpn_fps_lmg_dp28_m_standard","wpn_fps_lmg_dp28_o_standard","wpn_fps_lmg_dp28_s_standard","wpn_fps_lmg_dp28_trigger","wpn_fps_lmg_dp28_b_coned","wpn_fps_lmg_dp28_bipod","wpn_fps_lmg_dp28_g_standard","wpn_fps_lmg_dp28_m_casing_ext","wpn_fps_lmg_dp28_m_extended","wpn_fps_lmg_dp28_o_extended","wpn_fps_lmg_dp28_s_light"],"wpn_fps_pis_tt33":["wpn_fps_pis_tt33_body_standard","wpn_fps_pis_tt33_b_standard","wpn_fps_pis_tt33_sl_standard","wpn_fps_pis_tt33_m_standard","wpn_fps_pis_tt33_hammer","wpn_fps_pis_tt33_trigger","wpn_fps_pis_tt33_release","wpn_fps_pis_tt33_g_standard","wpn_fps_pis_tt33_m_extended","wpn_fps_pis_tt33_m_long","wpn_fps_pis_tt33_ns_brake","wpn_fps_pis_tt33_g_wooden"]}
tbl = {}

template = "{}/{}_pts/{}.material_config"

for w, ptbl in weapons.items():
    weapon = {}
    for p in ptbl:
        entry = {}
        entry["part_id"] = p
        entry["unique"] = []
        entry["fps"] = {}
        entry["tps"] = {}
        fps_file = template.format(weapondir, w, p)
        tps_file = template.format(weapondir, w.replace("fps", "third"), p.replace("fps", "third"))
        #fps
        if os.path.exists(fps_file):
            try:
                with open(fps_file, "r") as f:
                    root = ET.fromstring(f.read())
                for mat in root:
                    if mat.attrib["name"] != "shadow_caster":
                        m = {}
                        for t in mat:
                            if t.tag != "reflection_texture":
                                m[t.tag] = t.attrib["file"]
                            try:
                                if t.tag == reflection_texture and t.attrib["file"]:
                                    m[t.tag] = t.attrib["file"]
                            except:
                                pass
                        entry["fps"][mat.attrib["name"]] = m
                        entry["unique"].append(mat.attrib["name"])
            except:
                pass
        else:
            nf.append(fps_file)
        #tps
        if os.path.exists(tps_file):
            try:
                with open(tps_file, "r") as f:
                    root = ET.fromstring(f.read())
                for mat in root:
                    if mat.attrib["name"] != "shadow_caster":
                        m = {}
                        for t in mat:
                            if t.tag != "reflection_texture":
                                m[t.tag] = t.attrib["file"]
                            try:
                                if t.tag == reflection_texture and t.attrib["file"]:
                                    m[t.tag] = t.attrib["file"]
                            except:
                                pass
                        entry["tps"][mat.attrib["name"]] = m
                        if mat.attrib["name"] not in entry["unique"]:
                            entry["unique"].append(mat.attrib["name"])
            except:
                pass
        else:
            nf.append(tps_file)
        tbl[p] = entry


with open(out, "w") as f:
    f.write(json.dumps(tbl, indent=4, sort_keys=True))
with open("notfound.json", "w") as f:
    f.write(json.dumps(nf, indent=4, sort_keys=True))