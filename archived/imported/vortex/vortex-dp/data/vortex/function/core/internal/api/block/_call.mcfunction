# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/block/_call [INTERNAL, MACRO: id, h]
# Runs the registered handler <h> at the block position. The handler id was validated at register.
# RETURN the handler's return value (1 = ok, 0 = deny), or -1 when no handler is registered.
$execute unless data storage vortex:engine block_registry."$(id)".$(h) run return -1
$data modify storage vortex:block tmp.p.fn set from storage vortex:engine block_registry."$(id)".$(h)
return run function vortex:core/internal/api/block/_run_fn with storage vortex:block tmp.p
