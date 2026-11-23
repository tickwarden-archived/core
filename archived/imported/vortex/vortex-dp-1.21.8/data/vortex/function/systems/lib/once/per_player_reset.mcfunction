# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/once/per_player_reset
# Deletes the once_per_player record — function can run again.
#  Input : $(player), $(key)
# ─────────────────────────────────────────────────────────────────

$data remove storage vortex:engine once_per_player.$(player).$(key)
