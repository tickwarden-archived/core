# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/container/transfer
# Hopper-like transfer: moves ONE STACK from a source container to the first free slot of a target.
#
# INPUT  vortex:input x, y, z (source), tx, ty, tz (target), slot (optional source slot,
#        default: first occupied slot), to_size (optional target size, for unknown blocks)
# OUTPUT vortex:output container {ok, moved, from, to}
# RETURN 1 when a stack was moved, else 0 (nothing to move, target full, bad input).
# Whole stacks only: the stack is copied with the engine's own `item replace ... from block`, so
# stack limits are never exceeded. It does not merge into partly filled stacks.
execute if data storage vortex:engine modules{container:0b} run return 0
data modify storage vortex:output container set value {ok:0b,moved:0b}
execute unless data storage vortex:input tx run return 0
execute unless function vortex:core/internal/api/container/_addr run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_exists with storage vortex:container tmp.k
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
data modify storage vortex:container tmp.d.x set from storage vortex:container tmp.k.tx
data modify storage vortex:container tmp.d.y set from storage vortex:container tmp.k.ty
data modify storage vortex:container tmp.d.z set from storage vortex:container tmp.k.tz
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_exists with storage vortex:container tmp.d
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
data modify storage vortex:output container.ok set value 1b
execute unless data storage vortex:container tmp.k.slot run function vortex:core/internal/api/container/_src_first with storage vortex:container tmp.k
execute unless data storage vortex:container tmp.k.slot run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_size_pick {src:"tmp.d",ovr:"to_size"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
data modify storage vortex:container tmp.f set from storage vortex:container tmp.d
scoreboard players set #ct_i vortex.tmp 0
data modify storage vortex:container tmp.f.i set value 0
execute store result score #ct_ff vortex.tmp run function vortex:core/internal/api/container/_ff_loop with storage vortex:container tmp.f
execute if score #ct_ff vortex.tmp matches ..-1 run return 0
execute store result storage vortex:container tmp.k.dslot int 1 run scoreboard players get #ct_ff vortex.tmp
execute store result score #ct_mv vortex.tmp run function vortex:core/internal/api/container/_move_m with storage vortex:container tmp.k
execute unless score #ct_mv vortex.tmp matches 1 run return 0
data modify storage vortex:output container.moved set value 1b
data modify storage vortex:output container.from set from storage vortex:container tmp.k.slot
data modify storage vortex:output container.to set from storage vortex:container tmp.k.dslot
return 1
