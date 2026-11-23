# vortex:api/cmd/clone [MACRO]
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.clone"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
$clone $(x1) $(y1) $(z1) $(x2) $(y2) $(z2) $(dx) $(dy) $(dz)
