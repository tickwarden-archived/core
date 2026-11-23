# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:systems/diagnostics/collect
# ======================================================================================
# Collects a health snapshot of the engine into storage. Read-only with respect to engine
# state: it never changes config, modules, queues, tags or permissions. It only writes its own
# output (vortex:output diagnostics), scratch scores (#vortex.dg_* in vortex.tmp)
# and a scratch storage (vortex:diagnostics work) that is removed again before returning.
#
# OUTPUT  vortex:output diagnostics
#   ok            1b when issues is empty, else 0b
#   issue_count   length of issues
#   notice_count  length of notices
#   issues        list of problem codes, e.g. "module.mismatch:hook"   (see docs/diagnostics.md)
#   notices       list of informational codes, e.g. "config.applied"
#   modules       {enabled:int, disabled:int}
#   queue         {size:int, cap:int}
#   audit         {count:int}
#   log           {level:int, buffered:int}
# RETURN  number of issues (0 = healthy)
#
# Checks only what the engine itself stores. It does not measure CPU or tick time, and it does not
# repair anything: fixing is done with core/config/set, core/config/apply or a reload.
#
# Usage:
#   function vortex:systems/diagnostics/collect
#   data get storage vortex:output diagnostics.ok
# ======================================================================================

data modify storage vortex:output diagnostics set value {ok:1b,issue_count:0,notice_count:0,issues:[],notices:[],modules:{enabled:0,disabled:0},queue:{size:0,cap:0},audit:{count:0},log:{level:0,buffered:0}}
scoreboard players set #vortex.dg_on vortex.tmp 0
scoreboard players set #vortex.dg_off vortex.tmp 0
scoreboard players set #vortex.dg_q vortex.tmp 0
scoreboard players set #vortex.dg_n vortex.tmp 0

function vortex:systems/diagnostics/checks/config
function vortex:systems/diagnostics/checks/modules
function vortex:systems/diagnostics/checks/queue
function vortex:systems/diagnostics/checks/runtime

execute store result storage vortex:output diagnostics.modules.enabled int 1 run scoreboard players get #vortex.dg_on vortex.tmp
execute store result storage vortex:output diagnostics.modules.disabled int 1 run scoreboard players get #vortex.dg_off vortex.tmp
execute store result storage vortex:output diagnostics.issue_count int 1 run data get storage vortex:output diagnostics.issues
execute store result storage vortex:output diagnostics.notice_count int 1 run data get storage vortex:output diagnostics.notices
execute if data storage vortex:output diagnostics.issues[0] run data modify storage vortex:output diagnostics.ok set value 0b

data remove storage vortex:diagnostics work
execute store result score #vortex.dg_n vortex.tmp run data get storage vortex:output diagnostics.issues
return run scoreboard players get #vortex.dg_n vortex.tmp
