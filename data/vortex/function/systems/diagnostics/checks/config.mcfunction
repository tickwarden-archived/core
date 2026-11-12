# vortex:systems/diagnostics/checks/config
# Internal: called by systems/diagnostics/collect. Checks that the runtime config exists and that
# core/config/apply has copied it to the scores the engine reads. It checks presence only and does
# not hardcode key lists or the config_rev value, so config.mcfunction stays the single source.

execute unless data storage vortex:engine config run data modify storage vortex:output diagnostics.issues append value "config.missing"
execute unless data storage vortex:engine config_rev run data modify storage vortex:output diagnostics.issues append value "config.rev_missing"
execute unless data storage vortex:engine config_schema run data modify storage vortex:output diagnostics.issues append value "config.schema_missing"

execute unless score #vortaforge.packs.vortex.config.tick.rate vortex.meta matches 1.. run data modify storage vortex:output diagnostics.issues append value "config.not_applied:tick_rate"
execute unless score #queue_cap vortex.tick matches 1.. run data modify storage vortex:output diagnostics.issues append value "config.not_applied:queue_max_depth"
execute unless score #hook_interval vortex.tick matches 1.. run data modify storage vortex:output diagnostics.issues append value "config.not_applied:hook_interval"
execute unless score #dynamic_cmd vortex.tick_flags matches 0.. run data modify storage vortex:output diagnostics.issues append value "config.not_applied:dynamic_cmd"

execute if data storage vortex:engine config{dynamic_cmd:1b} run data modify storage vortex:output diagnostics.notices append value "security.dynamic_cmd_enabled"
