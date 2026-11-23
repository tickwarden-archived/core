# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
data modify storage guikit:work me set from entity @s UUID
execute store success score #uuid guikit.tmp run data modify storage guikit:work me set from storage guikit:work thrower
execute if score #uuid guikit.tmp matches 0 run tag @s add guikit.thrower
