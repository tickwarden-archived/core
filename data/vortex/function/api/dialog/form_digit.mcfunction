# vortex:api/dialog/form_digit [MACRO]
# Integer input named value, validated in 0..9. Gate+digit transported atomically.
$data modify storage vortex:dialog_work route set value {label:$(label),callback:$(callback),payload:$(payload),min:$(min),max:$(max),factor:10}
execute store result score #min vortex.dialog_tmp run data get storage vortex:dialog_work route.min
execute store result score #max vortex.dialog_tmp run data get storage vortex:dialog_work route.max
execute unless score #min vortex.dialog_tmp matches 0..9 run return 0
execute unless score #max vortex.dialog_tmp matches 0..9 run return 0
execute if score #min vortex.dialog_tmp > #max vortex.dialog_tmp run return 0
execute store result score #ok vortex.dialog_tmp run function vortex:core/internal/dialog/ticket
execute unless score #ok vortex.dialog_tmp matches 1 run return 0
data modify storage vortex:dialog_work form set from storage vortex:dialog_work route
# Store client macro as data, avoiding a second server-side macro expansion.
data modify storage vortex:dialog_work form.suffix set value "$(value)"
function vortex:core/internal/dialog/form_build with storage vortex:dialog_work form
