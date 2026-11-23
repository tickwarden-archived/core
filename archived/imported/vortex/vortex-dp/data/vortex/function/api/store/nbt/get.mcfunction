# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/store/nbt/get [MACRO]
# Reads one NBT value into vortex:store nbt.result.
# Input (macro args): storage (e.g. "mypack:data"), path (e.g. "player.stats")
# RETURN 1 when the path exists (result set), 0 otherwise (result removed).
#
# Usage:  function vortex:api/store/nbt/get {storage:"mypack:data",path:"motd"}
execute if data storage vortex:engine modules{store:0b} run return 0
data remove storage vortex:store nbt.result
$execute unless data storage $(storage) $(path) run return 0
$data modify storage vortex:store nbt.result set from storage $(storage) $(path)
return 1
