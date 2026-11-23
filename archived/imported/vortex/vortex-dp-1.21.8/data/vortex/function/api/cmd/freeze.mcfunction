# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/freeze
# Freezes a player in place using an invisible marker armor stand.
# Every tick the frozen player is teleported back to the stand's
# position, preventing any movement. This is the only reliable
# vanilla method — player NBT is read-only so FrozenTicks cannot
# be set, and Slowness 255 alone does not stop client-side movement.
#
# On freeze: a marker armor stand is summoned at the player's feet,
# the player's vortex.pid is copied to the stand's vortex.freeze_id,
# and the player receives the vortex.frozen tag.
#
# The per-tick teleport back is handled by:
#   vortex:core/internal/api/cmd/freeze/tick  (hooked via #vortex:loop)
#
# Use vortex:api/cmd/unfreeze to release.
#
# INPUT : $(player) → exact player name
#
# EXAMPLE:
#   function vortex:api/cmd/freeze {player:"Steve"}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.freeze"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
$execute as @a[name=$(player),tag=!vortex.frozen,limit=1] run function vortex:core/internal/api/cmd/freeze/apply
