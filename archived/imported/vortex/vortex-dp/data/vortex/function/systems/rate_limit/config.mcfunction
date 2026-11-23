# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/rate_limit/config — Register or update a rate limit rule [MACRO]
#
# Creates or replaces a sliding window rule for any key.
# Rules survive reloads because they live in vortex:engine storage.
#
# Usage:
# function vortex:systems/rate_limit/config {key:"global:my_event",limit:5,window:100}
# function vortex:systems/rate_limit/config {key:"player:Steve:shop",limit:3,window:600}
# function vortex:systems/rate_limit/config {key:"channel:admin_systems",limit:10,window:20}
#
# Fields:
# key (string) — unique rule identifier; convention:
# "global:<name>" → server-wide shared bucket
#                     "player:<name>:<player>" → per-player bucket (use $(player))
# "channel:<id>" → rate guard for a tick system function (id = system name,
#                     e.g. "admin_systems" — not tied to a registry anymore)
# limit (int) — max number of hits allowed inside the window
# window (int) — sliding window width in ticks (20 = 1 second)
#
# Removing or listing rules: no helper functions exist; edit
# vortex:engine rate_limit.rules.<key> directly.

execute if data storage vortex:engine modules{rate_limit:0b} run return 0
$data modify storage vortex:engine rate_limit.rules.$(key) set value {limit:$(limit),window:$(window),hits:[]}
