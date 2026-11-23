# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/interaction/on_attack
tag @s add macroengine.ia_active

data modify storage macroengine:engine _ia_iter set from storage macroengine:engine interaction_binds.attack
execute if data storage macroengine:engine _ia_iter[0] run execute on attacker run function macroengine:core/internal/api/interaction/dispatch

tag @s remove macroengine.ia_active
data remove entity @s attack
data remove storage macroengine:engine _ia_iter
data remove storage macroengine:engine _ia_cur
