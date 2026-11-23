# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/interaction/check_bind [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
$execute if entity @e[type=minecraft:interaction,tag=vortex.ia_active,tag=$(tag),limit=1] run function #vortex:internal/dispatch
