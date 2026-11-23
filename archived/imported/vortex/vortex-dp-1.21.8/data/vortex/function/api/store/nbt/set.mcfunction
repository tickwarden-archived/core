# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/store/nbt/set [MACRO]
# Writes vortex:store nbt.value to storage/path. Input (macro args): storage, path
# Passing the value through storage means any SNBT is safe: no escaping needed.
#
# Usage:
#   data modify storage vortex:store nbt.value set value {hp:20,name:"Steve"}
#   function vortex:api/store/nbt/set {storage:"mypack:data",path:"players.steve"}
execute if data storage vortex:engine modules{store:0b} run return 0
$data modify storage $(storage) $(path) set from storage vortex:store nbt.value
