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
