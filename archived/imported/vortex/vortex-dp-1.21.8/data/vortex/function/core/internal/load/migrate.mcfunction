# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/load/migrate — persistent-state migration chain
#
# Vortex keeps its persistent state in command storage (vortex:engine and the
# module storages). `vortex:engine global.state_version` records the schema
# version of that state. CURRENT STATE SCHEMA VERSION: 1.
#
# Called from core/internal/load/main BEFORE the "already loaded" early
# return, so migrations also run on /reload of a world that an older build
# wrote state into; the load pipeline itself is skipped in that case, the
# migration chain is not. Every step is guarded, so when the state is
# already current this costs two data checks per load.
#
# Adding a schema change: bump the version in the last line, add
# migrations/to_<n> (idempotent, no @s), and chain it below like to_1.
# Never edit a step that has shipped.

# The storage compound itself may not exist yet on a fresh world.
execute unless data storage vortex:engine global run data modify storage vortex:engine global set value {}

# No recorded version but live state present → legacy world: run the chain.
execute unless data storage vortex:engine global.state_version if data storage vortex:engine global.loaded run function vortex:core/internal/load/migrations/to_1
# Fresh world (nothing loaded yet): no legacy state, record the baseline.
execute unless data storage vortex:engine global.state_version run data modify storage vortex:engine global.state_version set value 1
