# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/systems/rng/_pick_at [MACRO]
# INPUT: $(index) — position already chosen by systems/rng/pick

$data modify storage macroengine:output result set from storage macroengine:engine _rng_list[$(index)]
