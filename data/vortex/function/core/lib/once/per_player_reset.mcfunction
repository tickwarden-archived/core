# ─────────────────────────────────────────────────────────────────
# vortex:core/lib/once/per_player_reset
# Deletes the once_per_player record — function can run again.
#  Input : $(player), $(key)
# ─────────────────────────────────────────────────────────────────

$data remove storage vortex:engine once_per_player.$(player).$(key)
