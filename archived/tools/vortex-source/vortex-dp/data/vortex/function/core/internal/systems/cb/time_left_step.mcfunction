# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/cb/time_left_step [INTERNAL]
# Pops the first entry of _cb_twork (a read-only copy of cb_queue). When its id == #cb_cid,
# counts it in #cb_tcount and keeps the smallest ticks_left in #cb_tmin (-1 = none yet).
data modify storage vortex:engine _cb_tentry set from storage vortex:engine _cb_twork[0]
data remove storage vortex:engine _cb_twork[0]
scoreboard players set #cb_eid vortex.tmp 0
scoreboard players set #cb_tlv vortex.tmp 0
execute store result score #cb_eid vortex.tmp run data get storage vortex:engine _cb_tentry.id
execute store result score #cb_tlv vortex.tmp run data get storage vortex:engine _cb_tentry.ticks_left
execute if score #cb_eid vortex.tmp = #cb_cid vortex.tmp run scoreboard players add #cb_tcount vortex.tmp 1
execute if score #cb_eid vortex.tmp = #cb_cid vortex.tmp if score #cb_tmin vortex.tmp matches ..-1 run scoreboard players operation #cb_tmin vortex.tmp = #cb_tlv vortex.tmp
execute if score #cb_eid vortex.tmp = #cb_cid vortex.tmp if score #cb_tlv vortex.tmp < #cb_tmin vortex.tmp run scoreboard players operation #cb_tmin vortex.tmp = #cb_tlv vortex.tmp
execute if data storage vortex:engine _cb_twork[0] run function vortex:core/internal/systems/cb/time_left_step
