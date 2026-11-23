# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/flag/set_if
# Sets a flag only when a scoreboard condition is met.
# Condition: score of $(score_holder) in $(objective) must match $(matches).
# Uses scoreboard matches syntax (e.g. "1", "1..5", "..0", "2..").
#
# INPUT : $(key)          → flag key
#         $(score_holder) → scoreboard entity/fake-player name
#         $(objective)    → scoreboard objective
#         $(matches)      → match range string (e.g. "1..")
# OUTPUT: vortex:output result → 1b if flag was set, 0b if condition not met
#
# EXAMPLE:
# function vortex:systems/flag/set_if {key:"night_mode",score_holder:"$time",objective:"vortex.tmp",matches:"..12000"}
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:output result set value 0b
$execute if score $(score_holder) $(objective) matches $(matches) run data modify storage vortex:engine flags.$(key) set value 1b
$execute if score $(score_holder) $(objective) matches $(matches) run data modify storage vortex:output result set value 1b
