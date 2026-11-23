# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/input/private/cbm_align_tp
execute as @s at @s anchored eyes positioned ^ ^ ^0.0 run tp @e[type=minecraft:command_block_minecart,tag=vortex.input,distance=..5,sort=nearest,limit=1] ~ ~-0.23 ~
