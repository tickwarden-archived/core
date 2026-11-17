# vortex:core/internal/api/store/_find_tpl [INTERNAL]
# Language fallback order: in.lang, the executor's own "lang", global "lang", then "en_us".
data modify storage vortex:store tmp.langs set value []
execute if data storage vortex:store in.lang run data modify storage vortex:store tmp.langs append from storage vortex:store in.lang
execute if entity @s[type=player] run function vortex:core/internal/api/store/_plang
execute if data storage vortex:store g.lang run data modify storage vortex:store tmp.langs append from storage vortex:store g.lang
execute if data storage vortex:engine config.store_default_lang run data modify storage vortex:store tmp.langs append from storage vortex:engine config.store_default_lang
execute unless data storage vortex:engine config.store_default_lang run data modify storage vortex:store tmp.langs append value "en_us"
function vortex:core/internal/api/store/_find_loop
