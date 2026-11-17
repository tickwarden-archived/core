# vortex:core/internal/text/safe_loop [INTERNAL]
# Pops the first character of sf and rejects a double quote or a backslash.
data modify storage vortex:text sc set string storage vortex:text sf 0 1
data modify storage vortex:text sf set string storage vortex:text sf 1
data modify storage vortex:text sq set from storage vortex:text sc
execute store success score #tx_qq vortex.tmp run data modify storage vortex:text sq set value '"'
execute if score #tx_qq vortex.tmp matches 0 run return 0
data modify storage vortex:text sq set from storage vortex:text sc
execute store success score #tx_qq vortex.tmp run data modify storage vortex:text sq set value '\\'
execute if score #tx_qq vortex.tmp matches 0 run return 0
scoreboard players remove #tx_sn vortex.tmp 1
execute if score #tx_sn vortex.tmp matches 1.. run return run function vortex:core/internal/text/safe_loop
return 1
