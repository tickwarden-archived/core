# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:player/is/online
# Checks whether the player is on the server.
#  Input : $(player) → player name
# Output: macroengine:output result → 1b (online) / 0b (offline)
# ─────────────────────────────────────────────────────────────────

data modify storage macroengine:output result set value 0b
$execute if entity @a[name=$(player),limit=1] run data modify storage macroengine:output result set value 1b
