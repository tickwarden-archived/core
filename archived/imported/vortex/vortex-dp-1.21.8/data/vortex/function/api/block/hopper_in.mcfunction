# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/block/hopper_in
# Hopper-style input into a registered custom block (same as insert, but the handler sees op=hopper_in).
#
# INPUT  vortex:input id (registered block), x, y, z (ints), slot (optional), item {id, count, components}
# OUTPUT vortex:output block {ok, denied}
# RETURN 1 success, 0 refused / denied / failed. Order: validate handler, then the hopper_in handler.
# Handlers run AT the block (execute positioned x y z) and read vortex:block ctx
# {op, x, y, z, slot?, item?}. A handler returns 1 for success/allow and 0 for failure/deny.
# A handler may write vortex:output block.item (take / hopper_out).
# End every handler with an explicit `return 1` (allow) or `return 0` (deny).
execute if data storage vortex:engine modules{block:0b} run return 0
data modify storage vortex:output block set value {ok:0b,denied:0b}
data modify storage vortex:block tmp set value {m:{op:"hopper_in"}}
execute unless function vortex:core/internal/api/block/_prepare run return 0
return run function vortex:core/internal/api/block/_run
