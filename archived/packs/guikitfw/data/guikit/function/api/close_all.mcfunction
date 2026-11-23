# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# Close every open guikit menu on the server
execute as @a[scores={guikit.timer=1..}] at @s run function guikit:api/close
