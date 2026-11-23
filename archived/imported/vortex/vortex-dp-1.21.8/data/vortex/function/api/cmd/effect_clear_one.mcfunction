# vortex:api/cmd/effect_clear_one [MACRO]
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.effect_clear_one"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
$execute as @a[name=$(player),limit=1] at @s run effect clear @s $(effect)
