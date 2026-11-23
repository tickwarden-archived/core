# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/interaction/remove [MACRO]
execute if data storage vortex:engine modules{interaction:0b} run return 0
$kill @e[type=minecraft:interaction,tag=vortex.interaction,tag=$(tag)]
