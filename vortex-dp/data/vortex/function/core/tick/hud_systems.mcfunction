# vortex:core/tick/hud_systems
execute if data storage vortex:engine pb_obj run scoreboard players operation $pb_mod vortex.tmp = $epoch vortex.time
execute if data storage vortex:engine pb_obj run scoreboard players operation $pb_mod vortex.tmp %= $pb_four vortex.tmp
execute if data storage vortex:engine pb_obj run execute if score $pb_mod vortex.tmp matches 0 run execute as @a run function vortex:systems/string/progress_bar_self with storage vortex:engine {}
