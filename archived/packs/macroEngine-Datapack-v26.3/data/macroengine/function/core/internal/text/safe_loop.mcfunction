# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/safe_loop [INTERNAL]
# Pops the first character of sf and rejects a double quote or a backslash.
data modify storage macroengine:text sc set string storage macroengine:text sf 0 1
data modify storage macroengine:text sf set string storage macroengine:text sf 1
data modify storage macroengine:text sq set from storage macroengine:text sc
execute store success score #tx_qq macroengine.tmp run data modify storage macroengine:text sq set value '"'
execute if score #tx_qq macroengine.tmp matches 0 run return 0
data modify storage macroengine:text sq set from storage macroengine:text sc
execute store success score #tx_qq macroengine.tmp run data modify storage macroengine:text sq set value '\\'
execute if score #tx_qq macroengine.tmp matches 0 run return 0
scoreboard players remove #tx_sn macroengine.tmp 1
execute if score #tx_sn macroengine.tmp matches 1.. run return run function macroengine:core/internal/text/safe_loop
return 1
