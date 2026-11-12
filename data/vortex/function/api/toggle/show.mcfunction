# vortex:api/toggle/show
# Prints a clickable module enable/disable menu.
#
# Usage:  function vortex:api/toggle/show
# Caller: vortex.admin tag required
#
# Each button runs:
#   /function vortex:api/toggle/<Module>/<State>
#   where <State> is "true" (enable) or "false" (disable).
#
# Supported modules: hook, interaction, perm, wand, geo, cb, block, container
#
# BACKPORT NOTE (1.21.2): the original (26.x) opened this as a native
# `dialog show` screen with a free-text "Module Name" field and a boolean
# toggle, submitted via minecraft:dynamic/run_command templating. The
# dialog system does not exist in 1.21.2 (added in 1.21.6, pack format 80),
# and free-text input has no chat-command equivalent. Reimplemented as a
# fixed clickable menu — one Enable/Disable button pair per known module —
# which is functionally equivalent since the module list is fixed anyway.

execute unless entity @s[tag=vortex.admin] run return 0

tellraw @s ["",{"text":"═══════ ","color":"dark_gray"},{"text":"Vortex — Module Toggles","color":"aqua","bold":true},{"text":" ═══════","color":"dark_gray"}]
tellraw @s ["",{"text":"hook       ","color":"white"},{"text":"[ON] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/hook/true"}},{"text":"[OFF]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/hook/false"}}]
tellraw @s ["",{"text":"interaction","color":"white"},{"text":"[ON] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/interaction/true"}},{"text":"[OFF]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/interaction/false"}}]
tellraw @s ["",{"text":"perm       ","color":"white"},{"text":"[ON] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/perm/true"}},{"text":"[OFF]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/perm/false"}}]
tellraw @s ["",{"text":"wand       ","color":"white"},{"text":"[ON] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/wand/true"}},{"text":"[OFF]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/wand/false"}}]
tellraw @s ["",{"text":"geo        ","color":"white"},{"text":"[ON] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/geo/true"}},{"text":"[OFF]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/geo/false"}}]
tellraw @s ["",{"text":"cb         ","color":"white"},{"text":"[ON] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/cb/true"}},{"text":"[OFF]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/cb/false"}}]
tellraw @s ["",{"text":"block      ","color":"white"},{"text":"[ON] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/block/true"}},{"text":"[OFF]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/block/false"}}]
tellraw @s ["",{"text":"container  ","color":"white"},{"text":"[ON] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/container/true"}},{"text":"[OFF]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function vortex:api/toggle/container/false"}}]
