# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/item/use_cooldown_check
#
# Reads minecraft:custom_data.vortex.cooldown_until from the target's
# MAIN HAND item and reports whether it has expired.
#
# LIMITATION: only the main-hand slot is supported here. "weapon.mainhand" is
# a slot argument valid for /item, /give, and "execute if items" — it is NOT
# a valid /data get NBT path. Reading a specific item's NBT by path requires
# the SelectedItem tag (main hand only) or Inventory[{Slot:N}] for other
# slots. Extending this to arbitrary slots needs a slot->index lookup table
# and is out of scope for this pass.
#
# Call:
#   function vortex:api/item/use_cooldown_check {player:"Steve"}
#
# Output:
#   vortex:output found     -> 1b if player found
#   vortex:output ready     -> 1b if cooldown has expired (or was never set)
#   vortex:output remaining -> ticks remaining (0 if ready)

execute if data storage vortex:engine modules{item:0b} run return 0
data modify storage vortex:output found set value 0b
data modify storage vortex:output ready set value 0b
data modify storage vortex:output remaining set value 0

$execute unless entity @a[name=$(player),limit=1] run return 0
data modify storage vortex:output found set value 1b

# Reset to 0 first: if the item has no cooldown_until path yet, the "data
# get" below fails and would otherwise leave a stale score from a prior call.
scoreboard players set #vortex_item_expiry vortex.tmp 0
execute store result score #vortex_item_now vortex.tmp run time query gametime
$execute as @a[name=$(player),limit=1] store result score #vortex_item_expiry vortex.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".vortex.cooldown_until

execute if score #vortex_item_now vortex.tmp >= #vortex_item_expiry vortex.tmp run data modify storage vortex:output ready set value 1b
execute unless score #vortex_item_now vortex.tmp >= #vortex_item_expiry vortex.tmp run scoreboard players operation #vortex_item_remaining vortex.tmp = #vortex_item_expiry vortex.tmp
execute unless score #vortex_item_now vortex.tmp >= #vortex_item_expiry vortex.tmp run scoreboard players operation #vortex_item_remaining vortex.tmp -= #vortex_item_now vortex.tmp
execute unless score #vortex_item_now vortex.tmp >= #vortex_item_expiry vortex.tmp store result storage vortex:output remaining int 1 run scoreboard players get #vortex_item_remaining vortex.tmp
