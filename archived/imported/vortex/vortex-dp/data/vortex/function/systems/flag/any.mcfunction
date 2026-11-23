# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/flag/any
# Checks whether ANY of two flags is set.
# Returns 1b if at least one of key_a or key_b is set, 0b otherwise.
# For three or more flags, chain calls or use flag/get on each.
#
# INPUT : $(key_a) → first flag key
#         $(key_b) → second flag key
# OUTPUT: vortex:output result → 1b if either flag set, 0b if neither
# vortex:output result_a → 1b if key_a set, 0b otherwise
# vortex:output result_b → 1b if key_b set, 0b otherwise
#
# EXAMPLE:
# function vortex:systems/flag/any {key_a:"pvp_enabled",key_b:"war_active"}
# → vortex:output result = 1b (if either is set)
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:output result_a set value 0b
data modify storage vortex:output result_b set value 0b
data modify storage vortex:output result set value 0b

scoreboard players set #fany_a vortex.tmp 0
scoreboard players set #fany_b vortex.tmp 0

$execute if data storage vortex:engine flags.$(key_a) run scoreboard players set #fany_a vortex.tmp 1
$execute if data storage vortex:engine flags.$(key_b) run scoreboard players set #fany_b vortex.tmp 1

execute if score #fany_a vortex.tmp matches 1 run data modify storage vortex:output result_a set value 1b
execute if score #fany_b vortex.tmp matches 1 run data modify storage vortex:output result_b set value 1b

scoreboard players operation #fany_a vortex.tmp += #fany_b vortex.tmp
execute if score #fany_a vortex.tmp matches 1.. run data modify storage vortex:output result set value 1b
