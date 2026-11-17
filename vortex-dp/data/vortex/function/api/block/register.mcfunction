# vortex:api/block/register
# Registers a custom block (a block entity backed by a container, or any block you handle yourself).
#
# INPUT  vortex:input id (name: letters, digits, _ . -), and optional handler function ids:
#        validate, insert, take, hopper_in, hopper_out  ("namespace:path", checked before they are stored)
# Handlers run AT the block (execute positioned x y z) and read vortex:block ctx
# {op, x, y, z, slot?, item?}. A handler returns 1 for success/allow and 0 for failure/deny.
# A handler may write vortex:output block.item (take / hopper_out).
# End every handler with an explicit `return 1` (allow) or `return 0` (deny).
# A missing handler falls back to the container defaults (insert/hopper_in: first free slot,
# take/hopper_out: first occupied slot, validate: the block must be a container).
# RETURN 1 registered, 0 refused (bad id, bad function id).
# Players need the vortex.admin tag; console, load and command-block callers are trusted.

# USAGE
#   data modify storage vortex:input id set value "my_crate"
#   data modify storage vortex:input insert set value "mypack:crate/insert"
#   function vortex:api/block/register
execute if data storage vortex:engine modules{block:0b} run return 0
execute if entity @s[type=minecraft:player] unless entity @s[tag=vortex.admin] run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input id
execute unless function vortex:systems/validate/safe_name run return 0
data modify storage vortex:block tmp set value {reg:{},m:{}}
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/block/_reg_fn {k:"validate"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/block/_reg_fn {k:"insert"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/block/_reg_fn {k:"take"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/block/_reg_fn {k:"hopper_in"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/block/_reg_fn {k:"hopper_out"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
data modify storage vortex:block tmp.m.id set from storage vortex:input id
return run function vortex:core/internal/api/block/_reg_store with storage vortex:block tmp.m
