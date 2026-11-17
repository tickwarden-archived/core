# vortex:core/version/define
# Single source of the pack's own version. Nothing else in this pack writes
# global.version or vortex.meta #vortaforge.packs.vortex.version directly -
# every other file calls this one instead. Bump this file when the version
# changes; nowhere else.

scoreboard objectives add vortex.meta dummy
scoreboard players set #vortaforge.packs.vortex.version.major vortex.meta 0
scoreboard players set #vortaforge.packs.vortex.version.minor vortex.meta 4
scoreboard players set #vortaforge.packs.vortex.version.patch vortex.meta 0
# Kept for code that still reads the old combined int (major*10+minor, no patch).
# Equal to: major*10 + minor. Remove once nothing reads it anymore.
scoreboard players set #vortaforge.packs.vortex.version vortex.meta 4

execute unless data storage vortex:engine global run data modify storage vortex:engine global set value {}
data modify storage vortex:engine global.version set value "0.4.0"
