# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/load
scoreboard objectives add vortex.dialog_id dummy
scoreboard objectives add vortex.dialog_sys dummy
scoreboard objectives add vortex.dialog_click trigger
scoreboard objectives add vortex.dialog_input trigger
scoreboard objectives add vortex.dialog_ttl dummy
scoreboard objectives add vortex.dialog_tmp dummy
scoreboard objectives add vortex.dialog_leave minecraft.custom:minecraft.leave_game
scoreboard objectives add vortex.dialog_seen dummy
scoreboard objectives add vortex.dialog_epoch dummy
scoreboard objectives add vortex.dialog_interval dummy
scoreboard objectives add vortex.dialog_refresh dummy
scoreboard objectives add vortex.dialog_cool dummy
scoreboard objectives add vortex.dialog_stat dummy
scoreboard objectives add vortex.dialog_shown dummy
scoreboard objectives add vortex.dialog_accept dummy
scoreboard objectives add vortex.dialog_reject dummy
scoreboard objectives add vortex.dialog_expire dummy
scoreboard players add #epoch vortex.dialog_sys 1
scoreboard players add #id vortex.dialog_sys 0
scoreboard players add #ticket vortex.dialog_sys 0
scoreboard players set #ten vortex.dialog_sys 10
execute unless data storage vortex:dialog_db players run data modify storage vortex:dialog_db players set value {}
execute unless data storage vortex:dialog_config ttl run data modify storage vortex:dialog_config ttl set value 1200
execute unless data storage vortex:dialog_config cooldown run data modify storage vortex:dialog_config cooldown set value 4
scoreboard players add #shown vortex.dialog_stat 0
scoreboard players add #accepted vortex.dialog_stat 0
scoreboard players add #rejected vortex.dialog_stat 0
scoreboard players add #expired vortex.dialog_stat 0
execute unless data storage vortex:dialog_config fallback_locale run data modify storage vortex:dialog_config fallback_locale set value "en_us"
tag @a remove vortex.dialog_active
tag @a remove vortex.dialog_form
execute as @a run function vortex:core/internal/dialog/invalidate
data modify storage vortex:dialog_dispatch stack set value []
