# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/logic/if_or [MACRO]
# Dispatches func if EITHER a or b is non-zero (logical OR).
# Composes with the other logic/if_* functions and any score-producing
# api/systems function: store each side's 0/1 result on a score first,
# then feed both into this as $(a)/$(b).
#
# INPUT (macro):
#   $(a)    -> first operand score value (non-zero = true)
#   $(b)    -> second operand score value (non-zero = true)
#   $(func) -> function id to run via #vortex:internal/dispatch if a || b

execute if data storage vortex:engine modules{logic:0b} run return 0
$scoreboard players set $if_or_a vortex.tmp $(a)
$scoreboard players set $if_or_b vortex.tmp $(b)
$data modify storage vortex:engine _dispatch.func set value "$(func)"
execute unless score $if_or_a vortex.tmp matches 0 run function #vortex:internal/dispatch
execute if score $if_or_a vortex.tmp matches 0 unless score $if_or_b vortex.tmp matches 0 run function #vortex:internal/dispatch
