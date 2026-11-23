# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/utils/add_command
# Add a command to queue at runtime
#
# INPUT (storage vortex:input):
# cmd or func → command/function to add
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.multi_cmd.utils.add_command"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
execute if data storage vortex:input cmd run data modify storage vortex:engine _mcmd_queue append value {}
execute if data storage vortex:input cmd run data modify storage vortex:engine _mcmd_queue[-1].cmd set from storage vortex:input cmd

execute if data storage vortex:input func run data modify storage vortex:engine _mcmd_queue append value {}
execute if data storage vortex:input func run data modify storage vortex:engine _mcmd_queue[-1].func set from storage vortex:input func
