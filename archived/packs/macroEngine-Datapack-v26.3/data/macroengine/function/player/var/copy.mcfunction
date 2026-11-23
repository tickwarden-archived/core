# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/var/copy [MACRO]
$data modify storage macroengine:engine players.$(to).$(key) set from storage macroengine:engine players.$(from).$(key)
