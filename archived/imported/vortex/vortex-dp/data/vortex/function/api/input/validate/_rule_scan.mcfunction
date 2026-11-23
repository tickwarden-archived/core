# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/input/validate/_rule_scan (internal)
# Walks vortex:input_validate _r.pending; sets _r.hit 1b as soon as one entry equals _r.s.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

execute if data storage vortex:input_validate _r{hit:1b} run return 0
execute unless data storage vortex:input_validate _r.pending[0] run return 0
data modify storage vortex:input_validate _r.cand set string storage vortex:input_validate _r.pending[0]
data remove storage vortex:input_validate _r.pending[0]
execute if data storage vortex:input_validate _r{ic:1b} run function vortex:api/input/validate/_rule_lower_cand
execute store success score #vortex.vr_diff vortex.tmp run data modify storage vortex:input_validate _r.cand set from storage vortex:input_validate _r.s
execute if score #vortex.vr_diff vortex.tmp matches 0 run data modify storage vortex:input_validate _r.hit set value 1b
function vortex:api/input/validate/_rule_scan
