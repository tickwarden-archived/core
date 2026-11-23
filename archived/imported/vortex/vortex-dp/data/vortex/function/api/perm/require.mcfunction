# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:api/perm/require
# ======================================================================================
# GUARD for the caller (@s). Put it at the top of any function that must be privileged.
# Passes when @s has tag vortex.admin OR tag perm.<name> (set by api/perm/grant).
# On denial: sound + translated message + audit entry (action "perm.denied").
#
# The permission name is checked with systems/validate/safe_name BEFORE it reaches a
# macro line, so a hostile name cannot inject commands into the tag test.
#
# NOT A MACRO FUNCTION - the name is passed through storage, not as a macro argument.
#
# INPUT  (storage vortex:perm_require):  in.perm   e.g. "shop.use"
#         optional in.strict 1b: ignore the off-switches (perm_enforce 0b, module_perm 0b).
#         Not strict = when the permission system is off, the result is 1 for everybody.
# OUTPUT: return value 1 = allowed, 0 = denied.  vortex:output result 1b / 0b.
#
# A server/console executor (no entity: load, tick, schedule, command block) is
# treated as trusted and passes, same convention as api/perm/grant.
#
# USAGE (first lines of a privileged function):
#   data modify storage vortex:perm_require in.perm set value "shop.use"
#   execute unless function vortex:api/perm/require run return 0
# ======================================================================================

# Strict callers set in.strict:1b and are never bypassed by the switches below.
execute store success score #vortex.pr_strict vortex.tmp if data storage vortex:perm_require in{strict:1b}
data remove storage vortex:perm_require in.strict
execute if score #vortex.pr_strict vortex.tmp matches 1 if data storage vortex:engine modules{perm:0b} run return 0

# Permission system switched off (config perm_enforce 0b, or module_perm 0b): every check passes.
# Fails closed: a missing score (config not applied yet) still enforces.
execute if score #vortex.pr_strict vortex.tmp matches 0 if data storage vortex:engine modules{perm:0b} run data modify storage vortex:output result set value 1b
execute if score #vortex.pr_strict vortex.tmp matches 0 if data storage vortex:engine modules{perm:0b} run return 1
execute if score #vortex.pr_strict vortex.tmp matches 0 if score #perm_enforce vortex.tick_flags matches 0 run data modify storage vortex:output result set value 1b
execute if score #vortex.pr_strict vortex.tmp matches 0 if score #perm_enforce vortex.tick_flags matches 0 run return 1
data modify storage vortex:output result set value 0b
execute unless entity @s run data modify storage vortex:output result set value 1b
execute unless entity @s run return 1

data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:perm_require in.perm
function vortex:systems/validate/safe_name
execute unless data storage vortex:validate out{valid:1b} run function vortex:core/internal/api/perm/require_invalid
execute unless data storage vortex:validate out{valid:1b} run return 0

execute if entity @s[tag=vortex.admin] run data modify storage vortex:output result set value 1b
execute unless data storage vortex:output {result:1b} run function vortex:core/internal/api/perm/require_eval with storage vortex:perm_require in
execute if data storage vortex:output {result:1b} run return 1

playsound vortex:perm.denied master @s ~ ~ ~ 1 1
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"translate":"vortex.msg.permission_denied","color":"red"}]
data modify storage vortex:audit in set value {action:"perm.denied"}
data modify storage vortex:audit in.detail set from storage vortex:perm_require in.perm
function vortex:systems/audit/record
return 0
