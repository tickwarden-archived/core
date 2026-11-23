# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/input
scoreboard players operation #ticket vortex.dialog_tmp = @s vortex.dialog_input
scoreboard players operation #digit vortex.dialog_tmp = @s vortex.dialog_input
scoreboard players reset @s vortex.dialog_input
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/get_form with storage vortex:dialog_ctx
execute store result score #factor vortex.dialog_tmp run data get storage vortex:dialog_event route.factor
execute unless score #factor vortex.dialog_tmp matches 10..1000000 run return run function vortex:core/internal/dialog/reject_input
scoreboard players operation #ticket vortex.dialog_tmp /= #factor vortex.dialog_tmp
scoreboard players operation #digit vortex.dialog_tmp %= #factor vortex.dialog_tmp
execute store result score #expected vortex.dialog_tmp run data get storage vortex:dialog_event route.ticket
execute store result score #min vortex.dialog_tmp run data get storage vortex:dialog_event route.min
execute store result score #max vortex.dialog_tmp run data get storage vortex:dialog_event route.max
execute unless score #ticket vortex.dialog_tmp = #expected vortex.dialog_tmp run return run function vortex:core/internal/dialog/reject_input
execute if score #digit vortex.dialog_tmp < #min vortex.dialog_tmp run return run function vortex:core/internal/dialog/reject_input
execute if score #digit vortex.dialog_tmp > #max vortex.dialog_tmp run return run function vortex:core/internal/dialog/reject_input
execute store result score #rules_ok vortex.dialog_tmp run function vortex:core/internal/dialog/form_rules
execute unless score #rules_ok vortex.dialog_tmp matches 1 run return run function vortex:core/internal/dialog/reject_validation
execute store result score #authorized vortex.dialog_tmp run function vortex:core/internal/dialog/authorize
execute unless score #authorized vortex.dialog_tmp matches 1 run return 0
function vortex:core/internal/dialog/accept
data remove storage vortex:dialog_event reason
data modify storage vortex:dialog_event type set value "input"
execute store result storage vortex:dialog_event value int 1 run scoreboard players get #digit vortex.dialog_tmp
function vortex:core/internal/dialog/invalidate
dialog clear @s
function vortex:core/internal/dialog/event_context
function #vortex:hook/dialog_on_event
function vortex:core/internal/dialog/callback with storage vortex:dialog_event route
