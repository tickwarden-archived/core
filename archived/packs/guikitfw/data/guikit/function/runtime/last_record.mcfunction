# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# Remember last menu id for /trigger guikit.last (per pid in storage)
execute store result storage guikit:work pid int 1 run scoreboard players get @s guikit.pid
data modify storage guikit:work menu set from storage guikit:in menu
function guikit:runtime/last_store with storage guikit:work
