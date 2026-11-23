# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/rng/_pick_at [MACRO]
# INPUT: $(index) — position already chosen by systems/rng/pick

$data modify storage vortex:output result set from storage vortex:engine _rng_list[$(index)]
