# vortex:api/cmd/damage_typed [MACRO]
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.damage_typed"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
$damage @a[name=$(player),limit=1] $(amount) $(damage_type)
