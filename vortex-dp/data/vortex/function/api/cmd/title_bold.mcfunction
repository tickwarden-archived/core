# vortex:api/cmd/title_bold [MACRO]
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.title_bold"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
$execute as @a[name=$(player),limit=1] at @s run title @s title {"text":"$(text)","color":"$(color)","bold":true}
