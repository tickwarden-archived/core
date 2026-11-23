# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/rate_limit/player/internal/ensure — Seed player bucket from template [MACRO]
# Input: $(tpl), $(full)
# Called only when bucket doesn't exist yet for this player.

$execute unless data storage macroengine:engine rate_limit.player_templates.$(tpl) run return 0
$data modify storage macroengine:engine "rate_limit.rules.$(full)" set from storage macroengine:engine rate_limit.player_templates.$(tpl)
$data modify storage macroengine:engine "rate_limit.rules.$(full).hits" set value []
