# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/store/nbt/set_default [MACRO]
# Writes vortex:store nbt.value to storage/path ONLY when the path does not exist yet
# (first-run initialisation that never overwrites live data).
# Input (macro args): storage, path.  RETURN 1 when it wrote, 0 when it already existed.
execute if data storage vortex:engine modules{store:0b} run return 0
$execute if data storage $(storage) $(path) run return 0
$data modify storage $(storage) $(path) set from storage vortex:store nbt.value
return 1
