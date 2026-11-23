# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/auto_refresh_stop
# Stop the current timer without closing the active screen.
scoreboard players set @s vortex.dialog_interval 0
scoreboard players set @s vortex.dialog_refresh 0
