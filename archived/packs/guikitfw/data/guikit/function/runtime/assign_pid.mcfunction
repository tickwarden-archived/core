# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
scoreboard players operation @s guikit.pid = #next_pid guikit.pid
scoreboard players add #next_pid guikit.pid 1
