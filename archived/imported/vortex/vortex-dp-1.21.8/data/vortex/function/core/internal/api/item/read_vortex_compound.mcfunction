# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/item/read_vortex_compound
# Internal — do not call directly.
#
# Reads the MAIN HAND item's existing minecraft:custom_data.vortex compound
# into storage vortex:item_tmp vortex, defaulting to {} if absent. Every
# api/item/* function calls this before writing, so that set_components
# never clobbers fields written by a different api/item/* call. This is the
# one piece shared across all five field-setters below (the field name
# itself must stay a literal in each caller's own JSON body, since macro
# variables cannot substitute NBT compound KEYS — only values).
#
# Expects: {player:"..."}
# Produces: storage vortex:item_tmp vortex

data modify storage vortex:item_tmp vortex set value {}
$execute as @a[name=$(player),limit=1] run data modify storage vortex:item_tmp vortex set from entity @s SelectedItem.components."minecraft:custom_data".vortex
