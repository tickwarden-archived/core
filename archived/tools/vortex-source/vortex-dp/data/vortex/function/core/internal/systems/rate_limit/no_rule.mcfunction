# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/rate_limit/no_rule — Warn when check called on unregistered key [MACRO]
# Input: $(key)
# Fail-open: result stays 1b (ALLOWED) so callers aren't broken by missing config.
execute if data storage vortex:engine modules{rate_limit:0b} run return 0

$tellraw @a[tag=vortex.admin] [{"text":"[VORTEX/WARNING] ","color":"gold","bold":true},{"text":"Rate limit check called for unregistered key: ","color":"yellow"},{"text":"$(key)","color":"red","bold":true},{"text":". Falling back to default (ALLOWED).","color":"gray"}]
