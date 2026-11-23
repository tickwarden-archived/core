# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:world/entity/tag_remove [MACRO]
$tag @e[type=$(type),tag=$(filter)] remove $(remove_tag)
