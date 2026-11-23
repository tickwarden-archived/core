# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/load/all — full init pipeline (no fork / rt_origin / confirm gates)

# forceload classic marker chunk (legacy features)
forceload add -30000000 1600

# Load scoreboards, storages and other systems
function macroengine:core/internal/load/loader/scoreboards
function macroengine:core/internal/load/loader/storages
function macroengine:core/internal/load/loader/other

# Re-apply config after storages (storages may reset defaults)
function #macroengine:hook/config_init
function #macroengine:hook/config_apply

# Run macroengine:core/internal/load/final function
function macroengine:core/internal/load/final
