# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/item/owner_tag
#
# Stamps the target's main-hand item with an owner tag under
# minecraft:custom_data.vortex.owner — a field Mojang does not provide
# natively. Preserves any other vortex fields already on the item (reads
# the existing compound first via internal/read_vortex_compound).
#
# Call:
#   function vortex:api/item/owner_tag {player:"Steve",slot:"weapon.mainhand",owner:"Steve"}
#
# LIMITATION: only writes/reads the main-hand slot reliably. "slot" is
# passed through to /item modify (a valid slot argument there), but the
# existing-compound READ always comes from SelectedItem — see
# api/item/use_cooldown_check for why arbitrary equipment slots cannot be
# read by /data get path. Passing a non-mainhand slot will still WRITE to
# that slot, but will merge against mainhand's existing data, which is
# almost certainly not what you want. Stick to weapon.mainhand for now.
#
# "/data modify entity <player>" is never used — Mojang blocks direct writes
# to player entity data (fails silently); all mutation goes through the
# item component system via /item modify instead.

execute if data storage vortex:engine modules{item:0b} run return 0
data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0
data modify storage vortex:output found set value 1b

$data modify storage vortex:item_tmp player set value "$(player)"
function vortex:core/internal/api/item/read_vortex_compound with storage vortex:item_tmp

$data modify storage vortex:item_tmp vortex.owner set value "$(owner)"
$data modify storage vortex:item_tmp slot set value "$(slot)"

function vortex:core/internal/api/item/owner_tag_apply with storage vortex:item_tmp

schedule function vortex:core/internal/api/item/clear_tmp 3t replace
