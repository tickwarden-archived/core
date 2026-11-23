# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/stats
data modify storage vortex:dialog_stats snapshot set value {global:{},player:{}}
function vortex:core/internal/dialog/event_context
execute store result storage vortex:dialog_stats snapshot.player.id int 1 run scoreboard players get @s vortex.dialog_id
execute store result storage vortex:dialog_stats snapshot.global.shown int 1 run scoreboard players get #shown vortex.dialog_stat
execute store result storage vortex:dialog_stats snapshot.player.shown int 1 run scoreboard players get @s vortex.dialog_shown
execute store result storage vortex:dialog_stats snapshot.global.accepted int 1 run scoreboard players get #accepted vortex.dialog_stat
execute store result storage vortex:dialog_stats snapshot.player.accepted int 1 run scoreboard players get @s vortex.dialog_accept
execute store result storage vortex:dialog_stats snapshot.global.rejected int 1 run scoreboard players get #rejected vortex.dialog_stat
execute store result storage vortex:dialog_stats snapshot.player.rejected int 1 run scoreboard players get @s vortex.dialog_reject
execute store result storage vortex:dialog_stats snapshot.global.expired int 1 run scoreboard players get #expired vortex.dialog_stat
execute store result storage vortex:dialog_stats snapshot.player.expired int 1 run scoreboard players get @s vortex.dialog_expire
