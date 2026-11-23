# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/cmd/other/multi_cmd/utils/run_with_options_tracked
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.multi_cmd.utils.run_with_options_tracked"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
data modify storage vortex:output multiCommands.executed set value 0b

execute at @s store success storage vortex:output multiCommands.executed byte 1 unless function vortex:api/cmd/other/multi_cmd/advanced/run_with_options run return 0
