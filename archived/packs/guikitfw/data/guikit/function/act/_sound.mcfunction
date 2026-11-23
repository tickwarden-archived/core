# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# Plays a short UI sound to @s only
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.6 1.2
