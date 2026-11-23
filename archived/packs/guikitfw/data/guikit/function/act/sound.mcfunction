# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.7 1.2
