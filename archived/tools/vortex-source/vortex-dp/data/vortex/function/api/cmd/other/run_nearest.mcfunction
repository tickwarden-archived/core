# vortex:api/cmd/other/run_nearest [MACRO]
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.run_nearest"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
$execute as @a[sort=nearest,limit=1] at @s run $(cmd)
