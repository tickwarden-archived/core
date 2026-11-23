# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/geo/region_watch/check_region [MACRO]
# INPUT (from _rw_cur): $(id), $(x1), $(y1), $(z1), $(x2), $(y2), $(z2)
# @s = the player being checked
# Player coordinates: vortex:engine _rw_player.{x,y,z}

# --- AABB test: return early if outside any axis ---
execute store result score $rwx vortex.tmp run data get storage vortex:engine _rw_player.x
execute store result score $rwy vortex.tmp run data get storage vortex:engine _rw_player.y
execute store result score $rwz vortex.tmp run data get storage vortex:engine _rw_player.z

$scoreboard players set $rwx1 vortex.tmp $(x1)
$scoreboard players set $rwy1 vortex.tmp $(y1)
$scoreboard players set $rwz1 vortex.tmp $(z1)
$scoreboard players set $rwx2 vortex.tmp $(x2)
$scoreboard players set $rwy2 vortex.tmp $(y2)
$scoreboard players set $rwz2 vortex.tmp $(z2)

# min/max normalize
execute if score $rwx1 vortex.tmp > $rwx2 vortex.tmp run scoreboard players operation $rwt vortex.tmp = $rwx1 vortex.tmp
execute if score $rwx1 vortex.tmp > $rwx2 vortex.tmp run scoreboard players operation $rwx1 vortex.tmp = $rwx2 vortex.tmp
execute if score $rwt vortex.tmp > $rwx2 vortex.tmp run scoreboard players operation $rwx2 vortex.tmp = $rwt vortex.tmp
execute if score $rwy1 vortex.tmp > $rwy2 vortex.tmp run scoreboard players operation $rwt vortex.tmp = $rwy1 vortex.tmp
execute if score $rwy1 vortex.tmp > $rwy2 vortex.tmp run scoreboard players operation $rwy1 vortex.tmp = $rwy2 vortex.tmp
execute if score $rwt vortex.tmp > $rwy2 vortex.tmp run scoreboard players operation $rwy2 vortex.tmp = $rwt vortex.tmp
execute if score $rwz1 vortex.tmp > $rwz2 vortex.tmp run scoreboard players operation $rwt vortex.tmp = $rwz1 vortex.tmp
execute if score $rwz1 vortex.tmp > $rwz2 vortex.tmp run scoreboard players operation $rwz1 vortex.tmp = $rwz2 vortex.tmp
execute if score $rwt vortex.tmp > $rwz2 vortex.tmp run scoreboard players operation $rwz2 vortex.tmp = $rwt vortex.tmp

# Inside AABB? 1=inside, 0=outside
scoreboard players set $rw_inside vortex.tmp 1
execute if score $rwx vortex.tmp < $rwx1 vortex.tmp run scoreboard players set $rw_inside vortex.tmp 0
execute if score $rwx vortex.tmp > $rwx2 vortex.tmp run scoreboard players set $rw_inside vortex.tmp 0
execute if score $rwy vortex.tmp < $rwy1 vortex.tmp run scoreboard players set $rw_inside vortex.tmp 0
execute if score $rwy vortex.tmp > $rwy2 vortex.tmp run scoreboard players set $rw_inside vortex.tmp 0
execute if score $rwz vortex.tmp < $rwz1 vortex.tmp run scoreboard players set $rw_inside vortex.tmp 0
execute if score $rwz vortex.tmp > $rwz2 vortex.tmp run scoreboard players set $rw_inside vortex.tmp 0

# --- State transition ---
# Was inside and still inside → do nothing
$execute if score $rw_inside vortex.tmp matches 1 run execute if entity @s[tag=rw.$(id)] run return 0
# Was outside and still outside → do nothing
$execute if score $rw_inside vortex.tmp matches 0 run execute unless entity @s[tag=rw.$(id)] run return 0

# --- on_enter: was outside, now inside ---
$execute if score $rw_inside vortex.tmp matches 1 run tag @s add rw.$(id)
# DOT NOTATION: _rw_cur.on_enter (space-separated subpath is invalid)
execute if score $rw_inside vortex.tmp matches 1 run execute if data storage vortex:engine _rw_cur.on_enter run function vortex:core/internal/systems/geo/region_watch/fire_enter with storage vortex:engine _rw_cur
execute if score $rw_inside vortex.tmp matches 1 run execute if data storage vortex:engine _rw_cur.on_enter_cmd run function vortex:core/internal/systems/geo/region_watch/fire_enter_cmd with storage vortex:engine _rw_cur
execute if score $rw_inside vortex.tmp matches 1 run return 0

# --- on_leave: was inside, now outside ---
$tag @s remove rw.$(id)
execute if data storage vortex:engine _rw_cur.on_leave run function vortex:core/internal/systems/geo/region_watch/fire_leave with storage vortex:engine _rw_cur
execute if data storage vortex:engine _rw_cur.on_leave_cmd run function vortex:core/internal/systems/geo/region_watch/fire_leave_cmd with storage vortex:engine _rw_cur
