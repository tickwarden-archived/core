# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:world/region/fill_hollow [MACRO]
$fill $(x1) $(y1) $(z1) $(x2) $(y2) $(z2) $(block) hollow
