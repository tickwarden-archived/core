# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/freeze/internal/apply  [INTERNAL]
# Runs AS the player to be frozen, AT their position.
#
# 1. Summons an invisible Marker armor stand at the player's feet.
#    Marker=1b means no hitbox and no tick overhead.
# 2. Copies the player's vortex.pid to the stand's vortex.freeze_id
#    so the tick function can match player↔stand reliably.
# 3. Tags both the stand (vortex.freeze_anchor) and the player
#    (vortex.frozen).
# ─────────────────────────────────────────────────────────────────

# Summon the anchor stand at player's exact position
summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["vortex.freeze_anchor"]}

# Copy this player's PID to a tmp score, then copy to the nearest
# anchor stand (the one we just summoned — always nearest to us).
scoreboard players operation $freeze_link vortex.tmp = @s vortex.pid
execute as @e[tag=vortex.freeze_anchor,sort=nearest,limit=1] run scoreboard players operation @s vortex.freeze_id = $freeze_link vortex.tmp

# Tag the player as frozen
tag @s add vortex.frozen

# Notify and play sound
playsound vortex:ui.freeze master @s ~ ~ ~ 0.9 0.9
tellraw @s ["",{"text":"\uE000","color":"#00AAAA"},{"text":" ","color":"#00AAAA"},{"translate":"vortex.msg.freeze","color":"#00aaff","bold":true}]
