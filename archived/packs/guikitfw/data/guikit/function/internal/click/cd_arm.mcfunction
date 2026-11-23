# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute store result score @s guikit.cd run data get storage guikit:act w.cooldown_ticks
