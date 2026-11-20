# vortex:core/config/reset
# Restores every runtime config value to its default and applies it.
data remove storage vortex:engine config
data remove storage vortex:engine modules
scoreboard players set #sys_time vortex.tick_flags 1
scoreboard players set #sys_player vortex.tick_flags 1
scoreboard players set #sys_queue vortex.tick_flags 1
scoreboard players set #sys_hud vortex.tick_flags 1
scoreboard players set #sys_admin vortex.tick_flags 1
# Drop any left-over old-name score first: the migration at the top of
# core/config/init would otherwise copy it straight back in.
scoreboard players reset #vortacraftmc.packs.vortex.version vortex.meta
scoreboard players reset #vortacraftmc.packs.vortex.config.tick.rate vortex.meta
scoreboard players reset #vortacraftmc.packs.vortex.config.tick.pause vortex.meta
scoreboard players reset #vortacraftmc.archivedpacks.vortex vortex.meta
function vortex:core/config/init
function vortex:core/config/apply
