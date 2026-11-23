# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/pluralize
# Stores the singular or plural form of a word based on count.
# Simple English rule: count == 1 → singular, else → plural.
#
# INPUT : $(count)    → integer count
#         $(singular) → singular form (e.g. "item")
#         $(plural)   → plural form   (e.g. "items")
# OUTPUT: vortex:output result → chosen string
# vortex:output count → original count
#
# EXAMPLE:
# function vortex:systems/string/pluralize {count:3,singular:"apple",plural:"apples"}
# → vortex:output result = "apples"
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$scoreboard players set #plr_c vortex.tmp $(count)
execute store result storage vortex:output count int 1 run scoreboard players get #plr_c vortex.tmp

$data modify storage vortex:engine _plr_singular set value $(singular)
$data modify storage vortex:engine _plr_plural set value $(plural)

data modify storage vortex:output result set from storage vortex:engine _plr_plural
execute if score #plr_c vortex.tmp matches 1 run data modify storage vortex:output result set from storage vortex:engine _plr_singular
