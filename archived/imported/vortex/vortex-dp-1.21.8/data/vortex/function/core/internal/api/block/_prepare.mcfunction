# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/block/_prepare [INTERNAL]
# Shared first step of insert / take / hopper_in / hopper_out / validate.
# Checks the block id (safe_name), the position and slot (as numbers), that the id is registered,
# and builds the handler context vortex:block ctx. RETURN 1 ready, 0 refused.
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input id
execute unless function vortex:systems/validate/safe_name run return 0
data modify storage vortex:block tmp.m.id set from storage vortex:input id
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/block/_registered with storage vortex:block tmp.m
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
execute unless function vortex:core/internal/api/container/_addr run return 0
data modify storage vortex:block ctx set value {}
data modify storage vortex:block ctx.op set from storage vortex:block tmp.m.op
data modify storage vortex:block ctx.x set from storage vortex:container tmp.k.x
data modify storage vortex:block ctx.y set from storage vortex:container tmp.k.y
data modify storage vortex:block ctx.z set from storage vortex:container tmp.k.z
data modify storage vortex:block tmp.p set from storage vortex:block ctx
execute if data storage vortex:container tmp.k.slot run data modify storage vortex:block ctx.slot set from storage vortex:container tmp.k.slot
execute if data storage vortex:input item run data modify storage vortex:block ctx.item set from storage vortex:input item
return 1
