# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/gamerule/persist [MACRO]
# Writes the normalized rule name + value into vortex:engine gamerules compound.
# Called exclusively by vortex:api/gamerule/set — do NOT call directly.
#
# INPUT (macro args via `with storage vortex:input {}`):
#   $(_gamerule_norm) — normalized rule name (spaces → underscores, lowercase)
#   $(value)          — value string

$data modify storage vortex:engine gamerules.$(_gamerule_norm) set value "$(value)"
