# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# The work queue (and its drain loop) is the lib module. Reached through the
# queue_process slot, so an install without lib simply has nothing to drain.
function #vortex:hook/queue_process

# CB fire cooldown (see core/internal/systems/cb/process_step)
execute if score #cb_cd vortex.tmp matches 1.. run scoreboard players remove #cb_cd vortex.tmp 1

# CB delay queue — process pending command block executions
execute if data storage vortex:engine modules{cb:1b} run execute if data storage vortex:engine cb_queue[0] run function vortex:core/internal/systems/cb/tick
