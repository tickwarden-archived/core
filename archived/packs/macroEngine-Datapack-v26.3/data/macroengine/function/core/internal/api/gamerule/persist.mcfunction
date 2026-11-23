# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/gamerule/internal/persist [MACRO]
# Writes the normalized rule name + value into macroengine:engine gamerules compound.
# Called exclusively by macroengine:api/gamerule/set — do NOT call directly.
#
# INPUT (macro args via `with storage macroengine:input {}`):
#   $(_gamerule_norm) — normalized rule name (spaces → underscores, lowercase)
#   $(value)          — value string

$data modify storage macroengine:engine gamerules.$(_gamerule_norm) set value "$(value)"
