# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/show
execute unless entity @s[type=minecraft:player] run return 0
execute store result score #owner vortex.dialog_tmp run data get storage vortex:dialog_work owner
execute unless score @s vortex.dialog_id = #owner vortex.dialog_tmp run return 0
# Ensure required nonempty actions. Passive buttons use close, not waiting.
execute if data storage vortex:dialog_work dialog{type:"minecraft:multi_action"} unless data storage vortex:dialog_work dialog.actions[0] run function vortex:api/dialog/button {label:{text:"Close"},callback:[{type:"close"}],payload:{}}
execute store success score #shown vortex.dialog_tmp run function vortex:core/internal/dialog/show with storage vortex:dialog_work
execute unless score #shown vortex.dialog_tmp matches 1 run return 0
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/commit with storage vortex:dialog_ctx
scoreboard players set @s vortex.dialog_click 0
scoreboard players set @s vortex.dialog_input 0
scoreboard players enable @s vortex.dialog_click
tag @s add vortex.dialog_active
tag @s remove vortex.dialog_form
execute if data storage vortex:dialog_work form.callback run tag @s add vortex.dialog_form
execute if entity @s[tag=vortex.dialog_form] run scoreboard players enable @s vortex.dialog_input
execute unless entity @s[tag=vortex.dialog_refreshing] store result score @s vortex.dialog_ttl run data get storage vortex:dialog_config ttl
function vortex:core/internal/dialog/auto_refresh_configure
execute if entity @s[tag=vortex.dialog_refreshing] run tag @s add vortex.dialog_refresh_done
scoreboard players add @s vortex.dialog_shown 1
scoreboard players add #shown vortex.dialog_stat 1
function vortex:core/internal/dialog/lifecycle
data modify storage vortex:dialog_event type set value "show"
function #vortex:hook/dialog_on_show
return 1
