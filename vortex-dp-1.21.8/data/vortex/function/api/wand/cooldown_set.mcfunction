# ─────────────────────────────────────────────────────────────────
# vortex:api/wand/cooldown_set
# Applies a cooldown to wand usage.
# NOTE: Wand cooldowns are stored under vortex:engine wand_cooldowns;
#      this avoids collision with vortex:cooldown module's "$(player).$(key)" path
# so there is zero risk of key collision.
#
# INPUT:
#   $(player)   → player name
#   $(tag)      → wand tag
#   $(duration) → cooldown duration (in ticks)
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{wand:0b} run return 0
$scoreboard players set $wcd_dur vortex.tmp $(duration)
execute store result score $wcd_now vortex.tmp run scoreboard players get $epoch vortex.time
scoreboard players operation $wcd_now vortex.tmp += $wcd_dur vortex.tmp
$execute store result storage vortex:engine wand_cooldowns.$(player).$(tag) int 1 run scoreboard players get $wcd_now vortex.tmp
