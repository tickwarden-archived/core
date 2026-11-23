# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/title/broadcast_p
# show_p for every online player; %player% and %score:...% resolve per recipient.
# Storage input as show_p.
execute if data storage vortex:engine modules{title:0b} run return 0
execute as @a run function vortex:api/title/show_p
