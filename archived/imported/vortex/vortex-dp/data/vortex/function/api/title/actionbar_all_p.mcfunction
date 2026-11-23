# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/title/actionbar_all_p
# actionbar_p for every online player. Storage input as actionbar_p.
execute if data storage vortex:engine modules{title:0b} run return 0
execute as @a run function vortex:api/title/actionbar_p
