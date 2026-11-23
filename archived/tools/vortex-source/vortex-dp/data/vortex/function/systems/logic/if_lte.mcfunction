# vortex:systems/logic/if_lte [MACRO]
execute if data storage vortex:engine modules{logic:0b} run return 0
$scoreboard players set $if_a vortex.tmp $(a)
$scoreboard players set $if_b vortex.tmp $(b)
$data modify storage vortex:engine _dispatch.func set value "$(func)"
execute if score $if_a vortex.tmp <= $if_b vortex.tmp run function #vortex:internal/dispatch
