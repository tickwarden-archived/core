# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/block/_run [INTERNAL]
# validate stage, then op stage. Sets vortex:output block {ok, denied}.
data modify storage vortex:output block set value {ok:0b,denied:0b}
execute unless function vortex:core/internal/api/block/_validate_stage run data modify storage vortex:output block.denied set value 1b
execute if data storage vortex:output block{denied:1b} run return 0
execute unless function vortex:core/internal/api/block/_op_stage run return 0
data modify storage vortex:output block.ok set value 1b
return 1
