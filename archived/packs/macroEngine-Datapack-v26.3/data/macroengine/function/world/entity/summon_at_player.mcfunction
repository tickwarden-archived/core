# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:world/entity/summon_at_player [MACRO]
$execute as @a[name=$(player),limit=1] at @s run summon $(entity) ~ ~ ~ $(nbt)
