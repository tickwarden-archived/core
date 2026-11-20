# ======================================================================================
# vortex:api/input/lectern
# ======================================================================================
#
# TRIGGERED BY: #vortex:input/lectern function tag  OR  direct call
#   execute as <player> at @s anchored eyes positioned ^ ^ ^ run function vortex:api/input/lectern
#
# PURPOSE:
#   Captures the raw text of page 0 of the book currently placed in the lectern
#   the player is looking at (short forward ray of ~5 blocks).
#   Stores into vortex:input lectern.raw.
#   CAPTURE ONLY — no execution of the text.
#
# lectern.raw is RAW, UNVALIDATED text. Run it through
# vortex:api/input/validate/check before treating it as a number/bool/tag-safe
# literal if required.
# ======================================================================================

execute if entity @s[type=minecraft:player] run function vortex:api/input/private/lectern_ray_start
execute unless entity @s[type=minecraft:player] run return fail
