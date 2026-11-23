# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
scoreboard players set #cond guikit.tmp 0
data modify storage guikit:work tag set from storage guikit:cond tag
function guikit:cond/t_has_tag_do with storage guikit:work
