# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/truncate
# Displays text in the named player's actionbar, optionally with a
# suffix to indicate truncation. The caller decides whether the text
# needs truncating and passes truncated:1b or truncated:0b.
# Because mcfunction cannot measure string byte-length at runtime,
# length-checking must be done externally.
#
# INPUT : $(player)    → player name
#         $(text)      → string to display
#         $(suffix)    → suffix shown when truncated (e.g. "...")
#         $(truncated) → 1b = append suffix, 0b = show as-is
# OUTPUT: vortex:output text → stored original text
#
# EXAMPLE:
# function vortex:systems/string/truncate {player:"Steve",text:"Hello Wor",suffix:"...",truncated:1b}
# → actionbar: "Hello Wor..."
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$data modify storage vortex:output text set value $(text)
$data modify storage vortex:engine _trunc_t set value $(truncated)

scoreboard players set #trunc_flag vortex.tmp 0
execute store result score #trunc_flag vortex.tmp run data get storage vortex:engine _trunc_t

$execute if score #trunc_flag vortex.tmp matches 0 run title @a[name=$(player),limit=1] actionbar {"plain":true ,"storage":"vortex:output","nbt":"text","interpret":false}
$execute if score #trunc_flag vortex.tmp matches 1.. run title @a[name=$(player),limit=1] actionbar ["",{"plain":true ,"storage":"vortex:output","nbt":"text","interpret":false},{"text":"$(suffix)","color":"gray"}]
