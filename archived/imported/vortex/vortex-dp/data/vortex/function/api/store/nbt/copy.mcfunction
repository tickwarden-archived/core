# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/store/nbt/copy [MACRO]
# Copies one NBT value to another place.
# Input (macro args): from, from_path, to, to_path   (from/to are storage ids)
#
# Usage:  function vortex:api/store/nbt/copy {from:"a:b",from_path:"x",to:"c:d",to_path:"y"}
execute if data storage vortex:engine modules{store:0b} run return 0
$data modify storage $(to) $(to_path) set from storage $(from) $(from_path)
