# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ======================================================================================
# macroengine:core/internal/ext/cooldown/try_use [MACRO] [INTERNAL]
# $(player), $(key) validated by core/cooldown/try_use.
# Scores #ext_cd_now / #ext_cd_new (macroengine.tmp) were prepared by the caller.
# ======================================================================================

$execute unless data storage macroengine:engine cooldowns.$(player).$(key) run return run function macroengine:core/internal/ext/cooldown/arm with storage macroengine:input cd
$execute store result score #ext_cd_exp macroengine.tmp run data get storage macroengine:engine cooldowns.$(player).$(key)
execute if score #ext_cd_now macroengine.tmp < #ext_cd_exp macroengine.tmp run return 0
return run function macroengine:core/internal/ext/cooldown/arm with storage macroengine:input cd
