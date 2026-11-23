# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:core/cooldown/reset_all
# Clears all active cooldowns for a player.
#  Input : $(player) → player name
# Output: (side effect only)
#
# Example:
# data modify storage macroengine:input player set value "Steve"
# function macroengine:core/cooldown/reset_all with storage macroengine:input {}
# ─────────────────────────────────────────────────────────────────

$data remove storage macroengine:engine cooldowns.$(player)
