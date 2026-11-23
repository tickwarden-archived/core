# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/load/all — full init pipeline

# forceload classic marker chunk (legacy features)
forceload add -30000000 1600

# Load scoreboards, storages and other systems
function vortex:core/internal/load/loader/scoreboards
function vortex:core/internal/load/loader/storages
function vortex:core/internal/load/loader/other

# Re-apply config after storages (storages may reset defaults)
function #vortex:hook/config_init
function #vortex:hook/config_apply

# Run vortex:core/internal/load/final function
function vortex:core/internal/load/final
