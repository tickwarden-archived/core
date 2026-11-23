# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/interaction/on_use
tag @s add vortex.ia_active

data modify storage vortex:engine _ia_iter set from storage vortex:engine interaction_binds.use
execute if data storage vortex:engine _ia_iter[0] run execute on target run function vortex:core/internal/api/interaction/dispatch

tag @s remove vortex.ia_active
data remove entity @s interaction
data remove storage vortex:engine _ia_iter
data remove storage vortex:engine _ia_cur
