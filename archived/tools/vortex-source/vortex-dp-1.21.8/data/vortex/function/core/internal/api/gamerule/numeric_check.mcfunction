# vortex:core/internal/api/gamerule/numeric_check [MACRO]
# Converts value string to score, checks against gr_matches range, calls gr_on_value.
# Called exclusively by dispatch — do NOT call directly.
#
# INPUT (macro args via `with storage vortex:input {}`):
#   $(value)        — numeric value string, e.g. "10"
#   $(gr_matches)   — scoreboard range string, e.g. "5..10" or "1.."
#   $(gr_on_value)  — function to call if score is in range

$scoreboard players set #vortex_gamerule_scratch vortex.gamerule $(value)
$execute if score #vortex_gamerule_scratch vortex.gamerule matches $(gr_matches) run function $(gr_on_value)
