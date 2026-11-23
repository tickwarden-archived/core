# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# Sets #ok=1 if guikit:in.menu exists in lib (and reg)
scoreboard players set #ok guikit.const 0
execute unless data storage guikit:in menu run return 0
data modify storage guikit:work id set from storage guikit:in menu
function guikit:internal/open/check_id with storage guikit:work
