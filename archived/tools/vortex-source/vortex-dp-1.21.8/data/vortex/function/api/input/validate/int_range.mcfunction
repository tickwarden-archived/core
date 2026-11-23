# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:api/input/validate/int_range [MACRO]
# Whole-number check PLUS range check for captured text, in one call. Wraps
# input/validate/check (type int) and only then turns the string into a number.
#
# INPUT (macro args): source  dot-path INTO vortex:input, e.g. "book.raw"
#                     min     smallest allowed value
#                     max     largest allowed value
#       source/min/max are written by the datapack author, not by players.
# OUTPUT (storage vortex:input_validate result):
#   valid   1b only when the text is a whole number AND min <= number <= max
#   is_int  1b when the text is a whole number (even if it is out of range)
#   number  the parsed value (only when is_int is 1b)
#   error   reason when invalid
# RETURN 1 when valid, 0 otherwise.
#
# The text may be at most 9 characters, so the number always fits a scoreboard score.
# Only text that passed the digit-by-digit check is ever turned into a number.
#
# Usage:
#   function vortex:api/input/validate/int_range {source:"book.raw",min:1,max:100}
#   execute if data storage vortex:input_validate result{valid:1b} run ...
# ======================================================================================

$function vortex:api/input/validate/check {source:"$(source)",type:"int"}
execute unless data storage vortex:input_validate result{valid:1b} run return 0
data modify storage vortex:input_validate result.valid set value 0b
data modify storage vortex:input_validate result.is_int set value 1b

data remove storage vortex:input_validate _ext
$data modify storage vortex:input_validate _ext.s set string storage vortex:input $(source)
execute store result score #ext_ir_len vortex.tmp run data get storage vortex:input_validate _ext.s
execute if score #ext_ir_len vortex.tmp matches 10.. run data modify storage vortex:input_validate result.error set value "too long for a number (max 9 characters)"
execute if score #ext_ir_len vortex.tmp matches 10.. run data remove storage vortex:input_validate _ext
execute if score #ext_ir_len vortex.tmp matches 10.. run data modify storage vortex:input_validate result.is_int set value 0b
execute if score #ext_ir_len vortex.tmp matches 10.. run return 0

function vortex:core/internal/ext/input/int_to_score with storage vortex:input_validate _ext
data remove storage vortex:input_validate _ext
execute store result storage vortex:input_validate result.number int 1 run scoreboard players get #ext_ir_val vortex.tmp

$scoreboard players set #ext_ir_min vortex.tmp $(min)
$scoreboard players set #ext_ir_max vortex.tmp $(max)
execute if score #ext_ir_val vortex.tmp < #ext_ir_min vortex.tmp run data modify storage vortex:input_validate result.error set value "below the minimum"
execute if score #ext_ir_val vortex.tmp < #ext_ir_min vortex.tmp run return 0
execute if score #ext_ir_val vortex.tmp > #ext_ir_max vortex.tmp run data modify storage vortex:input_validate result.error set value "above the maximum"
execute if score #ext_ir_val vortex.tmp > #ext_ir_max vortex.tmp run return 0

data modify storage vortex:input_validate result.valid set value 1b
return 1
