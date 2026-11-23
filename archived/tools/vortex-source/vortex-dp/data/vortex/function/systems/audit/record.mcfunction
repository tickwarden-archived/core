# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:systems/audit/record
# ======================================================================================
# Appends one entry to the persistent audit trail (max 100 entries, oldest dropped).
# Separate from systems/log: that buffer is a 30-line display log; this one keeps
# structured, machine-readable entries (who, what, when).
#
# NOT A MACRO FUNCTION. Values are copied as DATA and never substituted into a command,
# so a hostile string cannot alter any command. Shown with interpret:false.
#
# INPUT  (storage vortex:audit):
#   in.action   short action key, e.g. "perm.denied"      (default "unknown")
#   in.detail   free text / detail                         (default "")
# Actor = @s. Recorded automatically: t (tick epoch), pid + uuid (when @s is a player).
#
# USAGE:
#   data modify storage vortex:audit in set value {action:"shop.buy"}
#   data modify storage vortex:audit in.detail set value "diamond x3"
#   function vortex:systems/audit/record
#
# KNOWN LIMIT: no de-duplication. A caller that can trigger record in a loop can push
# older entries out of the 100-entry buffer. Rate-limit such callers with
# vortex:systems/rate_limit/check.
# ======================================================================================

execute if data storage vortex:engine modules{audit:0b} run return 0
data modify storage vortex:audit entry set value {action:"unknown",detail:""}
execute if data storage vortex:audit in.action run data modify storage vortex:audit entry.action set from storage vortex:audit in.action
execute if data storage vortex:audit in.detail run data modify storage vortex:audit entry.detail set from storage vortex:audit in.detail
execute store result storage vortex:audit entry.t int 1 run scoreboard players get $epoch vortex.time
execute if entity @s[type=player] store result storage vortex:audit entry.pid int 1 run scoreboard players get @s vortex.pid
execute if entity @s[type=player] run data modify storage vortex:audit entry.uuid set from entity @s UUID

execute unless data storage vortex:audit entries run data modify storage vortex:audit entries set value []
data modify storage vortex:audit entries append from storage vortex:audit entry

execute store result score #vortex.au_n vortex.tmp run data get storage vortex:audit entries
execute if score #vortex.au_n vortex.tmp matches 101.. run data remove storage vortex:audit entries[0]

data remove storage vortex:audit entry
data remove storage vortex:audit in
