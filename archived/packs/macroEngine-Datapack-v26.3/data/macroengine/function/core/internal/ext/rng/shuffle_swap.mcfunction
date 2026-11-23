# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ======================================================================================
# macroengine:core/internal/ext/rng/shuffle_swap [MACRO] [INTERNAL]
# $(i), $(j) are ints written by shuffle_step. Swaps two elements of _ext_shf.
# ======================================================================================

$data modify storage macroengine:engine _ext_shf_t set from storage macroengine:engine _ext_shf[$(i)]
$data modify storage macroengine:engine _ext_shf[$(i)] set from storage macroengine:engine _ext_shf[$(j)]
$data modify storage macroengine:engine _ext_shf[$(j)] set from storage macroengine:engine _ext_shf_t
