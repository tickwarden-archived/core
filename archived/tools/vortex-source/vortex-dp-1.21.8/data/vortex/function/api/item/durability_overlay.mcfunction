# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/item/durability_overlay
#
# Stamps a secondary, datapack-tracked durability counter under
# minecraft:custom_data.vortex.overlay_durability — independent of
# vanilla's minecraft:damage component. Lets a pack track "custom uses
# remaining" on items that are not damageable, or track a second pool
# (e.g. "charges") alongside real durability. Mojang has no such secondary
# counter. Preserves any other vortex fields already on the item.
#
# Call:
#   function vortex:api/item/durability_overlay {player:"Steve",slot:"weapon.mainhand",value:50}

execute if data storage vortex:engine modules{item:0b} run return 0
data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0
data modify storage vortex:output found set value 1b

$data modify storage vortex:item_tmp player set value "$(player)"
function vortex:core/internal/api/item/read_vortex_compound with storage vortex:item_tmp

$data modify storage vortex:item_tmp vortex.overlay_durability set value $(value)
$data modify storage vortex:item_tmp slot set value "$(slot)"

function vortex:core/internal/api/item/durability_overlay_apply with storage vortex:item_tmp

schedule function vortex:core/internal/api/item/clear_tmp 3t replace
