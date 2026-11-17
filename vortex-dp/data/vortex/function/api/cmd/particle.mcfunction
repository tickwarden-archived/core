# vortex:api/cmd/particle [MACRO]
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.particle"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
$particle $(name) $(x) $(y) $(z) $(dx) $(dy) $(dz) $(speed) $(count)
