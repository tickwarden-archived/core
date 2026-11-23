# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/logic/if_xor [MACRO]
# Dispatches func only if EXACTLY ONE of a and b is non-zero (logical XOR).
#  Input : $(a), $(b) — score values (non-zero = true); $(func) — function id
#
# Example: function vortex:systems/logic/if_xor {a:1,b:0,func:"my:ns/run"}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{logic:0b} run return 0
$scoreboard players set $if_xor_a vortex.tmp $(a)
$scoreboard players set $if_xor_b vortex.tmp $(b)
$data modify storage vortex:engine _dispatch.func set value "$(func)"
execute unless score $if_xor_a vortex.tmp matches 0 if score $if_xor_b vortex.tmp matches 0 run function #vortex:internal/dispatch
execute if score $if_xor_a vortex.tmp matches 0 unless score $if_xor_b vortex.tmp matches 0 run function #vortex:internal/dispatch
