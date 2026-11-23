# vortex:core/internal/dialog/template_form
data modify storage vortex:dialog_template patch.old set from storage vortex:dialog_work form.ticket
data modify storage vortex:dialog_template patch.suffix set from storage vortex:dialog_work form.suffix
execute store result score #factor vortex.dialog_tmp run data get storage vortex:dialog_work form.factor
scoreboard players set #limit vortex.dialog_tmp 2147483647
scoreboard players operation #limit vortex.dialog_tmp /= #factor vortex.dialog_tmp
scoreboard players remove #limit vortex.dialog_tmp 1
execute if score #ticket vortex.dialog_sys >= #limit vortex.dialog_tmp run return run function vortex:core/internal/dialog/template_failed
execute store result score #ok vortex.dialog_tmp run function vortex:core/internal/dialog/ticket
execute unless score #ok vortex.dialog_tmp matches 1 run return run function vortex:core/internal/dialog/template_failed
data modify storage vortex:dialog_work form.ticket set from storage vortex:dialog_work route.ticket
data modify storage vortex:dialog_template patch.new set from storage vortex:dialog_work form.ticket
function vortex:core/internal/dialog/template_form_patch with storage vortex:dialog_template patch
