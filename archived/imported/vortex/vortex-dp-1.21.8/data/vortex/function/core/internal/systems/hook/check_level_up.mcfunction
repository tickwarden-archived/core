# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/check_level_up
execute store result score $hlvl_cur vortex.tmp run data get entity @s XpLevel
execute if score @s vortex.hook_lvl < $hlvl_cur vortex.tmp run scoreboard players operation @s vortex.hook_lvl_new = $hlvl_cur vortex.tmp
execute if score @s vortex.hook_lvl < $hlvl_cur vortex.tmp run function vortex:core/internal/systems/hook/on_level_up
execute store result score @s vortex.hook_lvl run scoreboard players get $hlvl_cur vortex.tmp
