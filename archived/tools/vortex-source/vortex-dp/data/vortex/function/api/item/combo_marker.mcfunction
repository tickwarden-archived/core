# vortex:api/item/combo_marker
#
# Stamps a consecutive-use counter under minecraft:custom_data.vortex.combo
# on the target's held item — for "combo" mechanics (e.g. bonus effects
# after N consecutive uses without switching items). Mojang tracks no
# per-item use streak; this is purely datapack-side bookkeeping. Preserves
# any other vortex fields already on the item.
#
# Call:
#   function vortex:api/item/combo_marker {player:"Steve",slot:"weapon.mainhand",combo:3}
#
# Callers are responsible for incrementing/resetting "combo" between calls
# (e.g. via a player-scoped scoreboard objective) — this function only
# writes the given value onto the item, it does not track state itself.

execute if data storage vortex:engine modules{item:0b} run return 0
data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0
data modify storage vortex:output found set value 1b

$data modify storage vortex:item_tmp player set value "$(player)"
function vortex:core/internal/api/item/read_vortex_compound with storage vortex:item_tmp

$data modify storage vortex:item_tmp vortex.combo set value $(combo)
$data modify storage vortex:item_tmp slot set value "$(slot)"

function vortex:core/internal/api/item/combo_marker_apply with storage vortex:item_tmp

schedule function vortex:core/internal/api/item/clear_tmp 3t replace
