# vortex:systems/rate_limit/player/check — Per-player sliding window check [MACRO]
#
# Builds the compound key "player:<key>:<player>" and ensures the bucket exists.
# If no bucket exists yet for this player, auto-creates from the player_template.
#
# Usage:
#   $function vortex:systems/rate_limit/player/check {key:"shop",player:"$(player)"}
#
# Rule template must be registered via:
# function vortex:systems/rate_limit/player/config {key:"shop",limit:3,window:600}
#
# Output → vortex:output result 1b=ALLOWED 0b=DENIED

# Auto-seed: if bucket for this player+key doesn't exist, create from template
execute if data storage vortex:engine modules{rate_limit:0b} run return 0
$execute unless data storage vortex:engine "rate_limit.rules.player:$(key):$(player)" run function vortex:core/internal/systems/rate_limit/player/ensure {tpl:"$(key)",full:"player:$(key):$(player)"}

# Hand off to generic check with full compound key
$function vortex:systems/rate_limit/check {key:"player:$(key):$(player)"}
