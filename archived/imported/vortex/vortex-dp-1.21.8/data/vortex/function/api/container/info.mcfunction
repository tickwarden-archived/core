# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/container/info
# One-call summary of a container block: size, used and free slots, first free slot.
# INPUT  vortex:input x, y, z, size (int 1..256, optional: needed for modded or unknown blocks;
#        known vanilla containers report their own size)
# OUTPUT vortex:output container {ok:1b, size, used, free, empty:1b/0b, full:1b/0b, first_free}
#        first_free is the lowest slot without an item, or -1 when the container is full.
#        "used" counts occupied slots (not items); a partly filled stack still counts as used.
# RETURN 1 when the block is a container and its size is known, else 0 (container {ok:0b}).
execute if data storage vortex:engine modules{container:0b} run return 0
data modify storage vortex:output container set value {ok:0b}
execute unless function vortex:core/internal/api/container/_addr run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_count with storage vortex:container tmp.k
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_size_pick {src:"tmp.k",ovr:"size"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0

scoreboard players operation #ct_free vortex.tmp = #ct_size vortex.tmp
scoreboard players operation #ct_free vortex.tmp -= #ct_n vortex.tmp
execute if score #ct_free vortex.tmp matches ..-1 run scoreboard players set #ct_free vortex.tmp 0

data modify storage vortex:output container.ok set value 1b
execute store result storage vortex:output container.size int 1 run scoreboard players get #ct_size vortex.tmp
execute store result storage vortex:output container.used int 1 run scoreboard players get #ct_n vortex.tmp
execute store result storage vortex:output container.free int 1 run scoreboard players get #ct_free vortex.tmp
data modify storage vortex:output container.empty set value 0b
data modify storage vortex:output container.full set value 0b
data modify storage vortex:output container.first_free set value -1
execute if score #ct_n vortex.tmp matches 0 run data modify storage vortex:output container.empty set value 1b
execute if score #ct_free vortex.tmp matches 0 run data modify storage vortex:output container.full set value 1b
execute if score #ct_free vortex.tmp matches 0 run return 1

# Not full: find the lowest free slot (same loop as api/container/transfer)
data modify storage vortex:container tmp.f set from storage vortex:container tmp.k
data modify storage vortex:container tmp.f.i set value 0
scoreboard players set #ct_i vortex.tmp 0
execute store result score #ct_ff vortex.tmp run function vortex:core/internal/api/container/_ff_loop with storage vortex:container tmp.f
execute store result storage vortex:output container.first_free int 1 run scoreboard players get #ct_ff vortex.tmp
return 1
