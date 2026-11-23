# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/tick/time_systems
scoreboard players add $epoch vortex.time 1
scoreboard players add $tick vortex.tmp 1

scoreboard players set $pq_depth vortex.tmp 0
