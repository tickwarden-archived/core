# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/cb/cancel_step
# Pops the first entry of _cb_cwork; keeps it in cb_queue unless its id == #cb_cid.

data modify storage vortex:engine _cb_centry set from storage vortex:engine _cb_cwork[0]
data remove storage vortex:engine _cb_cwork[0]
scoreboard players set #cb_eid vortex.tmp 0
execute store result score #cb_eid vortex.tmp run data get storage vortex:engine _cb_centry.id
execute if score #cb_eid vortex.tmp = #cb_cid vortex.tmp run scoreboard players add #cb_ccount vortex.tmp 1
execute unless score #cb_eid vortex.tmp = #cb_cid vortex.tmp run data modify storage vortex:engine cb_queue append from storage vortex:engine _cb_centry
data remove storage vortex:engine _cb_centry
execute if data storage vortex:engine _cb_cwork[0] run function vortex:core/internal/systems/cb/cancel_step
