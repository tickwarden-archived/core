# vortex:api/cmd/as_player [MACRO]
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.as_player"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
# Dynamic commands are off by default (config dynamic_cmd). See docs/cmd_gate.md.
execute unless data storage vortex:engine config{dynamic_cmd:1b} run return 0
$execute as @a[name=$(player),limit=1] at @s run $(cmd)
