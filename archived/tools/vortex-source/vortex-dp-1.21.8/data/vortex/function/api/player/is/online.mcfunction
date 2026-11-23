# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/player/is/online
# Checks whether the player is on the server.
#  Input : $(player) → player name
# Output: vortex:output result → 1b (online) / 0b (offline)
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:output result set value 0b
$execute if entity @a[name=$(player),limit=1] run data modify storage vortex:output result set value 1b
