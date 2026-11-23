# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# DL Tick Engine — Simplified Entry Point
# Driven by #minecraft:tick function tag (guaranteed 1/game-tick, no drift).
#
# Runtime channel registry removed. Systems are called directly from
# core/tick/dispatch.mcfunction with fixed rates (see that file).
# Do NOT add per-system logic here — add it to dispatch.mcfunction instead.
#
# Merged in from the former vortex.main:vortex/tick; this function is called
# directly via #minecraft:tick, see data/minecraft/tags/function/tick.json.

# Runtime config: fill and apply anything missing (worlds loaded by an older version)
# config is a module now, so the tick reaches it through the config_ensure hook
# slot instead of naming it. With the module installed this behaves exactly as
# the direct call did; without it the slot is empty and the defaults baked into
# this tick stay in force. Core never names a module.
function #vortex:hook/config_ensure

# Config-level pause guard (separate from the storage-level pause below)
execute if score #vortaforge.packs.vortex.config.tick.pause vortex.meta matches 1 run return 0

# Config not applied yet (before the first load finished): nothing to do
execute unless score #vortaforge.packs.vortex.config.tick.rate vortex.meta matches 1.. run return 0

# tick_rate: run the engine once every N game ticks (the config module's apply keeps the rate >= 1)
scoreboard players add #gt_ctr vortex.tick 1
execute if score #gt_ctr vortex.tick matches 2000000000.. run scoreboard players set #gt_ctr vortex.tick 0
scoreboard players operation #gt_mod vortex.tick = #gt_ctr vortex.tick
scoreboard players operation #gt_mod vortex.tick %= #vortaforge.packs.vortex.config.tick.rate vortex.meta
execute unless score #gt_mod vortex.tick matches 0 run return 0

# Guard: no players online → nothing to process
execute unless entity @a run return 0

# Guard: engine not initialised
# (loaded flag lives under global.loaded — see vortex:core/internal/load/all which sets
#  `vortex:engine global.loaded`)
execute unless data storage vortex:engine global{loaded:1b} run return 0

# Guard: globally paused (set/clear via: data merge storage vortex:engine {tick:{paused:1b}} )
execute if data storage vortex:engine tick{paused:1b} run return 0

# Per-player input polling (writable book, command block minecart, etc.) —
# independent of the dispatch chain below.
execute as @a run function #vortex:loop

function vortex:core/tick/dispatch
