# vortex:core/internal/api/gamerule/normalize_run  [INTERNAL]
# Called by normalize, which resets the text buffers afterwards.
data modify storage vortex:text s set from storage vortex:input rule
data modify storage vortex:text needle set value " "
data modify storage vortex:text rep set value "_"
data modify storage vortex:text n set value 0
function vortex:core/internal/text/replace
execute if data storage vortex:text err run return fail
data modify storage vortex:text s set from storage vortex:text out
function vortex:core/internal/text/lower
execute if data storage vortex:text err run return fail
data modify storage vortex:input _gamerule_norm set from storage vortex:text out
