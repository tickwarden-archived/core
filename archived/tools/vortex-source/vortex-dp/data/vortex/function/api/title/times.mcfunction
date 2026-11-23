# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/title/times [MACRO]
# Sets title timing for a player without showing anything.
# Input (macro args): player, fade_in, stay, fade_out (ticks)
execute if data storage vortex:engine modules{title:0b} run return 0
$title @a[name=$(player),limit=1] times $(fade_in) $(stay) $(fade_out)
