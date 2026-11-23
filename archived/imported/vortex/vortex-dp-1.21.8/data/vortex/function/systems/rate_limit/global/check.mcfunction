# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/rate_limit/global/check — Global sliding window check [MACRO]
#
# Convenience wrapper for global (server-wide) rate limits.
# All players share the same bucket under this key.
#
# Usage:
# function vortex:systems/rate_limit/global/check {key:"boss_spawn"}
#
# Rule must be registered via:
# function vortex:systems/rate_limit/global/config {key:"boss_spawn",limit:1,window:24000}
#
# Output → vortex:output result 1b=ALLOWED 0b=DENIED

execute if data storage vortex:engine modules{rate_limit:0b} run return 0
$function vortex:systems/rate_limit/check {key:"global:$(key)"}
