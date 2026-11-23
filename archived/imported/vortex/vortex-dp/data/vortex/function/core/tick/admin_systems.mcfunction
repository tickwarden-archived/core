# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/tick/admin_systems
scoreboard players enable @a[tag=vortex.admin] vortex.action
scoreboard players enable @a[tag=vortex.admin] vortex.run
function vortex:core/internal/systems/geo/region_watch/tick_scan
