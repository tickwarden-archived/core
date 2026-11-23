# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/store/nbt/count [MACRO]
# RETURN the length of the list/string or the number of keys of the compound at
# storage/path (0 when missing). Input (macro args): storage, path
execute if data storage vortex:engine modules{store:0b} run return 0
$execute unless data storage $(storage) $(path) run return 0
$return run data get storage $(storage) $(path)
