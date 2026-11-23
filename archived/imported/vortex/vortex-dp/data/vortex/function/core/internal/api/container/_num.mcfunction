# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/container/_num [INTERNAL, MACRO: f]
# Copies the NUMBER vortex:input <f> into vortex:container tmp.k.<f> as an int.
# <f> is always a constant written by this pack, never caller data. Caller data only ever
# travels as a number here, so it cannot carry command text into a macro line.
# RETURN 1 when <f> was a number, 0 otherwise (missing, string, list, compound).
$execute store success score #ct_ok vortex.tmp run data get storage vortex:input $(f)
$execute if score #ct_ok vortex.tmp matches 0 if data storage vortex:input {$(f):0} run scoreboard players set #ct_ok vortex.tmp 1
$execute if score #ct_ok vortex.tmp matches 1 store result storage vortex:container tmp.k.$(f) int 1 run data get storage vortex:input $(f)
return run scoreboard players get #ct_ok vortex.tmp
