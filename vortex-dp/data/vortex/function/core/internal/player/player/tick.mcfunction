# Vortex player module — per-player tick pipeline (@s = one player).
# Order matters: clear last tick's state, refresh identity, detect movement,
# dispatch accumulated events, let click detection run, zero the counters,
# then hand over to user hooks.

function vortex:core/internal/player/player/remove_tags

# First sight of this player: cache the UUID
execute unless score @s vortex.player_action.uuid.0 matches -2147483648.. run function vortex:core/internal/player/player/set_uuid

function vortex:core/internal/player/player/is_moving
function vortex:core/internal/player/player/process_data
function vortex:core/internal/player/click_detection/tick

function vortex:core/internal/player/player/reset_scores

# User-facing per-player hook
function #vortex:core/internal/player/tick
