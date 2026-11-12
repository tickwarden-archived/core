# ======================================================================================
# vortex:core/internal/input/validate/_private/check_int  [INTERNAL]
# ======================================================================================
# A whole number: optional leading '-', then one or more digits. Delegates to
# vortex:core/internal/text/num_check, which walks the string one character at a
# time and never substitutes the input into a command line.
# ======================================================================================
data modify storage vortex:text s set from storage vortex:input_validate scratch.value
data modify storage vortex:text allow_dot set value 0b
execute store result score #vortex.NumOk vortex.tmp run function vortex:core/internal/text/num_check
execute if score #vortex.NumOk vortex.tmp matches 1 run data modify storage vortex:input_validate result.valid set value 1b
execute unless score #vortex.NumOk vortex.tmp matches 1 run data modify storage vortex:input_validate result.error set from storage vortex:text err
data remove storage vortex:text allow_dot
function vortex:core/internal/text/reset
