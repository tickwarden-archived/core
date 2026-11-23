# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/tick/admin_systems
scoreboard players enable @a[tag=macroengine.admin] macroengine.action
scoreboard players enable @a[tag=macroengine.admin] macroengine.run
function macroengine:core/internal/systems/geo/region_watch/tick_scan
