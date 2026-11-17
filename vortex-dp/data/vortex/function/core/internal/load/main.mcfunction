# vortex:core/internal/load/main — load entry
# data-loss is only a soft warning here; force-reload
# (vortex:core/internal/load/force) applies immediately, no confirmation

# Archive banner (score-controlled)
execute if score #vortaforge.archivedpacks.vortex vortex.meta matches 1 run tellraw @s {"text":"[vortex] This pack is marked archived (#vortaforge.archivedpacks.vortex=1).","color":"red"}

# Persistent-state migrations run before the early return below, so a
# /reload of a world written by an older build still migrates (see migrate).
function vortex:core/internal/load/migrate

# Already loaded → data-loss prevention notice (does not block)
# Load functions run without an executor entity, so a bare "@s" can never match;
# the notice is broadcast to all online players instead.
execute if data storage vortex:engine global{loaded:1b} if data storage vortex:engine config{reload_warn:1b} as @a run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"Reload: engine already loaded. Live storage kept. To force full re-init (discards live state): ","color":"yellow"},{"text":"/function vortex:core/internal/load/force","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function vortex:core/internal/load/force"}}]

execute if data storage vortex:engine global{loaded:1b} run return 0

function #vortex:hook/config_init
function vortex:core/internal/load/all
