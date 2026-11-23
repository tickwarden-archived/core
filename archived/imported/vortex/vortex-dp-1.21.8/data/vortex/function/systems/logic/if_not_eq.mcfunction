# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/logic/if_not_eq [MACRO]
execute if data storage vortex:engine modules{logic:0b} run return 0
$scoreboard players set $if_a vortex.tmp $(a)
$scoreboard players set $if_b vortex.tmp $(b)
$data modify storage vortex:engine _dispatch.func set value "$(func)"
execute unless score $if_a vortex.tmp = $if_b vortex.tmp run function #vortex:internal/dispatch
