# ─────────────────────────────────────────────────────────────────
# vortex:systems/logic/if_not [MACRO]
# Dispatches func only if value is zero (logical NOT).
#  Input : $(value) — score value (0 = true); $(func) — function id
#
# Example: function vortex:systems/logic/if_not {value:0,func:"my:ns/run"}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{logic:0b} run return 0
$scoreboard players set $if_not_v vortex.tmp $(value)
$data modify storage vortex:engine _dispatch.func set value "$(func)"
execute if score $if_not_v vortex.tmp matches 0 run function #vortex:internal/dispatch
