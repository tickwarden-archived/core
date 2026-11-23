# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
data remove storage guikit:work opts[0]
scoreboard players remove #i guikit.tmp 1
execute if score #i guikit.tmp matches 1.. if data storage guikit:work opts[0] run function guikit:widget/cycle_apply_skip
