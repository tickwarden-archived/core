# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/block/validate
# Asks whether an operation would be allowed, without doing it.
# INPUT  vortex:input id, x, y, z, slot (optional), item (optional), op ("insert" default,
#        "take", "hopper_in", "hopper_out")
# OUTPUT vortex:output block {ok, denied}   RETURN 1 allowed, 0 denied or refused.
execute if data storage vortex:engine modules{block:0b} run return 0
data modify storage vortex:output block set value {ok:0b,denied:0b}
data modify storage vortex:block tmp set value {m:{op:"insert"}}
execute if data storage vortex:input {op:"take"} run data modify storage vortex:block tmp.m.op set value "take"
execute if data storage vortex:input {op:"hopper_in"} run data modify storage vortex:block tmp.m.op set value "hopper_in"
execute if data storage vortex:input {op:"hopper_out"} run data modify storage vortex:block tmp.m.op set value "hopper_out"
execute unless function vortex:core/internal/api/block/_prepare run return 0
execute unless function vortex:core/internal/api/block/_validate_stage run data modify storage vortex:output block.denied set value 1b
execute if data storage vortex:output block{denied:1b} run return 0
data modify storage vortex:output block.ok set value 1b
return 1
