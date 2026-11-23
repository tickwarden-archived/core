# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/load/migrations/to_1
# Migration step: state schema 0 (legacy, no state_version recorded) → 1.
#
# This is the first recorded schema version. Worlds created by older Vortex
# versions carry no `vortex:engine global.state_version`; reaching this step
# means such a world was loaded with this build. The step is a marker: the
# storages it touches are (re)created by loader/storages and core/config/init
# with `unless data` guards, so nothing else has to be converted here.
#
# One change in this release cannot be migrated in code: the scoreboard
# objectives and entity tags formerly named `player_action.*` are now
# `vortex.player_action.*`, and `load.status` is now `vortex.load_status`
# (see RENAMES.md). Scores held under the old objective names stay behind in
# orphaned objectives; remove them manually if a world still has them:
#   scoreboard objectives remove player_action.<name>
# Fake-player version holders moved with them (#vortex.player_action.major).
#
# Rules for future steps (to_2, to_3, ...):
# - Never edit a shipped step; add the next one and chain it in migrate.
# - A step must be idempotent and must tolerate partially-migrated state,
#   because /reload can interrupt and re-run the chain at any point.
# - Steps run without an executor entity (@s is invalid); address fake
#   players, @a or storage only.

execute unless data storage vortex:dbg out run data modify storage vortex:dbg out set value []
function vortex:systems/dbg/out {src:"migrate",msg:"state schema 0 -> 1 (baseline recorded)"}
