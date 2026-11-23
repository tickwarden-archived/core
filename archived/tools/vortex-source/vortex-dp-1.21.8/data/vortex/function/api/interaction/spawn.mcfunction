# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/interaction/spawn [MACRO]
execute if data storage vortex:engine modules{interaction:0b} run return 0
$summon minecraft:interaction ~ ~ ~ {width:$(width), height:$(height), response:$(response), Tags:["vortex.interaction","vortex.ia_new"]}

$tag @e[type=minecraft:interaction,tag=vortex.ia_new,limit=1,sort=nearest] add $(tag)
tag @e[tag=vortex.ia_new] remove vortex.ia_new
