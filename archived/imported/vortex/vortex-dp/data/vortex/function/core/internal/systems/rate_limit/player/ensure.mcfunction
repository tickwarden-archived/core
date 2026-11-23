# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/rate_limit/player/ensure — Seed player bucket from template [MACRO]
# Input: $(tpl), $(full)
# Called only when bucket doesn't exist yet for this player.

$execute unless data storage vortex:engine rate_limit.player_templates.$(tpl) run return 0
$data modify storage vortex:engine "rate_limit.rules.$(full)" set from storage vortex:engine rate_limit.player_templates.$(tpl)
$data modify storage vortex:engine "rate_limit.rules.$(full).hits" set value []
