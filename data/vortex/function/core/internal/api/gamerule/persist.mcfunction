# vortex:api/gamerule/internal/persist [MACRO]
# Writes the normalized rule name + value into vortex:engine gamerules compound.
# Called exclusively by vortex:api/gamerule/set — do NOT call directly.
#
# INPUT (macro args via `with storage vortex:input {}`):
#   $(_gamerule_norm) — normalized rule name (spaces → underscores, lowercase)
#   $(value)          — value string

$data modify storage vortex:engine gamerules.$(_gamerule_norm) set value "$(value)"
