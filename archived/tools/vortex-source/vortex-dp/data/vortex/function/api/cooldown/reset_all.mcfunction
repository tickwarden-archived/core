# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cooldown/reset_all
# Clears all active cooldowns for a player.
#  Input : $(player) → player name
# Output: (side effect only)
#
# Example:
# data modify storage vortex:input player set value "Steve"
# function vortex:api/cooldown/reset_all with storage vortex:input {}
# ─────────────────────────────────────────────────────────────────

$data remove storage vortex:engine cooldowns.$(player)
