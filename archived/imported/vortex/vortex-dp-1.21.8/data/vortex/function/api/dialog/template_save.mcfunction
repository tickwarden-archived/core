# vortex:api/dialog/template_save [MACRO]
execute if data storage vortex:dialog_work {notification:1b} run return 0
# Trusted key: [a-z0-9_]+. Save a complete draft before showing it.
execute unless entity @s[type=minecraft:player] run return 0
execute store result score #owner vortex.dialog_tmp run data get storage vortex:dialog_work owner
execute unless score @s vortex.dialog_id = #owner vortex.dialog_tmp run return 0
$data modify storage vortex:dialog_templates entries.$(key) set from storage vortex:dialog_work
$data remove storage vortex:dialog_templates entries.$(key).owner
return 1
