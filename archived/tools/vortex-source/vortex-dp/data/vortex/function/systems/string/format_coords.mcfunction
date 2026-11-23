# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/format_coords
# Stores three integer coordinates in vortex:output and exposes
# them for use in tellraw components.
#
#  Input : $(x) → X coordinate (integer)
#          $(y) → Y coordinate (integer)
#          $(z) → Z coordinate (integer)
#
# Output: vortex:output x   → X int
#         vortex:output y   → Y int
#         vortex:output z   → Z int
#
# USAGE — embed the stored values directly in a tellraw:
#   function vortex:systems/string/format_coords {x:100,y:64,z:-200}
#   tellraw @a ["",
#     {"text":"(","color":"gray"},
#     {"plain":true ,"storage":"vortex:output","nbt":"x","color":"green"},
#     {"text":", ","color":"gray"},
#     {"plain":true ,"storage":"vortex:output","nbt":"y","color":"green"},
#     {"text":", ","color":"gray"},
#     {"plain":true ,"storage":"vortex:output","nbt":"z","color":"green"},
#     {"text":")","color":"gray"}
#   ]
#   → (100, 64, -200)
#
# NOTE: vortex:output is shared — copy x/y/z to your own storage
#       before making other vortex calls if you need them later.
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$scoreboard players set $fc_x vortex.tmp $(x)
$scoreboard players set $fc_y vortex.tmp $(y)
$scoreboard players set $fc_z vortex.tmp $(z)

execute store result storage vortex:output x int 1 run scoreboard players get $fc_x vortex.tmp
execute store result storage vortex:output y int 1 run scoreboard players get $fc_y vortex.tmp
execute store result storage vortex:output z int 1 run scoreboard players get $fc_z vortex.tmp
