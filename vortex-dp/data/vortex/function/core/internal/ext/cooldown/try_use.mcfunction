# ======================================================================================
# vortex:core/internal/ext/cooldown/try_use [MACRO] [INTERNAL]
# $(player), $(key) validated by core/cooldown/try_use.
# Scores #ext_cd_now / #ext_cd_new (vortex.tmp) were prepared by the caller.
# ======================================================================================

$execute unless data storage vortex:engine cooldowns.$(player).$(key) run return run function vortex:core/internal/ext/cooldown/arm with storage vortex:input cd
$execute store result score #ext_cd_exp vortex.tmp run data get storage vortex:engine cooldowns.$(player).$(key)
execute if score #ext_cd_now vortex.tmp < #ext_cd_exp vortex.tmp run return 0
return run function vortex:core/internal/ext/cooldown/arm with storage vortex:input cd
