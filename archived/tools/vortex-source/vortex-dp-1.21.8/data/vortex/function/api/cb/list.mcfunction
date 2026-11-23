# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/cb/list
# ─────────────────────────────────────────────────────────────────
# Prints pending queue entries to the executor.
# Shows each queued command and its remaining ticks.
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cb:0b} run return 0
execute store result score #cb_queue_size vortex.tmp run data get storage vortex:engine cb_queue
execute if score #cb_queue_size vortex.tmp matches 0 run tellraw @s [{"text":"[VORTEX/cb] ","color":"#00AAAA","bold":true},{"text":"Queue is empty","color":"gray"}]
execute unless score #cb_queue_size vortex.tmp matches 0 run tellraw @s [{"text":"[VORTEX/cb] Queue (","color":"#00AAAA","bold":true},{"score":{"name":"#cb_queue_size","objective":"vortex.tmp"}},{"text":" entries):","color":"#00AAAA","bold":true}]
execute unless score #cb_queue_size vortex.tmp matches 0 run tellraw @s {"nbt":"cb_queue","plain":true ,"storage":"vortex:engine","interpret":false}
