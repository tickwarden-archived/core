# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro: $(id)  — copies guikit:in menu → guikit:lib menus.$(id)
$data modify storage guikit:lib menus.$(id) set from storage guikit:in menu
# ensure order contains id once (re-registering the same id must not grow the list)
$execute unless data storage guikit:lib {order:["$(id)"]} run data modify storage guikit:lib order append value "$(id)"
