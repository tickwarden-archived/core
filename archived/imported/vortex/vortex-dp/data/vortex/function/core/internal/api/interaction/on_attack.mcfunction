# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/interaction/on_attack
tag @s add vortex.ia_active

data modify storage vortex:engine _ia_iter set from storage vortex:engine interaction_binds.attack
execute if data storage vortex:engine _ia_iter[0] run execute on attacker run function vortex:core/internal/api/interaction/dispatch

tag @s remove vortex.ia_active
data remove entity @s attack
data remove storage vortex:engine _ia_iter
data remove storage vortex:engine _ia_cur
