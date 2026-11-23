# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/input/validate/_private/check_float  [INTERNAL]
# ======================================================================================
# A whole number or a decimal: optional leading '-', digits, and at most one '.' that has
# digits on both sides ("1." and ".5" are rejected as ambiguous rather than guessed at).
# Hands off to vortex:core/internal/text/num_check with allow_dot set.
# ======================================================================================
data modify storage vortex:text s set from storage vortex:input_validate scratch.value
data modify storage vortex:text allow_dot set value 1b
execute store result score #vortex.NumOk vortex.tmp run function vortex:core/internal/text/num_check
execute if score #vortex.NumOk vortex.tmp matches 1 run data modify storage vortex:input_validate result.valid set value 1b
execute unless score #vortex.NumOk vortex.tmp matches 1 run data modify storage vortex:input_validate result.error set from storage vortex:text err
data remove storage vortex:text allow_dot
function vortex:core/internal/text/reset
