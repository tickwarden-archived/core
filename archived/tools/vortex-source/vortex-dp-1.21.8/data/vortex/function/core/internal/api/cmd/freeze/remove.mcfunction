# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/freeze/internal/remove  [INTERNAL]
# Runs AS the player being unfrozen.
#
# Copies the player's vortex.pid to tmp, then kills every anchor
# stand whose vortex.freeze_id matches (should always be exactly one).
# Then removes the vortex.frozen tag so the tick function's
# early-exit check fires and no further TPs occur.
# ─────────────────────────────────────────────────────────────────

# Store this player's PID so we can match it against anchor stands
scoreboard players operation $freeze_rm vortex.tmp = @s vortex.pid

# Kill the matching anchor stand
execute as @e[tag=vortex.freeze_anchor] if score @s vortex.freeze_id = $freeze_rm vortex.tmp run kill @s

# Unfreeze the player
tag @s remove vortex.frozen

# Notify and play sound
playsound vortex:ui.unfreeze master @s ~ ~ ~ 0.7 1.3
tellraw @s ["",{"text":"\uE000","color":"#00AAAA"},{"text":" ","color":"#00AAAA"},{"translate":"vortex.msg.unfreeze","color":"#55ff55","bold":true}]
