# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/ext/rng/shuffle_swap [MACRO] [INTERNAL]
# $(i), $(j) are ints written by shuffle_step. Swaps two elements of _ext_shf.
# ======================================================================================

$data modify storage vortex:engine _ext_shf_t set from storage vortex:engine _ext_shf[$(i)]
$data modify storage vortex:engine _ext_shf[$(i)] set from storage vortex:engine _ext_shf[$(j)]
$data modify storage vortex:engine _ext_shf[$(j)] set from storage vortex:engine _ext_shf_t
