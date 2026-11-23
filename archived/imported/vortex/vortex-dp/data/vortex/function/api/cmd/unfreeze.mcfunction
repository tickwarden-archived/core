# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/unfreeze
# Releases a player previously frozen by vortex:api/cmd/freeze.
#
# 1. Finds the frozen player's vortex.pid.
# 2. Kills the anchor armor stand whose vortex.freeze_id matches.
# 3. Removes the vortex.frozen tag so the tick function stops
#    teleporting them.
# 4. Plays the unfreeze sound and notifies the player.
#
# INPUT : $(player) → exact player name
#
# EXAMPLE:
#   function vortex:api/cmd/unfreeze {player:"Steve"}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.unfreeze"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
$execute as @a[name=$(player),tag=vortex.frozen,limit=1] run function vortex:core/internal/api/cmd/freeze/remove
