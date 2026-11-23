# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# guikit :: api/register_menu
# Input storage guikit:in: {id:"shop", menu:{...full menu object...}}
# Writes into guikit:lib and rebuilds reg entry.
execute unless data storage guikit:in id run return 0
execute unless data storage guikit:in menu run return 0
data modify storage guikit:work id set from storage guikit:in id
function guikit:runtime/put_menu with storage guikit:work
function guikit:runtime/rebuild_reg
data remove storage guikit:in id
data remove storage guikit:in menu
