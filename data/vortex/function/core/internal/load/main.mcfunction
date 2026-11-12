# vortex:core/internal/load/main — load entry
# Initial load runs unblocked — must not stall server startup. Reload
# data-loss is only a soft warning here; force-reload
# (vortex:core/internal/load/force) applies immediately, no confirmation
# gate (that gate system has been removed).

# Archive banner (score-controlled)
execute if score #vortaforge.archivedpacks.vortex vortex.meta matches 1 run tellraw @s {"text":"[vortex] This pack is marked archived (#vortaforge.archivedpacks.vortex=1).","color":"red"}

# Already loaded → data-loss prevention notice (NOT a hard gate; does not block)
# Load functions run without an executor entity, so a bare "@s" can never match;
# the notice is broadcast to all online players instead.
execute if data storage vortex:engine global{loaded:1b} if data storage vortex:engine config{reload_warn:1b} as @a run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"Reload: engine already loaded. Live storage kept. To force full re-init (discards live state): ","color":"yellow"},{"text":"/function vortex:core/internal/load/force","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function vortex:core/internal/load/force"}}]

execute if data storage vortex:engine global{loaded:1b} run return 0

function #vortex:hook/config_init
function vortex:core/internal/load/all
