# Vortex player module — translate this tick's statistics into state
# tags and one-shot event hooks.

# Movement counters -> tags
execute if score @s vortex.player_action.fly matches 1.. run tag @s add vortex.player_action.flying
execute if score @s vortex.player_action.walk matches 1.. run tag @s add vortex.player_action.walking
execute if score @s vortex.player_action.fall matches 1.. run tag @s add vortex.player_action.falling
execute if score @s vortex.player_action.climb matches 1.. run tag @s add vortex.player_action.climbing
execute if score @s vortex.player_action.aviate matches 1.. run tag @s add vortex.player_action.elyra_flying

# Entity-state predicates -> tags
execute if predicate vortex:core/internal/player/swimming run tag @s add vortex.player_action.swimming
execute if predicate vortex:core/internal/player/sneaking run tag @s add vortex.player_action.sneaking
execute if predicate vortex:core/internal/player/sprinting run tag @s add vortex.player_action.sprinting

# Mount predicates -> tags
execute if predicate vortex:core/internal/player/riding_pig run tag @s add vortex.player_action.riding_pig
execute if predicate vortex:core/internal/player/riding_boat run tag @s add vortex.player_action.riding_boat
execute if predicate vortex:core/internal/player/riding_mule run tag @s add vortex.player_action.riding_mule
execute if predicate vortex:core/internal/player/riding_llama run tag @s add vortex.player_action.riding_llama
execute if predicate vortex:core/internal/player/riding_horse run tag @s add vortex.player_action.riding_horse
execute if predicate vortex:core/internal/player/riding_donkey run tag @s add vortex.player_action.riding_donkey
execute if predicate vortex:core/internal/player/riding_strider run tag @s add vortex.player_action.riding_strider
execute if predicate vortex:core/internal/player/riding_minecart run tag @s add vortex.player_action.riding_minecart

# One-shot events -> user hooks
execute if score @s vortex.player_action.death matches 1.. run function #vortex:core/internal/player/died
execute if score @s vortex.player_action.enchant matches 1.. run function #vortex:core/internal/player/enchanted
execute if score @s vortex.player_action.jump matches 1.. run function #vortex:core/internal/player/jumped
execute if score @s vortex.player_action.use_coas matches 1.. run function #vortex:core/internal/player/right_click
execute if score @s vortex.player_action.use_wfoas matches 1.. run function #vortex:core/internal/player/right_click

# Join handling: fires on the leave_game statistic and once for players
# whose join score was never initialized (first tick after load/join).
execute if score @s vortex.player_action.join matches 1.. run function #vortex:core/internal/player/joined
execute unless score @s vortex.player_action.join matches 0.. run function #vortex:core/internal/player/joined
execute unless score @s vortex.player_action.join matches 0.. run scoreboard players add @s vortex.player_action.join 0
