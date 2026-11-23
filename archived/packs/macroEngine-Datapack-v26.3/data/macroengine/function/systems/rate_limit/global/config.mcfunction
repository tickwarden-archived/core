# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/rate_limit/global/config — Register a global (server-wide) rate limit [MACRO]
#
# Usage:
# function macroengine:systems/rate_limit/global/config {key:"boss_spawn",limit:1,window:24000}
#
# Equivalent to:
# function macroengine:systems/rate_limit/config {key:"global:boss_spawn",limit:1,window:24000}

execute if data storage macroengine:engine modules{rate_limit:0b} run return 0
$function macroengine:systems/rate_limit/config {key:"global:$(key)",limit:$(limit),window:$(window)}
