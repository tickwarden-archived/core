# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/catalog_next
scoreboard players operation #target vortex.dialog_tmp = #page vortex.dialog_tmp
scoreboard players add #target vortex.dialog_tmp 1
execute store result storage vortex:dialog_catalog nav.page int 1 run scoreboard players get #target vortex.dialog_tmp
function vortex:core/internal/dialog/catalog_next_button with storage vortex:dialog_catalog nav
