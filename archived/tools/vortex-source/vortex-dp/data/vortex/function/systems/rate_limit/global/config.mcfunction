# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/rate_limit/global/config — Register a global (server-wide) rate limit [MACRO]
#
# Usage:
# function vortex:systems/rate_limit/global/config {key:"boss_spawn",limit:1,window:24000}
#
# Equivalent to:
# function vortex:systems/rate_limit/config {key:"global:boss_spawn",limit:1,window:24000}

execute if data storage vortex:engine modules{rate_limit:0b} run return 0
$function vortex:systems/rate_limit/config {key:"global:$(key)",limit:$(limit),window:$(window)}
