# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/diagnostics/checks/runtime
# Internal: called by systems/diagnostics/collect. Engine load flag, tick pause state, log and audit.
# Issue:   engine.not_loaded
# Notices: tick.paused_storage  tick.paused_config  log.debug_level  audit.buffer_full

execute unless data storage vortex:engine global{loaded:1b} run data modify storage vortex:output diagnostics.issues append value "engine.not_loaded"
execute if data storage vortex:engine tick{paused:1b} run data modify storage vortex:output diagnostics.notices append value "tick.paused_storage"
execute if score #vortaforge.packs.vortex.config.tick.pause vortex.meta matches 1 run data modify storage vortex:output diagnostics.notices append value "tick.paused_config"

execute store result storage vortex:output diagnostics.log.level int 1 run scoreboard players get #vortex.log_level vortex.log_level
execute store result storage vortex:output diagnostics.log.buffered int 1 run data get storage vortex:engine log_display
execute if score #vortex.log_level vortex.log_level matches 4 run data modify storage vortex:output diagnostics.notices append value "log.debug_level"

execute store result storage vortex:output diagnostics.audit.count int 1 run data get storage vortex:audit entries
execute unless data storage vortex:engine modules{audit:0b} if data storage vortex:output diagnostics.audit{count:100} run data modify storage vortex:output diagnostics.notices append value "audit.buffer_full"
