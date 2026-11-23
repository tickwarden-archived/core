# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/ctl_loop [INTERNAL]
# Pops the first character of cf and compares it with \n, \r and \t.
data modify storage vortex:text sc set string storage vortex:text cf 0 1
data modify storage vortex:text cf set string storage vortex:text cf 1
data modify storage vortex:text sq set from storage vortex:text sc
execute store success score #tx_qq vortex.tmp run data modify storage vortex:text sq set value '\n'
execute if score #tx_qq vortex.tmp matches 0 run return 1
data modify storage vortex:text sq set from storage vortex:text sc
execute store success score #tx_qq vortex.tmp run data modify storage vortex:text sq set value '\r'
execute if score #tx_qq vortex.tmp matches 0 run return 1
data modify storage vortex:text sq set from storage vortex:text sc
execute store success score #tx_qq vortex.tmp run data modify storage vortex:text sq set value '\t'
execute if score #tx_qq vortex.tmp matches 0 run return 1
scoreboard players remove #tx_sn vortex.tmp 1
execute if score #tx_sn vortex.tmp matches 1.. run return run function vortex:core/internal/text/ctl_loop
return 0
