# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/cmd/data_remove_storage_apply
# The actual storage-removal logic.
$data remove storage $(storage) $(path)
