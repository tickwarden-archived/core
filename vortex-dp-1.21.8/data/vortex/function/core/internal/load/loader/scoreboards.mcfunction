# vortex:core/internal/load/loader/scoreboards
#  separates the loader bookkeeping from the actual init routines)

scoreboard objectives add vortex.tmp dummy
scoreboard objectives add vortex.anvil_t dummy
scoreboard objectives add vortex.meta dummy
scoreboard objectives add vortex.time dummy
scoreboard objectives add vortex.run trigger
scoreboard objectives add vortex.action trigger
scoreboard objectives add vortex.pid dummy
scoreboard objectives add vortex.freeze_id dummy
scoreboard objectives add vortex.health health
scoreboard objectives add vortex.food food
scoreboard objectives add vortex.right_click minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add vortex.hook_online dummy
scoreboard objectives add vortex.hook_deaths deathCount
scoreboard objectives add vortex.hook_placed dummy
scoreboard objectives add vortex.hook_lvl dummy
scoreboard objectives add vortex.hook_lvl_new dummy
scoreboard objectives add vortex.hook_sneak dummy
scoreboard objectives add vortex.hook_sprint dummy
scoreboard objectives add vortex.hook_elytra dummy
scoreboard objectives add vortex.hook_tool_used dummy
scoreboard objectives add vortex.hook_item_used dummy
scoreboard objectives add vortex.hook_entity_killed dummy
scoreboard objectives add vortex.hook_using_item dummy
scoreboard objectives add vortex.hook_killed_by_arrow dummy
scoreboard objectives add vortex.hook_hero_of_the_village dummy
scoreboard objectives add vortex.hook_dim_changed dummy
scoreboard objectives add vortex.hook_traded dummy
scoreboard objectives add vortex.tick dummy
scoreboard objectives add vortex.tick_flags dummy
scoreboard objectives add vortex.flags dummy
scoreboard objectives add vortex.hook_jump minecraft.custom:minecraft.jump
scoreboard objectives add vortex.hook_open_chest minecraft.custom:minecraft.open_chest
scoreboard objectives add vortex.hook_drop minecraft.custom:minecraft.drop
scoreboard objectives add vortex.hook_target_hit minecraft.custom:minecraft.target_hit
scoreboard objectives add vortex.hook_eat dummy
scoreboard objectives add vortex.hook_fish dummy
scoreboard objectives add vortex.log_level dummy
scoreboard objectives add vortex.gamerule dummy
scoreboard objectives add vortex.state dummy
scoreboard objectives add vortex.rnd_idx dummy

execute unless score #vortex.log_level vortex.log_level matches 0.. run scoreboard players set #vortex.log_level vortex.log_level 3
scoreboard players set @a vortex.hook_online 1
