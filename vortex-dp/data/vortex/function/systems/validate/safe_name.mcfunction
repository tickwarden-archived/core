# ======================================================================================
# vortex:systems/validate/safe_name
# ======================================================================================
# Checks a string WHILE IT IS STILL PLAIN DATA in storage, i.e. before it is ever
# substituted into a macro ($(...)) line.
#
# WHY: a macro argument is pasted into the command text as-is. A value such as
#        x run op @s        or        a"} run function ...
#      changes what the command means. Validating after the value has already been
#      passed as a macro argument is too late.
#
# THIS IS NOT A MACRO FUNCTION. It never substitutes the value into any command.
#
# INPUT  (storage vortex:validate):
#   in.value    the string to check
# OUTPUT (storage vortex:validate):
#   out.valid   1b if the value is a safe name, else 0b
#   out.error   reason (only when invalid)
# RETURN: 1 when valid, 0 when not.
#
# RULES: 1..64 characters, and none of:
#   space  "  '  \  {  }  [  ]  (  )  <  >  :  ;  ,  =  !  @  #  $  %  &  *  +  ?  /  |  ^  `  ~  §
#   newline, carriage return, tab
# i.e. letters, digits, underscore, dot and hyphen (plus non-ASCII letters) pass.
#
# USAGE:
#   data remove storage vortex:validate in
#   data modify storage vortex:validate in.value set value "shop.use"
#   function vortex:systems/validate/safe_name
#   execute if data storage vortex:validate out{valid:1b} run ...
#
# ALWAYS remove 'in' first: if the next 'set from' fails, a stale value would be checked.
# Uses vortex:core/internal/text (safe, ctl, scan_deny with the deny_name table).
# ======================================================================================

data modify storage vortex:validate out set value {valid:0b}
data remove storage vortex:validate tmp

data modify storage vortex:validate tmp.value set string storage vortex:validate in.value
execute unless data storage vortex:validate tmp.value run data modify storage vortex:validate out.error set value "no value"
execute unless data storage vortex:validate tmp.value run return 0

execute store result score #vortex.vs_len vortex.tmp run data get storage vortex:validate tmp.value
execute store result score #vortex.vs_max vortex.tmp run data get storage vortex:engine config.validate_max_name
execute if score #vortex.vs_max vortex.tmp matches ..0 run scoreboard players set #vortex.vs_max vortex.tmp 64
execute if score #vortex.vs_len vortex.tmp matches ..0 run data modify storage vortex:validate out.error set value "empty"
execute if score #vortex.vs_len vortex.tmp matches ..0 run return 0
execute if score #vortex.vs_len vortex.tmp > #vortex.vs_max vortex.tmp run data modify storage vortex:validate out.error set value "too long (config validate_max_name)"
execute if score #vortex.vs_len vortex.tmp > #vortex.vs_max vortex.tmp run return 0

data modify storage vortex:validate tmp.bad set value 0b
data modify storage vortex:text s set from storage vortex:validate tmp.value
# Double quote and backslash first, then newline / carriage return / tab. Only a string
# free of all of those goes on to the character table, which handles the rest.
execute store result score #vortex.vs_hit vortex.tmp run function vortex:core/internal/text/safe
execute if score #vortex.vs_hit vortex.tmp matches 0 run data modify storage vortex:validate tmp.bad set value 1b
execute store result score #vortex.vs_hit vortex.tmp run function vortex:core/internal/text/ctl
execute if score #vortex.vs_hit vortex.tmp matches 1 run data modify storage vortex:validate tmp.bad set value 1b
data modify storage vortex:text tbl set value "deny_name"
execute unless data storage vortex:validate tmp{bad:1b} store result score #vortex.vs_hit vortex.tmp run function vortex:core/internal/text/scan_deny
execute unless data storage vortex:validate tmp{bad:1b} if score #vortex.vs_hit vortex.tmp matches 1 run data modify storage vortex:validate tmp.bad set value 1b
data remove storage vortex:text tbl
function vortex:core/internal/text/reset
execute if data storage vortex:validate tmp{bad:1b} run data modify storage vortex:validate out.error set value "contains a disallowed character"
execute if data storage vortex:validate tmp{bad:1b} run return 0

data modify storage vortex:validate out.valid set value 1b
data remove storage vortex:validate tmp
return 1
