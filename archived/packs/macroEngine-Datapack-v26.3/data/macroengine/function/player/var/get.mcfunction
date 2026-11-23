# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/var/get [MACRO]
$data modify storage macroengine:output result set from storage macroengine:engine players.$(player).$(key)
