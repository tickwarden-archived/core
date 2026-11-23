# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/item/use_cooldown
#
# Stamps a per-item custom cooldown expiry tick under
# minecraft:custom_data.vortex.cooldown_until — independent of vanilla's
# shared "/cooldown" system (which is per-item-type, not per-item-instance).
# Preserves any other vortex fields already on the item.
#
# Call:
#   function vortex:api/item/use_cooldown {player:"Steve",slot:"weapon.mainhand",ticks:100}
#
# "ticks" is an offset added to the current world time; stored as an
# absolute expiry tick so checking it later is a single comparison
# (see api/item/use_cooldown_check).

execute if data storage vortex:engine modules{item:0b} run return 0
data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0
data modify storage vortex:output found set value 1b

# Compute absolute expiry tick = current gametime + requested offset
execute store result score #vortex_item_now vortex.tmp run time query gametime
$scoreboard players add #vortex_item_now vortex.tmp $(ticks)
execute store result storage vortex:item_tmp expiry int 1 run scoreboard players get #vortex_item_now vortex.tmp

$data modify storage vortex:item_tmp player set value "$(player)"
function vortex:core/internal/api/item/read_vortex_compound with storage vortex:item_tmp

data modify storage vortex:item_tmp vortex.cooldown_until set from storage vortex:item_tmp expiry
$data modify storage vortex:item_tmp slot set value "$(slot)"

function vortex:core/internal/api/item/use_cooldown_apply with storage vortex:item_tmp

schedule function vortex:core/internal/api/item/clear_tmp 3t replace
