# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/logic/if_gte [MACRO]
execute if data storage macroengine:engine modules{logic:0b} run return 0
$scoreboard players set $if_a macroengine.tmp $(a)
$scoreboard players set $if_b macroengine.tmp $(b)
$data modify storage macroengine:engine _dispatch.func set value "$(func)"
execute if score $if_a macroengine.tmp >= $if_b macroengine.tmp run function #macroengine:internal/dispatch
