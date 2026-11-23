# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/stats_reset
scoreboard players set @s vortex.dialog_shown 0
scoreboard players set @s vortex.dialog_accept 0
scoreboard players set @s vortex.dialog_reject 0
scoreboard players set @s vortex.dialog_expire 0
