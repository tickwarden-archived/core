# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/diagnostics/checks/queue
# Internal: called by systems/diagnostics/collect. Reads the work queue size and the applied cap.
# Codes: queue.over_cap  queue.not_draining:sys_queue_off

execute store result score #vortex.dg_q vortex.tmp run data get storage vortex:engine work_queue
execute store result storage vortex:output diagnostics.queue.size int 1 run scoreboard players get #vortex.dg_q vortex.tmp
execute store result storage vortex:output diagnostics.queue.cap int 1 run scoreboard players get #queue_cap vortex.tick

execute if score #queue_cap vortex.tick matches 1.. if score #vortex.dg_q vortex.tmp > #queue_cap vortex.tick run data modify storage vortex:output diagnostics.issues append value "queue.over_cap"
execute if score #sys_queue vortex.tick_flags matches 0 if score #vortex.dg_q vortex.tmp matches 1.. run data modify storage vortex:output diagnostics.issues append value "queue.not_draining:sys_queue_off"
