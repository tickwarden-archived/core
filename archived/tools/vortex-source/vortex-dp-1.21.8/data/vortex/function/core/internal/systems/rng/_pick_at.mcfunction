# vortex:core/internal/systems/rng/_pick_at [MACRO]
# INPUT: $(index) — position already chosen by systems/rng/pick

$data modify storage vortex:output result set from storage vortex:engine _rng_list[$(index)]
