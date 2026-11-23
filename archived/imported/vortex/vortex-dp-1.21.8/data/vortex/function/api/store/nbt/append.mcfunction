# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/store/nbt/append [MACRO]
# Appends vortex:store nbt.value to the list at storage/path. Input (macro args): storage, path
execute if data storage vortex:engine modules{store:0b} run return 0
$data modify storage $(storage) $(path) append from storage vortex:store nbt.value
