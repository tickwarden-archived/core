# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/store/nbt/set_default [MACRO]
# Writes macroengine:store nbt.value to storage/path ONLY when the path does not exist yet
# (first-run initialisation that never overwrites live data).
# Input (macro args): storage, path.  RETURN 1 when it wrote, 0 when it already existed.
execute if data storage macroengine:engine modules{store:0b} run return 0
$execute if data storage $(storage) $(path) run return 0
$data modify storage $(storage) $(path) set from storage macroengine:store nbt.value
return 1
