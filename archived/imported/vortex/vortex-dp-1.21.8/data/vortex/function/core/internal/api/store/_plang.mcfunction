# vortex:core/internal/api/store/_plang [INTERNAL]
# Appends the executor's own "lang" value (api/store/player/set) to tmp.langs.
data modify storage vortex:store tmp.pk set value {}
data modify storage vortex:store tmp.uuid set from entity @s UUID
data modify storage vortex:store tmp.pk.a set from storage vortex:store tmp.uuid[0]
data modify storage vortex:store tmp.pk.b set from storage vortex:store tmp.uuid[1]
data modify storage vortex:store tmp.pk.c set from storage vortex:store tmp.uuid[2]
data modify storage vortex:store tmp.pk.d set from storage vortex:store tmp.uuid[3]
function vortex:core/internal/api/store/_plang_get with storage vortex:store tmp.pk
