# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/catalog
execute store result score #size vortex.dialog_tmp run data get storage vortex:dialog_catalog model.size
execute unless score #size vortex.dialog_tmp matches 1..27 run return 0
execute store result score #page vortex.dialog_tmp run data get storage vortex:dialog_catalog model.page
execute if score #page vortex.dialog_tmp matches ..-1 run scoreboard players set #page vortex.dialog_tmp 0
execute store result score #count vortex.dialog_tmp run data get storage vortex:dialog_catalog model.items
scoreboard players operation #last vortex.dialog_tmp = #count vortex.dialog_tmp
scoreboard players remove #last vortex.dialog_tmp 1
execute if score #last vortex.dialog_tmp matches ..-1 run scoreboard players set #last vortex.dialog_tmp 0
scoreboard players operation #last vortex.dialog_tmp /= #size vortex.dialog_tmp
execute if score #page vortex.dialog_tmp > #last vortex.dialog_tmp run scoreboard players operation #page vortex.dialog_tmp = #last vortex.dialog_tmp
execute store result storage vortex:dialog_catalog model.page int 1 run scoreboard players get #page vortex.dialog_tmp
function vortex:api/dialog/begin
data modify storage vortex:dialog_work catalog set from storage vortex:dialog_catalog model
data modify storage vortex:dialog_work dialog.title set from storage vortex:dialog_catalog model.title
data modify storage vortex:dialog_work view set value {callback:[{type:"function",function:"vortex:api/dialog/catalog_reopen"}],payload:{}}
data modify storage vortex:dialog_catalog queue set from storage vortex:dialog_catalog model.items
scoreboard players operation #skip vortex.dialog_tmp = #page vortex.dialog_tmp
scoreboard players operation #skip vortex.dialog_tmp *= #size vortex.dialog_tmp
function vortex:core/internal/dialog/catalog_skip
scoreboard players operation #left vortex.dialog_tmp = #size vortex.dialog_tmp
function vortex:core/internal/dialog/catalog_take
execute if score #page vortex.dialog_tmp matches 1.. run function vortex:core/internal/dialog/catalog_prev
execute if score #page vortex.dialog_tmp < #last vortex.dialog_tmp run function vortex:core/internal/dialog/catalog_next
function vortex:api/dialog/exit {label: {text: "Close"}, callback:[{type:"function",function:"vortex:api/dialog/close"}], payload: {}}
function vortex:api/dialog/show
